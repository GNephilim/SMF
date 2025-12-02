<?php
/**
 * Database initialization script for Docker setup
 */

define('SMF', 1);
define('SMF_SETTINGS_FILE', __DIR__ . '/Settings.php');

// Load SMF's config
require_once __DIR__ . '/Sources/Config.php';
require_once __DIR__ . '/Sources/Db/Api.php';

use SMF\Db;

try {
    // Connect to database
    $db = Db::load();
    
    // Get all schema files from v3_0
    $schema_dir = __DIR__ . '/Sources/Db/Schema/v3_0';
    $files = glob($schema_dir . '/*.php');
    sort($files);
    
    echo "Creating SMF database tables...\n";
    
    foreach ($files as $file) {
        if (basename($file) === 'index.php') {
            continue;
        }
        
        include $file;
        echo "Loaded: " . basename($file) . "\n";
    }
    
    echo "Database initialization complete!\n";
    
} catch (Exception $e) {
    die("Error: " . $e->getMessage() . "\n");
}
