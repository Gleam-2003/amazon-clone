import React from 'react';
import './Footer.css';

const Footer = () => {
  const scrollToTop = () => {
    window.scrollTo({
      top: 0,
      behavior: 'smooth'
    });
  };

  return (
    <footer className="amazon-footer">
      {/* Back to top button */}
      <div className="footer-back-to-top" onClick={scrollToTop}>
        Back to top
      </div>

      {/* Main footer content */}
      <div className="footer-content">
        {/* Four main columns */}
        <div className="footer-columns">
          {/* Get to Know Us */}
          <div className="footer-column">
            <h3>Get to Know Us</h3>
            <ul>
              <li><a href="#about">About Amazon</a></li>
              <li><a href="#careers">Careers</a></li>
              <li><a href="#press">Press Releases</a></li>
              <li><a href="#science">Amazon Science</a></li>
            </ul>
          </div>

          {/* Connect with Us */}
          <div className="footer-column">
            <h3>Connect with Us</h3>
            <ul>
              <li><a href="#facebook">Facebook</a></li>
              <li><a href="#twitter">Twitter</a></li>
              <li><a href="#instagram">Instagram</a></li>
            </ul>
          </div>

          {/* Make Money with Us */}
          <div className="footer-column">
            <h3>Make Money with Us</h3>
            <ul>
              <li><a href="#sell">Sell on Amazon</a></li>
              <li><a href="#accelerator">Sell under Amazon Accelerator</a></li>
              <li><a href="#brand">Protect and Build Your Brand</a></li>
              <li><a href="#global">Amazon Global Selling</a></li>
              <li><a href="#supply">Supply to Amazon</a></li>
              <li><a href="#affiliate">Become an Affiliate</a></li>
              <li><a href="#fba">Fulfilment by Amazon</a></li>
              <li><a href="#advertise">Advertise Your Products</a></li>
              <li><a href="#merchants">Amazon Pay on Merchants</a></li>
            </ul>
          </div>

          {/* Let Us Help You */}
          <div className="footer-column">
            <h3>Let Us Help You</h3>
            <ul>
              <li><a href="#account">Your Account</a></li>
              <li><a href="/returns">Returns Centre</a></li>
              <li><a href="#recalls">Recalls and Product Safety Alerts</a></li>
              <li><a href="#protection">100% Purchase Protection</a></li>
              <li><a href="#app">Amazon App Download</a></li>
              <li><a href="#help">Help</a></li>
            </ul>
          </div>
        </div>

        {/* Amazon Logo and Language/Country Selectors */}
        <div className="footer-logo-section">
          <div className="footer-logo">
            <span className="amazon-logo-text">amazon.in</span>
          </div>
          <div className="footer-selectors">
            <div className="footer-selector">
              <span className="globe-icon">🌐</span>
              <span>English</span>
              <span className="arrow-down">▼</span>
            </div>
            <div className="footer-selector">
              <span className="flag-icon">🇮🇳</span>
              <span>India</span>
              <span className="arrow-down">▼</span>
            </div>
          </div>
        </div>

        {/* Amazon Affiliated Services */}
        <div className="footer-services">
          <div className="footer-service">
            <div className="service-title">AbeBooks</div>
            <div className="service-desc">Books, art & collectibles</div>
          </div>
          <div className="footer-service">
            <div className="service-title">Amazon Web Services</div>
            <div className="service-desc">Scalable Cloud Computing Services</div>
          </div>
          <div className="footer-service">
            <div className="service-title">Audible</div>
            <div className="service-desc">Download Audio Books</div>
          </div>
          <div className="footer-service">
            <div className="service-title">IMDb</div>
            <div className="service-desc">Movies, TV & Celebrities</div>
          </div>
          <div className="footer-service">
            <div className="service-title">Shopbop</div>
            <div className="service-desc">Designer Fashion Brands</div>
          </div>
          <div className="footer-service">
            <div className="service-title">Amazon Business</div>
            <div className="service-desc">Everything For Your Business</div>
          </div>
          <div className="footer-service">
            <div className="service-title">Amazon Prime Music</div>
            <div className="service-desc">100 million songs, ad-free<br />Over 15 million podcast episodes</div>
          </div>
        </div>
      </div>

      {/* Footer Bottom */}
      <div className="footer-bottom">
        <div className="footer-bottom-links">
          <a href="#conditions">Conditions of Use & Sale</a>
          <a href="#privacy">Privacy Notice</a>
          <a href="#interest">Interest-Based Ads</a>
        </div>
        <div className="footer-copyright">
          © 1996-{new Date().getFullYear()}, Amazon.com, Inc. or its affiliates
        </div>
      </div>
    </footer>
  );
};

export default Footer;

