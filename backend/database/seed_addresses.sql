-- Seed Addresses - Demo User Addresses
-- Inserts demo addresses for default user (user_id = 1)
-- Safe to re-run (uses INSERT IGNORE to prevent duplicates)

USE amazon_clone;

-- Insert Demo Addresses
INSERT IGNORE INTO addresses (user_id, name, phone, address_line1, address_line2, city, state, pincode, is_default) VALUES
(1, 'John Doe', '+91-9876543210', '123 Main Street', 'Apartment 4B', 'Mumbai', 'Maharashtra', '400001', TRUE),
(1, 'Jane Smith', '+91-9876543211', '456 Park Avenue', 'Floor 2', 'Delhi', 'Delhi', '110001', FALSE),
(1, 'Raj Kumar', '+91-9876543212', '789 MG Road', 'Near Metro Station', 'Bangalore', 'Karnataka', '560001', FALSE),
(1, 'Priya Sharma', '+91-9876543213', '321 Commercial Street', 'Shop 15', 'Chennai', 'Tamil Nadu', '600001', FALSE),
(1, 'Amit Patel', '+91-9876543214', '654 Marine Drive', 'Building A-5', 'Kolkata', 'West Bengal', '700001', FALSE),
(1, 'Sneha Reddy', '+91-9876543215', '987 Jubilee Hills', 'Villa 12', 'Hyderabad', 'Telangana', '500033', FALSE);

-- Verification (optional)
SELECT COUNT(*) AS total_addresses FROM addresses WHERE user_id = 1;

