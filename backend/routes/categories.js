const express = require('express');
const router = express.Router();
const db = require('../config/db');

// Get all categories
router.get('/', (req, res) => {
  const query = 'SELECT * FROM categories ORDER BY name';
  
  db.query(query, (err, results) => {
    if (err) {
      console.error('Error fetching categories:', err);
      return res.status(500).json({ error: 'Failed to fetch categories' });
    }
    res.json(results);
  });
});

module.exports = router;

