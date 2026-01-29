<?php

namespace App\Http\Requests\Employee\V1;

use Illuminate\Foundation\Http\FormRequest;

class ImportEmployeeRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            'file' => [
                'required',
                'file',
                'mimes:csv',
                'mimetypes:text/csv,application/csv,application/vnd.ms-excel',
                'max:2048',
            ],
        ];
    }

    protected function prepareForValidation()
    {
        if ($this->hasFile('file')) {
            $lines = count(file($this->file('file')->getRealPath()));
            if ($lines > 1000) {
                abort(422, 'CSV file has too many rows (max 5000).');
            }
        }
    }

    public function messages(): array
    {
        return [
            'file.required' => 'CSV file is required',
            'file.mimes' => 'Only CSV files are allowed',
            'file.mimetypes' => 'Invalid CSV file type',
            'file.max' => 'File size should not exceed 2MB',
        ];
    }
}
