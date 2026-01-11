const express = require('express');
const router = express.Router();
const db = require('../config/db');

const DEFAULT_USER_ID = 1;

router.get('/', async (req, res) => {
  try {
    const query = `
      SELECT c.*, p.name, p.price, p.image_urls, p.stock
      FROM cart c
      JOIN products p ON c.product_id = p.id
      WHERE c.user_id = ?
    `;

    const [results] = await db.query(query, [DEFAULT_USER_ID]);
    res.json(results);
  } catch (err) {
    console.error('Error fetching cart:', err);
    res.status(500).json({ error: 'Failed to fetch cart' });
  }
});

router.post('/', async (req, res) => {
  try {
    const { product_id, quantity } = req.body;

    if (!product_id || !quantity) {
      return res.status(400).json({ error: 'Product ID and quantity are required' });
    }

    const checkQuery = 'SELECT * FROM cart WHERE user_id = ? AND product_id = ?';
    const [results] = await db.query(checkQuery, [DEFAULT_USER_ID, product_id]);

    if (results.length > 0) {
      const updateQuery = 'UPDATE cart SET quantity = quantity + ? WHERE user_id = ? AND product_id = ?';
      await db.query(updateQuery, [quantity, DEFAULT_USER_ID, product_id]);
      res.json({ message: 'Cart updated successfully' });
    } else {
      const insertQuery = 'INSERT INTO cart (user_id, product_id, quantity) VALUES (?, ?, ?)';
      await db.query(insertQuery, [DEFAULT_USER_ID, product_id, quantity]);
      res.json({ message: 'Item added to cart successfully' });
    }
  } catch (err) {
    console.error('Error updating cart:', err);
    res.status(500).json({ error: 'Failed to update cart' });
  }
});

router.put('/:id', async (req, res) => {
  try {
    const cartId = req.params.id;
    const { quantity } = req.body;

    if (!quantity || quantity < 1) {
      return res.status(400).json({ error: 'Valid quantity is required' });
    }

    const query = 'UPDATE cart SET quantity = ? WHERE id = ? AND user_id = ?';
    const [results] = await db.query(query, [quantity, cartId, DEFAULT_USER_ID]);
    
    if (results.affectedRows === 0) {
      return res.status(404).json({ error: 'Cart item not found' });
    }
    
    res.json({ message: 'Cart updated successfully' });
  } catch (err) {
    console.error('Error updating cart:', err);
    res.status(500).json({ error: 'Failed to update cart' });
  }
});

router.delete('/:id', async (req, res) => {
  try {
    const cartId = req.params.id;
    const query = 'DELETE FROM cart WHERE id = ? AND user_id = ?';

    const [results] = await db.query(query, [cartId, DEFAULT_USER_ID]);
    
    if (results.affectedRows === 0) {
      return res.status(404).json({ error: 'Cart item not found' });
    }
    
    res.json({ message: 'Item removed from cart successfully' });
  } catch (err) {
    console.error('Error removing from cart:', err);
    res.status(500).json({ error: 'Failed to remove from cart' });
  }
});

router.delete('/', async (req, res) => {
  try {
    const query = 'DELETE FROM cart WHERE user_id = ?';
    await db.query(query, [DEFAULT_USER_ID]);
    res.json({ message: 'Cart cleared successfully' });
  } catch (err) {
    console.error('Error clearing cart:', err);
    res.status(500).json({ error: 'Failed to clear cart' });
  }
});

module.exports = router;

