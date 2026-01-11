const express = require('express');
const router = express.Router();
const db = require('../config/db');

const DEFAULT_USER_ID = 1;

router.get('/', async (req, res) => {
  try {
    const query = `
      SELECT r.*, 
             o.order_number,
             o.total_amount as order_total,
             o.created_at as order_date,
             oi.product_id,
             oi.quantity as ordered_quantity,
             oi.price as item_price,
             oi.id as order_item_id,
             p.name as product_name,
             p.image_urls
      FROM returns r
      JOIN order_items oi ON r.order_item_id = oi.id
      JOIN orders o ON oi.order_id = o.id
      JOIN products p ON oi.product_id = p.id
      WHERE o.user_id = ?
      ORDER BY r.created_at DESC
    `;

    const [results] = await db.query(query, [DEFAULT_USER_ID]);
    res.json(results);
  } catch (err) {
    console.error('Error fetching returns:', err);
    console.error('SQL Error:', err.sqlMessage);
    res.status(500).json({ error: 'Failed to fetch returns', details: err.message });
  }
});

router.get('/:id', async (req, res) => {
  try {
    const returnId = req.params.id;
    
    const query = `
      SELECT r.*, 
             o.order_number,
             o.total_amount as order_total,
             o.created_at as order_date,
             o.shipping_address,
             oi.product_id,
             oi.quantity as ordered_quantity,
             oi.price as item_price,
             p.name as product_name,
             p.image_urls,
             p.description as product_description
      FROM returns r
      JOIN orders o ON r.order_id = o.id
      JOIN order_items oi ON r.order_item_id = oi.id
      JOIN products p ON oi.product_id = p.id
      WHERE r.id = ? AND o.user_id = ?
    `;
    
    const [results] = await db.query(query, [returnId, DEFAULT_USER_ID]);
    
    if (results.length === 0) {
      return res.status(404).json({ error: 'Return not found' });
    }
    
    res.json(results[0]);
  } catch (err) {
    console.error('Error fetching return:', err);
    res.status(500).json({ error: 'Failed to fetch return' });
  }
});

router.post('/', async (req, res) => {
  try {
    const { order_id, order_item_id, return_reason, return_quantity, return_description } = req.body;

    console.log('Return request received:', { order_id, order_item_id, return_reason, return_quantity, return_description });

    if (!order_id || !order_item_id || !return_reason || return_quantity === undefined || return_quantity === null) {
      return res.status(400).json({ 
        error: 'Order ID, order item ID, return reason, and quantity are required',
        received: { order_id, order_item_id, return_reason, return_quantity }
      });
    }

    const verifyOrderQuery = 'SELECT id FROM orders WHERE id = ? AND user_id = ?';
    const [orderResults] = await db.query(verifyOrderQuery, [order_id, DEFAULT_USER_ID]);
    
    if (orderResults.length === 0) {
      return res.status(404).json({ error: 'Order not found' });
    }

    const itemQuery = 'SELECT quantity, price FROM order_items WHERE id = ? AND order_id = ?';
    const [itemResults] = await db.query(itemQuery, [order_item_id, order_id]);
    
    if (itemResults.length === 0) {
      return res.status(404).json({ error: 'Order item not found' });
    }

    const orderItem = itemResults[0];
    
    if (return_quantity > orderItem.quantity) {
      return res.status(400).json({ error: 'Return quantity cannot exceed ordered quantity' });
    }

    const refundAmount = (orderItem.price * return_quantity).toFixed(2);

    const insertQuery = `
      INSERT INTO returns (order_id, order_item_id, return_reason, return_quantity, refund_amount, return_description, return_status)
      VALUES (?, ?, ?, ?, ?, ?, 'pending')
    `;

    const [result] = await db.query(insertQuery, [order_id, order_item_id, return_reason, return_quantity, refundAmount, return_description || '']);

    res.json({
      message: 'Return request created successfully',
      return_id: result.insertId,
      refund_amount: refundAmount
    });
  } catch (err) {
    console.error('Error creating return:', err);
    console.error('SQL Error:', err.sqlMessage);
    console.error('SQL Code:', err.code);
    res.status(500).json({ 
      error: 'Failed to create return request', 
      details: err.message,
      sqlError: err.sqlMessage 
    });
  }
});

router.patch('/:id/status', async (req, res) => {
  try {
    const returnId = req.params.id;
    const { status } = req.body;

    const validStatuses = ['pending', 'approved', 'rejected', 'refunded', 'completed'];
    if (!validStatuses.includes(status)) {
      return res.status(400).json({ error: 'Invalid status' });
    }

    const updateQuery = 'UPDATE returns SET return_status = ? WHERE id = ?';
    const [result] = await db.query(updateQuery, [status, returnId]);
    
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Return not found' });
    }

    res.json({ message: 'Return status updated successfully', status });
  } catch (err) {
    console.error('Error updating return status:', err);
    res.status(500).json({ error: 'Failed to update return status' });
  }
});

module.exports = router;

