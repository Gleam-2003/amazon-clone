# Image URLs Guide - How to Change Product Images

## 📍 Where to Change Image URLs

You have **3 options** to change product image URLs:

---

## Single File: `backend/database/update_images.sql`

This file contains **TWO options** - choose one:

### Option 1: Quick Setup (Placeholder Images)
Uses picsum.photos for immediate setup - already active in the file.

### Option 2: Product-Specific Images (Manual)
Comment out Option 1 and uncomment Option 2 examples. Then add your product-specific images:

**Pattern:**
```sql
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://yourcdn.com/images/product-name/product-front.jpg',
  'https://yourcdn.com/images/product-name/product-back.jpg',
  'https://yourcdn.com/images/product-name/product-side.jpg',
  'https://yourcdn.com/images/product-name/product-box.jpg'
)
WHERE id = 1;
```

**Important:** All 4 images must be of the SAME product (different angles/views).

This file updates ALL products at once. Currently uses `picsum.photos`:

```sql
UPDATE products
SET image_urls = JSON_ARRAY(
  CONCAT('https://picsum.photos/seed/', (id * 4), '/400/400'),
  CONCAT('https://picsum.photos/seed/', (id * 4) + 1, '/400/400'),
  CONCAT('https://picsum.photos/seed/', (id * 4) + 2, '/400/400'),
  CONCAT('https://picsum.photos/seed/', (id * 4) + 3, '/400/400')
);
```

### To Use Your Own Images:

Replace with your image URLs:

```sql
-- Example: Update all products with your image URLs
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://yourdomain.com/images/product-1-image1.jpg',
  'https://yourdomain.com/images/product-1-image2.jpg',
  'https://yourdomain.com/images/product-1-image3.jpg',
  'https://yourdomain.com/images/product-1-image4.jpg'
)
WHERE id = 1;

-- Repeat for each product, or use a CASE statement for multiple products
```

**To apply:** Run this file in MySQL Workbench after seeding products.

---

## Option 2: Update Individual Products in Seed File

**File:** `backend/database/seed_products.sql`

Change the `image_urls` JSON array directly in the INSERT statements:

```sql
INSERT IGNORE INTO products (name, description, price, stock, category_id, image_urls, specifications) VALUES
('Product Name', 'Description...', 1000.00, 50, 1, 
'["https://yourdomain.com/image1.jpg", "https://yourdomain.com/image2.jpg", "https://yourdomain.com/image3.jpg", "https://yourdomain.com/image4.jpg"]',
'{"Brand": "BrandName", ...}'),
```

**To apply:** Re-run `seed_products.sql` (uses `INSERT IGNORE` so won't duplicate).

---

## Option 3: Update Specific Products via SQL

**Direct SQL in MySQL Workbench:**

```sql
USE amazon_clone;

-- Update a single product by ID
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://example.com/product-5-img1.jpg',
  'https://example.com/product-5-img2.jpg',
  'https://example.com/product-5-img3.jpg',
  'https://example.com/product-5-img4.jpg'
)
WHERE id = 5;

-- Update multiple products
UPDATE products
SET image_urls = CASE
  WHEN id = 1 THEN JSON_ARRAY('url1', 'url2', 'url3', 'url4')
  WHEN id = 2 THEN JSON_ARRAY('url1', 'url2', 'url3', 'url4')
  WHEN id = 3 THEN JSON_ARRAY('url1', 'url2', 'url3', 'url4')
  ELSE image_urls
END
WHERE id IN (1, 2, 3);
```

**To apply:** Run directly in MySQL Workbench.

---

## 🔄 How Images Get Fetched (Data Flow)

### Step 1: Database Storage
- Images are stored in `products.image_urls` as **JSON array**
- Format: `["url1", "url2", "url3", "url4"]`

### Step 2: Backend API (`backend/routes/products.js`)
```javascript
// Backend queries database and returns products with image_urls
SELECT p.*, c.name as category_name 
FROM products p 
LEFT JOIN categories c ON p.category_id = c.id

// Returns JSON like:
{
  "id": 1,
  "name": "Product Name",
  "image_urls": "[\"https://picsum.photos/seed/4/400/400\", \"https://picsum.photos/seed/5/400/400\", ...]",
  ...
}
```

### Step 3: Frontend Parsing (`frontend/src/utils/parseJson.js`)
```javascript
// Safely parses the JSON string to array
const images = parseImageUrls(product.image_urls);
// Returns: ["https://picsum.photos/seed/4/400/400", ...]
```

### Step 4: Frontend Display (`frontend/src/components/ProductCard.js`)
```javascript
const images = parseImageUrls(product.image_urls);
const mainImage = images[0] || 'https://via.placeholder.com/300x300?text=No+Image';

<img src={mainImage} alt={product.name} />
```

---

## 📝 Image URL Format Requirements

1. **Must be valid URLs** (http:// or https://)
2. **Must be JSON array format** in database: `["url1", "url2", "url3", "url4"]`
3. **4 images per product** (recommended, but can be 1-4)
4. **Images should be accessible** (no CORS issues, public URLs)

### Valid Examples:
```json
["https://example.com/img1.jpg", "https://example.com/img2.jpg", "https://example.com/img3.jpg", "https://example.com/img4.jpg"]
```

### Invalid Examples:
```json
// Missing quotes
[url1, url2, url3, url4]

// Not an array
"https://example.com/img1.jpg"

// Invalid JSON
['url1', 'url2']  // Use double quotes, not single
```

---

## 🚀 Quick Steps to Change All Images

1. **Open:** `backend/database/update_images.sql`
2. **Replace** the `UPDATE` statement with your image URLs
3. **Run** in MySQL Workbench:
   ```sql
   SOURCE backend/database/update_images.sql;
   ```
4. **Refresh** frontend - images will update automatically!

---

## 💡 Tips

- **Use CDN URLs** for faster loading (e.g., Cloudinary, AWS S3, Imgur)
- **Keep image dimensions consistent** (e.g., 400x400px)
- **Use HTTPS** for secure images
- **Test URLs** before updating database
- **Backup database** before bulk updates

---

## 🔍 Verify Images Are Working

```sql
-- Check if images are stored correctly
SELECT id, name, image_urls FROM products LIMIT 5;

-- Check if JSON is valid
SELECT id, name, JSON_VALID(image_urls) as is_valid FROM products;

-- Count images per product
SELECT id, name, JSON_LENGTH(image_urls) as image_count FROM products;
```

---

## 📂 File Locations Summary

| File | Purpose | When to Use |
|------|---------|-------------|
| `update_images.sql` | Bulk update all products | Change all images at once |
| `seed_products.sql` | Initial product data | Set images when seeding |
| Direct SQL | Update specific products | Change individual products |

---

**Note:** After updating images in the database, the frontend will automatically fetch and display them when you refresh the page. No frontend code changes needed!

