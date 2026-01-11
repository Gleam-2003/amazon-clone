const express = require('express');
const router = express.Router();
const db = require('../config/db');

const DEFAULT_USER_ID = 1;

function generateOrderNumber() {
  return 'ORD-' + Date.now() + '-' + Math.random().toString(36).substr(2, 9).toUpperCase();
}

router.get('/', async (req, res) => {
  try {
    const query = `
      SELECT o.*
      FROM orders o
      WHERE o.user_id = ?
      ORDER BY o.created_at DESC
    `;

    const [orders] = await db.query(query, [DEFAULT_USER_ID]);
    
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

    const [items] = await db.query(itemsQuery, [orderIds]);

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

    const ordersWithItems = orders.map(order => ({
      ...order,
      items: itemsByOrder[order.id] || []
    }));

    res.json(ordersWithItems);
  } catch (err) {
    console.error('Error fetching orders:', err);
    res.status(500).json({ error: 'Failed to fetch orders' });
  }
});

router.get('/:id', async (req, res) => {
  try {
    const orderId = req.params.id;
    
    const orderQuery = 'SELECT * FROM orders WHERE id = ? AND user_id = ?';
    const [orderResults] = await db.query(orderQuery, [orderId, DEFAULT_USER_ID]);
    
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
    
    const [itemsResults] = await db.query(itemsQuery, [orderId]);
    
    order.items = itemsResults;
    res.json(order);
  } catch (err) {
    console.error('Error fetching order:', err);
    res.status(500).json({ error: 'Failed to fetch order' });
  }
});

router.post('/', async (req, res) => {
  const { shipping_address, cart_items } = req.body;

  if (!shipping_address || !cart_items || cart_items.length === 0) {
    return res.status(400).json({ error: 'Shipping address and cart items are required' });
  }

  const conn = await db.getConnection();
  
  try {
    await conn.beginTransaction();

    let totalAmount = 0;
    const orderItems = [];

    const productIds = cart_items.map(item => item.product_id);
    const productQuery = 'SELECT id, price, stock FROM products WHERE id IN (?)';
    
    const [products] = await conn.query(productQuery, [productIds]);

    const productMap = {};
    products.forEach(p => {
      productMap[p.id] = p;
    });

    for (const item of cart_items) {
      const product = productMap[item.product_id];
      if (!product) {
        await conn.rollback();
        return res.status(400).json({ error: `Product ${item.product_id} not found` });
      }
      if (product.stock < item.quantity) {
        await conn.rollback();
        return res.status(400).json({ error: `Insufficient stock for product ${item.product_id}` });
      }
      totalAmount += product.price * item.quantity;
      orderItems.push({
        product_id: item.product_id,
        quantity: item.quantity,
        price: product.price
      });
    }

    const orderNumber = generateOrderNumber();
    const orderQuery = `
      INSERT INTO orders (user_id, order_number, total_amount, shipping_address, status)
      VALUES (?, ?, ?, ?, 'confirmed')
    `;

    const [orderResult] = await conn.query(orderQuery, [DEFAULT_USER_ID, orderNumber, totalAmount, shipping_address]);
    const orderId = orderResult.insertId;

    const itemsQuery = 'INSERT INTO order_items (order_id, product_id, quantity, price) VALUES ?';
    const itemsValues = orderItems.map(item => [orderId, item.product_id, item.quantity, item.price]);

    await conn.query(itemsQuery, [itemsValues]);

    const updatePromises = orderItems.map(item => {
      const updateQuery = 'UPDATE products SET stock = stock - ? WHERE id = ?';
      return conn.query(updateQuery, [item.quantity, item.product_id]);
    });

    await Promise.all(updatePromises);

    const clearCartQuery = 'DELETE FROM cart WHERE user_id = ?';
    try {
      await conn.query(clearCartQuery, [DEFAULT_USER_ID]);
    } catch (err) {
      console.error('Error clearing cart:', err);
    }

    await conn.commit();

    res.json({
      message: 'Order placed successfully',
      order_id: orderId,
      order_number: orderNumber,
      total_amount: totalAmount
    });
  } catch (err) {
    await conn.rollback();
    console.error('Error creating order:', err);
    res.status(500).json({ error: 'Failed to create order' });
  } finally {
    conn.release();
  }
});

module.exports = router;

