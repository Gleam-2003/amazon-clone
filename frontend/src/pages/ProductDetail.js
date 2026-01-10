import React, { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { getProductById, addToCart } from '../api/api';
import { parseImageUrls, parseSpecifications } from '../utils/parseJson';
import { formatINRAmount } from '../utils/formatPrice';
import './ProductDetail.css';

const ProductDetail = () => {
  const { id } = useParams();
  const navigate = useNavigate();
  const [product, setProduct] = useState(null);
  const [loading, setLoading] = useState(true);
  const [selectedImageIndex, setSelectedImageIndex] = useState(0);
  const [quantity, setQuantity] = useState(1);
  const [addingToCart, setAddingToCart] = useState(false);

  const fetchProduct = async () => {
    try {
      setLoading(true);
      const response = await getProductById(id);
      if (response && response.data) {
        setProduct(response.data);
      } else {
        console.error('Invalid response from API:', response);
        setProduct(null);
      }
    } catch (error) {
      console.error('Error fetching product:', error);
      setProduct(null);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchProduct();
  }, [id]);

  const handleAddToCart = async () => {
    setAddingToCart(true);
    try {
      await addToCart(product.id, quantity);
      window.dispatchEvent(new Event('cartUpdated'));
      alert('Item added to cart!');
    } catch (error) {
      console.error('Error adding to cart:', error);
      alert('Failed to add item to cart');
    } finally {
      setAddingToCart(false);
    }
  };

  const handleBuyNow = async () => {
    setAddingToCart(true);
    try {
      await addToCart(product.id, quantity);
      window.dispatchEvent(new Event('cartUpdated'));
      navigate('/cart');
    } catch (error) {
      console.error('Error adding to cart:', error);
      alert('Failed to add item to cart');
    } finally {
      setAddingToCart(false);
    }
  };

  if (loading) {
    return <div className="product-detail-loading">Loading product...</div>;
  }

  if (!product) {
    return <div className="product-detail-error">Product not found</div>;
  }

  const images = parseImageUrls(product.image_urls);
  const specifications = parseSpecifications(product.specifications);

  return (
    <div className="product-detail">
      <div className="detail-container">
        <div className="product-images">
          <div className="main-image">
            <img
              src={images[selectedImageIndex] || 'https://via.placeholder.com/500x500?text=No+Image'}
              alt={product.name}
            />
          </div>
          {images.length > 1 && (
            <div className="image-thumbnails">
              {images.map((image, index) => (
                <img
                  key={index}
                  src={image}
                  alt={`${product.name} ${index + 1}`}
                  className={selectedImageIndex === index ? 'active' : ''}
                  onClick={() => setSelectedImageIndex(index)}
                />
              ))}
            </div>
          )}
        </div>

        <div className="product-info-detail">
          <h1 className="product-title">{product.name}</h1>
          
          <div className="product-rating-detail">
            <span className="stars">★★★★★</span>
            <span className="rating-link">(123 customer reviews)</span>
          </div>

          <div className="product-price-detail">
            <span className="price-symbol">₹</span>
            <span className="price-amount">{formatINRAmount(product.price)}</span>
          </div>

          <div className="product-description">
            <h3>About this item</h3>
            <p>{product.description || 'No description available.'}</p>
          </div>

          {Object.keys(specifications).length > 0 && (
            <div className="product-specifications">
              <h3>Specifications</h3>
              <table>
                <tbody>
                  {Object.entries(specifications).map(([key, value]) => (
                    <tr key={key}>
                      <td className="spec-label">{key}:</td>
                      <td className="spec-value">{value}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}

          <div className="product-availability">
            {product.stock > 0 ? (
              <span className="in-stock">✓ In Stock ({product.stock} available)</span>
            ) : (
              <span className="out-of-stock">✗ Out of Stock</span>
            )}
          </div>

          <div className="quantity-selector">
            <label>Quantity:</label>
            <select
              value={quantity}
              onChange={(e) => setQuantity(parseInt(e.target.value))}
              disabled={product.stock === 0}
            >
              {[...Array(Math.min(product.stock, 10))].map((_, i) => (
                <option key={i + 1} value={i + 1}>
                  {i + 1}
                </option>
              ))}
            </select>
          </div>

          <div className="product-actions">
            <button
              className="btn-add-to-cart"
              onClick={handleAddToCart}
              disabled={product.stock === 0 || addingToCart}
            >
              {addingToCart ? 'Adding...' : 'Add to Cart'}
            </button>
            <button
              className="btn-buy-now"
              onClick={handleBuyNow}
              disabled={product.stock === 0 || addingToCart}
            >
              Buy Now
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ProductDetail;

