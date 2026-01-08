import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { getOrders } from '../api/api';
import { parseImageUrls } from '../utils/parseJson';
import { formatINRAmount } from '../utils/formatPrice';
import './OrderHistory.css';

const OrderHistory = () => {
  const [orders, setOrders] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  useEffect(() => {
    fetchOrders();
  }, []);

  const fetchOrders = async () => {
    try {
      setLoading(true);
      const response = await getOrders();
      setOrders(response.data);
      setError('');
    } catch (err) {
      console.error('Error fetching orders:', err);
      setError('Failed to load orders. Please try again.');
    } finally {
      setLoading(false);
    }
  };

  const formatDate = (dateString) => {
    const date = new Date(dateString);
    return date.toLocaleDateString('en-US', {
      year: 'numeric',
      month: 'long',
      day: 'numeric'
    });
  };


  if (loading) {
    return (
      <div className="order-history">
        <div className="order-history-container">
          <div className="loading">Loading orders...</div>
        </div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="order-history">
        <div className="order-history-container">
          <div className="error-message">{error}</div>
        </div>
      </div>
    );
  }

  return (
    <div className="order-history">
      <div className="order-history-container">
        <div className="order-history-header">
          <h1>Your Orders</h1>
          <p className="order-count">{orders.length} {orders.length === 1 ? 'order' : 'orders'} placed</p>
        </div>

        {orders.length === 0 ? (
          <div className="no-orders">
            <div className="no-orders-icon">📦</div>
            <h2>No orders yet</h2>
            <p>You haven't placed any orders yet. Start shopping to see your orders here!</p>
            <Link to="/" className="shop-now-btn">Start Shopping</Link>
          </div>
        ) : (
          <div className="orders-list">
            {orders.map((order) => (
              <div key={order.id} className="order-card">
                <div className="order-header">
                  <div className="order-info">
                    <div className="order-number">
                      <span className="order-label">Order #</span>
                      <span className="order-value">{order.order_number}</span>
                    </div>
                    <div className="order-date">
                      Placed on {formatDate(order.created_at)}
                    </div>
                  </div>
                  <div className="order-status">
                    <span 
                      className={`status-badge status-${order.status ? order.status.toLowerCase() : 'pending'}`}
                    >
                      {order.status ? order.status.charAt(0).toUpperCase() + order.status.slice(1) : 'Pending'}
                    </span>
                  </div>
                </div>

                <div className="order-items">
                  {order.items && order.items.length > 0 ? (
                    order.items.map((item, index) => {
                      if (!item || !item.product_id) {
                        console.warn('Invalid item data:', item);
                        return null;
                      }
                      
                      const images = parseImageUrls(item.image_urls);
                      const mainImage = images[0] || 'https://via.placeholder.com/150x150?text=No+Image';
                      const itemPrice = parseFloat(item.price) || 0;
                      const itemQuantity = parseInt(item.quantity) || 0;
                      const totalPrice = itemPrice * itemQuantity;
                      
                      return (
                        <div key={item.id || `item-${index}`} className="order-item">
                          {item.product_id ? (
                            <>
                              <Link to={`/product/${item.product_id}`} className="item-image-link">
                                <div className="item-image">
                                  <img src={mainImage} alt={item.name || 'Product'} />
                                </div>
                              </Link>
                              <div className="item-details">
                                <Link to={`/product/${item.product_id}`} className="item-name">
                                  {item.name || 'Product'}
                                </Link>
                                <div className="item-quantity">Quantity: {itemQuantity}</div>
                                <div className="item-price">
                                  {formatINRAmount(itemPrice)} × {itemQuantity} = {formatINRAmount(totalPrice)}
                                </div>
                              </div>
                            </>
                          ) : (
                            <div className="item-details">
                              <div className="item-name">{item.name || 'Product'}</div>
                              <div className="item-quantity">Quantity: {itemQuantity}</div>
                              <div className="item-price">
                                {formatINRAmount(itemPrice)} × {itemQuantity} = {formatINRAmount(totalPrice)}
                              </div>
                            </div>
                          )}
                        </div>
                      );
                    }).filter(Boolean)
                  ) : (
                    <div className="no-items">No items found</div>
                  )}
                </div>

                <div className="order-footer">
                  <div className="order-total">
                    <span className="total-label">Order Total:</span>
                    <span className="total-amount">{formatINRAmount(order.total_amount)}</span>
                  </div>
                  <div className="order-actions">
                    <Link to={`/order-confirmation/${order.id}`} className="view-order-btn">
                      View Order Details
                    </Link>
                    <Link to="/returns" className="return-btn">
                      Return Items
                    </Link>
                  </div>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  );
};

export default OrderHistory;

