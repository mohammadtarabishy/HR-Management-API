<?php

namespace App\Listeners;

use App\Events\EmployeeSalaryChanged;
use App\Events\SalaryChangedBroadcast;
use Illuminate\Contracts\Queue\ShouldQueue;

class BroadcastSalaryChange implements ShouldQueue
{
    public function handle(EmployeeSalaryChanged $event): void
    {
        broadcast(new SalaryChangedBroadcast(
            $event->employee,
            $event->newSalary
        ));
    }
}
