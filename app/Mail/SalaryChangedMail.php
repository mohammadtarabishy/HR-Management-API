<?php

namespace App\Mail;

use App\Models\Employee;
use Illuminate\Mail\Mailable;

class SalaryChangedMail extends Mailable
{
    public function __construct(
        public Employee $employee,
        public float $oldSalary,
        public float $newSalary
    ) {}

    public function build()
    {
        return $this->subject('Your Salary Has Been Updated')
            ->view('emails.salary_changed')
            ->with([
                'name' => $this->employee->name,
                'oldSalary' => $this->oldSalary,
                'newSalary' => $this->newSalary,
            ]);
    }
}
