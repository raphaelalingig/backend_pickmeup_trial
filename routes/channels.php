<?php

use Illuminate\Support\Facades\Broadcast;

Broadcast::channel('user-logout.{userId}', function ($user, $userId) {
    return (int) $user->user_id === (int) $userId;
});

Broadcast::channel('logout', function ($user) {
    return true; // Add your logic to authorize the user here
});

Broadcast::channel('dashboard', function ($user) {
    return true; // Add your logic to authorize the user here
});
Broadcast::channel('requirements', function ($user) {
    return true; // Add your logic to authorize the user here
});
Broadcast::channel('rides', function ($user) {
    return true; // Add your logic to authorize the user here
});
Broadcast::channel('application', function ($user) {
    return true; // Add your logic to authorize the user here
});
Broadcast::channel('booked', function ($user) {
    return true; // Add your logic to authorize the user here
});
Broadcast::channel('progress', function ($user) {
    return true; // Add your logic to authorize the user here
});

Broadcast::channel('bookuser.{userId}', function ($user, $userId) {
    return (int) $user->user_id === (int) $userId;
});

Broadcast::channel('bookrider.{userId}', function ($user, $userId) {
    return (int) $user->user_id === (int) $userId;
});

Broadcast::channel('notify', function ($user) {
    return true;
});