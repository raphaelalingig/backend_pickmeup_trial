<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    use HasFactory;

    protected $primaryKey = 'notif_id';

    protected $fillable = [
        'description',
        'user_id',
    ];
}
