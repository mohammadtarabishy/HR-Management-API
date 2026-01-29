<?php

namespace App\Console\Commands;

use App\Services\Employee\V1\EmployeeService;
use Illuminate\Console\Command;

class EmployeeExportJsonCommand extends Command
{
    protected $signature = 'employees:json {--path=storage/exports/employees.json : File path to save JSON}';
    protected $description = 'Export employees to JSON file';

    public function handle(EmployeeService $service): int
    {
        $path = $this->option('path') ?? storage_path('app/employees_' . now()->format('Ymd_His') . '.json');
        $file = $service->exportToJson($path);
        $this->info("Employees exported to: {$file}");
        return self::SUCCESS;
    }
}
