import React, { useState, useEffect } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { getCart, updateCartItem, removeFromCart } from '../api/api';
import { parseImageUrls } from '../utils/parseJson';
import { formatINRAmount } from '../utils/formatPrice';
import './Cart.css';

const Cart = () => {
  const [cartItems, setCartItems] = useState([]);
  const [loading, setLoading] = useState(true);
  const [updating, setUpdating] = useState({});
  const navigate = useNavigate();

  useEffect(() => {
    fetchCart();
  }, []);

  const fetchCart = async () => {
    try {
      const response = await getCart();
      setCartItems(response.data);
    } catch (error) {
      console.error('Error fetching cart:', error);
    } finally {
      setLoading(false);
    }
  };

  const handleQuantityChange = async (cartId, newQuantity) => {
    if (newQuantity < 1) return;

    setUpdating({ ...updating, [cartId]: true });
    try {
      await updateCartItem(cartId, newQuantity);
      await fetchCart();
      window.dispatchEvent(new Event('cartUpdated'));
    } catch (error) {
      console.error('Error updating cart:', error);
      alert('Failed to update quantity');
    } finally {
      setUpdating({ ...updating, [cartId]: false });
    }
  };

  const handleRemove = async (cartId) => {
    if (!window.confirm('Remove this item from cart?')) return;

    try {
      await removeFromCart(cartId);
      await fetchCart();
      window.dispatchEvent(new Event('cartUpdated'));
    } catch (error) {
      console.error('Error removing from cart:', error);
      alert('Failed to remove item');
    }
  };

  const calculateSubtotal = () => {
    return cartItems.reduce((sum, item) => sum + item.price * item.quantity, 0);
  };

  const calculateTotal = () => {
    const subtotal = calculateSubtotal();
    const tax = subtotal * 0.1; // 10% tax
    return subtotal + tax;
  };

  if (loading) {
    return <div className="cart-loading">Loading cart...</div>;
  }

  if (cartItems.length === 0) {
    return (
      <div className="cart-empty">
        <div className="empty-cart-content">
          <h2>Your Amazon Cart is empty</h2>
          <p>Shop today's deals</p>
          <Link to="/" className="continue-shopping-btn">
            Continue Shopping
          </Link>
        </div>
      </div>
    );
  }

  return (
    <div className="cart">
      <div className="cart-container">
        <div className="cart-items-section">
          <div className="cart-header">
            <h1>Shopping Cart</h1>
            <span className="items-count">{cartItems.length} {cartItems.length === 1 ? 'item' : 'items'}</span>
          </div>

          <div className="cart-items">
            {cartItems.map((item) => {
              const images = parseImageUrls(item.image_urls);
              const mainImage = images[0] || 'https://via.placeholder.com/150x150?text=No+Image';

              return (
                <div key={item.id} className="cart-item">
                  <div className="cart-item-image">
                    <img src={mainImage} alt={item.name} />
                  </div>
                  <div className="cart-item-details">
                    <Link to={`/product/${item.product_id}`} className="cart-item-name">
                      {item.name}
                    </Link>
                    <div className="cart-item-price">₹{formatINRAmount(item.price)}</div>
                    <div className="cart-item-actions">
                      <div className="quantity-controls">
                        <label>Qty:</label>
                        <button
                          className="qty-btn"
                          onClick={() => handleQuantityChange(item.id, item.quantity - 1)}
                          disabled={item.quantity <= 1 || updating[item.id]}
                        >
                          −
                        </button>
                        <span className="qty-value">{item.quantity}</span>
                        <button
                          className="qty-btn"
                          onClick={() => handleQuantityChange(item.id, item.quantity + 1)}
                          disabled={item.quantity >= item.stock || updating[item.id]}
                        >
                          +
                        </button>
                      </div>
                      <button
                        className="remove-btn"
                        onClick={() => handleRemove(item.id)}
                      >
                        Delete
                      </button>
                    </div>
                  </div>
                  <div className="cart-item-total">
                    ₹{formatINRAmount(item.price * item.quantity)}
                  </div>
                </div>
              );
            })}
          </div>

          <div className="cart-subtotal">
            Subtotal ({cartItems.reduce((sum, item) => sum + item.quantity, 0)} items): 
            <span className="subtotal-amount">₹{formatINRAmount(calculateSubtotal())}</span>
          </div>
        </div>

        <div className="cart-summary">
          <div className="summary-box">
            <div className="summary-line">
              <span>Subtotal:</span>
              <span>₹{formatINRAmount(calculateSubtotal())}</span>
            </div>
            <div className="summary-line">
              <span>Tax (10%):</span>
              <span>₹{formatINRAmount(calculateSubtotal() * 0.1)}</span>
            </div>
            <div className="summary-total">
              <span>Total:</span>
              <span>₹{formatINRAmount(calculateTotal())}</span>
            </div>
            <button
              className="checkout-btn"
              onClick={() => navigate('/checkout')}
            >
              Proceed to Checkout
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Cart;

