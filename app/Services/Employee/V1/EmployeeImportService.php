<?php

namespace App\Services\Employee\V1;

use App\Events\EmployeeChanged;
use App\Models\Employee;
use App\Models\Position;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\DB;

class EmployeeImportService
{
    public function import(UploadedFile $file): array
    {
        $rows = $this->parseCSV($file);

        $positions = Position::pluck('id', 'name')
            ->mapWithKeys(fn($id, $name) => [strtolower($name) => $id])
            ->toArray();
        $employeesByName = Employee::pluck('id', 'name')
            ->mapWithKeys(fn($id, $name) => [strtolower($name) => $id])
            ->toArray();
        $topManagerExists = Employee::whereNull('manager_id')->exists();
        $success = 0;
        $failed = 0;
        $failedRows = [];
        $pendingRows = $rows;
        while (!empty($pendingRows)) {
            $newPending = [];
            $anyInserted = false;
            foreach ($pendingRows as $data) {
                $rowErrors = $this->validateRow($data, $employeesByName, $positions, $topManagerExists);
                if (!empty($rowErrors)) {
                    if (isset($rowErrors['manager_not_found']) && $rowErrors['manager_not_found'] === true) {
                        $newPending[] = $data;
                        continue;
                    }
                    $failed++;
                    $failedRows[] = [
                        'row' => $data['_row_number'],
                        'data' => $data,
                        'errors' => array_values($rowErrors),
                    ];
                    continue;
                }
                $positionId = $this->getOrCreatePosition($data['position'], $positions);
                $managerId = null;
                if (!empty($data['manager'])) {
                    $managerNameKey = strtolower(trim($data['manager']));
                    $managerId = $employeesByName[$managerNameKey] ?? null;
                }
                DB::transaction(function () use ($data, $positionId, $managerId, &$employeesByName) {
                    $employee = Employee::create([
                        'name' => $data['name'],
                        'email' => $data['email'],
                        'salary' => $data['salary'],
                        'position_id' => $positionId,
                        'manager_id' => $managerId,
                    ]);
                    DB::afterCommit(function () use ($employee) {
                        event(new EmployeeChanged(
                            'created',
                            $employee,
                            [],
                            $employee->toArray()
                        ));
                    });
                    $employeesByName[strtolower(trim($employee->name))] = $employee->id;
                });
                $success++;
                $anyInserted = true;
            }
            if (!$anyInserted) {
                foreach ($newPending as $data) {
                    $failed++;
                    $failedRows[] = [
                        'row' => $data['_row_number'],
                        'data' => $data,
                        'errors' => ['Manager not found'],
                    ];
                }
                break;
            }
            $pendingRows = $newPending;
        }
        return [
            'success' => $success,
            'failed' => $failed,
            'failedRows' => $failedRows,
        ];
    }

    protected function parseCSV(UploadedFile $file): array
    {
        $path = $file->getRealPath();
        $rows = array_map('str_getcsv', file($path));
        $header = array_map('trim', array_shift($rows));
        $dataRows = [];
        foreach ($rows as $index => $row) {
            $dataRows[] = array_merge(array_combine($header, $row), [
                '_row_number' => $index + 2,
            ]);
        }
        return $dataRows;
    }

    protected function validateRow(array $data, array $employeesByName, array $positions, bool $topManagerExists): array
    {
        $errors = [];
        if (empty($data['name'])) {
            $errors['name'] = 'Name is required';
        }
        if (empty($data['email'])) {
            $errors['email'] = 'Email is required';
        } elseif (Employee::where('email', $data['email'])->exists()) {
            $errors['email'] = 'Email must be unique';
        }
        if (!isset($data['salary']) || !is_numeric($data['salary']) || $data['salary'] < 0) {
            $errors['salary'] = 'Salary must be a number >= 0';
        }
        if (empty($data['position'])) {
            $errors['position'] = 'Position is required';
        }
        $managerName = strtolower(trim($data['manager'] ?? ''));
        if (!empty($managerName)) {
            if (!isset($employeesByName[$managerName])) {
                $errors['manager_not_found'] = true; // retry later
            }
        } else {
            if ($topManagerExists) {
                $errors['top_manager'] = 'Founder already exists';
            }
        }
        return $errors;
    }

    protected function getOrCreatePosition(string $positionName, array &$positions): int
    {
        $key = strtolower(trim($positionName));
        if (isset($positions[$key])) {
            return $positions[$key];
        }
        $position = Position::create(['name' => $positionName]);
        $positions[$key] = $position->id;
        return $position->id;
    }
}
