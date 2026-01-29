<?php

namespace App\Http\Requests\Position\V1;

use Illuminate\Foundation\Http\FormRequest;

class UpdatePositionRequest extends FormRequest
{
    public function rules(): array
    {
        $positionId = $this->route('id');
        return [
            'name' => "required|string|unique:positions,name,{$positionId}",
        ];
    }

    public function messages(): array
    {
        return [
            'name.required' => 'Position name is required.',
            'name.string' => 'Position name must be a valid string.',
            'name.unique' => 'This position name is already in use.',
        ];
    }
}
