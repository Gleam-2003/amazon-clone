const express = require('express');
const router = express.Router();
const db = require('../config/db');

const DEFAULT_USER_ID = 1;

// Generate unique order number
function generateOrderNumber() {
  return 'ORD-' + Date.now() + '-' + Math.random().toString(36).substr(2, 9).toUpperCase();
}

// Get all orders for default user
router.get('/', (req, res) => {
  const query = `
    SELECT o.*
    FROM orders o
    WHERE o.user_id = ?
    ORDER BY o.created_at DESC
  `;

  db.query(query, [DEFAULT_USER_ID], (err, orders) => {
    if (err) {
      console.error('Error fetching orders:', err);
      return res.status(500).json({ error: 'Failed to fetch orders' });
    }
    
    // Fetch items for each order
    if (orders.length === 0) {
      return res.json([]);
    }

    const orderIds = orders.map(o => o.id);
    const itemsQuery = `
      SELECT oi.*, p.name, p.image_urls
      FROM order_items oi
      LEFT JOIN products p ON oi.product_id = p.id
      WHERE oi.order_id IN (?)
      ORDER BY oi.order_id, oi.id
    `;

    db.query(itemsQuery, [orderIds], (err, items) => {
      if (err) {
        console.error('Error fetching order items:', err);
        return res.status(500).json({ error: 'Failed to fetch order items' });
      }

      // Group items by order_id
      const itemsByOrder = {};
      items.forEach(item => {
        if (!itemsByOrder[item.order_id]) {
          itemsByOrder[item.order_id] = [];
        }
        itemsByOrder[item.order_id].push({
          id: item.id,
          product_id: item.product_id,
          quantity: item.quantity,
          price: parseFloat(item.price),
          name: item.name,
          image_urls: item.image_urls
        });
      });

      // Attach items to orders
      const ordersWithItems = orders.map(order => ({
        ...order,
        items: itemsByOrder[order.id] || []
      }));

      res.json(ordersWithItems);
    });
  });
});

// Get single order by ID
router.get('/:id', (req, res) => {
  const orderId = req.params.id;
  
  const orderQuery = 'SELECT * FROM orders WHERE id = ? AND user_id = ?';
  
  db.query(orderQuery, [orderId, DEFAULT_USER_ID], (err, orderResults) => {
    if (err) {
      console.error('Error fetching order:', err);
      return res.status(500).json({ error: 'Failed to fetch order' });
    }
    
    if (orderResults.length === 0) {
      return res.status(404).json({ error: 'Order not found' });
    }
    
    const order = orderResults[0];
    
    const itemsQuery = `
      SELECT oi.*, p.name, p.image_urls
      FROM order_items oi
      JOIN products p ON oi.product_id = p.id
      WHERE oi.order_id = ?
    `;
    
    db.query(itemsQuery, [orderId], (err, itemsResults) => {
      if (err) {
        console.error('Error fetching order items:', err);
        return res.status(500).json({ error: 'Failed to fetch order items' });
      }
      
      order.items = itemsResults;
      res.json(order);
    });
  });
});

// Create new order
router.post('/', (req, res) => {
  const { shipping_address, cart_items } = req.body;

  if (!shipping_address || !cart_items || cart_items.length === 0) {
    return res.status(400).json({ error: 'Shipping address and cart items are required' });
  }

  // Start transaction
  db.beginTransaction((err) => {
    if (err) {
      return res.status(500).json({ error: 'Failed to start transaction' });
    }

    // Calculate total amount
    let totalAmount = 0;
    const orderItems = [];

    // Get product prices and validate stock
    const productIds = cart_items.map(item => item.product_id);
    const productQuery = 'SELECT id, price, stock FROM products WHERE id IN (?)';
    
    db.query(productQuery, [productIds], (err, products) => {
      if (err) {
        db.rollback();
        return res.status(500).json({ error: 'Failed to fetch products' });
      }

      const productMap = {};
      products.forEach(p => {
        productMap[p.id] = p;
      });

      // Validate and calculate total
      for (const item of cart_items) {
        const product = productMap[item.product_id];
        if (!product) {
          db.rollback();
          return res.status(400).json({ error: `Product ${item.product_id} not found` });
        }
        if (product.stock < item.quantity) {
          db.rollback();
          return res.status(400).json({ error: `Insufficient stock for product ${item.product_id}` });
        }
        totalAmount += product.price * item.quantity;
        orderItems.push({
          product_id: item.product_id,
          quantity: item.quantity,
          price: product.price
        });
      }

      // Create order
      const orderNumber = generateOrderNumber();
      const orderQuery = `
        INSERT INTO orders (user_id, order_number, total_amount, shipping_address, status)
        VALUES (?, ?, ?, ?, 'confirmed')
      `;

      db.query(orderQuery, [DEFAULT_USER_ID, orderNumber, totalAmount, shipping_address], (err, orderResult) => {
        if (err) {
          db.rollback();
          return res.status(500).json({ error: 'Failed to create order' });
        }

        const orderId = orderResult.insertId;

        // Insert order items
        const itemsQuery = 'INSERT INTO order_items (order_id, product_id, quantity, price) VALUES ?';
        const itemsValues = orderItems.map(item => [orderId, item.product_id, item.quantity, item.price]);

        db.query(itemsQuery, [itemsValues], (err) => {
          if (err) {
            db.rollback();
            return res.status(500).json({ error: 'Failed to create order items' });
          }

          // Update product stock
          const updatePromises = orderItems.map(item => {
            return new Promise((resolve, reject) => {
              const updateQuery = 'UPDATE products SET stock = stock - ? WHERE id = ?';
              db.query(updateQuery, [item.quantity, item.product_id], (err) => {
                if (err) reject(err);
                else resolve();
              });
            });
          });

          Promise.all(updatePromises)
            .then(() => {
              // Clear cart
              const clearCartQuery = 'DELETE FROM cart WHERE user_id = ?';
              db.query(clearCartQuery, [DEFAULT_USER_ID], (err) => {
                if (err) {
                  console.error('Error clearing cart:', err);
                  // Don't fail the order if cart clearing fails
                }

                // Commit transaction
                db.commit((err) => {
                  if (err) {
                    db.rollback();
                    return res.status(500).json({ error: 'Failed to commit transaction' });
                  }

                  res.json({
                    message: 'Order placed successfully',
                    order_id: orderId,
                    order_number: orderNumber,
                    total_amount: totalAmount
                  });
                });
              });
            })
            .catch((err) => {
              db.rollback();
              return res.status(500).json({ error: 'Failed to update product stock' });
            });
        });
      });
    });
  });
});

module.exports = router;

