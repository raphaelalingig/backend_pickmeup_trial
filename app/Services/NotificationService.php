<?php

namespace App\Services;

use App\Models\Notification;

class NotificationService
{
    public function getNotifications()
    {
        // Fetch notifications ordered by creation date in descending order
        $notifications = Notification::orderBy('created_at', 'desc')->get();

        // Return the notifications
        return $notifications;
    }
}
