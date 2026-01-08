# Database Setup Documentation

This directory contains a production-style SQL structure for the Amazon Clone database.

## File Structure

```
backend/database/
├── schema.sql              # Table definitions only (no data)
├── seed_products.sql       # Categories and products (120 products)
├── seed_addresses.sql      # Demo user addresses
├── update_images.sql       # Update product images (4 per product, 480 total)
└── migrations/
    ├── add_returns.sql     # Creates returns table
    └── add_order_status.sql # Adds status column to orders table
```

## Setup Order

1. **schema.sql** - Creates all tables (including status column and returns table)
2. **seed_products.sql** - Inserts categories and products
3. **seed_addresses.sql** - Inserts demo addresses
4. **update_images.sql** - Updates product images (runs after seed_products.sql)

**Note:** Migration files are optional and only needed for existing databases that don't have these tables/columns yet.

## File Descriptions

### schema.sql
**Purpose:** Contains ONLY table definitions (no seed data)  
**Tables:** addresses, categories, products, cart, orders, order_items  
**Safe to re-run:** Yes (uses `CREATE TABLE IF NOT EXISTS`)

### seed_products.sql
**Purpose:** Inserts categories and products (120 products total)  
**Features:** 
- Uses `INSERT IGNORE` to prevent duplicates
- Prices in ₹ INR
- Image URLs are temporary placeholders (updated via update_images.sql)
**Safe to re-run:** Yes (uses `INSERT IGNORE`)

### seed_addresses.sql
**Purpose:** Inserts demo user addresses  
**Features:**
- Does NOT depend on products
- Safe to re-run independently
**Safe to re-run:** Yes (uses `INSERT IGNORE`)

### update_images.sql
**Purpose:** Updates ALL products to have exactly 4 images each  
**Features:**
- **Option 1:** Quick setup with picsum.photos placeholder images (default)
- **Option 2:** Manual update with product-specific images (commented examples included)
- Generates 480 unique images (120 products × 4 images)
- Safe UPDATE method using `WHERE id > 0` or `WHERE id = X`
**DO NOT:** Insert products or delete anything  
**Safe to re-run:** Yes (idempotent)

### migrations/add_returns.sql
**Purpose:** Creates returns table for existing databases  
**Features:**
- Uses `CREATE TABLE IF NOT EXISTS`
- Only needed if returns table doesn't exist
**Safe to re-run:** Yes

### migrations/add_order_status.sql
**Purpose:** Adds status column to orders table for existing databases  
**Features:**
- Checks if column exists before adding
- Sets default value 'PLACED' for existing rows
- Only needed if status column doesn't exist
**Safe to re-run:** Yes

## Usage Example

```sql
-- Step 1: Create schema (includes all tables)
SOURCE backend/database/schema.sql;

-- Step 2: Seed data
SOURCE backend/database/seed_products.sql;
SOURCE backend/database/seed_addresses.sql;

-- Step 3: Update images
SOURCE backend/database/update_images.sql;
```

**For existing databases:** If you already have tables but are missing the status column or returns table, run the migration files:
```sql
SOURCE backend/database/migrations/add_order_status.sql;
SOURCE backend/database/migrations/add_returns.sql;
```

## Notes

- All files use `IF NOT EXISTS` or `INSERT IGNORE` patterns for safety
- Files can be re-run without data loss
- Prices are in ₹ INR (Indian Rupees)
- Images use picsum.photos for reliable generation
- All files follow MySQL 8 syntax

