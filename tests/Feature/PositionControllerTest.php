<?php

namespace Tests\Feature;

use App\Models\User;
use Tests\TestCase;
use App\Models\Position;
use App\Services\Position\V1\PositionService;
use Illuminate\Foundation\Testing\WithFaker;
use PHPUnit\Framework\Attributes\Test;

class PositionControllerTest extends TestCase
{
    use WithFaker;

    #[Test]
    public function test_index_returns_positions()
    {
        $user = User::factory()->create();
        $this->actingAs($user, 'sanctum');

        $positions = Position::factory()->count(3)->make();
        $this->mock(PositionService::class, function ($mock) use ($positions) {
            $mock->shouldReceive('getAll')->once()->andReturn($positions);
        });

        $response = $this->getJson('/api/v1/positions');

        $response->assertStatus(200)
            ->assertJsonStructure(['success', 'message', 'data']);
    }

    #[Test]
    public function test_store_creates_position()
    {
        $user = User::factory()->create();
        $this->actingAs($user, 'sanctum');

        $data = ['name' => 'Manager'];
        $position = Position::factory()->make($data);

        $this->mock(PositionService::class, function ($mock) use ($position, $data) {
            $mock->shouldReceive('create')->with($data)->once()->andReturn($position);
        });
        $response = $this->postJson('/api/v1/positions', $data);
        $response->assertStatus(201)
            ->assertJson(['success' => true, 'message' => 'Position created']);
    }

    #[Test]
    public function test_store_validation_error()
    {
        $user = User::factory()->create();
        $this->actingAs($user, 'sanctum');
        $response = $this->postJson('/api/v1/positions', []);
        $response->assertStatus(422)
            ->assertJsonValidationErrors(['name']);
    }

    #[Test]
    public function test_update_position_success()
    {
        $user = User::factory()->create();
        $this->actingAs($user, 'sanctum');
        $data = ['name' => 'Updated Name'];
        $position = Position::factory()->make($data);
        $this->mock(PositionService::class, function ($mock) use ($position, $data) {
            $mock->shouldReceive('getById')->with(1)->once()->andReturn($position);
            $mock->shouldReceive('update')->with($position, $data)->once()->andReturn($position);
        });
        $response = $this->putJson('/api/v1/positions/1', $data);
        $response->assertStatus(200)
            ->assertJson(['success' => true, 'message' => 'Position updated']);
    }

    #[Test]
    public function test_update_position_not_found()
    {
        $user = User::factory()->create();
        $this->actingAs($user, 'sanctum');
        $this->mock(PositionService::class, function ($mock) {
            $mock->shouldReceive('getById')->with(999)->once()->andReturn(null);
        });
        $response = $this->putJson('/api/v1/positions/999', ['name' => 'Test']);
        $response->assertStatus(404)
            ->assertJson(['success' => false, 'message' => 'Position not found']);
    }
    #[Test]
    public function test_update_position_validation_error()
    {
        $user = User::factory()->create();
        $this->actingAs($user, 'sanctum');
        $response = $this->putJson('/api/v1/positions/1', []);
        $response->assertStatus(422)
            ->assertJsonValidationErrors(['name']);
    }
    #[Test]
    public function test_destroy_position_success()
    {
        $user = User::factory()->create();
        $this->actingAs($user, 'sanctum');
        $position = Position::factory()->make();
        $this->mock(PositionService::class, function ($mock) use ($position) {
            $mock->shouldReceive('getById')->with(1)->once()->andReturn($position);
            $mock->shouldReceive('delete')->with($position)->once();
        });
        $response = $this->deleteJson('/api/v1/positions/1');
        $response->assertStatus(200)
            ->assertJson(['success' => true, 'message' => 'Position deleted']);
    }
    #[Test]
    public function test_destroy_position_not_found()
    {
        $user = User::factory()->create();
        $this->actingAs($user, 'sanctum');
        $this->mock(PositionService::class, function ($mock) {
            $mock->shouldReceive('getById')->with(999)->once()->andReturn(null);
        });
        $response = $this->deleteJson('/api/v1/positions/999');
        $response->assertStatus(404);
    }

    #[Test]
    public function test_destroy_position_runtime_exception()
    {
        $user = User::factory()->create();
        $this->actingAs($user, 'sanctum');
        $position = Position::factory()->make();
        $this->mock(PositionService::class, function ($mock) use ($position) {
            $mock->shouldReceive('getById')->with(1)->once()->andReturn($position);
            $mock->shouldReceive('delete')->with($position)->andThrow(new \RuntimeException('Cannot delete'));
        });
        $response = $this->deleteJson('/api/v1/positions/1');
        $response->assertStatus(400)
            ->assertJson(['success' => false, 'message' => 'Cannot delete']);
    }
    #[Test]
    public function test_destroy_position_unexpected_exception()
    {
        $user = User::factory()->create();
        $this->actingAs($user, 'sanctum');
        $position = Position::factory()->make();
        $this->mock(PositionService::class, function ($mock) use ($position) {
            $mock->shouldReceive('getById')->with(1)->once()->andReturn($position);
            $mock->shouldReceive('delete')->with($position)->andThrow(new \Exception());
        });
        $response = $this->deleteJson('/api/v1/positions/1');
        $response->assertStatus(500)
            ->assertJson(['success' => false, 'message' => 'An unexpected error occurred.']);
    }
}
