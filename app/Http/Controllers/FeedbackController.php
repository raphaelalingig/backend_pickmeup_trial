<?php

namespace App\Http\Controllers;

use App\Models\Feedback;
use App\Models\User;
use App\Models\RideHistory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;

class FeedbackController extends Controller
{
    /**
     * Get all feedback with user details
     */
    public function index()
    {
        try {
            $feedbacks = Feedback::select(
                'feedbacks.*',
                'sender_user.first_name as sender_first_name',
                'sender_user.last_name as sender_last_name',
                'recipient_user.first_name as recipient_first_name',
                'recipient_user.last_name as recipient_last_name'
            )
            ->leftJoin('users as sender_user', 'sender_user.user_id', '=', 'feedbacks.sender')
            ->leftJoin('users as recipient_user', 'recipient_user.user_id', '=', 'feedbacks.recipient')
            ->get();

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

    /**
     * Submit new feedback
     */
    public function submitFeedback(Request $request)
    {
        DB::beginTransaction();
        
        try {
            // Validation rules
            $rules = [
                'sender' => 'required|integer|exists:users,user_id',
                'ride_id' => 'required|integer|exists:ride_histories,ride_id',
                'recipient' => 'required|integer|exists:users,user_id',
                'rating' => 'required|integer|min:1|max:5',
                'message' => 'nullable|string|max:500',
            ];

            // Custom validation messages
            $messages = [
                'sender.exists' => 'Invalid sender ID.',
                'ride_id.exists' => 'Invalid ride ID.',
                'recipient.exists' => 'Invalid recipient ID.',
                'rating.min' => 'Rating must be at least 1 star.',
                'rating.max' => 'Rating cannot exceed 5 stars.',
                'message.max' => 'Feedback message cannot exceed 500 characters.',
            ];

            // Validate request data
            $validatedData = $request->validate($rules, $messages);

            // Check if the ride exists and is completed
            $ride = RideHistory::find($validatedData['ride_id']);
            if (!$ride) {
                return response()->json([
                    'success' => false,
                    'message' => 'Ride not found'
                ], 404);
            }

            // Verify sender and recipient are part of the ride
            if (!$this->validateRideParticipants($ride, $validatedData['sender'], $validatedData['recipient'])) {
                return response()->json([
                    'success' => false,
                    'message' => 'Invalid sender or recipient for this ride'
                ], 400);
            }

            // Check for existing feedback
            $existingFeedback = Feedback::where('ride_id', $validatedData['ride_id'])
                ->where('sender', $validatedData['sender'])
                ->first();

            if ($existingFeedback) {
                return response()->json([
                    'success' => false,
                    'message' => 'Feedback already submitted for this ride'
                ], 400);
            }

            // Create feedback
            $feedback = Feedback::create([
                'sender' => $validatedData['sender'],
                'ride_id' => $validatedData['ride_id'],
                'recipient' => $validatedData['recipient'],
                'rating' => $validatedData['rating'],
                'comment' => $validatedData['message'] ?? '',
            ]);

            // Update user's average rating
            $this->updateUserRating($validatedData['recipient']);

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Feedback submitted successfully',
                'data' => $feedback
            ], 201);

        } catch (ValidationException $e) {
            DB::rollBack();
            Log::error('Validation error: ' . json_encode($e->errors()));
            return response()->json([
                'success' => false,
                'message' => 'Validation failed',
                'errors' => $e->errors()
            ], 422);

        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Error submitting feedback: ' . $e->getMessage());
            return response()->json([
                'success' => false,
                'message' => 'An error occurred while submitting feedback',
                'error' => $e->getMessage()
            ], 500);
        }
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