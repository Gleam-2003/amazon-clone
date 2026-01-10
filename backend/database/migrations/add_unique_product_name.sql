USE amazon_clone;

SET @constraint_exists = (
    SELECT COUNT(*) 
    FROM information_schema.table_constraints tc
    JOIN information_schema.key_column_usage kcu 
      ON tc.constraint_name = kcu.constraint_name 
      AND tc.table_schema = kcu.table_schema
    WHERE tc.table_schema = 'amazon_clone' 
      AND tc.table_name = 'products' 
      AND kcu.column_name = 'name'
      AND tc.constraint_type = 'UNIQUE'
);

SET @sql = IF(
    @constraint_exists = 0,
    'ALTER TABLE products ADD UNIQUE KEY uniq_product_name (name)',
    'SELECT ''UNIQUE constraint on name already exists'' AS message'
);

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SELECT 
    tc.constraint_name,
    kcu.column_name,
    tc.constraint_type
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu 
  ON tc.constraint_name = kcu.constraint_name 
  AND tc.table_schema = kcu.table_schema
WHERE tc.table_schema = 'amazon_clone' 
  AND tc.table_name = 'products' 
  AND kcu.column_name = 'name'
  AND tc.constraint_type = 'UNIQUE';
