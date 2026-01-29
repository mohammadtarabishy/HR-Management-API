<?php

namespace App\Console\Commands;

use App\Services\Employee\V1\LogCleanupService;
use Illuminate\Console\Command;

class EmployeeDBLogsCleanupCommand extends Command
{
    protected $signature = 'employee:logs:cleanup {--days=30 : Delete logs older than X days}';

    protected $description = 'Delete employee logs older than specified days';

    public function handle(LogCleanupService $service): int
    {
        $days = (int)$this->option('days');
        $deleted = $service->deleteOlderThan($days);
        $this->info("Deleted {$deleted} old employee logs.");
        return self::SUCCESS;
    }
}
