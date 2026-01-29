<?php

namespace App\Http\Requests\Employee\V1;

use App\Rules\OnlyOneFounder;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateEmployeeRequest extends FormRequest
{
    public function rules(): array
    {
        $routeParam = $this->route('employee');
        $employeeId = is_object($routeParam) ? $routeParam->id : $routeParam;

        return [
            'name' => 'sometimes|string|max:255',
            'email' => [
                'sometimes',
                'email',
                Rule::unique('employees', 'email')->ignore($employeeId),
            ],
            'salary' => 'sometimes|numeric|min:0',
            'position_id' => 'sometimes|exists:positions,id',
            'manager_id' => [
                'sometimes',
                'exists:employees,id',
                new OnlyOneFounder($employeeId),
            ],
        ];
    }
}
