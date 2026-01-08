-- Migration: Add Status Column to Orders Table
-- Adds status column to orders table if it doesn't exist
-- Default value: 'PLACED'
-- Safe to re-run (checks if column exists first)

USE amazon_clone;

-- Add Status Column (if not exists)
SET @col_exists = (
    SELECT COUNT(*) 
    FROM information_schema.columns 
    WHERE table_schema = 'amazon_clone' 
      AND table_name = 'orders' 
      AND column_name = 'status'
);

-- If column doesn't exist, add it
SET @sql = IF(
    @col_exists = 0,
    'ALTER TABLE orders ADD COLUMN status VARCHAR(50) DEFAULT ''PLACED'' AFTER shipping_address',
    'SELECT ''Column status already exists'' AS message'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Update Existing Orders (if status is NULL or empty)
UPDATE orders 
SET status = 'PLACED' 
WHERE status IS NULL OR status = '';

-- Add Index on Status Column (if not exists)
SET @index_exists = (
    SELECT COUNT(*) 
    FROM information_schema.statistics 
    WHERE table_schema = 'amazon_clone' 
      AND table_name = 'orders' 
      AND index_name = 'idx_status'
);

SET @sql_index = IF(
    @index_exists = 0,
    'ALTER TABLE orders ADD INDEX idx_status (status)',
    'SELECT ''Index idx_status already exists'' AS message'
);

PREPARE stmt_index FROM @sql_index;
EXECUTE stmt_index;
DEALLOCATE PREPARE stmt_index;

-- Verification (optional)
SELECT column_name, column_type, column_default 
FROM information_schema.columns 
WHERE table_schema = 'amazon_clone' 
  AND table_name = 'orders' 
  AND column_name = 'status';

