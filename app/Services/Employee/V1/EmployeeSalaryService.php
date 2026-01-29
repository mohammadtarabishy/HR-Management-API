<?php

namespace App\Services\Employee\V1;

use App\Events\EmployeeChanged;
use App\Events\EmployeeSalaryChanged;
use App\Http\Resources\EmployeeResource;
use App\Models\Employee;
use Illuminate\Support\Facades\DB;

class EmployeeSalaryService
{
    public function changeSalary(Employee $employee, float $newSalary)
    {
        return DB::transaction(function () use ($employee, $newSalary) {
            $oldSalary = $employee->salary;
            if ($oldSalary == $newSalary) {
                return $employee;
            }
            $oldData = $employee->toArray();
            $employee->update([
                'salary' => $newSalary,
                'last_salary_change_at' => now(),
            ]);
            event(new EmployeeSalaryChanged($employee, $oldSalary, $newSalary));
            event(new EmployeeChanged(
                action: 'updated',
                employee: $employee,
                oldData: $oldData,
                newData: $employee->toArray()
            ));
            return new EmployeeResource($employee);
        });
    }

    /**
     * Get employees without salary change in X months
     */
    public function getEmployeesWithoutRecentSalaryChange(int $months)
    {
        $employees = Employee::query()
            ->where(function ($q) use ($months) {
                $q->whereNull('last_salary_change_at')
                    ->orWhere('last_salary_change_at', '<', now()->subMonths($months));
            })
            ->get();
        return EmployeeResource::collection($employees);
    }
}
