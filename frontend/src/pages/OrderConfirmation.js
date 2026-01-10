import React, { useState, useEffect, useCallback } from 'react';
import { useParams, Link } from 'react-router-dom';
import { getOrderById } from '../api/api';
import { parseImageUrls } from '../utils/parseJson';
import { formatINRAmount } from '../utils/formatPrice';
import './OrderConfirmation.css';

const OrderConfirmation = () => {
  const { orderId } = useParams();
  const [order, setOrder] = useState(null);
  const [loading, setLoading] = useState(true);

  const fetchOrder = useCallback(async () => {
    try {
      const response = await getOrderById(orderId);
      setOrder(response.data);
    } catch (error) {
      console.error('Error fetching order:', error);
    } finally {
      setLoading(false);
    }
  }, [orderId]);

  useEffect(() => {
    fetchOrder();
  }, [fetchOrder]);

  if (loading) {
    return <div className="confirmation-loading">Loading order details...</div>;
  }

  if (!order) {
    return (
      <div className="confirmation-error">
        <h2>Order not found</h2>
        <Link to="/">Return to Home</Link>
      </div>
    );
  }

  return (
    <div className="order-confirmation">
      <div className="confirmation-container">
        <div className="confirmation-success">
          <div className="success-icon">✓</div>
          <h1>Order Placed Successfully!</h1>
          <p className="confirmation-message">
            Thank you for your purchase. Your order has been placed and will be processed shortly.
          </p>
        </div>

        <div className="order-details-box">
          <h2>Order Details</h2>

          <div className="detail-row">
            <span className="detail-label">Order Number:</span>
            <span className="detail-value">{order.order_number}</span>
          </div>

          <div className="detail-row">
            <span className="detail-label">Order ID:</span>
            <span className="detail-value">#{order.id}</span>
          </div>

          <div className="detail-row">
            <span className="detail-label">Order Date:</span>
            <span className="detail-value">
              {new Date(order.created_at).toLocaleString()}
            </span>
          </div>

          <div className="detail-row">
            <span className="detail-label">Status:</span>
            <span className={`detail-value status-badge status-${order.status ? order.status.toLowerCase() : 'confirmed'}`}>
              {order.status ? order.status.charAt(0).toUpperCase() + order.status.slice(1) : 'Confirmed'}
            </span>
          </div>

          <div className="detail-row">
            <span className="detail-label">Total Amount:</span>
            <span className="detail-value total-amount">₹{parseFloat(order.total_amount).toFixed(2)}</span>
          </div>
        </div>

        <div className="shipping-details-box">
          <h2>Shipping Address</h2>
          <div className="shipping-address">
            {order.shipping_address.split('\n').map((line, index) => (
              <div key={index}>{line}</div>
            ))}
          </div>
        </div>

        {order.items && order.items.length > 0 && (
          <div className="order-items-box">
            <h2>Order Items</h2>
            <div className="items-list">
              {order.items.map((item) => {
                const images = parseImageUrls(item.image_urls);
                const mainImage = images[0] || 'https://via.placeholder.com/100x100?text=No+Image';

                return (
                  <div key={item.id} className="confirmation-item">
                    <img src={mainImage} alt={item.name} />
                    <div className="confirmation-item-info">
                      <div className="confirmation-item-name">{item.name}</div>
                      <div className="confirmation-item-details">
                        Quantity: {item.quantity} × ₹{formatINRAmount(item.price)} = ₹{formatINRAmount(item.quantity * item.price)}
                      </div>
                    </div>
                  </div>
                );
              })}
            </div>
          </div>
        )}

        <div className="confirmation-actions">
          <Link to="/" className="continue-shopping-btn">
            Continue Shopping
          </Link>
        </div>
      </div>
    </div>
  );
};

export default OrderConfirmation;

