import React, { useState, useEffect } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { getCart, getCategories } from '../api/api';
import amazonLogo from '../assets/amazon-logo.png';
import './Header.css';

const Header = () => {
  const [searchQuery, setSearchQuery] = useState('');
  const [cartCount, setCartCount] = useState(0);
  const [showAllMenu, setShowAllMenu] = useState(false);
  const [categories, setCategories] = useState([]);
  const [showLocationModal, setShowLocationModal] = useState(false);
  const [location, setLocation] = useState({
    address: 'Mokokchūng 798601',
    pincode: '798601'
  });
  const [manualAddress, setManualAddress] = useState({
    address: '',
    pincode: '',
    city: '',
    state: ''
  });
  const [isLoadingLocation, setIsLoadingLocation] = useState(false);
  const [locationError, setLocationError] = useState('');
  const navigate = useNavigate();

  useEffect(() => {
    fetchCartCount();
    fetchCategories();
    
    // Load saved location from localStorage
    const savedLocation = localStorage.getItem('deliveryLocation');
    if (savedLocation) {
      try {
        setLocation(JSON.parse(savedLocation));
      } catch (e) {
        console.error('Error parsing saved location:', e);
      }
    }
    
    // Listen for cart updates
    const handleCartUpdate = () => {
      fetchCartCount();
    };
    
    window.addEventListener('cartUpdated', handleCartUpdate);
    
    return () => {
      window.removeEventListener('cartUpdated', handleCartUpdate);
    };
  }, []);

  const fetchCategories = async () => {
    try {
      const response = await getCategories();
      setCategories(response.data);
    } catch (error) {
      console.error('Error fetching categories:', error);
    }
  };

  const fetchCartCount = async () => {
    try {
      const response = await getCart();
      const totalItems = response.data.reduce((sum, item) => sum + item.quantity, 0);
      setCartCount(totalItems);
    } catch (error) {
      console.error('Error fetching cart:', error);
    }
  };

  const handleSearch = (e) => {
    e.preventDefault();
    if (searchQuery.trim()) {
      navigate(`/?search=${encodeURIComponent(searchQuery.trim())}`);
    }
  };

  const getCurrentLocation = () => {
    setIsLoadingLocation(true);
    setLocationError('');
    
    if (!navigator.geolocation) {
      setLocationError('Geolocation is not supported by your browser. Please enter your address manually.');
      setIsLoadingLocation(false);
      return;
    }

    navigator.geolocation.getCurrentPosition(
      async (position) => {
        const { latitude, longitude } = position.coords;
        try {
          // Reverse geocoding using a free API (Nominatim)
          const response = await fetch(
            `https://nominatim.openstreetmap.org/reverse?format=json&lat=${latitude}&lon=${longitude}&zoom=18&addressdetails=1`,
            {
              headers: {
                'User-Agent': 'AmazonClone/1.0'
              }
            }
          );
          
          if (!response.ok) {
            throw new Error('Failed to fetch address');
          }
          
          const data = await response.json();
          
          if (data && data.address) {
            const addr = data.address;
            const addressParts = [];
            if (addr.road) addressParts.push(addr.road);
            if (addr.suburb) addressParts.push(addr.suburb);
            if (addr.city || addr.town || addr.village) {
              addressParts.push(addr.city || addr.town || addr.village);
            }
            
            const newLocation = {
              address: addressParts.join(', ') || 'Current Location',
              pincode: addr.postcode || '',
              city: addr.city || addr.town || addr.village || '',
              state: addr.state || '',
              coordinates: { lat: latitude, lng: longitude }
            };
            
            setLocation(newLocation);
            localStorage.setItem('deliveryLocation', JSON.stringify(newLocation));
            setShowLocationModal(false);
            setLocationError('');
          } else {
            setLocationError('Could not determine address from location. Please enter manually.');
          }
        } catch (error) {
          console.error('Error fetching address:', error);
          setLocationError('Could not fetch address. Please enter your address manually below.');
        } finally {
          setIsLoadingLocation(false);
        }
      },
      (error) => {
        console.error('Error getting location:', error);
        let errorMessage = 'Could not get your location. ';
        
        switch(error.code) {
          case error.PERMISSION_DENIED:
            errorMessage += 'Location access was denied. Please enter your address manually.';
            break;
          case error.POSITION_UNAVAILABLE:
            errorMessage += 'Location information is unavailable. Please enter manually.';
            break;
          case error.TIMEOUT:
            errorMessage += 'Location request timed out. Please enter manually.';
            break;
          default:
            errorMessage += 'Please enter your address manually.';
            break;
        }
        
        setLocationError(errorMessage);
        setIsLoadingLocation(false);
      },
      {
        enableHighAccuracy: true,
        timeout: 15000,
        maximumAge: 0
      }
    );
  };

  const handleManualAddressSubmit = (e) => {
    e.preventDefault();
    if (!manualAddress.address.trim() || !manualAddress.pincode.trim()) {
      alert('Please enter address and pincode');
      return;
    }

    const newLocation = {
      address: `${manualAddress.address}, ${manualAddress.city || ''} ${manualAddress.state || ''}`.trim(),
      pincode: manualAddress.pincode,
      city: manualAddress.city,
      state: manualAddress.state
    };

    setLocation(newLocation);
    localStorage.setItem('deliveryLocation', JSON.stringify(newLocation));
    setManualAddress({ address: '', pincode: '', city: '', state: '' });
    setShowLocationModal(false);
  };

  return (
    <header className="header">
      {/* Top Header Section */}
      <div className="header-top">
        <div className="header-top-container">
          {/* Left: Logo and Location */}
          <div className="header-left">
            <Link to="/" className="header-logo">
              <img 
                src={amazonLogo} 
                alt="Amazon.in" 
                className="amazon-logo-img"
              />
            </Link>
            <div 
              className="header-location"
              onClick={() => {
                setShowLocationModal(true);
                setLocationError('');
              }}
            >
              <span className="location-icon">📍</span>
              <div className="location-text">
                <span className="location-deliver">Delivering to</span>
                <span className="location-place">{location.address}</span>
              </div>
            </div>
          </div>

          {/* Middle: Search Bar */}
          <form className="header-search" onSubmit={handleSearch}>
            <select className="search-dropdown">
              <option>All</option>
            </select>
            <input
              type="text"
              className="search-input"
              placeholder="Search Amazon.in"
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
            />
            <button type="submit" className="search-button">
              <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                <circle cx="11" cy="11" r="8"></circle>
                <path d="m21 21-4.35-4.35"></path>
              </svg>
            </button>
          </form>

          {/* Right: Language, Orders, Cart */}
          <div className="header-right">
            <div className="header-language">
              <span className="flag-icon">🇮🇳</span>
              <span>EN</span>
              <span className="dropdown-arrow">▼</span>
            </div>
            <Link to="/orders" className="header-returns">
              <span className="returns-text">Returns</span>
              <span className="orders-text">& Orders</span>
            </Link>
            <Link to="/cart" className="header-cart">
              <div className="cart-icon-wrapper">
                <svg 
                  className="cart-icon"
                  viewBox="0 0 48 32" 
                  fill="white"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  {/* Shopping Cart Handle */}
                  <path 
                    d="M12 8L10 0H2C0.9 0 0 0.9 0 2C0 3.1 0.9 4 2 4H9C9.6 4 10 4.4 10 5L11 8" 
                    stroke="white" 
                    strokeWidth="2.5" 
                    strokeLinecap="round" 
                    strokeLinejoin="round"
                    fill="none"
                  />
                  {/* Shopping Cart Basket */}
                  <path 
                    d="M2 8H12L15 24H44L47 8H15" 
                    stroke="white" 
                    strokeWidth="2.5" 
                    strokeLinecap="round" 
                    strokeLinejoin="round"
                    fill="none"
                  />
                  {/* Basket Bottom */}
                  <path 
                    d="M15 24H44L45 20H14" 
                    stroke="white" 
                    strokeWidth="2.5" 
                    strokeLinecap="round" 
                    strokeLinejoin="round"
                    fill="none"
                  />
                  {/* Left Wheel */}
                  <circle 
                    cx="16" 
                    cy="28" 
                    r="3" 
                    fill="white"
                  />
                  {/* Right Wheel */}
                  <circle 
                    cx="42" 
                    cy="28" 
                    r="3" 
                    fill="white"
                  />
                </svg>
                {cartCount > 0 && <span className="cart-badge">{cartCount > 99 ? '99+' : cartCount}</span>}
              </div>
              <span className="cart-label">Cart</span>
            </Link>
          </div>
        </div>
      </div>

      {/* Bottom Navigation Bar */}
      <div className="header-nav">
        <div className="nav-container">
          <div 
            className="nav-all" 
            onMouseEnter={() => setShowAllMenu(true)}
            onMouseLeave={() => setShowAllMenu(false)}
          >
            <span className="nav-hamburger">☰</span>
            <span>All</span>
            {showAllMenu && (
              <div className="all-menu-dropdown">
                <div className="all-menu-header">Shop by Category</div>
                <Link 
                  to="/" 
                  className="all-menu-item"
                  onClick={() => setShowAllMenu(false)}
                >
                  All Categories
                </Link>
                {categories.map((category) => (
                  <Link
                    key={category.id}
                    to={`/?category=${category.id}`}
                    className="all-menu-item"
                    onClick={() => setShowAllMenu(false)}
                  >
                    {category.name}
                  </Link>
                ))}
              </div>
            )}
          </div>
          <Link to="/?category=1" className="nav-link">Electronics</Link>
          <Link to="/?category=2" className="nav-link">Books</Link>
          <Link to="/?category=3" className="nav-link">Clothing</Link>
          <Link to="/?category=4" className="nav-link">Home & Kitchen</Link>
          <Link to="/?category=5" className="nav-link">Sports & Outdoors</Link>
          <Link to="/?category=6" className="nav-link">Toys & Games</Link>
          <Link to="/?category=7" className="nav-link">Beauty & Personal Care</Link>
          <Link to="/?category=8" className="nav-link">Automotive</Link>
          <Link to="/" className="nav-link">Today's Deals</Link>
          <div className="nav-link non-clickable">Customer Service</div>
          <div className="nav-link non-clickable">New Releases</div>
        </div>
      </div>

      {/* Location Modal */}
      {showLocationModal && (
        <div className="location-modal-overlay" onClick={() => setShowLocationModal(false)}>
          <div className="location-modal" onClick={(e) => e.stopPropagation()}>
            <div className="location-modal-header">
              <h3>Choose your location</h3>
              <button 
                className="location-modal-close"
                onClick={() => setShowLocationModal(false)}
              >
                ×
              </button>
            </div>
            
            <div className="location-modal-content">
              <div className="location-option">
                <button 
                  className="location-btn location-btn-auto"
                  onClick={getCurrentLocation}
                  disabled={isLoadingLocation}
                >
                  <span className="location-btn-icon">📍</span>
                  {isLoadingLocation ? 'Getting location...' : 'Use current location'}
                </button>
                {locationError && (
                  <div className="location-error">
                    {locationError}
                  </div>
                )}
              </div>

              <div className="location-divider">
                <span>OR</span>
              </div>

              <form className="location-form" onSubmit={handleManualAddressSubmit}>
                <div className="form-group">
                  <label>Enter Pincode</label>
                  <input
                    type="text"
                    placeholder="Enter pincode"
                    value={manualAddress.pincode}
                    onChange={(e) => setManualAddress({...manualAddress, pincode: e.target.value})}
                    maxLength="6"
                    pattern="[0-9]{6}"
                    required
                  />
                </div>

                <div className="form-group">
                  <label>Enter Address</label>
                  <textarea
                    placeholder="Enter your full address"
                    value={manualAddress.address}
                    onChange={(e) => setManualAddress({...manualAddress, address: e.target.value})}
                    rows="3"
                    required
                  />
                </div>

                <div className="form-row">
                  <div className="form-group">
                    <label>City</label>
                    <input
                      type="text"
                      placeholder="City"
                      value={manualAddress.city}
                      onChange={(e) => setManualAddress({...manualAddress, city: e.target.value})}
                    />
                  </div>

                  <div className="form-group">
                    <label>State</label>
                    <input
                      type="text"
                      placeholder="State"
                      value={manualAddress.state}
                      onChange={(e) => setManualAddress({...manualAddress, state: e.target.value})}
                    />
                  </div>
                </div>

                <button type="submit" className="location-btn location-btn-submit">
                  Apply
                </button>
              </form>
            </div>
          </div>
        </div>
      )}
    </header>
  );
};

export default Header;

