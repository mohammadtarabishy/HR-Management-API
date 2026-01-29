<?php

namespace App\Console\Commands;

use App\Services\DatabaseExportService;
use Illuminate\Console\Command;

class DatabaseExportCommand extends Command
{
    protected $signature = 'db:export {--path= : Optional path to save the SQL file}';
    protected $description = 'Export Database';

    public function handle(DatabaseExportService $service): int
    {
        $path = $this->option('path') ?? storage_path('exports/db_backup_' . now()->format('Ymd_His') . '.sql');
        if (!is_dir(dirname($path))) {
            mkdir(dirname($path), 0755, true);
        }
        $file = $service->export($path);
        $this->info("Database exported to: {$file}");
        return self::SUCCESS;
    }
}
