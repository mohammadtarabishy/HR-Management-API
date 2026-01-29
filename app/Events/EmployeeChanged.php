<?php

namespace App\Events;

use App\Models\Employee;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class EmployeeChanged
{
    use Dispatchable, SerializesModels;

    public string $action;
    public ?Employee $employee;
    public array $oldData;
    public array $newData;

    public function __construct(string $action, ?Employee $employee, array $oldData = [], array $newData = [])
    {
        $this->action = $action;
        $this->employee = $employee;
        $this->oldData = $oldData;
        $this->newData = $newData;
    }
}
