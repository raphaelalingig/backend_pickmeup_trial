<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Rider;
use App\Models\Delivery;
use App\Models\Pakyaw;
use App\Models\RideHistory;
use App\Models\RideLocation;
use App\Models\RideApplication;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

use App\Events\RidesUpdated;
use App\Events\RideBooked;
use App\Events\DashboardUpdated;
use App\Events\RideApply;
use App\Events\RideProgress;
// use App\Events\NewNotification;

use App\Services\DashboardService;
use App\Services\RidesService;
use App\Services\FareService;
// use App\Services\NotificationService;

class BookController extends Controller
{

    protected $dashboardService;
    protected $ridesService;
    protected $fareService;

        

    public function __construct(
        DashboardService $dashboardService, 
        RidesService $ridesService,
        FareService $fareService)
        // NotificationService $notificationService
        
    {
        $this->dashboardService = $dashboardService;
        $this->ridesService = $ridesService;
        $this->fareService = $fareService;
        // $this->notificationService = $notificationService;
    }


    public function book_delivery(Request $request)
    {
        $validated = $request->validate([
            'user_id' => 'required|exists:users,user_id',
            'pickup_location' => 'required|string|max:255',
            'dropoff_location' => 'required|string|max:255',
            'fare' => 'required|numeric',
            'distance' => 'required',
            'ride_type' => 'required',
            'delivery_type' => 'required',
            'instructions' => 'required',
        ]);

        \Log::info("DELIVERY " . json_encode($validated));

        // Calculate fare based on distance
        $calculatedFare = $this->fareService->calculateFare($validated['distance']);
    
        $rideHistory = new RideHistory();
        $rideHistory->user_id = $validated['user_id'];
        $rideHistory->pickup_location = $validated['pickup_location'];
        $rideHistory->dropoff_location = $validated['dropoff_location'];
        $rideHistory->fare = $validated['fare'];
        $rideHistory->distance = $validated['distance'];
        $rideHistory->calculated_fare = round($calculatedFare, 2);;
        $rideHistory->ride_date = now();
        $rideHistory->ride_type = $validated['ride_type'];
        $rideHistory->status = 'Available';
        $rideHistory->save();

        $delivery = new Delivery();
        $delivery->ride_id = $rideHistory->ride_id;
        $delivery->delivery_type = $validated['delivery_type'];
        $delivery->instructions = $validated['instructions'];
        $delivery->save();

        // Fetch updated counts and bookings using DashboardService
        $data = $this->dashboardService->getCounts();
        $counts = $data['counts'];
        $bookings = $data['bookings'];
        event(new DashboardUpdated($counts, $bookings));
    
        return response()->json(['success' => true, 'ride_id' => $rideHistory->ride_id], 201);
    }


    public function book_pakyaw(Request $request)
{
    $validated = $request->validate([
        'user_id' => 'required|exists:users,user_id',
        'pickup_location' => 'required|string|max:255',
        'dropoff_location' => 'required|string|max:255',
        'fare' => 'required|numeric',
        'status' => 'required',
        'distance' => 'required|numeric',
        'ride_type' => 'required|string',
        'numberOfRiders' => 'required|numeric',
        'scheduledDate' => 'nullable|date',
        'returnDate' => 'nullable|date',
        'description' => 'nullable|string'
    ]);
    
    $rideHistory = new RideHistory();
    $rideHistory->user_id = $validated['user_id'];
    $rideHistory->pickup_location = $validated['pickup_location'];
    $rideHistory->dropoff_location = $validated['dropoff_location'];
    $rideHistory->fare = $validated['fare'];
    $rideHistory->distance = $validated['distance'];
    $rideHistory->calculated_fare = $validated['fare'];
    $rideHistory->ride_date = now();
    $rideHistory->ride_type = $validated['ride_type'];
    $rideHistory->status = $validated['status'];
    $rideHistory->save();

    $delivery = new Pakyaw();
    $delivery->ride_id = $rideHistory->ride_id;
    $delivery->num_of_riders = $validated['numberOfRiders'];
    $delivery->description = $validated['description'] ? $validated['description'] : null;
    $delivery->scheduled_date = $validated['scheduledDate'] 
    ? \Carbon\Carbon::parse($validated['scheduledDate'])->format('Y-m-d H:i:s') 
    : null;
    $delivery->return_date = $validated['returnDate'] 
    ? \Carbon\Carbon::parse($validated['returnDate'])->format('Y-m-d H:i:s') 
    : null;
    
    $delivery->save();

    // Fetch updated counts and bookings using DashboardService
    $data = $this->dashboardService->getCounts();
    $counts = $data['counts'];
    $bookings = $data['bookings'];
    event(new DashboardUpdated($counts, $bookings));

    return response()->json(['success' => true, 'ride_id' => $rideHistory->ride_id], 201);
}

}