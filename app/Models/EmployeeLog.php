<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class EmployeeLog extends Model
{
    protected $fillable = [
        'employee_id',
        'action',
        'old_data',
        'new_data',
        'user_id',
    ];

    protected $casts = [
        'old_data' => 'array',
        'new_data' => 'array',
        ];
}
