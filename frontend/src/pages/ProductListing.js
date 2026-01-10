import React, { useState, useEffect } from 'react';
import { useSearchParams } from 'react-router-dom';
import ProductCard from '../components/ProductCard';
import { getProducts, getCategories } from '../api/api';
import './ProductListing.css';

const ProductListing = () => {
  const [searchParams, setSearchParams] = useSearchParams();
  const [products, setProducts] = useState([]);
  const [categories, setCategories] = useState([]);
  const [loading, setLoading] = useState(true);
  const [selectedCategory, setSelectedCategory] = useState(searchParams.get('category') || '');
  const [searchQuery, setSearchQuery] = useState(searchParams.get('search') || '');
  const [bannerIndex, setBannerIndex] = useState(0);

  useEffect(() => {
    fetchCategories();
  }, []);

  useEffect(() => {
    const category = searchParams.get('category') || '';
    const search = searchParams.get('search') || '';
    setSelectedCategory(category);
    setSearchQuery(search);
    window.scrollTo(0, 0);
  }, [searchParams]);

  const fetchCategories = async () => {
    try {
      const response = await getCategories();
      setCategories(response.data);
    } catch (error) {
      console.error('Error fetching categories:', error);
    }
  };

  const fetchProducts = async () => {
    setLoading(true);
    try {
      const response = await getProducts(searchQuery, selectedCategory);
      setProducts(response.data);
    } catch (error) {
      console.error('Error fetching products:', error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    if (categories.length > 0 || !selectedCategory) {
      fetchProducts();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selectedCategory, searchQuery, categories.length]);

  const clearFilters = () => {
    setSelectedCategory('');
    setSearchQuery('');
    setSearchParams({});
  };

  const promotionalBanners = [
    {
      id: 1,
      title: "Get set & fly to Dubai",
      price: "Starting ₹7,599*",
      offer: "Extra 5% unlimited cashback*",
      offerSubtext: "with Amazon Pay ICICI Bank credit card",
      backgroundImage: "https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=1200&h=400&fit=crop",
      backgroundColor: "#FFD814"
    },
    {
      id: 2,
      title: "Great Indian Festival",
      price: "Up to 70% OFF",
      offer: "Best deals on Electronics",
      offerSubtext: "Shop now and save more",
      backgroundImage: "https://images.unsplash.com/photo-1607083206869-4c7672e72a8a?w=1200&h=400&fit=crop",
      backgroundColor: "#FF9900"
    },
    {
      id: 3,
      title: "Flash Sale - Today Only",
      price: "Up to 60% OFF",
      offer: "Limited time offers",
      offerSubtext: "Hurry up! Don't miss out",
      backgroundImage: "https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=1200&h=400&fit=crop",
      backgroundColor: "#E8F5E9"
    }
  ];

  const handleBannerPrevious = () => {
    setBannerIndex((prev) => (prev === 0 ? promotionalBanners.length - 1 : prev - 1));
  };

  const handleBannerNext = () => {
    setBannerIndex((prev) => (prev === promotionalBanners.length - 1 ? 0 : prev + 1));
  };

  useEffect(() => {
    if (!selectedCategory && !searchQuery) {
      const interval = setInterval(() => {
        setBannerIndex((prev) => (prev === promotionalBanners.length - 1 ? 0 : prev + 1));
      }, 5000);
      return () => clearInterval(interval);
    } else {
      setBannerIndex(0);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selectedCategory, searchQuery]);

  const currentBanner = promotionalBanners[bannerIndex];

  return (
    <div className="product-listing">
      {!selectedCategory && !searchQuery && (
        <div className="promotional-banner-container">
          <div className="promotional-banner" style={{ backgroundColor: currentBanner.backgroundColor }}>
            <button className="banner-nav-button banner-nav-left" onClick={handleBannerPrevious} aria-label="Previous banner">
              ‹
            </button>
            
            <div className="banner-content">
              <div className="banner-left">
                <div className="banner-title">{currentBanner.title}</div>
                <div className="banner-price">{currentBanner.price}</div>
                
                <div className="banner-offer-section">
                  <div className="amazon-pay-logo">
                    <span className="amazon-pay-text">amazon pay</span>
                  </div>
                  <div className="banner-offer">
                    <div className="offer-text">{currentBanner.offer}</div>
                    <div className="offer-subtext">{currentBanner.offerSubtext}</div>
                  </div>
                  </div>
                
                <div className="credit-card-visual">
                  <div className="card-chip">⚫</div>
                  <div className="card-number">**** **** **** 1234</div>
                  <div className="card-holder">ROHIT SHARMA</div>
                  <div className="card-brand">VISA</div>
                </div>
                
                <div className="banner-tnc">*T&C apply</div>
              </div>
              
              <div className="banner-right">
                <img src={currentBanner.backgroundImage} alt={currentBanner.title} className="banner-image" />
              </div>
            </div>
            
            <button className="banner-nav-button banner-nav-right" onClick={handleBannerNext} aria-label="Next banner">
              ›
              </button>
            
            <div className="banner-indicators">
              {promotionalBanners.map((_, index) => (
                <button
                  key={index}
                  className={`banner-indicator ${index === bannerIndex ? 'active' : ''}`}
                  onClick={() => setBannerIndex(index)}
                  aria-label={`Go to banner ${index + 1}`}
                />
              ))}
            </div>
          </div>
        </div>
      )}

      <div className="listing-container">
        <div className="products-section">
          {(searchQuery || selectedCategory) && (
            <div className="search-results-header">
              {searchQuery && <h2>Search Results for "{searchQuery}"</h2>}
              {selectedCategory && !searchQuery && (
                <h2>{categories.find(c => c.id === selectedCategory)?.name || 'Products'}</h2>
              )}
              {selectedCategory && (
                <span className="filter-badge">
                  Category: {categories.find(c => c.id === selectedCategory)?.name}
                </span>
              )}
            </div>
          )}
          
          {loading ? (
            <div className="loading">Loading products...</div>
          ) : products.length === 0 ? (
            <div className="no-products">
              <p>No products found.</p>
              <button onClick={clearFilters} className="clear-filters-btn">
                Clear Filters
              </button>
            </div>
          ) : (
            <>
              <div className="results-count">
                {products.length} {products.length === 1 ? 'product' : 'products'} found
              </div>
              <div className="products-grid">
                {products.map((product) => (
                  <ProductCard key={product.id} product={product} />
                ))}
              </div>
            </>
          )}
        </div>
      </div>
    </div>
  );
};

export default ProductListing;

