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
}
