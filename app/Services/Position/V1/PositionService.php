<?php

namespace App\Services\Position\V1;

use App\Models\Position;
use Illuminate\Database\Eloquent\Collection;

class PositionService
{
    public function getAll(): Collection
    {
        return Position::all();
    }

    public function getById(int $id): ?Position
    {
        return Position::find($id);
    }

    public function create(array $data): Position
    {
        return Position::create($data);
    }

    public function update(Position $position, array $data): Position
    {
        $position->update($data);
        return $position;
    }

    public function delete(Position $position): bool
    {
        if ($position->employees()->exists()) {
            throw new \RuntimeException('Cannot delete position assigned to employees.');
        }
        return $position->delete();
    }
}
