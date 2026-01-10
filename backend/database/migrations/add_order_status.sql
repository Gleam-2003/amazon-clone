USE amazon_clone;

SET @col_exists = (
    SELECT COUNT(*) 
    FROM information_schema.columns 
    WHERE table_schema = 'amazon_clone' 
      AND table_name = 'orders' 
      AND column_name = 'status'
);

SET @sql = IF(
    @col_exists = 0,
    'ALTER TABLE orders ADD COLUMN status VARCHAR(50) DEFAULT ''PLACED'' AFTER shipping_address',
    'SELECT ''Column status already exists'' AS message'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

UPDATE orders 
SET status = 'PLACED' 
WHERE status IS NULL OR status = '';

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

SELECT column_name, column_type, column_default 
FROM information_schema.columns 
WHERE table_schema = 'amazon_clone' 
  AND table_name = 'orders' 
  AND column_name = 'status';

