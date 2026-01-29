<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Http\Requests\Position\V1\StorePositionRequest;
use App\Http\Requests\Position\V1\UpdatePositionRequest;
use App\Http\Resources\PositionResource;
use App\Services\Position\V1\PositionService;
use App\Helpers\ApiResponse;

class PositionController extends Controller
{
    protected PositionService $service;

    public function __construct(PositionService $service)
    {
        $this->service = $service;
    }

    public function index()
    {
        $positions = $this->service->getAll();
        return ApiResponse::success(PositionResource::collection($positions));
    }

    public function show($id)
    {
        $position = $this->service->getById($id);
        if (!$position) {
            return ApiResponse::notFound('Position not found');
        }
        return ApiResponse::success(new PositionResource($position));
    }

    public function store(StorePositionRequest $request)
    {
        $position = $this->service->create($request->validated());
        return ApiResponse::success(new PositionResource($position), 'Position created', 201);
    }

    public function update(UpdatePositionRequest $request, $id)
    {
        $position = $this->service->getById($id);
        if (!$position) {
            return ApiResponse::notFound('Position not found');
        }
        $position = $this->service->update($position, $request->validated());
        return ApiResponse::success(new PositionResource($position), 'Position updated');
    }

    public function destroy($id)
    {
        $position = $this->service->getById($id);
        if (!$position) {
            return ApiResponse::notFound('Position not found');
        }
        try {
            $this->service->delete($position);
            return ApiResponse::success(null, 'Position deleted');
        } catch (\RuntimeException $e) {
            return ApiResponse::error($e->getMessage());
        } catch (\Throwable $e) {
            return ApiResponse::error('An unexpected error occurred.', 500);
        }
    }
}
