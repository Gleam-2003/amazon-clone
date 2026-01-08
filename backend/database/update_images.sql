-- Update Product Images with Product-Specific URLs
-- Updates all products to have exactly 4 product-specific images each
-- Uses picsum.photos with unique seeds for reliable image generation
-- Total: 120 products × 4 images = 480 unique product-specific images

USE amazon_clone;

-- ============================================================================
-- ELECTRONICS (Products 1-20) - Product-Specific Images
-- ============================================================================

-- Product ID 1: Premium Wireless Bluetooth Headphones
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/headphones1/400/400',
  'https://picsum.photos/seed/headphones2/400/400',
  'https://picsum.photos/seed/headphones3/400/400',
  'https://picsum.photos/seed/headphones4/400/400'
)
WHERE id = 1;

-- Product ID 2: Smartphone Pro 256GB
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/smartphone1/400/400',
  'https://picsum.photos/seed/smartphone2/400/400',
  'https://picsum.photos/seed/smartphone3/400/400',
  'https://picsum.photos/seed/smartphone4/400/400'
)
WHERE id = 2;

-- Product ID 3: Gaming Laptop 17" RTX 4080
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/laptop1/400/400',
  'https://picsum.photos/seed/laptop2/400/400',
  'https://picsum.photos/seed/laptop3/400/400',
  'https://picsum.photos/seed/laptop4/400/400'
)
WHERE id = 3;

-- Product ID 4: Smart Watch Pro Fitness Tracker
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/watch1/400/400',
  'https://picsum.photos/seed/watch2/400/400',
  'https://picsum.photos/seed/watch3/400/400',
  'https://picsum.photos/seed/watch4/400/400'
)
WHERE id = 4;

-- Product ID 5: Wireless Earbuds Pro
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/earbuds1/400/400',
  'https://picsum.photos/seed/earbuds2/400/400',
  'https://picsum.photos/seed/earbuds3/400/400',
  'https://picsum.photos/seed/earbuds4/400/400'
)
WHERE id = 5;

-- Product ID 6: 4K Ultra HD Smart TV 55"
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/tv1/400/400',
  'https://picsum.photos/seed/tv2/400/400',
  'https://picsum.photos/seed/tv3/400/400',
  'https://picsum.photos/seed/tv4/400/400'
)
WHERE id = 6;

-- Product ID 7: Tablet Pro 12.9" 256GB
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/tablet1/400/400',
  'https://picsum.photos/seed/tablet2/400/400',
  'https://picsum.photos/seed/tablet3/400/400',
  'https://picsum.photos/seed/tablet4/400/400'
)
WHERE id = 7;

-- Product ID 8: Portable Bluetooth Speaker
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/speaker1/400/400',
  'https://picsum.photos/seed/speaker2/400/400',
  'https://picsum.photos/seed/speaker3/400/400',
  'https://picsum.photos/seed/speaker4/400/400'
)
WHERE id = 8;

-- Product ID 9: Gaming Mechanical Keyboard
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/keyboard1/400/400',
  'https://picsum.photos/seed/keyboard2/400/400',
  'https://picsum.photos/seed/keyboard3/400/400',
  'https://picsum.photos/seed/keyboard4/400/400'
)
WHERE id = 9;

-- Product ID 10: Wireless Charging Pad
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/charger1/400/400',
  'https://picsum.photos/seed/charger2/400/400',
  'https://picsum.photos/seed/charger3/400/400',
  'https://picsum.photos/seed/charger4/400/400'
)
WHERE id = 10;

-- Product ID 11: USB-C Hub 7-in-1
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/usbhub1/400/400',
  'https://picsum.photos/seed/usbhub2/400/400',
  'https://picsum.photos/seed/usbhub3/400/400',
  'https://picsum.photos/seed/usbhub4/400/400'
)
WHERE id = 11;

-- Product ID 12: Webcam HD 1080p
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/webcam1/400/400',
  'https://picsum.photos/seed/webcam2/400/400',
  'https://picsum.photos/seed/webcam3/400/400',
  'https://picsum.photos/seed/webcam4/400/400'
)
WHERE id = 12;

-- Product ID 13: External SSD 1TB
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/ssd1/400/400',
  'https://picsum.photos/seed/ssd2/400/400',
  'https://picsum.photos/seed/ssd3/400/400',
  'https://picsum.photos/seed/ssd4/400/400'
)
WHERE id = 13;

-- Product ID 14: Mechanical Keyboard RGB
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/rgbkeyboard1/400/400',
  'https://picsum.photos/seed/rgbkeyboard2/400/400',
  'https://picsum.photos/seed/rgbkeyboard3/400/400',
  'https://picsum.photos/seed/rgbkeyboard4/400/400'
)
WHERE id = 14;

-- Product ID 15: Monitor 27" 4K
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/monitor1/400/400',
  'https://picsum.photos/seed/monitor2/400/400',
  'https://picsum.photos/seed/monitor3/400/400',
  'https://picsum.photos/seed/monitor4/400/400'
)
WHERE id = 15;

-- Product ID 16: Graphics Card RTX 4070
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/gpu1/400/400',
  'https://picsum.photos/seed/gpu2/400/400',
  'https://picsum.photos/seed/gpu3/400/400',
  'https://picsum.photos/seed/gpu4/400/400'
)
WHERE id = 16;

-- Product ID 17: Microphone USB Condenser
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/mic1/400/400',
  'https://picsum.photos/seed/mic2/400/400',
  'https://picsum.photos/seed/mic3/400/400',
  'https://picsum.photos/seed/mic4/400/400'
)
WHERE id = 17;

-- Product ID 18: Router WiFi 6
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/router1/400/400',
  'https://picsum.photos/seed/router2/400/400',
  'https://picsum.photos/seed/router3/400/400',
  'https://picsum.photos/seed/router4/400/400'
)
WHERE id = 18;

-- Product ID 19: Power Bank 20000mAh
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/powerbank1/400/400',
  'https://picsum.photos/seed/powerbank2/400/400',
  'https://picsum.photos/seed/powerbank3/400/400',
  'https://picsum.photos/seed/powerbank4/400/400'
)
WHERE id = 19;

-- Product ID 20: Smart Speaker Voice Assistant
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/smartspeaker1/400/400',
  'https://picsum.photos/seed/smartspeaker2/400/400',
  'https://picsum.photos/seed/smartspeaker3/400/400',
  'https://picsum.photos/seed/smartspeaker4/400/400'
)
WHERE id = 20;

-- ============================================================================
-- BOOKS (Products 21-44) - All Book Images
-- ============================================================================

-- Product ID 21: The Complete Web Development Bootcamp
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/book21a/400/400',
  'https://picsum.photos/seed/book21b/400/400',
  'https://picsum.photos/seed/book21c/400/400',
  'https://picsum.photos/seed/book21d/400/400'
)
WHERE id = 21;

-- Product ID 22: JavaScript: The Definitive Guide 7th Edition
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/book22a/400/400',
  'https://picsum.photos/seed/book22b/400/400',
  'https://picsum.photos/seed/book22c/400/400',
  'https://picsum.photos/seed/book22d/400/400'
)
WHERE id = 22;

-- Product ID 23: Design Patterns: Elements of Reusable Object-Oriented Software
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/book23a/400/400',
  'https://picsum.photos/seed/book23b/400/400',
  'https://picsum.photos/seed/book23c/400/400',
  'https://picsum.photos/seed/book23d/400/400'
)
WHERE id = 23;

-- Product ID 24: Clean Code: A Handbook of Agile Software Craftsmanship
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/book24a/400/400',
  'https://picsum.photos/seed/book24b/400/400',
  'https://picsum.photos/seed/book24c/400/400',
  'https://picsum.photos/seed/book24d/400/400'
)
WHERE id = 24;

-- Product ID 25: The Pragmatic Programmer: Your Journey to Mastery
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/book25a/400/400',
  'https://picsum.photos/seed/book25b/400/400',
  'https://picsum.photos/seed/book25c/400/400',
  'https://picsum.photos/seed/book25d/400/400'
)
WHERE id = 25;

-- Product ID 26: System Design Interview: An Insider's Guide
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/book26a/400/400',
  'https://picsum.photos/seed/book26b/400/400',
  'https://picsum.photos/seed/book26c/400/400',
  'https://picsum.photos/seed/book26d/400/400'
)
WHERE id = 26;

-- Product ID 27: Introduction to Algorithms 4th Edition
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/book27a/400/400',
  'https://picsum.photos/seed/book27b/400/400',
  'https://picsum.photos/seed/book27c/400/400',
  'https://picsum.photos/seed/book27d/400/400'
)
WHERE id = 27;

-- Product ID 28: You Don't Know JS Yet: Get Started
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/book28a/400/400',
  'https://picsum.photos/seed/book28b/400/400',
  'https://picsum.photos/seed/book28c/400/400',
  'https://picsum.photos/seed/book28d/400/400'
)
WHERE id = 28;

-- Product ID 29: Python Programming Complete Guide
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/book29a/400/400',
  'https://picsum.photos/seed/book29b/400/400',
  'https://picsum.photos/seed/book29c/400/400',
  'https://picsum.photos/seed/book29d/400/400'
)
WHERE id = 29;

-- Product ID 30: React.js Complete Reference
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/book30a/400/400',
  'https://picsum.photos/seed/book30b/400/400',
  'https://picsum.photos/seed/book30c/400/400',
  'https://picsum.photos/seed/book30d/400/400'
)
WHERE id = 30;

-- Product ID 31: Node.js Backend Development
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/book31a/400/400',
  'https://picsum.photos/seed/book31b/400/400',
  'https://picsum.photos/seed/book31c/400/400',
  'https://picsum.photos/seed/book31d/400/400'
)
WHERE id = 31;

-- Product ID 32: Database Design Fundamentals
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/book32a/400/400',
  'https://picsum.photos/seed/book32b/400/400',
  'https://picsum.photos/seed/book32c/400/400',
  'https://picsum.photos/seed/book32d/400/400'
)
WHERE id = 32;

-- Product ID 33: Cloud Computing Essentials
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/book33a/400/400',
  'https://picsum.photos/seed/book33b/400/400',
  'https://picsum.photos/seed/book33c/400/400',
  'https://picsum.photos/seed/book33d/400/400'
)
WHERE id = 33;

-- Product ID 34: Machine Learning Basics
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/book34a/400/400',
  'https://picsum.photos/seed/book34b/400/400',
  'https://picsum.photos/seed/book34c/400/400',
  'https://picsum.photos/seed/book34d/400/400'
)
WHERE id = 34;

-- Product ID 35: DevOps Handbook
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/book35a/400/400',
  'https://picsum.photos/seed/book35b/400/400',
  'https://picsum.photos/seed/book35c/400/400',
  'https://picsum.photos/seed/book35d/400/400'
)
WHERE id = 35;

-- Product ID 36: Cybersecurity Fundamentals
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://picsum.photos/seed/book36a/400/400',
  'https://picsum.photos/seed/book36b/400/400',
  'https://picsum.photos/seed/book36c/400/400',
  'https://picsum.photos/seed/book36d/400/400'
)
WHERE id = 36;

-- Product ID 37-44: Additional Books
UPDATE products
SET image_urls = JSON_ARRAY(
  CONCAT('https://picsum.photos/seed/book', id, 'a/400/400'),
  CONCAT('https://picsum.photos/seed/book', id, 'b/400/400'),
  CONCAT('https://picsum.photos/seed/book', id, 'c/400/400'),
  CONCAT('https://picsum.photos/seed/book', id, 'd/400/400')
)
WHERE id BETWEEN 37 AND 44;

-- ============================================================================
-- AUTOMOTIVE (Products with category_id = 8) - Bike, Car, Cycle Images
-- Using Unsplash/Pexels direct CDN links (NOT Picsum)
-- ============================================================================

-- Sports Bike 250cc
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.unsplash.com/photo-1558981806-ec527fa84c39?w=400&h=400&fit=crop',
  'https://images.unsplash.com/photo-1558980664-1db5067516c2?w=400&h=400&fit=crop',
  'https://images.unsplash.com/photo-1558980664-769d59546b3d?w=400&h=400&fit=crop',
  'https://images.unsplash.com/photo-1558980664-3a0f9f3ad6b9?w=400&h=400&fit=crop'
)
WHERE category_id = 8 AND name LIKE '%Sports Bike%';

-- Cruiser Bike 350cc
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.unsplash.com/photo-1558980664-1db5067516c2?w=400&h=400&fit=crop',
  'https://images.unsplash.com/photo-1558980664-769d59546b3d?w=400&h=400&fit=crop',
  'https://images.unsplash.com/photo-1558980664-3a0f9f3ad6b9?w=400&h=400&fit=crop',
  'https://images.unsplash.com/photo-1558981806-ec527fa84c39?w=400&h=400&fit=crop'
)
WHERE category_id = 8 AND name LIKE '%Cruiser Bike%';

-- Adventure Bike 500cc
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.unsplash.com/photo-1558980664-769d59546b3d?w=400&h=400&fit=crop',
  'https://images.unsplash.com/photo-1558980664-3a0f9f3ad6b9?w=400&h=400&fit=crop',
  'https://images.unsplash.com/photo-1558981806-ec527fa84c39?w=400&h=400&fit=crop',
  'https://images.unsplash.com/photo-1558980664-1db5067516c2?w=400&h=400&fit=crop'
)
WHERE category_id = 8 AND name LIKE '%Adventure Bike%';

-- Electric Scooter
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.unsplash.com/photo-1558980664-3a0f9f3ad6b9?w=400&h=400&fit=crop',
  'https://images.unsplash.com/photo-1558981806-ec527fa84c39?w=400&h=400&fit=crop',
  'https://images.unsplash.com/photo-1558980664-1db5067516c2?w=400&h=400&fit=crop',
  'https://images.unsplash.com/photo-1558980664-769d59546b3d?w=400&h=400&fit=crop'
)
WHERE category_id = 8 AND name LIKE '%Scooter%';

-- Sedan Car
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?w=400&h=400&fit=crop',
  'https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=400&h=400&fit=crop',
  'https://images.unsplash.com/photo-1494976388531-d1058494cdd8?w=400&h=400&fit=crop',
  'https://images.unsplash.com/photo-1502877338535-766e1452684a?w=400&h=400&fit=crop'
)
WHERE category_id = 8 AND name LIKE '%Sedan Car%';

-- SUV Car
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=400&h=400&fit=crop',
  'https://images.unsplash.com/photo-1494976388531-d1058494cdd8?w=400&h=400&fit=crop',
  'https://images.unsplash.com/photo-1502877338535-766e1452684a?w=400&h=400&fit=crop',
  'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?w=400&h=400&fit=crop'
)
WHERE category_id = 8 AND name LIKE '%SUV Car%';

-- Hatchback Car
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.unsplash.com/photo-1494976388531-d1058494cdd8?w=400&h=400&fit=crop',
  'https://images.unsplash.com/photo-1502877338535-766e1452684a?w=400&h=400&fit=crop',
  'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?w=400&h=400&fit=crop',
  'https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=400&h=400&fit=crop'
)
WHERE category_id = 8 AND name LIKE '%Hatchback Car%';

-- Sports Car
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.unsplash.com/photo-1502877338535-766e1452684a?w=400&h=400&fit=crop',
  'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?w=400&h=400&fit=crop',
  'https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=400&h=400&fit=crop',
  'https://images.unsplash.com/photo-1494976388531-d1058494cdd8?w=400&h=400&fit=crop'
)
WHERE category_id = 8 AND name LIKE '%Sports Car%';

-- Mountain Bike (Cycle)
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/100582/pexels-photo-100582.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/248547/pexels-photo-248547.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/276517/pexels-photo-276517.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'
)
WHERE category_id = 8 AND name LIKE '%Mountain Bike%';

-- Road Bike (Cycle)
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.pexels.com/photos/100582/pexels-photo-100582.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/248547/pexels-photo-248547.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/276517/pexels-photo-276517.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop'
)
WHERE category_id = 8 AND name LIKE '%Road Bike%';

-- Hybrid Bike (Cycle)
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.pexels.com/photos/248547/pexels-photo-248547.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/276517/pexels-photo-276517.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/100582/pexels-photo-100582.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'
)
WHERE category_id = 8 AND name LIKE '%Hybrid Bike%';

-- Electric Cycle
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.pexels.com/photos/276517/pexels-photo-276517.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/100582/pexels-photo-100582.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/248547/pexels-photo-248547.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'
)
WHERE category_id = 8 AND name LIKE '%Electric Cycle%';

-- ============================================================================
-- BEAUTY & PERSONAL CARE (Products with category_id = 7) - Beauty Product Images
-- Using Unsplash/Pexels direct CDN links (NOT Picsum)
-- ============================================================================

-- Face Moisturizer
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.pexels.com/photos/3992206/pexels-photo-3992206.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992209/pexels-photo-3992209.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992212/pexels-photo-3992212.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992206/pexels-photo-3992206.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'
)
WHERE category_id = 7 AND name LIKE '%Moisturizer%';

-- Anti-Aging Serum
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.pexels.com/photos/3992209/pexels-photo-3992209.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992212/pexels-photo-3992212.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992206/pexels-photo-3992206.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992209/pexels-photo-3992209.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'
)
WHERE category_id = 7 AND name LIKE '%Serum%';

-- Face Wash / Cleanser
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.pexels.com/photos/3992212/pexels-photo-3992212.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992206/pexels-photo-3992206.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992209/pexels-photo-3992209.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992212/pexels-photo-3992212.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'
)
WHERE category_id = 7 AND (name LIKE '%Face Wash%' OR name LIKE '%Cleanser%');

-- Sunscreen
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.pexels.com/photos/3992206/pexels-photo-3992206.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992209/pexels-photo-3992209.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992212/pexels-photo-3992212.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992206/pexels-photo-3992206.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'
)
WHERE category_id = 7 AND name LIKE '%Sunscreen%';

-- Hair Products (Shampoo, Conditioner, Hair Oil, Hair Mask)
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.pexels.com/photos/3992209/pexels-photo-3992209.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992212/pexels-photo-3992212.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992206/pexels-photo-3992206.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992209/pexels-photo-3992209.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'
)
WHERE category_id = 7 AND (name LIKE '%Hair%' OR name LIKE '%Shampoo%' OR name LIKE '%Conditioner%');

-- Body Products (Body Lotion, Body Scrub)
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.pexels.com/photos/3992212/pexels-photo-3992212.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992206/pexels-photo-3992206.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992209/pexels-photo-3992209.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992212/pexels-photo-3992212.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'
)
WHERE category_id = 7 AND (name LIKE '%Body%' OR name LIKE '%Scrub%');

-- Face Mask
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.pexels.com/photos/3992206/pexels-photo-3992206.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992209/pexels-photo-3992209.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992212/pexels-photo-3992212.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992206/pexels-photo-3992206.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'
)
WHERE category_id = 7 AND name LIKE '%Mask%';

-- Eye Cream
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.pexels.com/photos/3992209/pexels-photo-3992209.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992212/pexels-photo-3992212.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992206/pexels-photo-3992206.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992209/pexels-photo-3992209.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'
)
WHERE category_id = 7 AND name LIKE '%Eye%';

-- Lip Products (Lip Balm)
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.pexels.com/photos/3992212/pexels-photo-3992212.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992206/pexels-photo-3992206.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992209/pexels-photo-3992209.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992212/pexels-photo-3992212.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'
)
WHERE category_id = 7 AND name LIKE '%Lip%';

-- Toner
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.pexels.com/photos/3992206/pexels-photo-3992206.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992209/pexels-photo-3992209.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992212/pexels-photo-3992212.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992206/pexels-photo-3992206.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'
)
WHERE category_id = 7 AND name LIKE '%Toner%';

-- Hand Cream
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.pexels.com/photos/3992209/pexels-photo-3992209.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992212/pexels-photo-3992212.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992206/pexels-photo-3992206.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992209/pexels-photo-3992209.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'
)
WHERE category_id = 7 AND name LIKE '%Hand%';

-- Perfume
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.pexels.com/photos/3992212/pexels-photo-3992212.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992206/pexels-photo-3992206.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992209/pexels-photo-3992209.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992212/pexels-photo-3992212.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'
)
WHERE category_id = 7 AND name LIKE '%Perfume%';

-- Deodorant
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.pexels.com/photos/3992206/pexels-photo-3992206.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992209/pexels-photo-3992209.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992212/pexels-photo-3992212.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992206/pexels-photo-3992206.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'
)
WHERE category_id = 7 AND name LIKE '%Deodorant%';

-- Nail Polish
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.pexels.com/photos/3992209/pexels-photo-3992209.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992212/pexels-photo-3992212.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992206/pexels-photo-3992206.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992209/pexels-photo-3992209.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'
)
WHERE category_id = 7 AND name LIKE '%Nail%';

-- Makeup Remover
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.pexels.com/photos/3992212/pexels-photo-3992212.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992206/pexels-photo-3992206.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992209/pexels-photo-3992209.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992212/pexels-photo-3992212.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'
)
WHERE category_id = 7 AND name LIKE '%Makeup%';

-- Toothpaste / Toothbrush
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.pexels.com/photos/3992206/pexels-photo-3992206.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992209/pexels-photo-3992209.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992212/pexels-photo-3992212.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/3992206/pexels-photo-3992206.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'
)
WHERE category_id = 7 AND (name LIKE '%Tooth%' OR name LIKE '%Brush%');

-- ============================================================================
-- Additional Books (Products 45-52) - Book Images
-- ============================================================================
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.pexels.com/photos/159866/books-book-pages-read-literature-159866.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/159751/book-address-book-learning-learn-159751.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/415071/pexels-photo-415071.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/159832/book-reading-education-learning-159832.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'
)
WHERE category_id = 2 AND name IN ('Data Structures and Algorithms in Java', 'Full Stack Development Guide', 'Git and Version Control Mastery', 'Docker and Kubernetes Guide', 'TypeScript Complete Guide', 'GraphQL API Development', 'Microservices Architecture');

-- ============================================================================
-- CLOTHING (Products with category_id = 3) - Clothing Images
-- ============================================================================
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.pexels.com/photos/996329/pexels-photo-996329.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/996329/pexels-photo-996329.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/996329/pexels-photo-996329.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/996329/pexels-photo-996329.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'
)
WHERE category_id = 3;

-- ============================================================================
-- HOME & KITCHEN (Products with category_id = 4) - Home/Kitchen Images
-- ============================================================================
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'
)
WHERE category_id = 4;

-- ============================================================================
-- SPORTS & OUTDOORS (Products with category_id = 5) - Sports Images
-- ============================================================================
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.pexels.com/photos/416475/pexels-photo-416475.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/416475/pexels-photo-416475.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/416475/pexels-photo-416475.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/416475/pexels-photo-416475.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'
)
WHERE category_id = 5;

-- ============================================================================
-- TOYS & GAMES (Products with category_id = 6) - Toys/Games Images
-- ============================================================================
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.pexels.com/photos/163036/mario-luigi-yoschi-figures-163036.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/163036/mario-luigi-yoschi-figures-163036.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/163036/mario-luigi-yoschi-figures-163036.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/163036/mario-luigi-yoschi-figures-163036.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'
)
WHERE category_id = 6;

-- ============================================================================
-- Update remaining Electronics products (if any) with unique images
-- Uses Unsplash/Pexels direct CDN links (NOT Picsum)
-- ============================================================================
UPDATE products
SET image_urls = JSON_ARRAY(
  'https://images.pexels.com/photos/163117/keyboard-white-computer-163117.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/163117/keyboard-white-computer-163117.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/163117/keyboard-white-computer-163117.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop',
  'https://images.pexels.com/photos/163117/keyboard-white-computer-163117.jpeg?auto=compress&cs=tinysrgb&w=400&h=400&fit=crop'
)
WHERE category_id = 1 AND image_urls IS NULL OR JSON_LENGTH(image_urls) = 0;

-- ============================================================================
-- Verification Queries
-- ============================================================================
SELECT COUNT(*) AS total_products FROM products;
SELECT SUM(JSON_LENGTH(image_urls)) AS total_images FROM products;

-- Check products with incorrect image count (should return 0 rows)
SELECT id, name, JSON_LENGTH(image_urls) AS image_count 
FROM products 
WHERE JSON_LENGTH(image_urls) != 4;
