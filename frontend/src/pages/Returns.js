import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { getReturns, getOrders, createReturn } from '../api/api';
import { parseImageUrls } from '../utils/parseJson';
import { formatINRAmount } from '../utils/formatPrice';
import './Returns.css';

const Returns = () => {
  const [returns, setReturns] = useState([]);
  const [orders, setOrders] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [showReturnForm, setShowReturnForm] = useState(false);
  const [selectedOrder, setSelectedOrder] = useState(null);
  const [selectedItem, setSelectedItem] = useState(null);
  const [returnForm, setReturnForm] = useState({
    return_reason: '',
    return_quantity: 1,
    return_description: ''
  });
  const [submitting, setSubmitting] = useState(false);
  const [showReturnDetails, setShowReturnDetails] = useState(false);
  const [selectedReturn, setSelectedReturn] = useState(null);

  useEffect(() => {
    fetchReturns();
    fetchOrders();
  }, []);

  const fetchReturns = async () => {
    try {
      const response = await getReturns();
      setReturns(response.data);
      setError('');
    } catch (err) {
      console.error('Error fetching returns:', err);
      setError('Failed to load returns. Please try again.');
    } finally {
      setLoading(false);
    }
  };

  const fetchOrders = async () => {
    try {
      const response = await getOrders();
      setOrders(response.data);
    } catch (err) {
      console.error('Error fetching orders:', err);
    }
  };

  const handleStartReturn = (order, item) => {
    console.log('handleStartReturn called with:', { order, item });
    
    if (!order || !item) {
      console.error('Missing order or item:', { order, item });
      alert('Error: Unable to start return. Please try again.');
      return;
    }

    if (!item.id) {
      console.error('Item missing id:', item);
      alert('Error: Item information is incomplete. Please refresh the page.');
      return;
    }

    setSelectedOrder(order);
    setSelectedItem(item);
    setReturnForm({
      return_reason: '',
      return_quantity: 1,
      return_description: ''
    });
    setShowReturnForm(true);
    setShowReturnDetails(false);
    setSelectedReturn(null);
    
    console.log('Modal state set. showReturnForm should be true.');
  };

  const handleViewReturnDetails = (returnItem) => {
    setSelectedReturn(returnItem);
    setShowReturnDetails(true);
    setShowReturnForm(false);
  };

  const handleSubmitReturn = async (e) => {
    e.preventDefault();
    
    if (!returnForm.return_reason) {
      alert('Please select a return reason');
      return;
    }

    if (returnForm.return_quantity > selectedItem.quantity) {
      alert('Return quantity cannot exceed ordered quantity');
      return;
    }

    try {
      setSubmitting(true);
      console.log('Submitting return:', {
        orderId: selectedOrder.id,
        orderItemId: selectedItem.id,
        reason: returnForm.return_reason,
        quantity: returnForm.return_quantity,
        description: returnForm.return_description
      });
      
      const response = await createReturn(
        selectedOrder.id,
        selectedItem.id,
        returnForm.return_reason,
        returnForm.return_quantity,
        returnForm.return_description
      );
      
      console.log('Return created successfully:', response.data);
      alert('Return request submitted successfully!');
      setShowReturnForm(false);
      setSelectedOrder(null);
      setSelectedItem(null);
      fetchReturns();
    } catch (err) {
      console.error('Error creating return:', err);
      const errorMessage = err.response?.data?.error || err.response?.data?.details || err.message || 'Failed to submit return request. Please try again.';
      alert(errorMessage);
    } finally {
      setSubmitting(false);
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

  const getStatusColor = (status) => {
    const statusColors = {
      pending: '#ff9900',
      approved: '#0066cc',
      rejected: '#cc0000',
      refunded: '#008000',
      completed: '#008000'
    };
    return statusColors[status] || '#666';
  };

  if (loading) {
    return (
      <div className="returns-page">
        <div className="returns-container">
          <div className="loading">Loading returns...</div>
        </div>
      </div>
    );
  }

  return (
    <div className="returns-page">
      <div className="returns-container">
        <div className="returns-header">
          <h1>Returns & Refunds</h1>
          <Link to="/orders" className="view-orders-link">View Orders</Link>
        </div>

        {showReturnDetails && selectedReturn && (
          <div className="return-form-modal">
            <div className="return-form-overlay" onClick={() => setShowReturnDetails(false)}></div>
            <div className="return-form-content">
              <div className="return-form-header">
                <h2>Return Request Details</h2>
                <button className="close-btn" onClick={() => setShowReturnDetails(false)}>×</button>
              </div>
              
              <div className="return-form-item">
                <h3>Return Information</h3>
                <div className="return-details-view">
                  <div className="detail-row">
                    <strong>Return Request #:</strong> {selectedReturn.id}
                  </div>
                  <div className="detail-row">
                    <strong>Requested On:</strong> {formatDate(selectedReturn.created_at)}
                  </div>
                  <div className="detail-row">
                    <strong>Status:</strong> 
                    <span className="status-badge" style={{ color: getStatusColor(selectedReturn.return_status), marginLeft: '10px' }}>
                      {selectedReturn.return_status.charAt(0).toUpperCase() + selectedReturn.return_status.slice(1)}
                    </span>
                  </div>
                </div>
              </div>

              <div className="return-form-item">
                <h3>Item Details</h3>
                <div className="return-item-preview">
                  {(() => {
                    const images = parseImageUrls(selectedReturn.image_urls);
                    const mainImage = images[0] || 'https://via.placeholder.com/100x100?text=No+Image';
                    return (
                      <>
                        <img src={mainImage} alt={selectedReturn.product_name} />
                        <div>
                          <div className="item-name">{selectedReturn.product_name}</div>
                          <div className="item-info">Order #{selectedReturn.order_number}</div>
                          <div className="item-info">Quantity: {selectedReturn.return_quantity}</div>
                          <div className="item-info">Refund Amount: ₹{formatINRAmount(selectedReturn.refund_amount || 0)}</div>
                        </div>
                      </>
                    );
                  })()}
                </div>
              </div>

              <div className="return-form-item">
                <h3>Return Reason</h3>
                <div className="return-details-view">
                  <div className="detail-row">
                    <strong>Reason:</strong> {selectedReturn.return_reason}
                  </div>
                  {selectedReturn.return_description && (
                    <div className="detail-row">
                      <strong>Additional Details:</strong>
                      <p style={{ marginTop: '10px', color: '#666', lineHeight: '1.6' }}>
                        {selectedReturn.return_description}
                      </p>
                    </div>
                  )}
                </div>
              </div>

              <div className="form-actions">
                <button type="button" onClick={() => setShowReturnDetails(false)} className="cancel-btn">
                  Close
                </button>
                <Link to={`/order-confirmation/${selectedReturn.order_id}`} className="submit-btn" style={{ textDecoration: 'none', display: 'inline-block', textAlign: 'center' }}>
                  View Order
                </Link>
              </div>
            </div>
          </div>
        )}

        {showReturnForm && selectedOrder && selectedItem && (
          <div className="return-form-modal" style={{ display: 'flex' }}>
            <div className="return-form-overlay" onClick={() => setShowReturnForm(false)}></div>
            <div className="return-form-content">
              <div className="return-form-header">
                <h2>Request a Return</h2>
                <button className="close-btn" onClick={() => setShowReturnForm(false)}>×</button>
              </div>
              
              <div className="return-form-item">
                <h3>Item to Return</h3>
                <div className="return-item-preview">
                  {(() => {
                    const images = parseImageUrls(selectedItem.image_urls);
                    const mainImage = images[0] || 'https://via.placeholder.com/100x100?text=No+Image';
                    return (
                      <>
                        <img src={mainImage} alt={selectedItem.name} />
                        <div>
                          <div className="item-name">{selectedItem.name}</div>
                          <div className="item-info">Ordered: {selectedItem.quantity} × ₹{formatINRAmount(selectedItem.price)}</div>
                        </div>
                      </>
                    );
                  })()}
                </div>
              </div>

              <form onSubmit={handleSubmitReturn} className="return-form">
                <div className="form-group">
                  <label>Return Reason *</label>
                  <select
                    value={returnForm.return_reason}
                    onChange={(e) => setReturnForm({...returnForm, return_reason: e.target.value})}
                    required
                  >
                    <option value="">Select a reason</option>
                    <option value="Defective/Damaged">Defective/Damaged</option>
                    <option value="Wrong Item">Wrong Item</option>
                    <option value="Not as Described">Not as Described</option>
                    <option value="Changed Mind">Changed Mind</option>
                    <option value="Size/Color Issue">Size/Color Issue</option>
                    <option value="Other">Other</option>
                  </select>
                </div>

                <div className="form-group">
                  <label>Quantity to Return *</label>
                  <input
                    type="number"
                    min="1"
                    max={selectedItem.quantity}
                    value={returnForm.return_quantity}
                    onChange={(e) => setReturnForm({...returnForm, return_quantity: parseInt(e.target.value) || 1})}
                    required
                  />
                  <span className="form-hint">Maximum: {selectedItem.quantity}</span>
                </div>

                <div className="form-group">
                  <label>Additional Details (Optional)</label>
                  <textarea
                    rows="4"
                    value={returnForm.return_description}
                    onChange={(e) => setReturnForm({...returnForm, return_description: e.target.value})}
                    placeholder="Please provide any additional information about your return..."
                  />
                </div>

                <div className="form-actions">
                  <button type="button" onClick={() => setShowReturnForm(false)} className="cancel-btn">
                    Cancel
                  </button>
                  <button type="submit" disabled={submitting} className="submit-btn">
                    {submitting ? 'Submitting...' : 'Submit Return Request'}
                  </button>
                </div>
              </form>
            </div>
          </div>
        )}

        <div className="returns-tabs">
          <div className="tab active">Return Requests</div>
        </div>

        {error && <div className="error-message">{error}</div>}

        {(() => {
          const itemsWithPendingReturns = new Set(
            returns
              .filter(r => r.return_status === 'pending')
              .map(r => r.order_item_id)
          );

          const eligibleItems = orders.flatMap((order) => {
            if (!order.items || order.items.length === 0) return [];
            return order.items
              .filter(item => {
                if (!item.id) {
                  console.warn('Item missing id:', item);
                  return false;
                }
                return !itemsWithPendingReturns.has(item.id);
              })
              .map(item => ({ ...item, order_id: order.id, order_number: order.order_number, order_date: order.created_at }));
          });

          console.log('Eligible items for return:', eligibleItems.length, eligibleItems);

          return (
            <>
              {returns.length > 0 && (
                <div className="returns-list" style={{ marginBottom: '30px' }}>
                  <h3 style={{ marginBottom: '15px', color: '#131921', fontSize: '18px', fontWeight: '500' }}>
                    Your Return Requests ({returns.length})
                  </h3>
                  {returns.map((returnItem) => {
                    const images = parseImageUrls(returnItem.image_urls);
                    const mainImage = images[0] || 'https://via.placeholder.com/100x100?text=No+Image';
                    
                    return (
                      <div 
                        key={returnItem.id} 
                        className="return-card clickable-return-card"
                        onClick={() => handleViewReturnDetails(returnItem)}
                        style={{ cursor: 'pointer' }}
                      >
                        <div className="return-header">
                          <div className="return-info">
                            <div className="return-number">
                              Return Request #{returnItem.id}
                            </div>
                            <div className="return-date">
                              Requested on {formatDate(returnItem.created_at)}
                            </div>
                          </div>
                          <div className="return-status">
                            <span
                              className="status-badge"
                              style={{ color: getStatusColor(returnItem.return_status) }}
                            >
                              {returnItem.return_status.charAt(0).toUpperCase() + returnItem.return_status.slice(1)}
                            </span>
                          </div>
                        </div>

                        <div className="return-item-details">
                          <img src={mainImage} alt={returnItem.product_name} />
                          <div className="return-item-info">
                            <div className="item-name">{returnItem.product_name}</div>
                            <div className="return-meta">
                              <span>Order #{returnItem.order_number}</span>
                              <span>Quantity: {returnItem.return_quantity}</span>
                              <span>Refund: ₹{formatINRAmount(returnItem.refund_amount || 0)}</span>
                            </div>
                            <div className="return-reason">
                              <strong>Reason:</strong> {returnItem.return_reason}
                            </div>
                            {returnItem.return_description && (
                              <div className="return-description">
                                <strong>Details:</strong> {returnItem.return_description.substring(0, 100)}{returnItem.return_description.length > 100 ? '...' : ''}
                              </div>
                            )}
                            <div style={{ marginTop: '10px', color: '#0066cc', fontSize: '13px', fontWeight: '500' }}>
                              Click to view full details →
                            </div>
                          </div>
                        </div>
                      </div>
                    );
                  })}
                </div>
              )}

              {eligibleItems.length > 0 && (
                <div className="available-returns" style={{ background: 'white', padding: '20px', borderRadius: '8px', boxShadow: '0 2px 4px rgba(0,0,0,0.1)' }}>
                  <h3 style={{ marginBottom: '20px', color: '#131921', fontSize: '18px', fontWeight: '500' }}>
                    Items Eligible for Return ({eligibleItems.length})
                  </h3>
                  <div className="eligible-orders">
                    {eligibleItems.map((item, index) => {
                      const order = orders.find(o => o.id === item.order_id);
                      
                      return (
                        <div key={`${item.order_id}-${item.id || index}`} className="eligible-item">
                          <div className="eligible-item-info">
                            {(() => {
                              const images = parseImageUrls(item.image_urls);
                              const mainImage = images[0] || 'https://via.placeholder.com/80x80?text=No+Image';
                              return <img src={mainImage} alt={item.name} />;
                            })()}
                            <div>
                              <div className="item-name">{item.name}</div>
                              <div className="item-meta">Order #{item.order_number} • {formatDate(item.order_date)}</div>
                              <div className="item-meta" style={{ marginTop: '5px' }}>
                                Quantity: {item.quantity} × ₹{formatINRAmount(item.price)} = ₹{formatINRAmount(item.price * item.quantity)}
                              </div>
                            </div>
                          </div>
                          <button
                            onClick={(e) => {
                              e.preventDefault();
                              e.stopPropagation();
                              console.log('Return Item button clicked for:', { order, item });
                              if (order) {
                                handleStartReturn(order, item);
                              } else {
                                console.error('Order not found for item:', item);
                                alert('Error: Unable to find order information. Please refresh the page.');
                              }
                            }}
                            className="return-item-btn"
                            type="button"
                          >
                            Return Item
                          </button>
                        </div>
                      );
                    })}
                  </div>
                </div>
              )}

              {returns.length === 0 && eligibleItems.length === 0 && (
                <div className="no-returns">
                  <div className="no-returns-icon">📦</div>
                  <h2>No return requests</h2>
                  <p>You haven't requested any returns yet. Items eligible for return will appear here.</p>
                </div>
              )}
            </>
          );
        })()}
      </div>
    </div>
  );
};

export default Returns;

