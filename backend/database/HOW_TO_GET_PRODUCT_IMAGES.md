# How to Get Product-Specific Images

## Quick Guide: Finding Product Images

### Step 1: Visit Free Stock Photo Sites

1. **Unsplash** - https://unsplash.com
   - Search: "wireless bluetooth headphones"
   - Click image → Download → Copy image URL
   - Or use: `https://images.unsplash.com/photo-[ID]?w=400&h=400&fit=crop`

2. **Pexels** - https://pexels.com
   - Search: "smartphone"
   - Right-click image → Copy image address

3. **Pixabay** - https://pixabay.com
   - Search: "gaming laptop"
   - Download or copy direct URL

### Step 2: Search Terms for Each Product

| Product Type | Search Term |
|-------------|-------------|
| Headphones | "wireless bluetooth headphones" |
| Smartphone | "smartphone" or "mobile phone" |
| Laptop | "gaming laptop" or "laptop" |
| Smart Watch | "smart watch" or "fitness tracker" |
| Earbuds | "wireless earbuds" or "bluetooth earbuds" |
| TV | "smart tv" or "television" |
| Tablet | "tablet" or "ipad" |
| Speaker | "bluetooth speaker" |
| Keyboard | "gaming keyboard" or "mechanical keyboard" |
| Charger | "wireless charger" |
| USB Hub | "usb hub" |
| Webcam | "webcam" |
| SSD | "external hard drive" or "ssd" |
| Monitor | "computer monitor" |
| GPU | "graphics card" |
| Microphone | "usb microphone" |
| Router | "wifi router" |
| Power Bank | "power bank" |
| Books | "book cover" |
| Clothing | "t-shirt", "jeans", "dress" |
| Home & Kitchen | "kitchen appliance", "home decor" |
| Sports | "sports equipment" |
| Toys | "toy" |
| Beauty | "beauty product" |
| Automotive | "car accessory" |

### Step 3: Get 4 Images of the SAME Product

For each product, download 4 images showing:
1. **Front view** - Main product view
2. **Side/Back view** - Different angle
3. **Detail view** - Close-up of features
4. **Box/Packaging** - Product packaging or another angle

**IMPORTANT:** All 4 images must be of the SAME product!

### Step 4: Update SQL File

1. Open `backend/database/update_images.sql`
2. Find the product you want to update
3. Replace the placeholder URLs with your actual image URLs
4. Run the SQL file in MySQL Workbench

### Example:

```sql
-- Product ID 1: Premium Wireless Bluetooth Headphones
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400&h=400&fit=crop',  -- Front
  'https://images.unsplash.com/photo-1484704849700-f032a568e944?w=400&h=400&fit=crop',  -- Side
  'https://images.unsplash.com/photo-1572569511254-d8f925fe2cbb?w=400&h=400&fit=crop',  -- Detail
  'https://images.unsplash.com/photo-1545127398-14699f92334b?w=400&h=400&fit=crop'   -- Back
)
WHERE id = 1;
```

### Step 5: Verify

After updating, run:
```sql
SELECT id, name, image_urls FROM products WHERE id = 1;
```

Refresh your frontend - images will update automatically!

---

## Tips

- ✅ Use high-quality images (at least 400x400px)
- ✅ Keep images consistent (same style/background)
- ✅ All 4 images must be of the SAME product
- ✅ Use HTTPS URLs
- ✅ Test URLs before updating database

---

## Free Image Sources

1. **Unsplash** - https://unsplash.com (Free, no attribution required)
2. **Pexels** - https://pexels.com (Free, no attribution required)
3. **Pixabay** - https://pixabay.com (Free, no attribution required)
4. **Freepik** - https://freepik.com (Free with attribution)

---

## Using Unsplash Direct URLs

Unsplash provides direct image URLs. Format:
```
https://images.unsplash.com/photo-[PHOTO_ID]?w=400&h=400&fit=crop
```

Example:
- Search "wireless headphones" on Unsplash
- Click an image
- Copy the URL from browser
- Use in your SQL file

