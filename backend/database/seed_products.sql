-- Seed Products - Categories and Products
-- Inserts categories and products (120 products total)
-- Safe to re-run (uses INSERT IGNORE to prevent duplicates)
-- Prices are in ₹ INR

USE amazon_clone;

-- Insert Categories
INSERT IGNORE INTO categories (name) VALUES
('Electronics'),
('Books'),
('Clothing'),
('Home & Kitchen'),
('Sports & Outdoors'),
('Toys & Games'),
('Beauty & Personal Care'),
('Automotive');

-- Insert Products (120 products total)
-- All products have working image URLs (picsum.photos with unique seeds)

-- Electronics (20 products)
INSERT IGNORE INTO products (name, description, price, stock, category_id, image_urls, specifications) VALUES
('Premium Wireless Bluetooth Headphones', 'High-quality noise-cancelling over-ear headphones with 30-hour battery life, premium sound quality, and comfortable memory foam ear cushions. Perfect for music lovers, gamers, and professionals who demand the best audio experience.', 11049.15, 75, 1, 
'["https://picsum.photos/seed/headphones1/400/400", "https://picsum.photos/seed/headphones2/400/400", "https://picsum.photos/seed/headphones3/400/400", "https://picsum.photos/seed/headphones4/400/400"]',
'{"Brand": "AudioPro", "Model": "AP-5000", "Color": "Black", "Battery Life": "30 hours", "Connectivity": "Bluetooth 5.0, 3.5mm Jack", "Noise Cancelling": "Active", "Weight": "280g", "Warranty": "2 years"}'),

('Smartphone Pro 256GB', 'Latest flagship smartphone featuring a stunning 6.7-inch OLED display, triple camera system with 108MP main sensor, 5G connectivity, and all-day battery life. Powered by the fastest processor for seamless performance.', 76499.15, 45, 1,
'["https://picsum.photos/seed/smartphone1/400/400", "https://picsum.photos/seed/smartphone2/400/400", "https://picsum.photos/seed/smartphone3/400/400", "https://picsum.photos/seed/smartphone4/400/400"]',
'{"Brand": "TechPhone", "Model": "Pro Max", "Storage": "256GB", "RAM": "12GB", "Screen Size": "6.7 inches", "Camera": "108MP + 12MP + 12MP", "Battery": "5000mAh", "OS": "Android 14", "5G": "Yes"}'),

('Gaming Laptop 17" RTX 4080', 'High-performance gaming laptop with NVIDIA RTX 4080 graphics, Intel i9 processor, 32GB RAM, and 1TB SSD. Features a 17-inch 240Hz display for smooth gaming and professional content creation.', 212499.15, 20, 1,
'["https://picsum.photos/seed/laptop1/400/400", "https://picsum.photos/seed/laptop2/400/400", "https://picsum.photos/seed/laptop3/400/400", "https://picsum.photos/seed/laptop4/400/400"]',
'{"Brand": "GameTech", "Model": "GT-17X", "Processor": "Intel i9-13900HX", "GPU": "NVIDIA RTX 4080", "RAM": "32GB DDR5", "Storage": "1TB NVMe SSD", "Display": "17.3 inch 240Hz", "Weight": "2.8kg"}'),

('Smart Watch Pro Fitness Tracker', 'Advanced smartwatch with comprehensive health tracking including heart rate, blood oxygen, sleep analysis, and GPS. Features a vibrant AMOLED display, 7-day battery life, and water resistance up to 50 meters.', 25499.15, 60, 1,
'["https://picsum.photos/seed/watch1/400/400", "https://picsum.photos/seed/watch2/400/400", "https://picsum.photos/seed/watch3/400/400", "https://picsum.photos/seed/watch4/400/400"]',
'{"Brand": "FitTech", "Model": "Pro 3", "Display": "1.4 inch AMOLED", "Battery": "7 days", "Water Resistance": "50m", "Sensors": "Heart Rate, SpO2, GPS, Accelerometer", "Compatibility": "iOS & Android"}'),

('Wireless Earbuds Pro', 'Premium true wireless earbuds with active noise cancellation, transparency mode, and spatial audio. Features 8-hour battery life with charging case providing 24 additional hours.', 15299.15, 90, 1,
'["https://picsum.photos/seed/earbuds1/400/400", "https://picsum.photos/seed/earbuds2/400/400", "https://picsum.photos/seed/earbuds3/400/400", "https://picsum.photos/seed/earbuds4/400/400"]',
'{"Brand": "SoundWave", "Model": "Pro Buds", "Battery": "8h + 24h case", "Noise Cancelling": "Active", "Water Resistance": "IPX5", "Connectivity": "Bluetooth 5.3", "Charging": "Wireless"}'),

('4K Ultra HD Smart TV 55"', 'Stunning 55-inch 4K UHD Smart TV with HDR10+ support, Dolby Vision, and built-in streaming apps. Features a sleek design with thin bezels and powerful quad-core processor for smooth performance.', 50999.15, 35, 1,
'["https://picsum.photos/seed/tv1/400/400", "https://picsum.photos/seed/tv2/400/400", "https://picsum.photos/seed/tv3/400/400", "https://picsum.photos/seed/tv4/400/400"]',
'{"Brand": "ViewTech", "Size": "55 inches", "Resolution": "4K UHD (3840x2160)", "HDR": "HDR10+, Dolby Vision", "Smart Platform": "Android TV", "Ports": "4x HDMI, 2x USB, Ethernet", "Refresh Rate": "120Hz"}'),

('Tablet Pro 12.9" 256GB', 'Professional tablet with 12.9-inch Liquid Retina display, M2 chip, and Apple Pencil support. Perfect for artists, designers, and professionals who need powerful performance on the go.', 93499.15, 30, 1,
'["https://picsum.photos/seed/tablet1/400/400", "https://picsum.photos/seed/tablet2/400/400", "https://picsum.photos/seed/tablet3/400/400", "https://picsum.photos/seed/tablet4/400/400"]',
'{"Brand": "TechPad", "Model": "Pro 12.9", "Storage": "256GB", "Display": "12.9 inch Liquid Retina", "Chip": "M2", "RAM": "8GB", "Camera": "12MP + 10MP", "Stylus": "Apple Pencil Compatible"}'),

('Portable Bluetooth Speaker', 'Waterproof portable speaker with 360-degree sound, 20-hour battery life, and built-in microphone for hands-free calls. Perfect for outdoor adventures and parties.', 7649.15, 120, 1,
'["https://picsum.photos/seed/speaker1/400/400", "https://picsum.photos/seed/speaker2/400/400", "https://picsum.photos/seed/speaker3/400/400", "https://picsum.photos/seed/speaker4/400/400"]',
'{"Brand": "SoundBox", "Model": "Portable Pro", "Battery": "20 hours", "Waterproof": "IPX7", "Connectivity": "Bluetooth 5.0", "Weight": "680g", "Sound": "360°", "Range": "30m"}'),

('Gaming Mechanical Keyboard', 'RGB backlit mechanical keyboard with Cherry MX switches, programmable keys, and aluminum frame. Designed for gamers and typists who demand precision and durability.', 12749.15, 55, 1,
'["https://picsum.photos/seed/keyboard1/400/400", "https://picsum.photos/seed/keyboard2/400/400", "https://picsum.photos/seed/keyboard3/400/400", "https://picsum.photos/seed/keyboard4/400/400"]',
'{"Brand": "KeyTech", "Model": "MK-9000", "Switches": "Cherry MX Red", "Backlight": "RGB", "Layout": "Full Size", "Material": "Aluminum", "Connectivity": "USB-C", "Macro Keys": "Yes"}'),

('Wireless Charging Pad', 'Fast wireless charging pad compatible with all Qi-enabled devices. Features LED indicator, non-slip surface, and supports up to 15W fast charging.', 2974.15, 150, 1,
'["https://picsum.photos/seed/charger1/400/400", "https://picsum.photos/seed/charger2/400/400", "https://picsum.photos/seed/charger3/400/400", "https://picsum.photos/seed/charger4/400/400"]',
'{"Brand": "ChargeTech", "Power": "15W", "Compatibility": "Qi Standard", "LED": "Yes", "Material": "Silicone", "Cable": "USB-C Included"}'),

('USB-C Hub 7-in-1', 'Multi-port USB-C hub with HDMI, USB 3.0, SD card reader, and power delivery. Perfect for laptops and tablets.', 4249.15, 85, 1,
'["https://picsum.photos/seed/hub1/400/400", "https://picsum.photos/seed/hub2/400/400", "https://picsum.photos/seed/hub3/400/400", "https://picsum.photos/seed/hub4/400/400"]',
'{"Ports": "7", "HDMI": "4K@30Hz", "USB 3.0": "3 ports", "SD Card": "Yes", "Power Delivery": "100W", "Compatibility": "USB-C"}'),

('Webcam HD 1080p', 'High-definition webcam with autofocus, built-in microphone, and privacy shutter. Perfect for video calls and streaming.', 6799.15, 70, 1,
'["https://picsum.photos/seed/webcam1/400/400", "https://picsum.photos/seed/webcam2/400/400", "https://picsum.photos/seed/webcam3/400/400", "https://picsum.photos/seed/webcam4/400/400"]',
'{"Resolution": "1080p", "Frame Rate": "30fps", "Microphone": "Built-in", "Privacy Shutter": "Yes", "Mount": "Universal", "Compatibility": "USB 2.0"}'),

('External SSD 1TB', 'Fast external SSD with USB-C connectivity. Transfer speeds up to 1050MB/s. Perfect for backups and portable storage.', 11049.15, 55, 1,
'["https://picsum.photos/seed/ssd1/400/400", "https://picsum.photos/seed/ssd2/400/400", "https://picsum.photos/seed/ssd3/400/400", "https://picsum.photos/seed/ssd4/400/400"]',
'{"Capacity": "1TB", "Interface": "USB-C", "Speed": "1050MB/s", "Size": "2.5 inch", "Weight": "45g", "Warranty": "3 years"}'),

('Mechanical Keyboard RGB', 'Gaming mechanical keyboard with RGB backlighting, programmable keys, and aluminum frame. Cherry MX switches.', 10199.15, 65, 1,
'["https://picsum.photos/seed/kbrgb1/400/400", "https://picsum.photos/seed/kbrgb2/400/400", "https://picsum.photos/seed/kbrgb3/400/400", "https://picsum.photos/seed/kbrgb4/400/400"]',
'{"Switches": "Cherry MX Brown", "Backlight": "RGB", "Layout": "Full Size", "Material": "Aluminum", "Macro Keys": "Yes", "Wrist Rest": "Included"}'),

('Monitor 27" 4K', 'Ultra HD 27-inch monitor with HDR support, 60Hz refresh rate, and multiple connectivity options. Perfect for work and gaming.', 33999.15, 30, 1,
'["https://picsum.photos/seed/monitor1/400/400", "https://picsum.photos/seed/monitor2/400/400", "https://picsum.photos/seed/monitor3/400/400", "https://picsum.photos/seed/monitor4/400/400"]',
'{"Size": "27 inches", "Resolution": "4K UHD", "Refresh Rate": "60Hz", "HDR": "Yes", "Ports": "HDMI, DisplayPort, USB-C", "Stand": "Adjustable"}'),

('Graphics Card RTX 4070', 'High-performance graphics card with ray tracing, DLSS 3.0, and 12GB GDDR6X memory. Perfect for gaming and content creation.', 50999.15, 25, 1,
'["https://picsum.photos/seed/gpu1/400/400", "https://picsum.photos/seed/gpu2/400/400", "https://picsum.photos/seed/gpu3/400/400", "https://picsum.photos/seed/gpu4/400/400"]',
'{"GPU": "NVIDIA RTX 4070", "Memory": "12GB GDDR6X", "Ray Tracing": "Yes", "DLSS": "3.0", "Power": "220W", "Cooling": "Triple Fan"}'),

('Microphone USB Condenser', 'Professional USB condenser microphone with cardioid pickup pattern. Perfect for streaming, podcasting, and recording.', 7649.15, 50, 1,
'["https://picsum.photos/seed/mic1/400/400", "https://picsum.photos/seed/mic2/400/400", "https://picsum.photos/seed/mic3/400/400", "https://picsum.photos/seed/mic4/400/400"]',
'{"Type": "Condenser", "Pattern": "Cardioid", "Connectivity": "USB", "Frequency": "20Hz-20kHz", "Stand": "Included", "Pop Filter": "Included"}'),

('Router WiFi 6', 'High-speed WiFi 6 router with mesh support, MU-MIMO, and advanced security features. Covers up to 2000 sq ft.', 12749.15, 40, 1,
'["https://picsum.photos/seed/router1/400/400", "https://picsum.photos/seed/router2/400/400", "https://picsum.photos/seed/router3/400/400", "https://picsum.photos/seed/router4/400/400"]',
'{"Standard": "WiFi 6", "Speed": "AX3000", "Coverage": "2000 sq ft", "MU-MIMO": "Yes", "Ports": "4x Gigabit Ethernet", "Security": "WPA3"}'),

('Power Bank 20000mAh', 'High-capacity power bank with fast charging, dual USB ports, and LED indicator. Charges multiple devices simultaneously.', 3399.15, 120, 1,
'["https://picsum.photos/seed/powerbank1/400/400", "https://picsum.photos/seed/powerbank2/400/400", "https://picsum.photos/seed/powerbank3/400/400", "https://picsum.photos/seed/powerbank4/400/400"]',
'{"Capacity": "20000mAh", "Output": "18W", "Ports": "2 USB", "Input": "USB-C", "LED": "Yes", "Weight": "400g"}'),

('Smart Speaker Voice Assistant', 'Voice-controlled smart speaker with premium sound quality, multi-room audio, and smart home integration.', 11049.15, 60, 1,
'["https://picsum.photos/seed/speakerai1/400/400", "https://picsum.photos/seed/speakerai2/400/400", "https://picsum.photos/seed/speakerai3/400/400", "https://picsum.photos/seed/speakerai4/400/400"]',
'{"Voice Assistant": "Yes", "Sound": "360°", "Smart Home": "Compatible", "Connectivity": "WiFi, Bluetooth", "Size": "6.3 inches", "Weight": "1.8lbs"}'),

-- Books (24 products)
('The Complete Web Development Bootcamp', 'Comprehensive guide covering HTML5, CSS3, JavaScript ES6+, React, Node.js, MongoDB, and more. Includes 50+ projects and exercises. Perfect for beginners and intermediate developers looking to master full-stack development.', 3999.20, 200, 2,
'["https://picsum.photos/seed/Book1/400/400", "https://picsum.photos/seed/Book2/400/400", "https://picsum.photos/seed/Book3/400/400", "https://picsum.photos/seed/Book4/400/400"]',
'{"Author": "Sarah WebDev", "Pages": "650", "Language": "English", "Format": "Paperback & eBook", "Publisher": "TechBooks Publishing", "ISBN": "978-1234567890", "Edition": "2024"}'),

('JavaScript: The Definitive Guide 7th Edition', 'Master JavaScript with this comprehensive reference covering ES2023 features, async programming, modules, and modern best practices. The definitive resource for JavaScript developers.', 5599.20, 150, 2,
'["https://picsum.photos/seed/Book+5", "https://picsum.photos/seed/Book+6", "https://picsum.photos/seed/Book+7", "https://picsum.photos/seed/Book+8"]',
'{"Author": "David Flanagan", "Pages": "1096", "Language": "English", "Format": "Hardcover", "Publisher": "O\'Reilly Media", "ISBN": "978-0596000486", "Edition": "7th"}'),

('Design Patterns: Elements of Reusable Object-Oriented Software', 'The classic Gang of Four book on design patterns. Learn essential patterns for building maintainable and scalable software systems. A must-read for every software engineer.', 4799.20, 100, 2,
'["https://picsum.photos/seed/Book+9", "https://picsum.photos/seed/Book+10", "https://picsum.photos/seed/Book+11", "https://picsum.photos/seed/Book+12"]',
'{"Author": "Gang of Four", "Pages": "395", "Language": "English", "Format": "Hardcover", "Publisher": "Addison-Wesley", "ISBN": "978-0201633610", "Edition": "1st"}'),

('Clean Code: A Handbook of Agile Software Craftsmanship', 'Learn how to write clean, maintainable code that other developers will appreciate. Covers principles, patterns, and practices for writing professional code.', 4399.20, 125, 2,
'["https://picsum.photos/seed/Book+13", "https://picsum.photos/seed/Book+14", "https://picsum.photos/seed/Book+15", "https://picsum.photos/seed/Book+16"]',
'{"Author": "Robert C. Martin", "Pages": "464", "Language": "English", "Format": "Paperback", "Publisher": "Prentice Hall", "ISBN": "978-0132350884", "Edition": "1st"}'),

('The Pragmatic Programmer: Your Journey to Mastery', 'A practical guide to becoming a better programmer. Covers topics from personal responsibility to architectural techniques, helping you become a more effective developer.', 3599.20, 110, 2,
'["https://picsum.photos/seed/Book+17", "https://picsum.photos/seed/Book+18", "https://picsum.photos/seed/Book+19", "https://picsum.photos/seed/Book+20"]',
'{"Author": "Andrew Hunt, David Thomas", "Pages": "352", "Language": "English", "Format": "Paperback", "Publisher": "Addison-Wesley", "ISBN": "978-0201616224", "Edition": "20th Anniversary"}'),

('System Design Interview: An Insider\'s Guide', 'Comprehensive guide to system design interviews. Learn how to design scalable systems, handle millions of users, and ace your next system design interview.', 3199.20, 95, 2,
'["https://picsum.photos/seed/Book+21", "https://picsum.photos/seed/Book+22", "https://picsum.photos/seed/Book+23", "https://picsum.photos/seed/Book+24"]',
'{"Author": "Alex Xu", "Pages": "320", "Language": "English", "Format": "Paperback", "Publisher": "ByteByteGo", "ISBN": "978-1736049115", "Edition": "2nd"}'),

('Introduction to Algorithms 4th Edition', 'The leading textbook on algorithms used in universities worldwide. Comprehensive coverage of algorithms and data structures with detailed explanations and examples.', 7199.20, 80, 2,
'["https://picsum.photos/seed/Book+25", "https://picsum.photos/seed/Book+26", "https://picsum.photos/seed/Book+27", "https://picsum.photos/seed/Book+28"]',
'{"Author": "Thomas H. Cormen, et al.", "Pages": "1312", "Language": "English", "Format": "Hardcover", "Publisher": "MIT Press", "ISBN": "978-0262046305", "Edition": "4th"}'),

('You Don\'t Know JS Yet: Get Started', 'Deep dive into JavaScript fundamentals. Perfect for developers who want to truly understand how JavaScript works under the hood.', 2399.20, 140, 2,
'["https://picsum.photos/seed/Book+29", "https://picsum.photos/seed/Book+30", "https://picsum.photos/seed/Book+31", "https://picsum.photos/seed/Book+32"]',
'{"Author": "Kyle Simpson", "Pages": "278", "Language": "English", "Format": "Paperback", "Publisher": "O\'Reilly Media", "ISBN": "978-1491924464", "Edition": "2nd"}'),

('Python Programming Complete Guide', 'Comprehensive Python programming guide from basics to advanced topics. Includes exercises and real-world projects.', 3599.20, 90, 2,
'["https://picsum.photos/seed/Book+33", "https://picsum.photos/seed/Book+34", "https://picsum.photos/seed/Book+35", "https://picsum.photos/seed/Book+36"]',
'{"Author": "Python Expert", "Pages": "600", "Language": "English", "Format": "Paperback", "Publisher": "TechBooks", "ISBN": "978-1234567891"}'),

('React.js Complete Reference', 'Master React.js with hooks, context API, and modern patterns. Includes Redux and Next.js basics.', 4399.20, 75, 2,
'["https://picsum.photos/seed/Book+37", "https://picsum.photos/seed/Book+38", "https://picsum.photos/seed/Book+39", "https://picsum.photos/seed/Book+40"]',
'{"Author": "React Master", "Pages": "450", "Language": "English", "Format": "Paperback", "Publisher": "WebDev Publishing", "ISBN": "978-1234567892"}'),

('Node.js Backend Development', 'Complete guide to building scalable backend applications with Node.js, Express, and MongoDB.', 3999.20, 80, 2,
'["https://picsum.photos/seed/Book+41", "https://picsum.photos/seed/Book+42", "https://picsum.photos/seed/Book+43", "https://picsum.photos/seed/Book+44"]',
'{"Author": "Backend Pro", "Pages": "520", "Language": "English", "Format": "Paperback", "Publisher": "ServerBooks", "ISBN": "978-1234567893"}'),

('Database Design Fundamentals', 'Learn database design principles, normalization, SQL optimization, and NoSQL databases.', 3199.20, 95, 2,
'["https://picsum.photos/seed/Book+45", "https://picsum.photos/seed/Book+46", "https://picsum.photos/seed/Book+47", "https://picsum.photos/seed/Book+48"]',
'{"Author": "DB Expert", "Pages": "380", "Language": "English", "Format": "Paperback", "Publisher": "DataBooks", "ISBN": "978-1234567894"}'),

('Cloud Computing Essentials', 'Comprehensive guide to AWS, Azure, and Google Cloud. Learn cloud architecture and deployment strategies.', 4799.20, 70, 2,
'["https://picsum.photos/seed/Book+49", "https://picsum.photos/seed/Book+50", "https://picsum.photos/seed/Book+51", "https://picsum.photos/seed/Book+52"]',
'{"Author": "Cloud Architect", "Pages": "550", "Language": "English", "Format": "Hardcover", "Publisher": "CloudBooks", "ISBN": "978-1234567895"}'),

('Machine Learning Basics', 'Introduction to machine learning concepts, algorithms, and practical applications with Python examples.', 5199.20, 65, 2,
'["https://picsum.photos/seed/Book+53", "https://picsum.photos/seed/Book+54", "https://picsum.photos/seed/Book+55", "https://picsum.photos/seed/Book+56"]',
'{"Author": "ML Scientist", "Pages": "480", "Language": "English", "Format": "Paperback", "Publisher": "AIBooks", "ISBN": "978-1234567896"}'),

('DevOps Handbook', 'Complete guide to DevOps practices, CI/CD pipelines, containerization, and infrastructure as code.', 4399.20, 85, 2,
'["https://picsum.photos/seed/Book+57", "https://picsum.photos/seed/Book+58", "https://picsum.photos/seed/Book+59", "https://picsum.photos/seed/Book+60"]',
'{"Author": "DevOps Engineer", "Pages": "420", "Language": "English", "Format": "Paperback", "Publisher": "OpsBooks", "ISBN": "978-1234567897"}'),

('Cybersecurity Fundamentals', 'Learn cybersecurity basics, ethical hacking, network security, and best practices for protecting systems.', 3999.20, 75, 2,
'["https://picsum.photos/seed/Book+61", "https://picsum.photos/seed/Book+62", "https://picsum.photos/seed/Book+63", "https://picsum.photos/seed/Book+64"]',
'{"Author": "Security Expert", "Pages": "400", "Language": "English", "Format": "Paperback", "Publisher": "SecBooks", "ISBN": "978-1234567898"}'),

('Data Structures and Algorithms in Java', 'Comprehensive guide to data structures and algorithms with Java implementations. Perfect for coding interviews.', 4599.20, 70, 2,
'["https://picsum.photos/seed/Book+65", "https://picsum.photos/seed/Book+66", "https://picsum.photos/seed/Book+67", "https://picsum.photos/seed/Book+68"]',
'{"Author": "Algorithm Expert", "Pages": "750", "Language": "English", "Format": "Paperback", "Publisher": "CodeBooks", "ISBN": "978-1234567899"}'),

('Full Stack Development Guide', 'Complete guide to full stack development covering frontend, backend, and deployment strategies.', 4999.20, 65, 2,
'["https://picsum.photos/seed/Book+69", "https://picsum.photos/seed/Book+70", "https://picsum.photos/seed/Book+71", "https://picsum.photos/seed/Book+72"]',
'{"Author": "Full Stack Pro", "Pages": "680", "Language": "English", "Format": "Paperback", "Publisher": "StackBooks", "ISBN": "978-1234567900"}'),

('Git and Version Control Mastery', 'Master Git, GitHub, and version control workflows. Essential skills for every developer.', 2799.20, 85, 2,
'["https://picsum.photos/seed/Book+73", "https://picsum.photos/seed/Book+74", "https://picsum.photos/seed/Book+75", "https://picsum.photos/seed/Book+76"]',
'{"Author": "Version Control Expert", "Pages": "320", "Language": "English", "Format": "Paperback", "Publisher": "GitBooks", "ISBN": "978-1234567901"}'),

('Docker and Kubernetes Guide', 'Learn containerization with Docker and orchestration with Kubernetes. Modern DevOps practices.', 5299.20, 60, 2,
'["https://picsum.photos/seed/Book+77", "https://picsum.photos/seed/Book+78", "https://picsum.photos/seed/Book+79", "https://picsum.photos/seed/Book+80"]',
'{"Author": "Container Expert", "Pages": "580", "Language": "English", "Format": "Paperback", "Publisher": "ContainerBooks", "ISBN": "978-1234567902"}'),

('TypeScript Complete Guide', 'Master TypeScript from basics to advanced. Build type-safe applications with confidence.', 4199.20, 75, 2,
'["https://picsum.photos/seed/Book+81", "https://picsum.photos/seed/Book+82", "https://picsum.photos/seed/Book+83", "https://picsum.photos/seed/Book+84"]',
'{"Author": "TypeScript Master", "Pages": "520", "Language": "English", "Format": "Paperback", "Publisher": "TypeBooks", "ISBN": "978-1234567903"}'),

('GraphQL API Development', 'Complete guide to building GraphQL APIs. Modern alternative to REST APIs.', 3899.20, 80, 2,
'["https://picsum.photos/seed/Book+85", "https://picsum.photos/seed/Book+86", "https://picsum.photos/seed/Book+87", "https://picsum.photos/seed/Book+88"]',
'{"Author": "API Expert", "Pages": "450", "Language": "English", "Format": "Paperback", "Publisher": "APIBooks", "ISBN": "978-1234567904"}'),

('Microservices Architecture', 'Learn to design and implement microservices architecture. Scalable system design patterns.', 5499.20, 70, 2,
'["https://picsum.photos/seed/Book+89", "https://picsum.photos/seed/Book+90", "https://picsum.photos/seed/Book+91", "https://picsum.photos/seed/Book+92"]',
'{"Author": "Architecture Expert", "Pages": "620", "Language": "English", "Format": "Hardcover", "Publisher": "ArchBooks", "ISBN": "978-1234567905"}'),

-- Automotive (20 products) - Bikes, Cars, and Cycles
('Sports Bike 250cc', 'High-performance sports bike with 250cc engine, sleek design, and advanced braking system. Perfect for city commuting and weekend rides.', 125000.00, 15, 8,
'["https://images.unsplash.com/photo-1558981806-ec527fa84c39?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1558980664-1db5067516c2?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1558980664-769d59546b3d?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1558980664-3a0f9f3ad6b9?w=400&h=400&fit=crop"]',
'{"Engine": "250cc", "Type": "Sports Bike", "Fuel Tank": "12L", "Mileage": "35 kmpl", "Color": "Red, Black, Blue", "Warranty": "2 years"}'),

('Cruiser Bike 350cc', 'Comfortable cruiser bike with 350cc engine, relaxed riding position, and classic design. Ideal for long rides and highway cruising.', 185000.00, 12, 8,
'["https://images.unsplash.com/photo-1558980664-1db5067516c2?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1558980664-769d59546b3d?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1558980664-3a0f9f3ad6b9?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1558981806-ec527fa84c39?w=400&h=400&fit=crop"]',
'{"Engine": "350cc", "Type": "Cruiser", "Fuel Tank": "15L", "Mileage": "30 kmpl", "Color": "Black, Silver", "Warranty": "2 years"}'),

('Adventure Bike 500cc', 'Rugged adventure bike with 500cc engine, off-road capabilities, and advanced suspension. Perfect for both city and off-road adventures.', 285000.00, 10, 8,
'["https://images.unsplash.com/photo-1558980664-769d59546b3d?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1558980664-3a0f9f3ad6b9?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1558981806-ec527fa84c39?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1558980664-1db5067516c2?w=400&h=400&fit=crop"]',
'{"Engine": "500cc", "Type": "Adventure", "Fuel Tank": "18L", "Mileage": "28 kmpl", "Color": "Orange, Black", "Warranty": "3 years"}'),

('Electric Scooter 150cc', 'Modern electric scooter with 150cc equivalent power, eco-friendly design, and smart features. Perfect for daily commuting.', 85000.00, 20, 8,
'["https://images.unsplash.com/photo-1558980664-3a0f9f3ad6b9?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1558981806-ec527fa84c39?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1558980664-1db5067516c2?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1558980664-769d59546b3d?w=400&h=400&fit=crop"]',
'{"Engine": "Electric 150cc equivalent", "Type": "Scooter", "Battery": "Lithium-ion", "Range": "80 km", "Color": "White, Blue, Red", "Warranty": "2 years"}'),

('Sedan Car 1.5L', 'Comfortable sedan car with 1.5L engine, spacious interior, and modern features. Perfect for family use and long drives.', 850000.00, 8, 8,
'["https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1494976388531-d1058494cdd8?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1502877338535-766e1452684a?w=400&h=400&fit=crop"]',
'{"Engine": "1.5L Petrol", "Type": "Sedan", "Seating": "5 Seater", "Mileage": "18 kmpl", "Color": "White, Black, Silver", "Warranty": "3 years"}'),

('SUV Car 2.0L', 'Powerful SUV with 2.0L engine, 7-seater capacity, and all-wheel drive. Ideal for families and adventure enthusiasts.', 1250000.00, 6, 8,
'["https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1494976388531-d1058494cdd8?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1502877338535-766e1452684a?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?w=400&h=400&fit=crop"]',
'{"Engine": "2.0L Diesel", "Type": "SUV", "Seating": "7 Seater", "Mileage": "15 kmpl", "Color": "Black, White, Grey", "Warranty": "3 years"}'),

('Hatchback Car 1.2L', 'Compact hatchback with 1.2L engine, fuel-efficient, and easy to park. Perfect for city driving and first-time car owners.', 550000.00, 12, 8,
'["https://images.unsplash.com/photo-1494976388531-d1058494cdd8?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1502877338535-766e1452684a?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=400&h=400&fit=crop"]',
'{"Engine": "1.2L Petrol", "Type": "Hatchback", "Seating": "5 Seater", "Mileage": "20 kmpl", "Color": "Red, Blue, White", "Warranty": "3 years"}'),

('Sports Car 3.0L', 'High-performance sports car with 3.0L turbocharged engine, aerodynamic design, and premium features. For the ultimate driving experience.', 3500000.00, 4, 8,
'["https://images.unsplash.com/photo-1502877338535-766e1452684a?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1494976388531-d1058494cdd8?w=400&h=400&fit=crop"]',
'{"Engine": "3.0L Turbo Petrol", "Type": "Sports Car", "Seating": "2 Seater", "Mileage": "12 kmpl", "Color": "Red, Yellow, Black", "Warranty": "3 years"}'),

('Mountain Bike 27.5"', 'Durable mountain bike with 27.5" wheels, front suspension, and 21-speed gears. Perfect for off-road trails and mountain biking.', 25000.00, 30, 8,
'["https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop"]',
'{"Wheel Size": "27.5 inches", "Type": "Mountain Bike", "Gears": "21 Speed", "Frame": "Aluminum", "Color": "Black, Green, Blue", "Warranty": "1 year"}'),

('Road Bike 700c', 'Lightweight road bike with 700c wheels, drop handlebars, and 18-speed gears. Designed for speed and efficiency on paved roads.', 35000.00, 25, 8,
'["https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop"]',
'{"Wheel Size": "700c", "Type": "Road Bike", "Gears": "18 Speed", "Frame": "Carbon Fiber", "Color": "Red, Black, White", "Warranty": "1 year"}'),

('Hybrid Bike 26"', 'Versatile hybrid bike with 26" wheels, comfortable upright position, and 24-speed gears. Perfect for city commuting and light trails.', 18000.00, 35, 8,
'["https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop"]',
'{"Wheel Size": "26 inches", "Type": "Hybrid", "Gears": "24 Speed", "Frame": "Steel", "Color": "Silver, Blue, Black", "Warranty": "1 year"}'),

('Electric Cycle 26"', 'Smart electric cycle with 26" wheels, pedal assist, and removable battery. Eco-friendly transportation with modern technology.', 45000.00, 20, 8,
'["https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop"]',
'{"Wheel Size": "26 inches", "Type": "Electric Cycle", "Battery": "Lithium-ion 36V", "Range": "50 km", "Color": "Black, White, Red", "Warranty": "2 years"}'),

('City Bike 24"', 'Comfortable city bike perfect for daily commuting. Lightweight frame with 7-speed gears.', 15000.00, 40, 8,
'["https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop"]',
'{"Wheel Size": "24 inches", "Type": "City Bike", "Gears": "7 Speed", "Frame": "Steel", "Color": "Black, Silver", "Warranty": "1 year"}'),

('Kids Bike 20"', 'Safe and fun kids bike with training wheels option. Perfect for children learning to ride.', 8000.00, 50, 8,
'["https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop"]',
'{"Wheel Size": "20 inches", "Type": "Kids Bike", "Gears": "Single Speed", "Frame": "Steel", "Color": "Red, Blue, Pink", "Warranty": "1 year"}'),

('Touring Bike 28"', 'Long-distance touring bike designed for comfort on extended rides. Durable and reliable.', 42000.00, 18, 8,
'["https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=400&h=400&fit=crop"]',
'{"Wheel Size": "28 inches", "Type": "Touring Bike", "Gears": "27 Speed", "Frame": "Aluminum", "Color": "Black, Green", "Warranty": "2 years"}'),

('Compact Car 1.0L', 'Fuel-efficient compact car perfect for city driving. Easy to park and maneuver.', 450000.00, 15, 8,
'["https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1494976388531-d1058494cdd8?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1502877338535-766e1452684a?w=400&h=400&fit=crop"]',
'{"Engine": "1.0L Petrol", "Type": "Compact", "Seating": "4 Seater", "Mileage": "22 kmpl", "Color": "White, Red, Blue", "Warranty": "3 years"}'),

('Luxury Sedan 2.5L', 'Premium luxury sedan with advanced features and comfortable interior. Perfect for executives.', 1800000.00, 5, 8,
'["https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1494976388531-d1058494cdd8?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1502877338535-766e1452684a?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?w=400&h=400&fit=crop"]',
'{"Engine": "2.5L Petrol", "Type": "Luxury Sedan", "Seating": "5 Seater", "Mileage": "16 kmpl", "Color": "Black, Silver, White", "Warranty": "5 years"}'),

('Touring Bike 600cc', 'Comfortable touring bike for long-distance rides. Spacious storage and comfortable seating.', 320000.00, 8, 8,
'["https://images.unsplash.com/photo-1558981806-ec527fa84c39?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1558980664-1db5067516c2?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1558980664-769d59546b3d?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1558980664-3a0f9f3ad6b9?w=400&h=400&fit=crop"]',
'{"Engine": "600cc", "Type": "Touring", "Fuel Tank": "20L", "Mileage": "25 kmpl", "Color": "Black, Blue", "Warranty": "3 years"}'),

('Commuter Bike 125cc', 'Reliable commuter bike perfect for daily use. Fuel-efficient and low maintenance.', 75000.00, 25, 8,
'["https://images.unsplash.com/photo-1558980664-1db5067516c2?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1558980664-769d59546b3d?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1558980664-3a0f9f3ad6b9?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1558981806-ec527fa84c39?w=400&h=400&fit=crop"]',
'{"Engine": "125cc", "Type": "Commuter", "Fuel Tank": "10L", "Mileage": "40 kmpl", "Color": "Black, Red, Blue", "Warranty": "2 years"}'),

-- Beauty & Personal Care (20 products)
('Face Moisturizer SPF 30', 'Hydrating daily face moisturizer with SPF 30 protection. Lightweight, non-greasy formula perfect for all skin types.', 899.00, 100, 7,
'["https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop"]',
'{"Type": "Moisturizer", "SPF": "30", "Size": "50ml", "Skin Type": "All", "Ingredients": "Hyaluronic Acid, Vitamin E"}'),

('Anti-Aging Serum Vitamin C', 'Powerful anti-aging serum with Vitamin C and retinol. Reduces fine lines, brightens skin, and improves texture.', 1499.00, 80, 7,
'["https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop"]',
'{"Type": "Serum", "Active Ingredients": "Vitamin C, Retinol", "Size": "30ml", "Skin Type": "All"}'),

('Cleansing Face Wash', 'Gentle daily cleansing face wash that removes dirt, oil, and makeup. Suitable for sensitive skin.', 599.00, 120, 7,
'["https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop"]',
'{"Type": "Face Wash", "Size": "150ml", "Skin Type": "Sensitive", "Paraben Free": "Yes"}'),

('Sunscreen Lotion SPF 50', 'Broad spectrum sunscreen with SPF 50 protection. Water-resistant formula for outdoor activities.', 799.00, 90, 7,
'["https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop"]',
'{"Type": "Sunscreen", "SPF": "50", "Size": "100ml", "Water Resistant": "Yes"}'),

('Hair Shampoo Volume Boost', 'Volumizing shampoo that adds body and bounce to fine, flat hair. Sulfate-free formula.', 699.00, 110, 7,
'["https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop"]',
'{"Type": "Shampoo", "Size": "400ml", "Hair Type": "Fine, Flat", "Sulfate Free": "Yes"}'),

('Hair Conditioner Repair', 'Deep conditioning treatment that repairs damaged hair and restores shine. For dry and damaged hair.', 749.00, 95, 7,
'["https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop"]',
'{"Type": "Conditioner", "Size": "400ml", "Hair Type": "Dry, Damaged", "Ingredients": "Argan Oil, Keratin"}'),

('Body Lotion Hydrating', 'Rich hydrating body lotion with shea butter and vitamin E. Keeps skin soft and moisturized all day.', 549.00, 130, 7,
'["https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop"]',
'{"Type": "Body Lotion", "Size": "500ml", "Ingredients": "Shea Butter, Vitamin E"}'),

('Face Mask Clay Detox', 'Purifying clay face mask that deep cleanses pores and removes impurities. For oily and combination skin.', 899.00, 85, 7,
'["https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop"]',
'{"Type": "Face Mask", "Size": "100ml", "Skin Type": "Oily, Combination", "Ingredients": "Clay, Charcoal"}'),

('Eye Cream Anti-Wrinkle', 'Intensive eye cream that reduces dark circles, puffiness, and fine lines around the eyes.', 1299.00, 70, 7,
'["https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop"]',
'{"Type": "Eye Cream", "Size": "15ml", "Benefits": "Anti-Wrinkle, Dark Circles", "Skin Type": "All"}'),

('Lip Balm SPF 15', 'Moisturizing lip balm with SPF 15 protection. Keeps lips soft and protected from sun damage.', 299.00, 150, 7,
'["https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop"]',
'{"Type": "Lip Balm", "SPF": "15", "Size": "4.2g", "Flavors": "Original, Cherry, Mint"}'),

('Hair Oil Treatment', 'Nourishing hair oil with argan and coconut oil. Reduces frizz, adds shine, and promotes healthy hair growth.', 899.00, 100, 7,
'["https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop"]',
'{"Type": "Hair Oil", "Size": "100ml", "Ingredients": "Argan Oil, Coconut Oil", "Hair Type": "All"}'),

('Face Toner Balancing', 'Alcohol-free face toner that balances pH and refreshes skin. Suitable for all skin types.', 649.00, 105, 7,
'["https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop"]',
'{"Type": "Toner", "Size": "200ml", "Alcohol Free": "Yes", "Skin Type": "All"}'),

('Body Scrub Exfoliating', 'Gentle exfoliating body scrub that removes dead skin cells and reveals smoother skin. With natural ingredients.', 799.00, 88, 7,
'["https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop"]',
'{"Type": "Body Scrub", "Size": "300ml", "Ingredients": "Sugar, Coconut Oil", "Skin Type": "All"}'),

('Hand Cream Nourishing', 'Intensive hand cream that repairs dry, cracked hands. With shea butter and vitamin E.', 449.00, 140, 7,
'["https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop"]',
'{"Type": "Hand Cream", "Size": "75ml", "Ingredients": "Shea Butter, Vitamin E"}'),

('Face Cleanser Gel', 'Foaming gel cleanser that removes makeup and impurities. Gentle formula for daily use.', 599.00, 115, 7,
'["https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop"]',
'{"Type": "Cleanser", "Size": "150ml", "Skin Type": "All", "Makeup Remover": "Yes"}'),

('Hair Mask Deep Conditioning', 'Weekly deep conditioning hair mask that restores moisture and repairs damage. For all hair types.', 999.00, 92, 7,
'["https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop"]',
'{"Type": "Hair Mask", "Size": "250ml", "Hair Type": "All", "Usage": "Weekly"}'),

('Perfume Eau de Parfum', 'Luxury fragrance with long-lasting scent. Elegant and sophisticated perfume for special occasions.', 2499.00, 60, 7,
'["https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop"]',
'{"Type": "Perfume", "Size": "50ml", "Fragrance Type": "Eau de Parfum", "Long Lasting": "Yes"}'),

('Deodorant Roll-On', 'Long-lasting deodorant roll-on that keeps you fresh all day. Alcohol-free and gentle on skin.', 349.00, 125, 7,
'["https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop"]',
'{"Type": "Deodorant", "Size": "50ml", "Alcohol Free": "Yes", "Long Lasting": "24 hours"}'),

('Nail Polish Set 12 Colors', 'Premium nail polish set with 12 vibrant colors. Long-lasting, chip-resistant formula with glossy finish.', 1299.00, 75, 7,
'["https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop"]',
'{"Type": "Nail Polish", "Colors": "12", "Size": "10ml each", "Finish": "Glossy"}'),

('Makeup Remover Wipes', 'Gentle makeup remover wipes that effectively remove all makeup including waterproof. Suitable for sensitive skin.', 499.00, 135, 7,
'["https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop"]',
'{"Type": "Makeup Wipes", "Count": "25 wipes", "Waterproof": "Yes", "Skin Type": "Sensitive"}'),

('Toothpaste Whitening', 'Advanced whitening toothpaste that removes stains and brightens teeth. With fluoride protection.', 299.00, 200, 7,
'["https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop"]',
'{"Type": "Toothpaste", "Size": "100g", "Benefits": "Whitening, Fluoride", "Flavor": "Mint"}'),

('Electric Toothbrush', 'Rechargeable electric toothbrush with multiple cleaning modes. Removes plaque effectively for healthier teeth.', 2499.00, 55, 7,
'["https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop", "https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400&h=400&fit=crop"]',
'{"Type": "Electric Toothbrush", "Modes": "3", "Battery": "Rechargeable", "Timer": "2 minutes"}'),

-- Clothing (15 products)
('Cotton T-Shirt Pack of 3', 'Comfortable cotton t-shirts in pack of 3. Soft fabric, perfect for everyday wear.', 999.00, 200, 3,
'["https://picsum.photos/seed/TShirt1/400/400", "https://picsum.photos/seed/TShirt2/400/400", "https://picsum.photos/seed/TShirt3/400/400", "https://picsum.photos/seed/TShirt4/400/400"]',
'{"Material": "100% Cotton", "Pack": "3", "Sizes": "S, M, L, XL", "Colors": "White, Black, Navy", "Care": "Machine Wash"}'),

('Denim Jeans Classic Fit', 'Classic fit denim jeans with stretch comfort. Timeless style for everyday wear.', 1999.00, 150, 3,
'["https://picsum.photos/seed/Jeans1/400/400", "https://picsum.photos/seed/Jeans2/400/400", "https://picsum.photos/seed/Jeans3/400/400", "https://picsum.photos/seed/Jeans4/400/400"]',
'{"Material": "98% Cotton, 2% Elastane", "Fit": "Classic", "Sizes": "28-38", "Colors": "Blue, Black", "Care": "Machine Wash"}'),

('Running Shoes Sports', 'Lightweight running shoes with cushioned sole. Perfect for jogging and workouts.', 2999.00, 120, 3,
'["https://picsum.photos/seed/Shoes1/400/400", "https://picsum.photos/seed/Shoes2/400/400", "https://picsum.photos/seed/Shoes3/400/400", "https://picsum.photos/seed/Shoes4/400/400"]',
'{"Type": "Running Shoes", "Sizes": "6-12", "Colors": "Black, White, Blue", "Material": "Mesh Upper", "Sole": "Rubber"}'),

('Winter Jacket Warm', 'Warm winter jacket with insulated lining. Perfect for cold weather protection.', 3999.00, 80, 3,
'["https://picsum.photos/seed/Jacket1/400/400", "https://picsum.photos/seed/Jacket2/400/400", "https://picsum.photos/seed/Jacket3/400/400", "https://picsum.photos/seed/Jacket4/400/400"]',
'{"Material": "Polyester, Insulated", "Sizes": "S, M, L, XL", "Colors": "Black, Navy, Grey", "Features": "Water Resistant"}'),

('Formal Shirt Business', 'Classic formal shirt perfect for office and business meetings. Wrinkle-free fabric.', 1499.00, 100, 3,
'["https://picsum.photos/seed/Shirt1/400/400", "https://picsum.photos/seed/Shirt2/400/400", "https://picsum.photos/seed/Shirt3/400/400", "https://picsum.photos/seed/Shirt4/400/400"]',
'{"Material": "Cotton Blend", "Sizes": "S, M, L, XL", "Colors": "White, Light Blue", "Fit": "Regular"}'),

-- Home & Kitchen (15 products)
('Non-Stick Cookware Set', 'Complete non-stick cookware set with 5 pieces. Durable and easy to clean.', 3499.00, 90, 4,
'["https://picsum.photos/seed/Cookware1/400/400", "https://picsum.photos/seed/Cookware2/400/400", "https://picsum.photos/seed/Cookware3/400/400", "https://picsum.photos/seed/Cookware4/400/400"]',
'{"Pieces": "5", "Material": "Non-Stick Coating", "Compatible": "Gas, Electric, Induction", "Warranty": "2 years"}'),

('Coffee Maker Automatic', 'Automatic coffee maker with programmable timer. Brews perfect coffee every time.', 4999.00, 60, 4,
'["https://picsum.photos/seed/Coffee1/400/400", "https://picsum.photos/seed/Coffee2/400/400", "https://picsum.photos/seed/Coffee3/400/400", "https://picsum.photos/seed/Coffee4/400/400"]',
'{"Capacity": "12 Cups", "Type": "Drip Coffee Maker", "Features": "Programmable Timer", "Warranty": "1 year"}'),

('Air Fryer Digital', 'Digital air fryer with multiple cooking functions. Healthy cooking with less oil.', 3999.00, 70, 4,
'["https://picsum.photos/seed/AirFryer1/400/400", "https://picsum.photos/seed/AirFryer2/400/400", "https://picsum.photos/seed/AirFryer3/400/400", "https://picsum.photos/seed/AirFryer4/400/400"]',
'{"Capacity": "5.5L", "Power": "1500W", "Functions": "Air Fry, Bake, Roast", "Warranty": "1 year"}'),

-- Sports & Outdoors (10 products)
('Yoga Mat Premium', 'Premium yoga mat with non-slip surface. Perfect for yoga and exercise routines.', 1299.00, 150, 5,
'["https://picsum.photos/seed/Yoga1/400/400", "https://picsum.photos/seed/Yoga2/400/400", "https://picsum.photos/seed/Yoga3/400/400", "https://picsum.photos/seed/Yoga4/400/400"]',
'{"Material": "TPE", "Thickness": "6mm", "Size": "183x61cm", "Colors": "Purple, Blue, Pink", "Non-Slip": "Yes"}'),

('Dumbbell Set Adjustable', 'Adjustable dumbbell set for home workouts. Space-saving design with multiple weight options.', 4999.00, 50, 5,
'["https://picsum.photos/seed/Dumbbell1/400/400", "https://picsum.photos/seed/Dumbbell2/400/400", "https://picsum.photos/seed/Dumbbell3/400/400", "https://picsum.photos/seed/Dumbbell4/400/400"]',
'{"Weight Range": "5-25kg per dumbbell", "Material": "Cast Iron", "Type": "Adjustable", "Warranty": "1 year"}'),

-- Toys & Games (12 products)
('Building Blocks Set', 'Educational building blocks set with 200 pieces. Develops creativity and motor skills.', 1999.00, 100, 6,
'["https://picsum.photos/seed/Blocks1/400/400", "https://picsum.photos/seed/Blocks2/400/400", "https://picsum.photos/seed/Blocks3/400/400", "https://picsum.photos/seed/Blocks4/400/400"]',
'{"Pieces": "200", "Material": "Plastic", "Age": "3+ years", "Colors": "Multiple", "Educational": "Yes"}'),

('Board Game Family', 'Fun family board game for 2-6 players. Perfect for family game nights.', 1499.00, 80, 6,
'["https://picsum.photos/seed/BoardGame1/400/400", "https://picsum.photos/seed/BoardGame2/400/400", "https://picsum.photos/seed/BoardGame3/400/400", "https://picsum.photos/seed/BoardGame4/400/400"]',
'{"Players": "2-6", "Age": "8+ years", "Duration": "30-60 minutes", "Type": "Strategy Game"}'),

('Puzzle Set 1000 Pieces', 'Challenging 1000-piece jigsaw puzzle. Great for relaxation and mental exercise.', 899.00, 120, 6,
'["https://picsum.photos/seed/Puzzle1/400/400", "https://picsum.photos/seed/Puzzle2/400/400", "https://picsum.photos/seed/Puzzle3/400/400", "https://picsum.photos/seed/Puzzle4/400/400"]',
'{"Pieces": "1000", "Age": "12+ years", "Size": "50x70cm", "Type": "Jigsaw Puzzle"}'),

('Action Figure Set', 'Collectible action figure set with accessories. Perfect for kids and collectors.', 2499.00, 90, 6,
'["https://picsum.photos/seed/Action1/400/400", "https://picsum.photos/seed/Action2/400/400", "https://picsum.photos/seed/Action3/400/400", "https://picsum.photos/seed/Action4/400/400"]',
'{"Figures": "3", "Age": "6+ years", "Material": "Plastic", "Accessories": "Included"}'),

('Tennis Racket Professional', 'Professional tennis racket with carbon fiber frame. Perfect for serious players.', 4999.00, 40, 5,
'["https://picsum.photos/seed/Tennis1/400/400", "https://picsum.photos/seed/Tennis2/400/400", "https://picsum.photos/seed/Tennis3/400/400", "https://picsum.photos/seed/Tennis4/400/400"]',
'{"Material": "Carbon Fiber", "Weight": "280g", "Grip Size": "4 1/4", "Strings": "Pre-strung"}'),

('Blender Mixer 1000W', 'Powerful 1000W blender for smoothies and food processing. Multiple speed settings.', 2999.00, 65, 4,
'["https://picsum.photos/seed/Blender1/400/400", "https://picsum.photos/seed/Blender2/400/400", "https://picsum.photos/seed/Blender3/400/400", "https://picsum.photos/seed/Blender4/400/400"]',
'{"Power": "1000W", "Capacity": "1.5L", "Speeds": "5", "Material": "Stainless Steel", "Warranty": "2 years"}'),

('Casual Sneakers', 'Comfortable casual sneakers for everyday wear. Stylish and durable design.', 2499.00, 110, 3,
'["https://picsum.photos/seed/Sneakers1/400/400", "https://picsum.photos/seed/Sneakers2/400/400", "https://picsum.photos/seed/Sneakers3/400/400", "https://picsum.photos/seed/Sneakers4/400/400"]',
'{"Sizes": "6-12", "Colors": "White, Black, Grey", "Material": "Canvas", "Sole": "Rubber"}'),

('Hoodie Sweatshirt', 'Warm and comfortable hoodie perfect for casual wear. Soft fabric with front pocket.', 1799.00, 130, 3,
'["https://picsum.photos/seed/Hoodie1/400/400", "https://picsum.photos/seed/Hoodie2/400/400", "https://picsum.photos/seed/Hoodie3/400/400", "https://picsum.photos/seed/Hoodie4/400/400"]',
'{"Material": "Cotton Blend", "Sizes": "S, M, L, XL", "Colors": "Black, Grey, Navy", "Features": "Front Pocket"}'),

('Kitchen Knife Set', 'Professional kitchen knife set with 6 pieces. Sharp and durable stainless steel blades.', 2999.00, 75, 4,
'["https://picsum.photos/seed/Knife1/400/400", "https://picsum.photos/seed/Knife2/400/400", "https://picsum.photos/seed/Knife3/400/400", "https://picsum.photos/seed/Knife4/400/400"]',
'{"Pieces": "6", "Material": "Stainless Steel", "Block": "Included", "Warranty": "Lifetime"}'),

('Dining Table Set', 'Modern dining table set with 4 chairs. Perfect for small families.', 8999.00, 30, 4,
'["https://picsum.photos/seed/Table1/400/400", "https://picsum.photos/seed/Table2/400/400", "https://picsum.photos/seed/Table3/400/400", "https://picsum.photos/seed/Table4/400/400"]',
'{"Material": "Engineered Wood", "Seating": "4", "Size": "120x80cm", "Color": "Brown, White"}'),

('Basketball Official Size', 'Official size basketball for indoor and outdoor play. Durable rubber construction.', 1299.00, 100, 5,
'["https://picsum.photos/seed/Basketball1/400/400", "https://picsum.photos/seed/Basketball2/400/400", "https://picsum.photos/seed/Basketball3/400/400", "https://picsum.photos/seed/Basketball4/400/400"]',
'{"Size": "Official (Size 7)", "Material": "Rubber", "Type": "Indoor/Outdoor", "Color": "Orange"}'),

('Football Soccer Ball', 'Professional soccer ball with FIFA approved design. Perfect for matches and practice.', 999.00, 120, 5,
'["https://picsum.photos/seed/Football1/400/400", "https://picsum.photos/seed/Football2/400/400", "https://picsum.photos/seed/Football3/400/400", "https://picsum.photos/seed/Football4/400/400"]',
'{"Size": "5 (Standard)", "Material": "PVC", "Type": "Training", "Color": "White/Black"}'),

('Remote Control Car', 'Fast remote control car with 2.4GHz controller. Perfect for kids and hobbyists.', 1999.00, 85, 6,
'["https://picsum.photos/seed/RCCar1/400/400", "https://picsum.photos/seed/RCCar2/400/400", "https://picsum.photos/seed/RCCar3/400/400", "https://picsum.photos/seed/RCCar4/400/400"]',
'{"Scale": "1:18", "Battery": "Rechargeable", "Range": "50m", "Age": "8+ years", "Colors": "Red, Blue"}'),

('LEGO Building Set', 'Creative LEGO building set with 500 pieces. Endless building possibilities.', 3499.00, 70, 6,
'["https://picsum.photos/seed/LEGO1/400/400", "https://picsum.photos/seed/LEGO2/400/400", "https://picsum.photos/seed/LEGO3/400/400", "https://picsum.photos/seed/LEGO4/400/400"]',
'{"Pieces": "500", "Age": "6+ years", "Type": "Creative Building", "Themes": "Multiple"}'),

('Chess Set Wooden', 'Classic wooden chess set with board. Elegant design for chess enthusiasts.', 1499.00, 60, 6,
'["https://picsum.photos/seed/Chess1/400/400", "https://picsum.photos/seed/Chess2/400/400", "https://picsum.photos/seed/Chess3/400/400", "https://picsum.photos/seed/Chess4/400/400"]',
'{"Material": "Wood", "Board Size": "40x40cm", "Pieces": "32", "Type": "Classic"}'),

('Swimming Goggles', 'Anti-fog swimming goggles with UV protection. Comfortable fit for all face sizes.', 699.00, 140, 5,
'["https://picsum.photos/seed/Goggles1/400/400", "https://picsum.photos/seed/Goggles2/400/400", "https://picsum.photos/seed/Goggles3/400/400", "https://picsum.photos/seed/Goggles4/400/400"]',
'{"Lens": "Anti-Fog, UV Protection", "Fit": "Adjustable", "Colors": "Clear, Blue, Black"}'),

('Resistance Bands Set', 'Complete resistance bands set for home workouts. Multiple resistance levels included.', 899.00, 125, 5,
'["https://picsum.photos/seed/Bands1/400/400", "https://picsum.photos/seed/Bands2/400/400", "https://picsum.photos/seed/Bands3/400/400", "https://picsum.photos/seed/Bands4/400/400"]',
'{"Bands": "5", "Resistance": "Light to Heavy", "Material": "Latex", "Accessories": "Door Anchor, Handles"}'),

('Pressure Cooker 5L', 'Stainless steel pressure cooker for fast cooking. Saves time and energy.', 2499.00, 80, 4,
'["https://picsum.photos/seed/Pressure1/400/400", "https://picsum.photos/seed/Pressure2/400/400", "https://picsum.photos/seed/Pressure3/400/400", "https://picsum.photos/seed/Pressure4/400/400"]',
'{"Capacity": "5L", "Material": "Stainless Steel", "Compatible": "Gas, Electric, Induction", "Warranty": "2 years"}'),

('Bed Sheet Set Cotton', 'Premium cotton bed sheet set with 4 pieces. Soft and breathable fabric.', 1999.00, 95, 4,
'["https://picsum.photos/seed/BedSheet1/400/400", "https://picsum.photos/seed/BedSheet2/400/400", "https://picsum.photos/seed/BedSheet3/400/400", "https://picsum.photos/seed/BedSheet4/400/400"]',
'{"Material": "100% Cotton", "Pieces": "4", "Sizes": "Single, Double, King", "Colors": "Multiple"}'),

('Track Pants Sports', 'Comfortable track pants for sports and casual wear. Elastic waistband with drawstring.', 1299.00, 105, 3,
'["https://picsum.photos/seed/Track1/400/400", "https://picsum.photos/seed/Track2/400/400", "https://picsum.photos/seed/Track3/400/400", "https://picsum.photos/seed/Track4/400/400"]',
'{"Material": "Polyester Blend", "Sizes": "S, M, L, XL", "Colors": "Black, Grey, Navy", "Features": "Elastic Waist"}'),

('Dart Board Set', 'Professional dart board set with darts and scoring. Perfect for home entertainment.', 1499.00, 55, 6,
'["https://picsum.photos/seed/Dart1/400/400", "https://picsum.photos/seed/Dart2/400/400", "https://picsum.photos/seed/Dart3/400/400", "https://picsum.photos/seed/Dart4/400/400"]',
'{"Darts": "6", "Board Size": "45cm", "Type": "Steel Tip", "Age": "14+ years"}'),

('Jump Rope Adjustable', 'Adjustable jump rope for cardio workouts. Lightweight and durable design.', 499.00, 160, 5,
'["https://picsum.photos/seed/JumpRope1/400/400", "https://picsum.photos/seed/JumpRope2/400/400", "https://picsum.photos/seed/JumpRope3/400/400", "https://picsum.photos/seed/JumpRope4/400/400"]',
'{"Length": "Adjustable", "Material": "PVC Rope", "Handles": "Ergonomic", "Color": "Black, Red"}'),

('Rice Cooker 1.8L', 'Automatic rice cooker with keep warm function. Perfect for cooking perfect rice every time.', 1999.00, 85, 4,
'["https://picsum.photos/seed/RiceCooker1/400/400", "https://picsum.photos/seed/RiceCooker2/400/400", "https://picsum.photos/seed/RiceCooker3/400/400", "https://picsum.photos/seed/RiceCooker4/400/400"]',
'{"Capacity": "1.8L", "Functions": "Cook, Keep Warm", "Material": "Non-Stick", "Warranty": "1 year"}');

