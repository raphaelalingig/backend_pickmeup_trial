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

require(__DIR__ . '/../../../vendor/autoload.php');

class AuthController extends Authenticatable
{

    public function __construct() {
        $this->model = new User();
    }

    /**
     *  /api/user/login
     * Store a newly created resource in storage.
     */

    public function showCustomer() {
        try {
            return User::where('role_id', 3)->get();
        } catch (\Throwable $th) {
            return response(["message" => $th->getMessage()]);
        }
    }

    public function showRider() {
        try {
            return User::where('role_id', 2)->get();
        } catch (\Throwable $th) {
            return response(["message" => $th->getMessage()]);
        }
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



    public function loginAccountMobile(Request $request)
    {
        try {
            $credentials = $request->only(['user_name', 'password']);
    
            if (!Auth::attempt($credentials)) {
                return response(['message' => "Invalid username or password"], 401);
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
            
            return response([
                'token' => $token,
                'role' => $user->role_id,
                'status' => $user->status,
                'user_id' => $user->user_id  // Include the user_id in the response
            ], 200);
        } catch (\Throwable $th) {
            return response(['message' => $th->getMessage()], 400);
        }
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
