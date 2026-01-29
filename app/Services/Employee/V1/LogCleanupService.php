<?php

namespace App\Services\Employee\V1;

use App\Models\EmployeeLog;
use Carbon\Carbon;

class LogCleanupService
{
    public function deleteOlderThan(int $days): int
    {
        return EmployeeLog::where('created_at', '<', Carbon::now()->subDays($days))
            ->delete();
    }
}
