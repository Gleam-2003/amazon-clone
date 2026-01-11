import axios from 'axios';

const API_BASE = process.env.REACT_APP_API_BASE || 'http://localhost:5000';
const API_BASE_URL = `${API_BASE}/api`;

const api = axios.create({
  baseURL: API_BASE_URL,
  headers: {
    'Content-Type': 'application/json',
  },
});

export const getProducts = (search = '', category = '') => {
  const params = {};
  if (search) params.search = search;
  if (category) params.category = category;
  return api.get('/products', { params });
};

export const getProductById = (id) => {
  return api.get(`/products/${id}`);
};

export const getCategories = () => {
  return api.get('/categories');
};

export const getCart = () => {
  return api.get('/cart');
};

export const addToCart = (productId, quantity = 1) => {
  return api.post('/cart', { product_id: productId, quantity });
};

export const updateCartItem = (cartId, quantity) => {
  return api.put(`/cart/${cartId}`, { quantity });
};

export const removeFromCart = (cartId) => {
  return api.delete(`/cart/${cartId}`);
};

export const getOrders = () => {
  return api.get('/orders');
};

export const createOrder = (shippingAddress, cartItems) => {
  return api.post('/orders', {
    shipping_address: shippingAddress,
    cart_items: cartItems,
  });
};

export const getOrderById = (orderId) => {
  return api.get(`/orders/${orderId}`);
};

export const getReturns = () => {
  return api.get('/returns');
};

export const getReturnById = (returnId) => {
  return api.get(`/returns/${returnId}`);
};

export const createReturn = (orderId, orderItemId, returnReason, returnQuantity, returnDescription) => {
  return api.post('/returns', {
    order_id: orderId,
    order_item_id: orderItemId,
    return_reason: returnReason,
    return_quantity: returnQuantity,
    return_description: returnDescription,
  });
};

export default api;

