const express = require('express');
const router = express.Router();
const db = require('../config/db');

const DEFAULT_USER_ID = 1;

// Get cart items for default user
router.get('/', (req, res) => {
  const query = `
    SELECT c.*, p.name, p.price, p.image_urls, p.stock
    FROM cart c
    JOIN products p ON c.product_id = p.id
    WHERE c.user_id = ?
  `;

  db.query(query, [DEFAULT_USER_ID], (err, results) => {
    if (err) {
      console.error('Error fetching cart:', err);
      return res.status(500).json({ error: 'Failed to fetch cart' });
    }
    res.json(results);
  });
});

// Add item to cart
router.post('/', (req, res) => {
  const { product_id, quantity } = req.body;

  if (!product_id || !quantity) {
    return res.status(400).json({ error: 'Product ID and quantity are required' });
  }

  // Check if item already exists in cart
  const checkQuery = 'SELECT * FROM cart WHERE user_id = ? AND product_id = ?';
  
  db.query(checkQuery, [DEFAULT_USER_ID, product_id], (err, results) => {
    if (err) {
      console.error('Error checking cart:', err);
      return res.status(500).json({ error: 'Failed to check cart' });
    }

    if (results.length > 0) {
      // Update quantity
      const updateQuery = 'UPDATE cart SET quantity = quantity + ? WHERE user_id = ? AND product_id = ?';
      db.query(updateQuery, [quantity, DEFAULT_USER_ID, product_id], (err) => {
        if (err) {
          console.error('Error updating cart:', err);
          return res.status(500).json({ error: 'Failed to update cart' });
        }
        res.json({ message: 'Cart updated successfully' });
      });
    } else {
      // Insert new item
      const insertQuery = 'INSERT INTO cart (user_id, product_id, quantity) VALUES (?, ?, ?)';
      db.query(insertQuery, [DEFAULT_USER_ID, product_id, quantity], (err) => {
        if (err) {
          console.error('Error adding to cart:', err);
          return res.status(500).json({ error: 'Failed to add to cart' });
        }
        res.json({ message: 'Item added to cart successfully' });
      });
    }
  });
});

// Update cart item quantity
router.put('/:id', (req, res) => {
  const cartId = req.params.id;
  const { quantity } = req.body;

  if (!quantity || quantity < 1) {
    return res.status(400).json({ error: 'Valid quantity is required' });
  }

  const query = 'UPDATE cart SET quantity = ? WHERE id = ? AND user_id = ?';
  
  db.query(query, [quantity, cartId, DEFAULT_USER_ID], (err, results) => {
    if (err) {
      console.error('Error updating cart:', err);
      return res.status(500).json({ error: 'Failed to update cart' });
    }
    
    if (results.affectedRows === 0) {
      return res.status(404).json({ error: 'Cart item not found' });
    }
    
    res.json({ message: 'Cart updated successfully' });
  });
});

// Remove item from cart
router.delete('/:id', (req, res) => {
  const cartId = req.params.id;
  const query = 'DELETE FROM cart WHERE id = ? AND user_id = ?';

  db.query(query, [cartId, DEFAULT_USER_ID], (err, results) => {
    if (err) {
      console.error('Error removing from cart:', err);
      return res.status(500).json({ error: 'Failed to remove from cart' });
    }
    
    if (results.affectedRows === 0) {
      return res.status(404).json({ error: 'Cart item not found' });
    }
    
    res.json({ message: 'Item removed from cart successfully' });
  });
});

// Clear entire cart
router.delete('/', (req, res) => {
  const query = 'DELETE FROM cart WHERE user_id = ?';

  db.query(query, [DEFAULT_USER_ID], (err) => {
    if (err) {
      console.error('Error clearing cart:', err);
      return res.status(500).json({ error: 'Failed to clear cart' });
    }
    res.json({ message: 'Cart cleared successfully' });
  });
});

module.exports = router;

