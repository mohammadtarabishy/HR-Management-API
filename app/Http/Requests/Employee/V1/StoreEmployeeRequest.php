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

    protected function prepareForValidation()
    {
        if ($this->has('manager_id') && $this->manager_id === '') {
            $this->merge(['manager_id' => null]);
        }
    }
}
