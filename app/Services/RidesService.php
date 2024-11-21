<?php

namespace App\Services;

use App\Models\User;
use App\Models\Rider;
use App\Models\Pakyaw;
use App\Models\RideHistory;
use App\Models\RideLocation;

class RidesService
{
    public function getAvailableRides()
    {
        // Fetch available rides along with user and ride location details
        $availableRides = RideHistory::whereIn('ride_histories.status', ['Available', 'Scheduled', ])
        ->join('users', 'ride_histories.user_id', '=', 'users.user_id')
        ->join('ride_locations', 'ride_histories.ride_id', '=', 'ride_locations.ride_id') // Join RideLocation
        ->leftJoin('pakyaw', 'ride_histories.ride_id', '=', 'pakyaw.ride_id') // Left join with Pakyaw
        ->select(
            'ride_histories.*',
            'users.first_name',
            'users.last_name',
            'users.mobile_number',
            'ride_locations.customer_latitude',
            'ride_locations.customer_longitude',
            'ride_locations.dropoff_latitude',
            'ride_locations.dropoff_longitude',
            'pakyaw.*' 
        )
        ->orderBy('ride_histories.created_at', 'desc')
        ->get();

        // Return the available rides with pakyaw data included
        return $availableRides;
    }
}
