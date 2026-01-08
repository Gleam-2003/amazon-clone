import React from 'react';
import { Link } from 'react-router-dom';
import { parseImageUrls } from '../utils/parseJson';
import { formatINRAmount } from '../utils/formatPrice';
import './ProductCard.css';

const ProductCard = ({ product }) => {
  const images = parseImageUrls(product.image_urls);
  const mainImage = images[0] || 'https://via.placeholder.com/300x300?text=No+Image';

  return (
    <Link to={`/product/${product.id}`} className="product-card">
      <div className="product-image-container">
        <img src={mainImage} alt={product.name} className="product-image" />
      </div>
      <div className="product-info">
        <h3 className="product-name">{product.name}</h3>
        <div className="product-rating">
          <span className="stars">★★★★★</span>
          <span className="rating-count">(123)</span>
        </div>
        <div className="product-price">
          <span className="price-symbol">₹</span>
          <span className="price-amount">{formatINRAmount(product.price)}</span>
        </div>
        {product.stock > 0 ? (
          <span className="product-stock">In Stock</span>
        ) : (
          <span className="product-stock out-of-stock">Out of Stock</span>
        )}
      </div>
    </Link>
  );
};

export default ProductCard;

