<?php

namespace App\Http\Requests\Employee\V1;

use Illuminate\Foundation\Http\FormRequest;

class UpdateEmployeeSalaryRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            'salary' => ['required', 'numeric', 'min:0'],
        ];
    }
    public function messages(): array
    {
        return [
            'salary.required' => 'The salary field is required.',
            'salary.numeric' => 'The salary must be a number.',
            'salary.min' => 'The salary must be at least 0.',
        ];
    }
}
