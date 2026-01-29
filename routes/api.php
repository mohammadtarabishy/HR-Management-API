<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Api\V1\AuthController;
use App\Http\Controllers\Api\v1\EmployeeController;
use App\Http\Controllers\Api\V1\PositionController;

Route::prefix('v1')->group(function () {

    Route::middleware('throttle:auth')->group(function () {
        Route::post('/register', [AuthController::class, 'register']);
        Route::post('/login', [AuthController::class, 'login']);
    });
    Route::get('/reports/employees/no-salary-change', [EmployeeController::class, 'employeesWithoutSalaryChange']);

    Route::middleware(['auth:sanctum','throttle:api'])->group(function () {
        Route::post('/logout', [AuthController::class, 'logout']);
        Route::get('employees/search', [EmployeeController::class, 'index']);

        Route::patch('employees/{employee}/salary', [EmployeeController::class, 'updateSalary']);
//    Route::get('employees/salary-change-list', [EmployeeController::class, 'employeesWithoutSalaryChange']);

        Route::get('employees/{employee}/hierarchy', [EmployeeController::class, 'hierarchy']);
        Route::get('employees/{employee}/hierarchy-salary', [EmployeeController::class, 'hierarchyWithSalary']);

        Route::apiResource('employees', EmployeeController::class)->except(['show']);

        Route::get('employees-export', [EmployeeController::class, 'export']);
        Route::post('employees-import', [EmployeeController::class, 'import']);

        Route::apiResource('positions', PositionController::class)->except(['show']);
    });


});

