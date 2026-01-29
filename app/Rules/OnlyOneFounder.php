<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\ImplicitRule;
use App\Models\Employee;

class OnlyOneFounder implements ImplicitRule
{
    protected $employeeId;

    public function __construct($employeeId = null)
    {
        $this->employeeId = $employeeId;
    }

    public function passes($attribute, $value): bool
    {
        if (!is_null($value)) {
            return true;
        }
        $founderQuery = Employee::whereNull('manager_id');
        if ($this->employeeId) {
            $founderQuery->where('id', '!=', $this->employeeId);
        }
        return !$founderQuery->exists();
    }

    public function message(): string
    {
        return 'Only one founder is allowed.';
    }
}
