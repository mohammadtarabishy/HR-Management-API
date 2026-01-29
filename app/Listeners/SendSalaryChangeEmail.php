<?php

namespace App\Listeners;

use App\Events\EmployeeSalaryChanged;
use App\Mail\SalaryChangedMail;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Support\Facades\Mail;

class SendSalaryChangeEmail implements ShouldQueue
{
    public function handle(EmployeeSalaryChanged $event): void
    {
        Mail::to($event->employee->email)->queue(
            new SalaryChangedMail(
                $event->employee,
                $event->oldSalary,
                $event->newSalary
            )
        );
    }
}
