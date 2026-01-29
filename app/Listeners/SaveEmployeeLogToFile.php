<?php

namespace App\Listeners;

use App\Events\EmployeeChanged;
use Illuminate\Support\Facades\Log;

class SaveEmployeeLogToFile
{
    public function handle(EmployeeChanged $event): void
    {
        Log::channel('employee')->info('Employee action', [
            'action' => $event->action,
            'employee_id' => $event->employee?->id,
            'old_data' => $event->oldData,
            'new_data' => $event->newData,
            'user_id' => auth()->id(),
            'timestamp' => now()->toDateTimeString(),
        ]);
    }
}
