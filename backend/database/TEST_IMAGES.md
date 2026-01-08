# Test Image Fetching - Troubleshooting Guide

## Step 1: Verify Database Has Images

Run in MySQL Workbench:
```sql
USE amazon_clone;

-- Check if products have image URLs
SELECT id, name, image_urls FROM products LIMIT 5;

-- Check if JSON is valid
SELECT id, name, JSON_VALID(image_urls) as is_valid FROM products WHERE JSON_VALID(image_urls) = 0;

-- Count images per product
SELECT id, name, JSON_LENGTH(image_urls) as image_count FROM products LIMIT 10;
```

## Step 2: Verify Backend API Returns Images

1. **Start backend server:**
   ```bash
   cd backend
   npm start
   ```

2. **Test API in browser:**
   Open: `http://localhost:5000/api/products`
   
   You should see JSON with `image_urls` field like:
   ```json
   {
     "id": 1,
     "name": "Premium Wireless Bluetooth Headphones",
     "image_urls": "[\"https://picsum.photos/seed/4/400/400\", ...]",
     ...
   }
   ```

## Step 3: Verify Frontend Fetches Images

1. **Start frontend:**
   ```bash
   cd frontend
   npm start
   ```

2. **Open browser console** (F12)
   - Go to: `http://localhost:3000`
   - Check Console tab for errors
   - Check Network tab - look for `/api/products` request

3. **Check if images load:**
   - Right-click on broken image → Inspect
   - Check the `src` attribute
   - Verify the URL is correct

## Step 4: Common Issues & Fixes

### Issue 1: Images show as broken
**Fix:** Run `update_images.sql` in MySQL Workbench first

### Issue 2: image_urls is NULL or empty
**Fix:** 
```sql
-- Update all products with placeholder images
UPDATE products
SET image_urls = JSON_ARRAY(
  CONCAT('https://picsum.photos/seed/', (id * 4), '/400/400'),
  CONCAT('https://picsum.photos/seed/', (id * 4) + 1, '/400/400'),
  CONCAT('https://picsum.photos/seed/', (id * 4) + 2, '/400/400'),
  CONCAT('https://picsum.photos/seed/', (id * 4) + 3, '/400/400')
)
WHERE id > 0;
```

### Issue 3: Frontend shows "No Image"
**Fix:** Check browser console for parsing errors. Verify `parseImageUrls()` is working.

### Issue 4: Backend not running
**Fix:** 
```bash
cd backend
npm start
```

### Issue 5: CORS errors
**Fix:** Backend should have CORS enabled. Check `backend/server.js` has `app.use(cors())`

## Step 5: Quick Test Query

Run this to see exactly what the frontend receives:
```sql
SELECT 
  id, 
  name, 
  image_urls,
  JSON_LENGTH(image_urls) as image_count,
  JSON_EXTRACT(image_urls, '$[0]') as first_image
FROM products 
LIMIT 5;
```

The `first_image` should show a valid URL like: `"https://picsum.photos/seed/4/400/400"`

