<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Rider;
use App\Models\RideHistory;
use App\Models\Fare;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\UpdateUserRequest;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use App\Mail\RiderVerificationNotification;
use App\Mail\RiderRejectionMail;
use App\Mail\UnclearDocumentationMail;


class AdminController extends Controller
{
    public function getAdmin()
    {
        $admin = User::where('role_id', User::ROLE_ADMIN)->get(['user_id', 'first_name', 'last_name', 'email', 'mobile_number', 'date_of_birth', 'user_name','gender', 'status']);
        return response()->json($admin);
    }

    public function getAdminById($userId)
    {
        $user = User::where('user_id', $userId) 
                    ->first();

        // Check if the user exists
        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }

        // Check if the user's status is "Disabled"
        if ($user->status === 'Disabled') {
            return response()->json(['message' => 'Account Disabled'], 200);
        }
        // If condition is not met, return the rider's data
        return response()->json($user, 200);
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

    // public function updateAccount(Request $request, $userId)
    // {

    //     $user = User::findOrFail($userId); // Ensure the user exists
    //     $user->user_name = $request->input('user_name');
    //     $user->email = $request->input('email');
    //     $user->user_name = $request->input('email');
    //     $user->save();

    //     return response()->json([
    //         'message' => 'User status updated successfully',
    //         'user' => $user
    //     ]);
    // }

//     public function updateProfile(Request $request, $userId)
// {
//     \Log::info('Profile update request received', [
//         'userId' => $userId,
//         'request_data' => $request->all()
//     ]);

//     Log::info('Raw request data', [
//         'all' => request()->all(),
//         'files' => request()->allFiles(),
//         'headers' => request()->headers->all()
//     ]);
    
//     try {
//         $user = User::findOrFail($userId);
        
//         // Initialize updates array
//         $updates = [];
        
//         // Check for username update
//         if ($request->has('user_name') && $request->user_name !== $user->user_name) {
//             $updates['user_name'] = $request->user_name;
//         }
        
//         // Check for email update
//         if ($request->has('email') && $request->email !== $user->email) {
//             $updates['email'] = $request->email;
//         }
        
//         // Validate updates if any exist
//         if (!empty($updates)) {
//             $validator = Validator::make($updates, [
//                 'user_name' => ['sometimes', 'string', 'max:255', Rule::unique('users')->ignore($user->user_id)],
//                 'email' => ['sometimes', 'string', 'email', 'max:255', Rule::unique('users')->ignore($user->user_id)],
//             ]);

//             if ($validator->fails()) {
//                 return response()->json(['error' => $validator->errors()], 422);
//             }
//         }
        
//         // Handle password update
//         if ($request->filled('newPassword')) {
//             $passwordValidator = Validator::make($request->all(), [
//                 'currentPassword' => 'required|string',
//                 'newPassword' => 'required|string|min:8|confirmed',
//             ]);

//             if ($passwordValidator->fails()) {
//                 return response()->json(['error' => $passwordValidator->errors()], 422);
//             }

//             if (!Hash::check($request->currentPassword, $user->password)) {
//                 return response()->json(['error' => 'Current password is incorrect'], 422);
//             }
            
//             $updates['password'] = Hash::make($request->newPassword);
//         }

//         // If no updates, return early with 304 status
//         if (empty($updates)) {
//             return response()->json([
//                 'message' => 'No changes detected',
//                 'user' => [
//                     'user_name' => $user->user_name,
//                     'email' => $user->email,
//                 ]
//             ], 304);
//         }

//         // Perform update
//         DB::beginTransaction();
//         try {
//             $user->update($updates);
//             DB::commit();
            
//             return response()->json([
//                 'message' => 'Profile updated successfully!',
//                 'user' => [
//                     'user_name' => $user->user_name,
//                     'email' => $user->email,
//                 ]
//             ]);
            
//         } catch (\Exception $e) {
//             DB::rollBack();
//             \Log::error('Update failed:', ['error' => $e->getMessage()]);
//             throw $e;
//         }
//     } catch (\Exception $e) {
//         \Log::error('Profile update failed:', ['error' => $e->getMessage()]);
//         return response()->json([
//             'error' => 'Failed to update profile. Please try again later.'
//         ], 500);
//     }
// }



    public function updateStatus(Request $request, $user_id)
    {
        $request->validate([
            'status' => 'required|in:Active,Disabled',
        ]);

        $user = User::findOrFail($user_id); // Ensure the user exists
        $user->status = $request->status;
        $user->save();

        return response()->json([
            'message' => 'User status updated successfully',
            'user' => $user
        ]);
    }

    public function show($user_id)
    {
        $admin = User::where('user_id', $user_id)->where('role_id', 2)->first();
        if ($admin) {
            return response()->json($admin);
        }
        return response()->json(['message' => 'Admin not found'], 404);
    }


    public function updateAdmin(Request $request, $id)
    {
        // Retrieve the current admin data to compare with the new input
        $admin = User::findOrFail($id);

        // Define base validation rules
        $rules = [
            'user_name' => 'required|string|max:255',
            'first_name' => 'required|string|max:255',
            'last_name' => 'required|string|max:255',
            'gender' => 'required|string|in:Male,Female',
            'date_of_birth' => 'required|date',
            'email' => 'required|email|max:255',
            'mobile_number' => 'required|string|max:15',
        ];

        // Apply unique validation only if the username or email has changed
        if ($request->input('user_name') !== $admin->user_name) {
            $rules['user_name'] = 'required|string|max:255|unique:users,user_name';
        }
        
        if ($request->input('email') !== $admin->email) {
            $rules['email'] = 'required|email|max:255|unique:users,email';
        }

        // Define custom messages
        $messages = [
            'user_name.unique' => 'The username is already taken.',
            'email.unique' => 'The email is already in use.',
        ];

        // Validate the request data
        $validator = Validator::make($request->all(), $rules, $messages);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        try {
            // Update the admin user data
            $admin->user_name = $request->input('user_name');
            $admin->first_name = $request->input('first_name');
            $admin->last_name = $request->input('last_name');
            $admin->gender = $request->input('gender');
            $admin->date_of_birth = $request->input('date_of_birth');
            $admin->email = $request->input('email');
            $admin->mobile_number = $request->input('mobile_number');

            // Save the updated data
            $admin->save();

            return response(['message' => 'Admin updated successfully', 'admin' => $admin], 200);
        } catch (\Exception $e) {
            \Log::error('Error updating admin: ' . $e->getMessage());
            return response(['message' => 'Error updating admin', 'error' => $e->getMessage()], 500);
        }
    }


    public function accountUpdate(UpdateUserRequest $request, User $editingAdminId)
    {
        try {
            $userDetails = User::find($editingAdminId);

            if (!$userDetails) {
                return response(["message" => "User not found"], 404);
            }

            // Exclude null or empty password from the update
            $data = $request->validated();
            if (empty($data['password'])) {
                unset($data['password']);
            }

            $userDetails->update($data);

            return response(["message" => "User Successfully Updated"], 200);
        } catch (\Throwable $th) {
            return response(["message" => $th->getMessage()], 400);
        }
    }

    public function verify_rider(Request $request, $user_id)
    {
        Log::info('Starting rider verification', ['user_id' => $user_id, 'status' => $request->status]);
        
        try {
            $rider = Rider::where('user_id', $user_id)->firstOrFail();
            $user = User::find($user_id);
            
            Log::info('Found user details', ['email' => $user->email]);
            
            Mail::to($user->email)->send(new RiderVerificationNotification($request->status));
            Log::info('Email sent successfully');
            
            $rider->verification_status = $request->status;
            $rider->save();
            
            return response()->json([
                'message' => 'Rider verification status updated successfully',
                'rider' => $rider
            ]);
        } catch (\Exception $e) {
            Log::error('Error in rider verification', ['error' => $e->getMessage()]);
            throw $e;
        }
    }

    public function notify_rider(Request $request, $user_id)
    {
        Log::info('Notifying Rider', ['user_id' => $user_id, 'status' => $request->status]);
        
        try {
            $rider = Rider::where('user_id', $user_id)->firstOrFail();
            $user = User::find($user_id);
            
            Log::info('Found user details', ['email' => $user->email]);
            
            Mail::to($user->email)->send(new RiderVerificationNotification($request->status));
            Log::info('Email sent successfully');
            
            $rider->verification_status = $request->status;
            $rider->save();
            
            return response()->json([
                'message' => 'Rider verification status updated successfully',
                'rider' => $rider
            ]);
        } catch (\Exception $e) {
            Log::error('Error in rider verification', ['error' => $e->getMessage()]);
            throw $e;
        }
    }

    public function reject_rider(Request $request, $user_id)
    {
        Log::info('Starting rider rejection', [
            'user_id' => $user_id, 
            'status' => $request->status,
            'reason' => $request->reason
        ]);
        
        try {
            $rider = Rider::where('user_id', $user_id)->firstOrFail();
            $user = User::find($user_id);

            $rider->verification_status = $request->status;
            $rider->save();

            switch ($request->status) {
                case 'Unverified':
                    Mail::to($user->email)->send(new RiderRejectionMail($user, $request->reason));
                    $message = 'Rider rejected successfully';
                    break;

                case 'Pending':
                    Mail::to($user->email)->send(new UnclearDocumentationMail($user, $request->reason));
                    $message = 'Unclear documentation notification sent successfully';
                    break;

                default:
                    throw new \Exception('Invalid action type');
            }
            
            // Send rejection email
            // Mail::to($user->email)->send(new RiderRejectionMail($user, $request->reason));
            
            return response()->json([
                'message' => $message,
                'rider' => $rider
            ]);
        } catch (\Exception $e) {
            Log::error('Error in rider rejection', ['error' => $e->getMessage()]);
            throw $e;
        }
    }

    public function getRiderLocations()
    {
        $riders = Rider::with(['user'])->get();

        return response()->json($riders);
    }

    public function getFare()
    {
        $fare = Fare::first(); // Fetch the first fare record
        if (!$fare) {
            return response()->json(['message' => 'Fare not found'], 404);
        }
        return response()->json($fare);
    }

    /**
     * Update fare details after validating the admin's password.
     */
    public function updateFare(Request $request)
    {
        // Validate the incoming data
        $request->validate([
            'first_2km' => 'required|numeric|min:0',
            'exceeding_2km' => 'required|numeric|min:0',
            'password' => 'required|string',
        ]);

        // Verify admin password
        $admin = Auth::user(); // Assuming the admin is authenticated
        if (!$admin || !Hash::check($request->password, $admin->password)) {
            return response()->json(['message' => 'Invalid password'], 403);
        }

        // Fetch the fare record
        $fare = Fare::first();
        if (!$fare) {
            return response()->json(['message' => 'Fare not found'], 404);
        }

        // Update the fare
        $fare->update([
            'first_2km' => $request->first_2km,
            'exceeding_2km' => $request->exceeding_2km,
        ]);

        return response()->json(['message' => 'Fare updated successfully']);
    }

}