<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Contracts\Broadcasting\ShouldBroadcastNow;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;

class UserLoggedOutFromOtherDevices implements ShouldBroadcastNow
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $userId;

    public function __construct($userId)
    {
        $this->userId = $userId;
        Log::info("UserIDDDDDDDDDDDDDDDDDDD: " . $userId);
    }

    public function broadcastOn()
    {
        return new Channel('logout.' . $this->userId);
    }

    public function broadcastAs()
    {
        return 'LOGOUT';
    }

    public function broadcastWith()
    {
        return [
            'userId' => $this->userId
        ];
    }
}
