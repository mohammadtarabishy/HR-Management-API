<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('employees', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('email')->unique();
            $table->decimal('salary', 10, 2);
            $table->timestamp('last_salary_change_at')->nullable();
            $table->foreignId('position_id')->constrained()->onDelete('cascade');
            $table->unsignedBigInteger('manager_id')->nullable();
            $table->timestamps();
            $table->foreign('manager_id')->references('id')->on('employees')->onDelete('set null');
            $table->index('salary');
            $table->fullText('name');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employees');
    }
};
