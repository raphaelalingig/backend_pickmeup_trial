<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pakyaw extends Model
{
    use HasFactory;

    // Specify the table name if it doesn’t follow Laravel’s naming convention
    protected $table = 'pakyaw';

    // Define the primary key if it's not "id"
    protected $primaryKey = 'pakyaw_id';

    // Specify the attributes that are mass assignable
    protected $fillable = [
        'ride_id',
        'date_posted',
        'num_of_riders',
        'description',
        'scheduled_date'
    ];

    /**
     * Define the relationship to the RideHistory model
     * Assuming each pakyaw is associated with a ride history record
     */
    public function rideHistory()
    {
        return $this->belongsTo(RideHistory::class, 'ride_id', 'ride_id');
    }
}
