<?php

namespace App\Listeners;

use App\Events\EmployeeChanged;
use App\Models\EmployeeLog;

class SaveEmployeeLogToDatabase
{
    public function handle(EmployeeChanged $event): void
    {
        EmployeeLog::create([
            'employee_id' => $event->employee?->id,
            'action' => $event->action,
            'old_data' => $event->oldData,
            'new_data' => $event->newData,
            'user_id' => auth()->id(),
        ]);
    }
}
