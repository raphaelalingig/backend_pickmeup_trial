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

class RideProgress implements ShouldBroadcastNow
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $update;

    public function __construct($update)
    {
        $this->update = $update;
    }

    public function broadcastOn()
    {
        return new Channel('progress');
    }

    public function broadcastAs()
    {
        return 'RIDE_PROG';
    }

    public function broadcastWith()
    {
        return [
            'update' => $this->update
        ];
    }
}