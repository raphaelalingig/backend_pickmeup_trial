<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class EmailVerification extends Model
{
    protected $fillable = [
        'email', 
        'verification_code', 
        'expires_at'
    ];

    protected $dates = ['expires_at'];
}