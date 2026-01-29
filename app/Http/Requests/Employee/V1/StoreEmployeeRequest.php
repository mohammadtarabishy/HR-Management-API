<?php

namespace App\Http\Requests\Employee\V1;

use App\Rules\OnlyOneFounder;
use Illuminate\Foundation\Http\FormRequest;

class StoreEmployeeRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:employees,email',
            'salary' => 'required|numeric|min:0',
            'position_id' => 'required|exists:positions,id',
            'manager_id' => [
                'exists:employees,id',
                new OnlyOneFounder($this->employee ? $this->employee->id : null),
            ],
        ];
    }

    public function messages(): array
    {
        return [
            'name.required' => 'Employee name is required.',
            'name.string' => 'Employee name must be a valid string.',
            'name.max' => 'Employee name may not exceed 255 characters.',
            'email.required' => 'Email address is required.',
            'email.email' => 'Please enter a valid email address.',
            'email.unique' => 'This email address is already assigned to another employee.',
            'salary.required' => 'Salary is required.',
            'salary.numeric' => 'Salary must be a valid number.',
            'salary.min' => 'Salary must be greater than or equal to 0.',
            'position_id.required' => 'Position is required.',
            'position_id.exists' => 'The selected position does not exist.',
            'manager_id.exists' => 'The selected manager does not exist.',
        ];
    }

    protected function prepareForValidation()
    {
        if ($this->has('manager_id') && $this->manager_id === '') {
            $this->merge(['manager_id' => null]);
        }
    }
}
