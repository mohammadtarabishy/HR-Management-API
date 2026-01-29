<?php

namespace App\Events;

use App\Models\Employee;
use Illuminate\Queue\SerializesModels;

class EmployeeSalaryChanged
{
    use SerializesModels;
    public function __construct(
        public Employee $employee,
        public float    $oldSalary,
        public float    $newSalary
    )
    {
    }
}
