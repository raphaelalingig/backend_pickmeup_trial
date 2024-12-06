<?php

namespace App\Services;

use App\Models\Fare;

class FareService
{
    private const THRESHOLD_KM = 2;

    private $baseFare;
    private $additionalFareRate;

    public function __construct()
    {
        // Load fare values from the database
        $fare = Fare::first();

        if ($fare) {
            $this->baseFare = $fare->first_2km ?? 40; // Default to 40 if null
            $this->additionalFareRate = $fare->exceeding_2km ?? 12; // Default to 12 if null
        } else {
            // Set default values if no fare data is found
            $this->baseFare = 40;
            $this->additionalFareRate = 12;
        }
    }

    public function calculateFare(float $distance): float
    {
        if ($distance <= self::THRESHOLD_KM) {
            return $this->baseFare;
        }

        $exceedingDistance = $distance - self::THRESHOLD_KM;
        return round($this->baseFare + ($exceedingDistance * $this->additionalFareRate), 2);
    }
}
