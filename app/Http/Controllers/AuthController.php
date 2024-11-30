<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Confirmation;
use App\Http\Requests\UserStoreRequest;
use App\Http\Requests\UpdateUserRequest;
use App\Http\Requests\LoginRequest;
use Infobip\Configuration;
use Infobip\Api\SmsApi;
use Infobip\Model\SmsDestination;
use Infobip\Model\SmsTextualMessage;
use Infobip\Model\SmsAdvancedTextualRequest;
use App\Events\UserLoggedOutFromOtherDevices;
use Illuminate\Support\Facades\Log;



require(__DIR__ . '/../../../vendor/autoload.php');

class AuthController extends Authenticatable
{

    public function __construct() {
        $this->model = new User();
    }


    public function validateToken(Request $request)
    {
        \Log::info('Received token: ' . $request->bearerToken());
        \Log::info('Auth user: ' . Auth::user());
        $user = Auth::user(); // Get the authenticated user

        if ($user) {
            return response()->json([
                'message' => 'Token is valid',
                'role' => $user->role_id,
                'status' => $user->status,
                'user_id' => $user->user_id,
                'token' => $request->bearerToken(), // You can return the token or any other data if needed
            ], 200);
        }

        return response()->json(['message' => 'Invalid or expired token'], 401);
    }

    /**
     *  /api/user/login
     * Store a newly created resource in storage.
     */
    public function loginAccount(LoginRequest $request)
    {
        try {
            $credentials = $request->only(['email', 'password']);

            if (!Auth::attempt($credentials)) {
                return response(['message' => "Account doesn't exist"], 404);
            }

            $user = $request->user();

            if ($user->is_logged_in) {
                Auth::logout();
                return response()->json([
                    'message' => 'Your account is already logged in on another device.',
                ], 403);
            }
    
            // Set the user as logged in
            $user->is_logged_in = true;
            $user->save();

            $token = $user->createToken('Personal Access Token')->plainTextToken;


            // if($user->status === "Disabled"){
            //     return response(['message' => 'Disabled'], 200);
            // }
            
            return response([
                'token' => $token,
                'role' => $user->role_id,
                'status' => $user->status,
                'user_id' => $user->user_id
            ], 200);
        } catch (\Throwable $th) {
            return response(['message' => $th->getMessage()], 400);
        }
    }



    // public function loginAccountMobile(Request $request)
    // {
    //     try {
    //         $credentials = $request->only(['user_name', 'password']);
    
    //         if (!Auth::attempt($credentials)) {
    //             return response(['message' => "Invalid username or password"], 401);
    //         }
    
    //         $user = $request->user();

    //         if ($user->is_logged_in) {
    //             Auth::logout();
    //             return response()->json([
    //                 'message' => 'Your account is already logged in on another device.',
    //             ], 403);
    //         }
    
    //         // Set the user as logged in
    //         $user->is_logged_in = true;
    //         $user->save();
    //         $token = $user->createToken('Personal Access Token')->plainTextToken;
            
    //         return response([
    //             'token' => $token,
    //             'role' => $user->role_id,
    //             'status' => $user->status,
    //             'user_id' => $user->user_id  // Include the user_id in the response
    //         ], 200);
    //     } catch (\Throwable $th) {
    //         return response(['message' => $th->getMessage()], 400);
    //     }
    // }

    public function loginAccountMobile(Request $request)
    {
        $credentials = $request->only(['user_name', 'password']);
    
        if (Auth::attempt($credentials)) {
            $user = Auth::user();
    
            // Notify other devices
            
            event(new UserLoggedOutFromOtherDevices($user->user_id));
    
            // Revoke all previous tokens
            $user->tokens()->delete();
    
            // Create a new token
            $token = $user->createToken('Personal Access Token')->plainTextToken;
    
            return response([
                            'token' => $token,
                            'role' => $user->role_id,
                            'status' => $user->status,
                            'user_id' => $user->user_id  // Include the user_id in the response
                        ], 200);
        }
    
        return response()->json(['message' => 'Invalid credentials.'], 401);
    }



     public function accountUpdate(UpdateUserRequest $request, User $user)
    {
        try {
            $userDetails = $user->find($request->user()->user_id);

            if (! $userDetails) {
                return response(["message" => "User not found"], 404);
            }

            $userDetails->update($request->validated());

            return response(["message" => "User Successfully Updated"], 200);
        } catch (\Throwable $th) {
            return response(["message" => $th->getMessage()], 400);
        }
    }

     
    

    // /api/user/signup
    // Create Account function

    public function createAccount(UserStoreRequest $request)
    {
        try {
            $this->model->create($request->all());
            return response(['message' => "Successfully created"], 201);
        } catch (\Throwable $e) {
            // Log the error message to understand what's going wrong
            \Log::error('User creation failed: ' . $e->getMessage());
            return response(['errors' => $e->getMessage()], 400);
        }
    }


    public function logoutAccount(Request $request) {
        try {
            // Check if the user and token exist
            $user = $request->user();
            if ($user) {
                $rider = Rider::where('user_id', $user->user_id)
                    ->first();
                $rider->availability = "Offline";
                $rider->save(); 

                $user->is_logged_in = false;
                $user->save();
                $token = $user->currentAccessToken();
                if ($token) {
                    $token->delete();
                }
            }
    
            // Return a success response regardless of token state
            return response(['message' => 'Successfully logged out'], 200);
        } catch (\Throwable $th) {
            // Handle cases where the token is invalid or already removed
            return response(['message' => 'Logout completed, token not found or already invalid'], 200);
        }
    }

    /**
     * /api/user/me
     */
    public function show(Request $request)
    {
        return response()->json($request->user(), 200);
    }



}
