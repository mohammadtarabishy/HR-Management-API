<?php

namespace App\Http\Requests\Position\V1;

use Illuminate\Foundation\Http\FormRequest;

class StorePositionRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            'name' => 'required|string|unique:positions,name',
        ];
    }

    public function messages(): array
    {
        return [
            'name.required' => 'Position name is required.',
            'name.string' => 'Position name must be a valid string.',
            'name.unique' => 'This position name already exists.',
        ];
    }
}
