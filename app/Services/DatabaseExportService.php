<?php

namespace App\Services;

use Illuminate\Support\Facades\DB;
use Exception;

class DatabaseExportService
{
    public function export(string $filePath): string
    {
        $dbName = config('database.connections.mysql.database');
        $tables = DB::select('SHOW TABLES');
        if (empty($tables)) {
            throw new Exception("No tables found in database {$dbName}");
        }
        $sql = "-- Database Export: {$dbName}\n-- Generated at " . now() . "\n\n";
        foreach ($tables as $tableObj) {
            $tableName = array_values((array)$tableObj)[0];
            $sql .= "DROP TABLE IF EXISTS `{$tableName}`;\n";
            $createTable = DB::select("SHOW CREATE TABLE `{$tableName}`");
            $createSql = $createTable[0]->{'Create Table'};
            $sql .= $createSql . ";\n\n";
            $rows = DB::table($tableName)->get();
            foreach ($rows as $row) {
                $columns = array_map(fn($col) => "`$col`", array_keys((array)$row));
                $values = array_map(fn($val) => is_null($val) ? "NULL" : "'" . str_replace("'", "''", $val) . "'", (array)$row);

                $sql .= "INSERT INTO `{$tableName}` (" . implode(',', $columns) . ") VALUES (" . implode(',', $values) . ");\n";
            }
            $sql .= "\n";
        }
        if (false === file_put_contents($filePath, $sql)) {
            throw new Exception("Failed to write database export to: {$filePath}");
        }
        return $filePath;
    }
}
