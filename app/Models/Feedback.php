<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Feedback extends Model
{
    use HasFactory;

    protected $primaryKey = 'feedback_id';
    protected $table = 'feedbacks';

    protected $fillable = [
        'sender',
        'recipient',
        'comment',
        'rating',
        'ride_id',
    ];

    protected $casts = [
        'created_at' => 'datetime:Y-m-d H:i:s',
        'updated_at' => 'datetime:Y-m-d H:i:s',
    ];

    // Add relationships for better data handling
    public function senderUser()
    {
        return $this->belongsTo(User::class, 'sender', 'user_id');
    }

    public function recipientUser()
    {
        return $this->belongsTo(User::class, 'recipient', 'user_id');
    }

    public function rideHistory()
    {
        return $this->belongsTo(RideHistory::class, 'ride_id', 'ride_id');
    }
}