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
}
