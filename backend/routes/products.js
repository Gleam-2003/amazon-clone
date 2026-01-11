const express = require('express');
const router = express.Router();
const db = require('../config/db');

router.get('/', async (req, res) => {
  try {
    const { search, category } = req.query;
    let query = `
      SELECT p.*, c.name as category_name 
      FROM products p 
      LEFT JOIN categories c ON p.category_id = c.id 
      WHERE 1=1
    `;
    const params = [];

    if (search) {
      query += ` AND p.name LIKE ?`;
      params.push(`%${search}%`);
    }

    if (category) {
      query += ` AND c.id = ?`;
      params.push(category);
    }

    query += ` ORDER BY p.created_at DESC`;

    const [results] = await db.query(query, params);
    res.json(results);
  } catch (err) {
    console.error('Error fetching products:', err);
    res.status(500).json({ error: 'Failed to fetch products' });
  }
});

router.get('/:id', async (req, res) => {
  try {
    const productId = req.params.id;
    
    const query = `
      SELECT p.*, c.name as category_name 
      FROM products p 
      LEFT JOIN categories c ON p.category_id = c.id 
      WHERE p.id = ?
    `;

    const [results] = await db.query(query, [productId]);
    
    if (results.length === 0) {
      return res.status(404).json({ error: 'Product not found' });
    }
    
    res.json(results[0]);
  } catch (err) {
    console.error('Error fetching product:', err);
    res.status(500).json({ error: 'Failed to fetch product' });
  }
});

module.exports = router;

