<?php

namespace App\Http\Controllers\Api\V1;

use App\Helpers\ApiResponse;
use App\Http\Controllers\Controller;
use App\Http\Requests\Employee\V1\ImportEmployeeRequest;
use App\Http\Requests\Employee\V1\StoreEmployeeRequest;
use App\Http\Requests\Employee\V1\UpdateEmployeeRequest;
use App\Http\Requests\Employee\V1\UpdateEmployeeSalaryRequest;
use App\Http\Resources\EmployeeResource;
use App\Models\Employee;
use App\Services\Employee\V1\EmployeeSalaryService;
use App\Services\Employee\V1\EmployeeService;
use Illuminate\Http\Request;

class EmployeeController extends Controller
{
    public function __construct(private EmployeeService $employeeService)
    {
    }

    public function index(Request $request)
    {
        $employees = $this->employeeService->list($request->all());
        return ApiResponse::success(EmployeeResource::collection($employees));
    }

    public function store(StoreEmployeeRequest $request)
    {
        $employee = $this->employeeService->create($request->validated());
        return ApiResponse::success(new EmployeeResource($employee));
    }

    public function update(UpdateEmployeeRequest $request, int $id)
    {
        $employee = $this->employeeService->update($id, $request->validated());
        return ApiResponse::success(new EmployeeResource($employee));
    }

    public function hierarchy(int $id)
    {
        $result = $this->employeeService->hierarchy($id);
        return ApiResponse::success($result);
    }

    public function hierarchyWithSalary(int $id)
    {
        $result = $this->employeeService->hierarchy($id, true);
        return ApiResponse::success($result);
    }

    public function destroy(int $id)
    {
        $employee = $this->employeeService->getById($id);
        if (!$employee) {
            return ApiResponse::notFound('Employee not found');
        }
        $this->employeeService->delete($id);
        return ApiResponse::success(null, 'Employee deleted successfully');
    }

    public function export()
    {
        return $this->employeeService->exportEmployees();
    }

    public function import(ImportEmployeeRequest $request)
    {
        $file = $request->file('file');
        $result = $this->employeeService->importEmployeesFromCSV($file);
        return response()->json([
            'message' => 'Employees import completed',
            'success' => $result['success'],
            'failed' => $result['failed'],
            'failedRows' => $result['failedRows'],
        ]);
    }

    public function updateSalary(UpdateEmployeeSalaryRequest $request, Employee $employee, EmployeeSalaryService $service)
    {
        $employee = $service->changeSalary($employee, $request->salary);
        return ApiResponse::success($employee);
    }

    public function employeesWithoutSalaryChange(Request $request, EmployeeSalaryService $service)
    {
        $months = (int)$request->query('months', 2);
        return ApiResponse::success($service->getEmployeesWithoutRecentSalaryChange($months));
    }
}
