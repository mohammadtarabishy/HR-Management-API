<?php

namespace App\Console\Commands;

use App\Services\Employee\V1\EmployeeService;
use Illuminate\Console\Command;

class EmployeeInsertCommand extends Command
{
    protected $signature = 'employee:seed {count=100 : Number of employees to insert}';
    protected $description = 'Insert employees with progress bar';

    public function handle(EmployeeService $service): int
    {
        $count = (int) $this->argument('count');
        $this->info("Seeding {$count} employees");
        $bar = $this->output->createProgressBar($count);
        $bar->start();
        $service->seed($count, function () use ($bar) {
            $bar->advance();
        });
        $bar->finish();
        $this->newLine();
        $this->info('Employees inserted successfully.');
        return self::SUCCESS;
    }
}
