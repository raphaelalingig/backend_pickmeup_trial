<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Rider;
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
    //
}
