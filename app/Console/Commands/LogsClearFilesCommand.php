<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\File;

class LogsClearFilesCommand extends Command
{
    protected $signature = 'logs:clear-files {--force : Force delete without confirmation}';
    protected $description = 'Remove all log files from storage/logs';

    public function handle(): int
    {
        if (!$this->option('force') && !$this->confirm('Are you sure you want to delete all log files?')) {
            $this->warn('Operation cancelled.');
            return self::FAILURE;
        }

        $path = storage_path('logs');

        $files = File::files($path);

        foreach ($files as $file) {
            File::delete($file->getPathname());
        }

        $this->info('All log files deleted successfully.');

        return self::SUCCESS;
    }
}
