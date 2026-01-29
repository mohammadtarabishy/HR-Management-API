<?php

namespace App\Events;

use App\Models\Employee;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class SalaryChangedBroadcast implements ShouldBroadcast
{
    use InteractsWithSockets;
    public Employee $employee;
    public float $newSalary;

    public function __construct(Employee $employee, float $newSalary)
    {
        $this->employee = $employee;
        $this->newSalary = $newSalary;
    }

    public function broadcastOn()
    {
        $channels = [];
        $manager = $this->employee->manager;
        while ($manager) {
            $channels[] = new PrivateChannel('managers.' . $manager->id);
            $manager = $manager->manager;
        }
        $channels[] = new PrivateChannel('managers.1');
        return $channels;
    }

    public function broadcastWith()
    {
        return [
            'employee_id' => $this->employee->id,
            'name' => $this->employee->name,
            'new_salary' => $this->newSalary,
        ];
    }
}
