<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    protected $fillable = ['name', 'email', 'salary', 'position_id', 'manager_id', 'last_salary_change_at'];

    public function position() {
        return $this->belongsTo(Position::class);
    }

    public function manager() {
        return $this->belongsTo(Employee::class, 'manager_id');
    }

    public function parentManagers() {
        return $this->manager()->with('parentManagers');
    }
    public function subordinates()
    {
        return $this->hasMany(Employee::class, 'manager_id');
    }
}
