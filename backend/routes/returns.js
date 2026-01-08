const express = require('express');
const router = express.Router();
const db = require('../config/db');

const DEFAULT_USER_ID = 1;

// Get all returns for default user
router.get('/', (req, res) => {
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

  db.query(query, [DEFAULT_USER_ID], (err, results) => {
    if (err) {
      console.error('Error fetching returns:', err);
      console.error('SQL Error:', err.sqlMessage);
      return res.status(500).json({ error: 'Failed to fetch returns', details: err.message });
    }
    
    res.json(results);
  });
});

// Get single return by ID
router.get('/:id', (req, res) => {
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
  
  db.query(query, [returnId, DEFAULT_USER_ID], (err, results) => {
    if (err) {
      console.error('Error fetching return:', err);
      return res.status(500).json({ error: 'Failed to fetch return' });
    }
    
    if (results.length === 0) {
      return res.status(404).json({ error: 'Return not found' });
    }
    
    res.json(results[0]);
  });
});

// Create new return request
router.post('/', (req, res) => {
  const { order_id, order_item_id, return_reason, return_quantity, return_description } = req.body;

  console.log('Return request received:', { order_id, order_item_id, return_reason, return_quantity, return_description });

  if (!order_id || !order_item_id || !return_reason || return_quantity === undefined || return_quantity === null) {
    return res.status(400).json({ 
      error: 'Order ID, order item ID, return reason, and quantity are required',
      received: { order_id, order_item_id, return_reason, return_quantity }
    });
  }

  // Verify order belongs to user
  const verifyOrderQuery = 'SELECT id FROM orders WHERE id = ? AND user_id = ?';
  
  db.query(verifyOrderQuery, [order_id, DEFAULT_USER_ID], (err, orderResults) => {
    if (err) {
      console.error('Error verifying order:', err);
      return res.status(500).json({ error: 'Failed to verify order' });
    }
    
    if (orderResults.length === 0) {
      return res.status(404).json({ error: 'Order not found' });
    }

    // Get order item details
    const itemQuery = 'SELECT quantity, price FROM order_items WHERE id = ? AND order_id = ?';
    
    db.query(itemQuery, [order_item_id, order_id], (err, itemResults) => {
      if (err) {
        console.error('Error fetching order item:', err);
        return res.status(500).json({ error: 'Failed to fetch order item' });
      }
      
      if (itemResults.length === 0) {
        return res.status(404).json({ error: 'Order item not found' });
      }

      const orderItem = itemResults[0];
      
      // Validate return quantity
      if (return_quantity > orderItem.quantity) {
        return res.status(400).json({ error: 'Return quantity cannot exceed ordered quantity' });
      }

      // Calculate refund amount
      const refundAmount = (orderItem.price * return_quantity).toFixed(2);

      // Create return request
      const insertQuery = `
        INSERT INTO returns (order_id, order_item_id, return_reason, return_quantity, refund_amount, return_description, return_status)
        VALUES (?, ?, ?, ?, ?, ?, 'pending')
      `;

      db.query(insertQuery, [order_id, order_item_id, return_reason, return_quantity, refundAmount, return_description || ''], (err, result) => {
        if (err) {
          console.error('Error creating return:', err);
          console.error('SQL Error:', err.sqlMessage);
          console.error('SQL Code:', err.code);
          return res.status(500).json({ 
            error: 'Failed to create return request', 
            details: err.message,
            sqlError: err.sqlMessage 
          });
        }

        res.json({
          message: 'Return request created successfully',
          return_id: result.insertId,
          refund_amount: refundAmount
        });
      });
    });
  });
});

// Update return status (for admin use - can be extended later)
router.patch('/:id/status', (req, res) => {
  const returnId = req.params.id;
  const { status } = req.body;

  const validStatuses = ['pending', 'approved', 'rejected', 'refunded', 'completed'];
  if (!validStatuses.includes(status)) {
    return res.status(400).json({ error: 'Invalid status' });
  }

  const updateQuery = 'UPDATE returns SET return_status = ? WHERE id = ?';
  
  db.query(updateQuery, [status, returnId], (err, result) => {
    if (err) {
      console.error('Error updating return status:', err);
      return res.status(500).json({ error: 'Failed to update return status' });
    }
    
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Return not found' });
    }

    res.json({ message: 'Return status updated successfully', status });
  });
});

module.exports = router;

