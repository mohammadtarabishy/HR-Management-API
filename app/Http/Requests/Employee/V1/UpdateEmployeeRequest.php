<?php

namespace App\Http\Requests\Employee\V1;

use App\Rules\OnlyOneFounder;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateEmployeeRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            'name' => 'sometimes|string|max:255',
            'email' => [
                'sometimes',
                'email',
                Rule::unique('employees', 'email')->ignore($this->route('employee')),
            ],
            'salary' => 'sometimes|numeric|min:0',
            'position_id' => 'sometimes|exists:positions,id',
            'manager_id' => [
                'exists:employees,id',
                new OnlyOneFounder($this->employee ? $this->employee->id : null),
            ],
        ];
    }
}
