# Quick Fix: Images Not Showing

## ✅ Solution: Run the SQL Update

The frontend is not fetching images because the database hasn't been updated yet.

### Step 1: Open MySQL Workbench

### Step 2: Run the Update Script

1. Open: `backend/database/update_images.sql`
2. **Make sure Step 1 is NOT commented** (the bulk UPDATE for all products)
3. **Make sure Step 2 individual updates ARE commented** (the ones with specific products)
4. Run the entire file in MySQL Workbench:
   ```sql
   SOURCE backend/database/update_images.sql;
   ```
   OR copy-paste the Step 1 UPDATE statement and run it.

### Step 3: Verify Images Were Updated

Run this query:
```sql
SELECT id, name, image_urls FROM products LIMIT 3;
```

You should see `image_urls` with JSON arrays like:
```json
["https://picsum.photos/seed/4/400/400", "https://picsum.photos/seed/5/400/400", ...]
```

### Step 4: Restart Backend (if running)

If your backend is running, restart it:
```bash
# Stop backend (Ctrl+C)
# Then restart:
cd backend
npm start
```

### Step 5: Refresh Frontend

1. Open: `http://localhost:3000`
2. **Hard refresh** (Ctrl+Shift+R or Ctrl+F5)
3. Images should now appear!

---

## 🔍 Still Not Working?

### Check 1: Backend API
Open in browser: `http://localhost:5000/api/products`
- Do you see `image_urls` in the JSON?
- Are the URLs valid?

### Check 2: Browser Console
1. Open browser DevTools (F12)
2. Go to Console tab
3. Look for errors related to images
4. Go to Network tab → Check if images are loading

### Check 3: Database Connection
Make sure backend can connect to database:
- Check `backend/.env` file exists
- Verify database credentials are correct

---

## 📝 The SQL File Structure

The `update_images.sql` file has:

**Step 1 (ACTIVE):** Updates ALL 120 products with placeholder images
```sql
UPDATE products SET image_urls = JSON_ARRAY(...) WHERE id > 0;
```

**Step 2 (COMMENTED):** Individual product updates (for later use)

Make sure Step 1 is active and Step 2 is commented when you run it!

