import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { getCart, createOrder } from '../api/api';
import { parseImageUrls } from '../utils/parseJson';
import { formatINRAmount } from '../utils/formatPrice';
import './Checkout.css';

const Checkout = () => {
  const navigate = useNavigate();
  const [cartItems, setCartItems] = useState([]);
  const [loading, setLoading] = useState(true);
  const [placingOrder, setPlacingOrder] = useState(false);
  const [formData, setFormData] = useState({
    fullName: '',
    address: '',
    city: '',
    state: '',
    zipCode: '',
    country: 'United States',
    phone: '',
  });

  const fetchCart = async () => {
    try {
      const response = await getCart();
      setCartItems(response.data);
      if (response.data.length === 0) {
        navigate('/cart');
      }
    } catch (error) {
      console.error('Error fetching cart:', error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchCart();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };

  const validateForm = () => {
    const required = ['fullName', 'address', 'city', 'state', 'zipCode', 'phone'];
    for (const field of required) {
      if (!formData[field].trim()) {
        alert(`Please fill in ${field.replace(/([A-Z])/g, ' $1').toLowerCase()}`);
        return false;
      }
    }
    return true;
  };

  const handlePlaceOrder = async (e) => {
    e.preventDefault();

    if (!validateForm()) return;

    setPlacingOrder(true);

    const shippingAddress = `
      ${formData.fullName}
      ${formData.address}
      ${formData.city}, ${formData.state} ${formData.zipCode}
      ${formData.country}
      Phone: ${formData.phone}
    `.trim();

    const orderItems = cartItems.map(item => ({
      product_id: item.product_id,
      quantity: item.quantity,
    }));

    try {
      const response = await createOrder(shippingAddress, orderItems);
      navigate(`/order-confirmation/${response.data.order_id}`);
    } catch (error) {
      console.error('Error placing order:', error);
      alert(error.response?.data?.error || 'Failed to place order. Please try again.');
    } finally {
      setPlacingOrder(false);
    }
  };

  const calculateSubtotal = () => {
    return cartItems.reduce((sum, item) => sum + item.price * item.quantity, 0);
  };

  const calculateTotal = () => {
    const subtotal = calculateSubtotal();
    const tax = subtotal * 0.1;
    return subtotal + tax;
  };

  if (loading) {
    return <div className="checkout-loading">Loading...</div>;
  }

  return (
    <div className="checkout">
      <div className="checkout-container">
        <h1 className="checkout-title">Checkout</h1>

        <div className="checkout-content">
          <div className="checkout-form-section">
            <form onSubmit={handlePlaceOrder} className="shipping-form">
              <h2>Shipping Address</h2>

              <div className="form-group">
                <label htmlFor="fullName">Full Name *</label>
                <input
                  type="text"
                  id="fullName"
                  name="fullName"
                  value={formData.fullName}
                  onChange={handleInputChange}
                  required
                />
              </div>

              <div className="form-group">
                <label htmlFor="address">Address *</label>
                <input
                  type="text"
                  id="address"
                  name="address"
                  value={formData.address}
                  onChange={handleInputChange}
                  required
                />
              </div>

              <div className="form-row">
                <div className="form-group">
                  <label htmlFor="city">City *</label>
                  <input
                    type="text"
                    id="city"
                    name="city"
                    value={formData.city}
                    onChange={handleInputChange}
                    required
                  />
                </div>

                <div className="form-group">
                  <label htmlFor="state">State *</label>
                  <input
                    type="text"
                    id="state"
                    name="state"
                    value={formData.state}
                    onChange={handleInputChange}
                    required
                  />
                </div>

                <div className="form-group">
                  <label htmlFor="zipCode">ZIP Code *</label>
                  <input
                    type="text"
                    id="zipCode"
                    name="zipCode"
                    value={formData.zipCode}
                    onChange={handleInputChange}
                    required
                  />
                </div>
              </div>

              <div className="form-group">
                <label htmlFor="country">Country</label>
                <input
                  type="text"
                  id="country"
                  name="country"
                  value={formData.country}
                  onChange={handleInputChange}
                />
              </div>

              <div className="form-group">
                <label htmlFor="phone">Phone Number *</label>
                <input
                  type="tel"
                  id="phone"
                  name="phone"
                  value={formData.phone}
                  onChange={handleInputChange}
                  required
                />
              </div>

              <button
                type="submit"
                className="place-order-btn"
                disabled={placingOrder}
              >
                {placingOrder ? 'Placing Order...' : 'Place Order'}
              </button>
            </form>
          </div>

          <div className="order-summary-section">
            <div className="order-summary-box">
              <h2>Order Summary</h2>

              <div className="order-items">
                {cartItems.map((item) => {
                  const images = parseImageUrls(item.image_urls);
                  const mainImage = images[0] || 'https://via.placeholder.com/80x80?text=No+Image';

                  return (
                    <div key={item.id} className="order-item">
                      <img src={mainImage} alt={item.name} />
                      <div className="order-item-info">
                        <div className="order-item-name">{item.name}</div>
                        <div className="order-item-qty">Quantity: {item.quantity}</div>
                        <div className="order-item-price">₹{formatINRAmount(item.price)}</div>
                      </div>
                    </div>
                  );
                })}
              </div>

              <div className="order-totals">
                <div className="total-line">
                  <span>Subtotal:</span>
                  <span>₹{formatINRAmount(calculateSubtotal())}</span>
                </div>
                <div className="total-line">
                  <span>Tax (10%):</span>
                  <span>₹{formatINRAmount(calculateSubtotal() * 0.1)}</span>
                </div>
                <div className="total-line total-final">
                  <span>Total:</span>
                  <span>₹{formatINRAmount(calculateTotal())}</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Checkout;

