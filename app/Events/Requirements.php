<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\ShouldBroadcast;
use Illuminate\Contracts\Broadcasting\ShouldBroadcastNow;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class Requirements implements ShouldBroadcastNow
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $requirements;
    /**
     * Create a new event instance.
     *
     * @param array $counts
     * @param \Illuminate\Support\Collection $bookings
     */
    public function __construct($requirements)
    {
        $this->requirements = $requirements;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel
     */
    public function broadcastOn()
    {
        return new Channel('requirements');
    }

    /**
     * Specify the event name for broadcasting.
     *
     * @return string
     */
    public function broadcastAs()
    {
        return 'REQUIREMENTS';
    }
}
