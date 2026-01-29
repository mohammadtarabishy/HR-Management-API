<?php

namespace App\Services\Employee\V1;

use App\Events\EmployeeChanged;
use App\Events\EmployeeSalaryChanged;
use App\Models\Employee;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\UploadedFile;
use Illuminate\Validation\ValidationException;
use Symfony\Component\HttpFoundation\StreamedResponse;
use Illuminate\Support\Str;

class EmployeeService
{
    public function __construct(private EmployeeImportService $importService)
    {
    }

    public function list(array $filters = []): Collection
    {
        return Employee::query()
            ->when($filters['name'] ?? null, fn($q, $name) => $q->where('name', 'like', "%{$name}%"))
            ->when($filters['salary'] ?? null, fn($q, $salary) => $q->where('salary', $salary))
            ->with(['position:id,name', 'manager:id,name'])
            ->get();
    }

    public function create(array $data): Employee
    {
        $employee = Employee::create($data);
        event(new EmployeeChanged(
            'created',
            $employee,
            [],
            $employee->toArray()
        ));
        return $employee;
    }

    public function update(int $id, array $data): Employee
    {
        $employee = $this->findOrFail($id);
        $oldData = $employee->toArray();
        $oldSalary = $employee->salary;
        $newSalary = $data['salary'] ?? $oldSalary;
        if ($oldSalary !== $newSalary) {
            $data['last_salary_change_at'] = now();
        }
        $employee->update($data);
        event(new EmployeeChanged(
            action: 'updated',
            employee: $employee,
            oldData: $oldData,
            newData: $employee->toArray()
        ));
        if ($oldSalary !== $newSalary) {
            event(new EmployeeSalaryChanged($employee, $oldSalary, $newSalary));
        }
        return $employee;
    }

    public function delete(int $id): void
    {
        $employee = $this->findOrFail($id);
        if ($employee->subordinates()->exists()) {
            throw new \RuntimeException('Cannot delete manager assigned to employees.');
        }
        $oldData = $employee->toArray();
        $employee->delete();
        event(new EmployeeChanged(
            'deleted',
            null,
            $oldData,
            []
        ));
    }

    public function getById(int $id): ?Employee
    {
        return Employee::find($id);
    }

    public function hierarchy(int $id, bool $withSalary = false): array
    {
        $employee = Employee::with('parentManagers:name,salary')->findOrFail($id);
        $hierarchy = [];
        $current = $employee;

        while ($current) {
            if ($withSalary) {
                $hierarchy[$current->name] = (float)$current->salary;
            } else {
                $hierarchy[] = $current->name;
            }

            $current = $current->manager;
        }

        return array_reverse($hierarchy);
    }

    private function findOrFail(int $id): Employee
    {
        return Employee::with('manager')->findOrFail($id);
    }


    public function exportEmployees(): StreamedResponse
    {
        $fileName = 'employees_' . now()->format('Y_m_d_H_i_s') . '.csv';
        $employees = Employee::with(['position', 'manager'])->get();
        $headers = [
            "Content-Type" => "text/csv",
            "Content-Disposition" => "attachment; filename=\"$fileName\"",
        ];
        $callback = function () use ($employees) {
            $handle = fopen('php://output', 'w');
            fputcsv($handle, [
                'Name',
                'Email',
                'Salary',
                'Last Salary Change At',
                'Founder',
                'Position',
                'Manager',
            ]);
            foreach ($employees as $employee) {
                fputcsv($handle, [
                    $employee->name,
                    $employee->email,
                    $employee->salary,
                    $employee->last_salary_change_at,
                    $employee->manager ? 'No' : 'Yes',
                    $employee->position?->name,
                    $employee->manager?->name,
                ]);
            }
            fclose($handle);
        };
        return response()->stream($callback, 200, $headers);
    }

    public function importEmployeesFromCSV(UploadedFile $file): array
    {
        return $this->importService->import($file);
    }

    public function seed(int $count, callable $progressCallback = null): void
    {
        $batchSize = 100;
        $batch = [];
        for ($i = 1; $i <= $count; $i++) {
            $batch[] = [
                'name' => 'Employee ' . Str::random(6),
                'email' => Str::random(8) . '@example.com',
                'position_id' => 1,
                'manager_id' => 1,
                'salary' => rand(500, 5000),
                'created_at' => now(),
                'updated_at' => now(),
            ];
            if ($progressCallback) {
                $progressCallback();
            }
            if (count($batch) >= $batchSize) {
                Employee::insert($batch);
                $batch = [];
            }
        }
        if (!empty($batch)) {
            Employee::insert($batch);
        }
    }

    public function exportToJson(string $path): string
    {
        $directory = dirname($path);
        if (!is_dir($directory)) {
            mkdir($directory, 0755, true); // recursive creation
        }
        $employees = Employee::with(['position', 'manager'])->get();
        file_put_contents($path, $employees->toJson(JSON_PRETTY_PRINT));
        return $path;
    }
}
