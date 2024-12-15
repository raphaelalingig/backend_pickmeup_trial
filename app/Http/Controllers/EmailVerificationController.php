<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;
use App\Models\EmailVerification;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;

class EmailVerificationController extends Controller
{
    public function sendVerificationCode(Request $request)
    {
        $request->validate([
            'email' => 'required|email|unique:users,email'
        ]);

        $email = $request->email;
        $verificationCode = Str::random(6); // Generate 6-digit random code

        // Store or update verification code in database
        EmailVerification::updateOrCreate(
            ['email' => $email],
            [
                'verification_code' => $verificationCode,
                'expires_at' => Carbon::now()->addMinutes(15)
            ]
        );

        try {
            Mail::send('emails.verification', ['code' => $verificationCode], function($message) use ($email) {
                $message->to($email)
                        ->subject('Email Verification Code');
            });

            return response()->json([
                'message' => 'Verification code sent successfully',
                'email' => $email
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Failed to send verification code',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function verifyCode(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'verification_code' => 'required|string'
        ]);

        $verification = EmailVerification::where('email', $request->email)
            ->where('verification_code', $request->verification_code)
            ->where('expires_at', '>', Carbon::now())
            ->first();

        if ($verification) {
            // Delete the verification record
            $verification->delete();

            return response()->json([
                'message' => 'Email verified successfully',
                'email_verified' => true
            ], 200);
        }

        return response()->json([
            'message' => 'Invalid or expired verification code',
            'email_verified' => false
        ], 400);
    }
}