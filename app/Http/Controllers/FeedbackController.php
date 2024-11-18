<?php

namespace App\Http\Controllers;

use App\Models\Feedback;
use App\Models\Report;
use App\Models\User;
use App\Models\RideHistory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;

class FeedbackController extends Controller
{
    public function index()
    {
        try {
            $feedbacks = Feedback::select(
                'feedbacks.*',
                'ride_id',
                'sender_user.first_name as sender_first_name',
                'sender_user.last_name as sender_last_name',
                'recipient_user.first_name as recipient_first_name',
                'recipient_user.last_name as recipient_last_name',
                'comment',
                'feedbacks.rating'
            )
            ->leftJoin('users as sender_user', 'sender_user.user_id', '=', 'feedbacks.sender')
            ->leftJoin('users as recipient_user', 'recipient_user.user_id', '=', 'feedbacks.recipient')
            ->get();

            


            Log::info("User: " . $feedbacks);

            return response()->json([
                'success' => true,
                'data' => $feedbacks
            ]);
        } catch (\Exception $e) {
            Log::error('Error fetching feedback: ' . $e->getMessage());
            return response()->json([
                'success' => false,
                'message' => 'Failed to fetch feedback',
                'error' => $e->getMessage()
            ], 500);
        }
    }


    public function reports()
    {
        try {
            $reports = Report::select(
                'reports.*',
                'ride_id',
                'sender_user.first_name as sender_first_name',
                'sender_user.last_name as sender_last_name',
                'recipient_user.first_name as recipient_first_name',
                'recipient_user.last_name as recipient_last_name',
                'comment',
                'reason'
            )
            ->leftJoin('users as sender_user', 'sender_user.user_id', '=', 'reports.sender')
            ->leftJoin('users as recipient_user', 'recipient_user.user_id', '=', 'reports.recipient')
            ->get();

            


            Log::info("User: " . $reports);

            return response()->json([
                'success' => true,
                'data' => $reports
            ]);
        } catch (\Exception $e) {
            Log::error('Error fetching feedback: ' . $e->getMessage());
            return response()->json([
                'success' => false,
                'message' => 'Failed to fetch feedback',
                'error' => $e->getMessage()
            ], 500);
        }
    }


    public function submitFeedback(Request $request)
    {
        $validated = $request->validate([
            'sender' => 'required|integer|exists:users,user_id',
            'ride_id' => 'required|integer|exists:ride_histories,ride_id',
            'recipient' => 'required|integer|exists:users,user_id',
            'rating' => 'required|integer|min:1|max:5',
            'message' => 'nullable|string|max:500',
        ]);

        $ride = RideHistory::find($validated['ride_id']);
        if (!$ride) {
            return response()->json([
                'success' => false,
                'message' => 'Ride not found'
            ], 404);
        }

        $existingFeedback = Feedback::where('ride_id', $validated['ride_id'])
        ->where('sender', $validated['sender'])
        ->first();

        if ($existingFeedback) {
            return response()->json([
                'success' => false,
                'message' => 'You have already submitted feedback for this ride'
            ], 201);
        }

        // Create feedback
        $feedback = Feedback::create([
            'sender' => $validated['sender'],
            'ride_id' => $validated['ride_id'],
            'recipient' => $validated['recipient'],
            'rating' => $validated['rating'],
            'comment' => $validated['message'] ?? '',
        ]);

        $this->updateUserRating($validated['recipient']);

            
        return response()->json([
            'success' => true,
            'message' => 'Feedback submitted successfully',
            'data' => $feedback
        ], 201);
    }

    public function submitReport(Request $request)
    {
        $validated = $request->validate([
            'sender' => 'required|integer|exists:users,user_id',
            'ride_id' => 'required|integer|exists:ride_histories,ride_id',
            'recipient' => 'required|integer|exists:users,user_id',
            'reason' => 'required|string|max:500',
            'comments' => 'nullable|string|max:500',
        ]);

        $ride = RideHistory::find($validated['ride_id']);
        if (!$ride) {
            return response()->json([
                'success' => false,
                'message' => 'Ride not found'
            ], 404);
        }

        $existingFeedback = Report::where('ride_id', $validated['ride_id'])
        ->where('sender', $validated['sender'])
        ->first();

        if ($existingFeedback) {
            return response()->json([
                'success' => false,
                'message' => 'You have already submitted a report for this ride'
            ], 201);
        }

        // Create feedback
        $feedback = Report::create([
            'sender' => $validated['sender'],
            'ride_id' => $validated['ride_id'],
            'recipient' => $validated['recipient'],
            'reason' => $validated['reason'],
            'comment' => $validated['comments'] ?? '',
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Feedback submitted successfully',
            'data' => $feedback
        ], 201);
    }

    /**
     * Validate that sender and recipient are part of the ride
     */
    private function validateRideParticipants($ride, $senderId, $recipientId)
    {
        return ($ride->user_id === $senderId && $ride->rider_id === $recipientId) ||
               ($ride->rider_id === $senderId && $ride->user_id === $recipientId);
    }

    /**
     * Update user's average rating
     */
    private function updateUserRating($userId)
    {
        try {
            $averageRating = Feedback::where('recipient', $userId)
                ->avg('rating');

            User::where('user_id', $userId)
                ->update(['rating' => round($averageRating, 2)]);
        } catch (\Exception $e) {
            Log::error('Error updating user rating: ' . $e->getMessage());
            throw $e;
        }
    }
}