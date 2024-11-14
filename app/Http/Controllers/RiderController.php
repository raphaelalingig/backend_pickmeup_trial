<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Rider;
use App\Models\RequirementPhoto;
use App\Models\RideApplication;
use App\Models\Requirement;
use App\Models\RideHistory;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Storage;
use CloudinaryLabs\CloudinaryLaravel\Facades\Cloudinary;

use App\Events\RidesUpdated;
use App\Events\DashboardUpdated;
use App\Events\RideBooked;
use App\Events\RideProgress;

use App\Services\DashboardService;
use App\Services\RidesService;

class RiderController extends Controller
{
    
    protected $ridesService;

    public function __construct(
        DashboardService $dashboardService, 
        RidesService $ridesService)
        {
            $this->dashboardService = $dashboardService;
            $this->ridesService = $ridesService;
        }

    public function getRiders()
    {
        $riders = User::where('role_id', User::ROLE_RIDER)
            ->whereHas('rider', function($query) {
                $query->where('verification_status', 'Verified');
            })
            ->with('rider' )
            ->with(['rider:verification_status,user_id,rider_id,availability', 'rider.requirementPhotos' => function($query) {
                $query->whereIn('requirement_id', [3, 6]) // Assuming 1 is for license and 2 is for OR
                    ->select('rider_id', 'requirement_id', 'photo_url');
            }])
            ->get(['user_id', 'first_name', 'last_name', 'mobile_number', 'status', 'email', 'date_of_birth']);

        return response()->json($riders);
    }

    public function updateAvailability(Request $request)
    {
        $rider = Rider::where('user_id', $request->input('user_id'))->first();
    
        if ($rider) {
            $rider->rider_latitude = $request->input('latitude');
            $rider->rider_longitude = $request->input('longitude');
            $rider->availability = $request->input('status');
            
            $rider->save();
    
            return response()->json($rider);
        } else {
            return response()->json(['error' => 'Rider not found'], 404);
        }
    }

    public function updateRiderLocation(Request $request)
    {
        $rider = Rider::where('user_id', $request->input('user_id'))->first();
    
        if ($rider) {
            $rider->rider_latitude = $request->input('latitude');
            $rider->rider_longitude = $request->input('longitude');
            
            $rider->save();
    
            return response()->json($rider);
        } else {
            return response()->json(['error' => 'Rider not found'], 404);
        }
    }

    public function getRiderById($user_id)
    {
        $user = User::where('role_id', User::ROLE_RIDER)
            ->where('user_id', $user_id)
            ->first();

        if (!$user) {
            return response()->json(['message' => 'Rider not found'], 404);
        }

        $rider = Rider::where('user_id', $user_id)->first();

        if (!$rider) {
            return response()->json(['message' => 'Rider not found'], 404);
        }

        if (in_array($rider->verification_status, ['Unverified', 'Pending'])) {
            return response()->json(['message' => 'Get Verified'], 200);
        }

        if ($user->status === 'Disabled') {
            return response()->json(['message' => 'Account Disabled'], 200);
        }

        return response()->json($rider, 200);
    }

    public function getApplications($userId)
    {
        // Retrieve the oldest Ride Application for the specified user
        $apply = RideApplication::where('apply_to', $userId)
            ->where('status', 'Pending')
            ->with('ridehistory')
            ->oldest()
            ->first();

        if (!$apply) {
            Log::info("No applications found for user_id: " . $userId);
            return response()->json(['message' => 'No applications found', 'data' => []], 200);
        }
        $rider = RideHistory::where('ride_id', $apply->ride_id)
                ->first();
        
        if (!$rider) {
            Log::info("No longer available found for user_id: " . $userId);
            return response()->json(['message' => 'No applications found', 'data' => []], 200);
        }

        // Fetch user details
        $user = User::where('user_id', $apply->applier)
                    ->first(['first_name', 'last_name', 'mobile_number', 'status']);
        
        if (!$user) {
            Log::info("User not found for applier_id: " . $apply->applier);
            return response()->json(['message' => 'User not found', 'data' => []], 200);
        }

        // Fetch complete ride data
        $completeRideData = RideHistory::join('users', 'ride_histories.user_id', '=', 'users.user_id')
                        ->join('ride_locations', 'ride_histories.ride_id', '=', 'ride_locations.ride_id')
                        ->where('ride_histories.ride_id', $apply->ride_id)
                        ->select(
                            'ride_histories.*',
                            'users.first_name',
                            'users.last_name',
                            'ride_locations.customer_latitude',
                            'ride_locations.customer_longitude',
                            'ride_locations.dropoff_latitude',
                            'ride_locations.dropoff_longitude'
                        )
                        ->first();

        if (!$completeRideData) {
            Log::info("Ride data not found for ride_id: " . $apply->ride_id);
            return response()->json(['message' => 'Ride data not found', 'data' => []], 200);
        }

        // Create payload with matching structure
        $applicationData = array_merge($completeRideData->toArray(), [
            'apply_id' => $apply->apply_id,
            'applier' => $apply->applier,
            'apply_to' => $apply->apply_to,
            'applier_name' => $user->first_name . ' ' . $user->last_name,
        ]);

        return response()->json(['message' => 'Application retrieved successfully', 'data' => [$applicationData]], 200);
    }


    

    public function getAvailableRides()
    {
        $availableRides = $this->ridesService->getAvailableRides();
    
        return response()->json($availableRides);
    }

    public function getRidersRequirements()
    {
        // Fetch riders with their related user data and requirement photos
        $riders = Rider::with([
            'user', // Load the associated User model
            'requirementphotos' // Load the associated RequirementPhoto model
        ])->get();

        // Return the data as JSON
        return response()->json($riders);
    }



    public function upload(Request $request)
    {
        try {
            // Check Cloudinary configuration
            $cloudName = Config::get('cloudinary.cloud_name');
            $apiKey = Config::get('cloudinary.api_key');
            $apiSecret = Config::get('cloudinary.api_secret');

            if (!$cloudName || !$apiKey || !$apiSecret) {
                Log::error('Cloudinary configuration missing', [
                    'cloud_name' => $cloudName ? 'set' : 'missing',
                    'api_key' => $apiKey ? 'set' : 'missing',
                    'api_secret' => $apiSecret ? 'set' : 'missing'
                ]);
                return response()->json([
                    'success' => false,
                    'message' => 'Cloud storage configuration is incomplete.'
                ], 500);
            }

            // Validate input
            $request->validate([
                'requirement_id' => 'required|integer',
                'photo' => 'required|image|mimes:jpeg,png,jpg|max:5120',
                'user_id' => 'required|integer',
            ]);

            $rider = Rider::where('user_id', $request->input('user_id'))->first();

            if (!$rider) {
                return response()->json(['success' => false, 'message' => 'Rider not found.'], 404);
            }

            if ($request->hasFile('photo')) {
                $uploadedFile = $request->file('photo');

                if (!$uploadedFile->isValid()) {
                    return response()->json([
                        'success' => false,
                        'message' => 'Invalid file upload.'
                    ], 400);
                }

                try {
                    // Get the file path
                    $filePath = $uploadedFile->getRealPath();
                    
                    // Verify file exists and is readable
                    if (!file_exists($filePath) || !is_readable($filePath)) {
                        throw new \Exception('Unable to read upload file');
                    }

                    // Upload to Cloudinary with explicit options
                    $uploadResult = Cloudinary::upload($filePath, [
                        'folder' => 'verification_documents',
                        'resource_type' => 'image',
                        'overwrite' => true,
                        'unique_filename' => true
                    ]);

                    if (!$uploadResult || !$uploadResult->getSecurePath()) {
                        throw new \Exception('Cloudinary upload failed to return a valid URL');
                    }

                    $photoUrl = $uploadResult->getSecurePath();

                    // Check for existing photo record
                    $requirementPhoto = RequirementPhoto::where('requirement_id', $request->input('requirement_id'))
                        ->where('rider_id', $rider->rider_id)
                        ->first();

                    if ($requirementPhoto) {
                        if ($requirementPhoto->photo_url) {
                            try {
                                $publicId = basename($requirementPhoto->photo_url, '.' . pathinfo($requirementPhoto->photo_url, PATHINFO_EXTENSION));
                                Cloudinary::destroy($publicId);
                            } catch (\Exception $e) {
                                Log::warning('Failed to delete old image from Cloudinary: ' . $e->getMessage());
                            }
                        }

                        $requirementPhoto->photo_url = $photoUrl;
                        $requirementPhoto->save();
                    } else {
                        RequirementPhoto::create([
                            'requirement_id' => $request->input('requirement_id'),
                            'photo_url' => $photoUrl,
                            'rider_id' => $rider->rider_id,
                        ]);
                    }

                    return response()->json([
                        'success' => true,
                        'message' => 'File uploaded successfully.',
                        'photo_url' => $photoUrl
                    ]);

                } catch (\Exception $cloudinaryException) {
                    Log::error('Cloudinary upload failed', [
                        'error' => $cloudinaryException->getMessage(),
                        'trace' => $cloudinaryException->getTraceAsString()
                    ]);
                    
                    return response()->json([
                        'success' => false,
                        'message' => 'Failed to upload file to cloud storage.',
                        'error' => $cloudinaryException->getMessage()
                    ], 500);
                }
            }

            return response()->json([
                'success' => false,
                'message' => 'No file was uploaded.'
            ], 400);

        } catch (\Exception $e) {
            Log::error('File upload failed', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);
            
            return response()->json([
                'success' => false,
                'message' => 'File upload failed.',
                'error' => $e->getMessage()
            ], 500);
        }
    }
    

    public function updateRiderInfo(Request $request)
    {
        try {
            // Validate text data
            $request->validate([
                'drivers_license_number' => 'required|string',
                'license_expiration_date' => 'required|date',
                'or_expiration_date' => 'required|date',
                'plate_number' => 'required|string',
                'user_id' => 'required|integer', // Ensure user_id is included in the request
            ]);

            \Log::info("Updating rider info for user_id: " . $request->input('user_id'));

            // Retrieve the rider based on user_id
            $rider = Rider::where('user_id', $request->input('user_id'))->first();

            if (!$rider) {
                return response()->json(['success' => false, 'message' => 'Rider not found.']);
            }

            // Prepare data to update or create in requirement_photos table
            $requirementsData = [
                5 => $request->input('drivers_license_number'), // For requirement_id 1
                6 => $request->input('license_expiration_date'), // For requirement_id 2
                3 => $request->input('or_expiration_date'), // For requirement_id 4
                10 => $request->input('plate_number'), // For requirement_id 5
            ];

            foreach ($requirementsData as $requirement_id => $value) {
                // Check if the requirement photo exists
                $requirementPhoto = RequirementPhoto::where('rider_id', $rider->rider_id)
                    ->where('requirement_id', $requirement_id)
                    ->first();

                if ($requirementPhoto) {
                    // Update the existing record
                    $requirementPhoto->update(['text_data' => $value]); // Replace 'text_data' with the actual column name you want to update
                } else {
                    // Create a new record if it doesn't exist
                    RequirementPhoto::create([
                        'rider_id' => $rider->rider_id,
                        'requirement_id' => $requirement_id,
                        'photo_url' => $value, // Replace 'text_data' with the actual column name
                    ]);
                }
            }

            return response()->json(['success' => true, 'message' => 'Rider information updated successfully.']);
        } catch (\Exception $e) {
            \Log::error("Error updating rider info: " . $e->getMessage());
            return response()->json(['success' => false, 'message' => 'Failed to update rider information.', 'error' => $e->getMessage()]);
        }
    }


    public function getUploadedImages($userId)
    {
        try {
            $rider = Rider::where('user_id', $userId)->first();
            // Fetch the photos for the given rider ID
            $photos = RequirementPhoto::where('rider_id', $rider->rider_id)->get();

            // Prepare the response data
            $response = [
                'license_image_url' => null,
                'or_cr_image_url' => null,
                'cor_image_url' => null,
                'motor_model_image_url' => null,
                'tpl_insurance_image_url' => null,
                'brgy_clearance_image_url' => null,
                'police_clearance_image_url' => null,
            ];

            // Map the photos to their respective URLs based on the requirement_id
            foreach ($photos as $photo) {
                switch ($photo->requirement_id) {
                    case 1:
                        $response['motor_model_image_url'] = $photo->photo_url;
                        break;
                    case 2:
                        $response['or_cr_image_url'] = $photo->photo_url;
                        break;
                    case 4:
                        $response['cor_image_url'] = $photo->photo_url;
                        break;
                    case 5:
                        $response['license_image_url'] = $photo->photo_url;
                        break;
                    case 8:
                        $response['tpl_insurance_image_url'] = $photo->photo_url;
                        break;
                    case 9:
                        $response['brgy_clearance_image_url'] = $photo->photo_url;
                        break;
                    case 10:
                        $response['police_clearance_image_url'] = $photo->photo_url;
                        break;
                    default:
                        break;
                }
            }

            return response()->json([
                'success' => true,
                'data' => $response,
            ], 200);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error fetching images: ' . $e->getMessage(),
            ], 500);
        }
    }

    public function updateStatus(Request $request, $id)
    {
        try {
            $user = User::findOrFail($id);
            $user->status = $request->input('status');
            $user->save();

            return response()->json(['message' => 'User status updated successfully.']);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to update user status.'], 500);
        }
    }


    private function updateRideHistory($ride_id, $customer, $user_id)
    {
        $ride = RideHistory::where('ride_id', $ride_id)
                            ->where('status', 'Available')
                            ->lockForUpdate()
                            ->first();
    
        if ($ride) {
            // Update the ride history record
            $ride->rider_id = $user_id;
            $ride->status = "Booked";
            $ride->save(); // Save directly to the RideHistory model

            $rider_status = Rider::where('user_id', $user_id)
                ->lockForUpdate()
                ->first();

            $rider_status->availability = "Booked";
            $rider_status->save();
    
            // Fetch dashboard counts and bookings
            $data = $this->dashboardService->getCounts();
            $counts = $data['counts'];
            $bookings = $data['bookings'];
            
            // Broadcast the dashboard update
            event(new DashboardUpdated($counts, $bookings));


            Log::info("Customer: " . $customer);
            Log::info("Rider: " . $user_id);

            $apply = RideApplication::where('ride_id', $ride_id)
                        ->where('applier', $customer)
                        ->where('apply_to', $user_id)
                        ->where('status', 'Matched')
                        ->lockForUpdate()
                        ->first();

            $rider = User::where('user_id', $user_id)
                        ->first(['first_name', 'last_name', 'mobile_number', 'status']);

            // Log the rider's first name
            if ($rider) {
                Log::info("User: " . $rider->first_name);
            }

            // Check if $apply is not null before merging
            if ($apply) {
                // Merge data from $apply and additional rider info
                $ride = array_merge($apply->toArray(), [
                    'rider_name' => $rider->first_name . ' ' . $rider->last_name,
                ]);

                // Log and broadcast the ride data
                Log::info("Broadcasting Ride Data: " . json_encode($ride));
                event(new RideBooked($ride));
            } else {
                Log::warning("No matching RideApplication found for ride_id: $ride_id, applier: $customer, apply_to: $user_id");
            }
    
            Log::info("Ride history updated successfully for ride ID: " . $ride_id);
        } else {
            Log::warning("Ride history not found for ride ID: " . $ride_id);
        }
    }
    

    public function apply_ride(Request $request, $ride_id)
    {
        Log::info("Attempting to apply ride with ID: " . $ride_id);

        try {
            return DB::transaction(function () use ($ride_id, $request) {
                $validated = $request->validate([
                    'user_id' => 'required|exists:users,user_id',
                    'customer_id' => 'required',
                ]);

                $user_id = $validated['user_id'];
                $customer = $validated['customer_id'];

                $ride = RideHistory::where('ride_id', $ride_id)
                                ->where('status', 'Available')
                                ->lockForUpdate()
                                ->first();

                if (!$ride) {
                    Log::warning("Ride not available for acceptance: " . $ride_id);
                    return response()->json(['message' => 'This ride is no longer available.'], 200);
                }
                
                $check = RideApplication::where('ride_id', $ride_id)
                                ->where('applier', $user_id)
                                ->where('apply_to', $customer)
                                ->where('status', 'Pending')
                                ->lockForUpdate()
                                ->first();

                if ($check) {
                    Log::warning("You have already applied for this ride: " . $ride_id);
                    return response()->json(['message' => 'exist'], 200);
                }

                $accept = RideApplication::where('ride_id', $ride_id)
                                ->where('apply_to', $user_id)
                                ->lockForUpdate()
                                ->first();

                if ($accept) {
                    $accept->status = 'Matched';
                    $accept->save();

                    $this->updateRideHistory($ride_id, $customer, $user_id);

                    Log::info("Ride Matched successfully: " . $ride_id);
                    return response()->json(['message' => 'Accepted Successfully']);
                }

                $apply = new RideApplication();
                $apply->ride_id = $ride_id;
                $apply->applier = $user_id;
                $apply->status = 'Pending';
                $apply->apply_to = $ride->user_id;
                $apply->date = now();
                $apply->save();

                Log::info("Ride Application successfully: " . $ride_id);
                return response()->json(['message' => 'applied'], 200);
            });
        } catch (\Exception $e) {
            Log::error("Failed to accept ride: " . $e->getMessage());
            return response()->json(['error' => 'Failed to accept ride. Please try again.'], 500);
        }
    }


    public function checkActiveRide($user_id)
    {
        $activeRide = RideHistory::where('rider_id', $user_id)
            ->whereIn('status', ['Booked', 'In Transit'])
            ->with(['user', 'ridelocations'])
            ->latest()
            ->first();

        return response()->json([
            'hasActiveRide' => $activeRide !== null,
            'rideDetails' => $activeRide
        ]);
    }

    public function decline_ride($apply_id)
    {
        $decline = RideApplication::where('apply_id', $apply_id)
                ->where('status', 'Pending')
                ->lockForUpdate()
                ->first();

        if(!$decline){
            return response()->json(['message' => 'Unavailable']);
        }

        $decline->status = "Declined";
        $decline->save();

        return response()->json(['message' => 'Declined']);
    }

    public function start_ride(Request $request, $ride_id)
    {
        $ride = RideHistory::find($ride_id);
    
        if (!$ride || $ride->status == 'Canceled') {
            return response()->json(['error' => 'This ride is no longer available.'], 400);
        }
    
        // Logic to start the ride
        $ride->status = 'In Transit';
        $ride->save();


        $update = [
            'id' => $ride->user_id,
            'status' => 'Start'
        ];
        Log::info("Ride Application successfully: " . json_encode($update));
        event(new RideProgress($update));


    
        return response()->json(['message' => 'Now In Transit']);
    }

    public function finish_ride(Request $request, $ride_id)
    {
        $ride = RideHistory::find($ride_id);
    
        if (!$ride || $ride->status == 'Canceled') {
            return response()->json(['error' => 'This ride is no longer available.'], 400);
        }

        // Logic to finish the ride
        $ride->status = 'Review';
        $ride->save();

        $rider = Rider::where('user_id', $ride->rider_id)->first();
        $rider->availability = "Available";
        $rider->save();

        $update = [
            'id' => $ride->user_id,
            'status' => 'Completed'
        ];

        Log::info("Ride Application successfully: " . json_encode($update));
        event(new RideProgress($update));
    
        return response()->json(['message' => 'Ride successfully ended']);
    }


}