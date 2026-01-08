-- Migration: Add UNIQUE Constraint to Product Name
-- Run this AFTER removing duplicates
-- Safe to re-run (checks if constraint exists first)

USE amazon_clone;

-- Check if constraint/index already exists
SET @index_exists = (
    SELECT COUNT(*) 
    FROM information_schema.statistics 
    WHERE table_schema = 'amazon_clone' 
      AND table_name = 'products' 
      AND index_name = 'uniq_product_name'
);

-- Add UNIQUE constraint if it doesn't exist
SET @sql = IF(
    @index_exists = 0,
    'ALTER TABLE products ADD UNIQUE KEY uniq_product_name (name)',
    'SELECT ''Constraint uniq_product_name already exists'' AS message'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Verification
SELECT 
    index_name,
    column_name
FROM information_schema.statistics 
WHERE table_schema = 'amazon_clone' 
  AND table_name = 'products' 
  AND index_name = 'uniq_product_name';
