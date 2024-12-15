<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;
use App\Models\EmailVerification;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;

class PasswordResetController extends Controller
{
    public function sendResetCode(Request $request)
    {
        $request->validate([
            'email' => 'required|email'
        ]);

        $email = $request->email;

        // Check if user exists
        $user = User::where('email', $email)->first();

        if (!$user) {
            return response()->json([
                'message' => 'No account found with this email address',
                'error' => 'email_not_found'
            ], 404);
        }

        $verificationCode = Str::random(6); // Generate 6-digit random code

        // Store or update verification code in database
        EmailVerification::updateOrCreate(
            ['email' => $email],
            [
                'verification_code' => $verificationCode,
                'expires_at' => Carbon::now()->addMinutes(15),
                'type' => 'password_reset' // Add type to distinguish from registration verification
            ]
        );

        try {
            Mail::send('emails.password-reset', ['code' => $verificationCode], function($message) use ($email) {
                $message->to($email)
                        ->subject('Password Reset Verification Code');
            });

            return response()->json([
                'message' => 'Password reset code sent successfully',
                'email' => $email
            ], 200);
        } catch (\Exception $e) {
            Log::error('Failed to send password reset code: ' . $e->getMessage());
            return response()->json([
                'message' => 'Failed to send password reset code',
                'error' => 'email_sending_failed'
            ], 500);
        }
    }

    public function verifyResetCode(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'verification_code' => 'required|string'
        ]);

        $verification = EmailVerification::where('email', $request->email)
            ->where('verification_code', $request->verification_code)
            ->where('expires_at', '>', Carbon::now())
            ->first();

        if (!$verification) {
            return response()->json([
                'message' => 'Invalid or expired verification code',
                'verified' => false
            ], 400);
        }

        // Delete the verification record after successful verification
        $verification->delete();

        return response()->json([
            'message' => 'Code verified successfully',
            'verified' => true
        ], 200);
    }

    public function resetPassword(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required|min:8|confirmed'
        ]);

        $user = User::where('email', $request->email)->first();

        if (!$user) {
            return response()->json([
                'message' => 'User not found',
                'error' => 'user_not_found'
            ], 404);
        }

        try {
            $user->password = bcrypt($request->password);
            $user->save();

            return response()->json([
                'message' => 'Password reset successfully',
                'success' => true
            ], 200);
        } catch (\Exception $e) {
            Log::error('Failed to reset password: ' . $e->getMessage());
            return response()->json([
                'message' => 'Failed to reset password',
                'error' => 'password_reset_failed'
            ], 500);
        }
    }
}