<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\RegisterRequest;
use App\Http\Requests\Auth\LoginRequest;
use App\Http\Resources\UserResource;
use App\Helpers\ApiResponse;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function register(RegisterRequest $request)
    {
        $user = User::create($request->validated());
        $token = $user->createToken('auth_token')->plainTextToken;
        return ApiResponse::success([
            'user' => new UserResource($user),
            'token' => $token,
        ], 'User registered successfully', 201);
    }

    public function login(LoginRequest $request)
    {
        if (!Auth::attempt($request->validated())) {
            return ApiResponse::unauthorized('Invalid credentials');
        }
        $user = Auth::user();
        $token = $user->createToken('auth_token')->plainTextToken;
        return ApiResponse::success([
            'user' => new UserResource($user),
            'token' => $token,
        ], 'Login successful');
    }

    public function logout()
    {
        $user = auth()->user();
        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'User not authenticated',
            ], 401);
        }
        $user->tokens()->delete();
        return response()->json([
            'success' => true,
            'message' => 'Logged out successfully',
        ]);
    }
}
