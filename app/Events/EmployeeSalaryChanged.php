<?php

namespace App\Events;

use App\Models\Employee;
use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
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
