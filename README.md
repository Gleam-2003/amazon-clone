# Amazon Clone - E-Commerce Platform

A full-stack e-commerce web application that replicates Amazon's design and user experience. Built with React.js, Node.js, Express.js, and MySQL.

## 🚀 Features

### Core Features (Implemented)
- ✅ **Product Listing Page** - Grid layout with search and category filters
- ✅ **Product Detail Page** - Image carousel, descriptions, specifications, and buy options
- ✅ **Shopping Cart** - View, update quantities, and remove items
- ✅ **Order Placement** - Complete checkout flow with order confirmation
- ✅ **Responsive Design** - Works on mobile, tablet, and desktop
- ✅ **Amazon-like UI** - Closely matches Amazon's design patterns

### Technical Features
- Single Page Application (SPA) with React Router
- RESTful API with Express.js
- MySQL database with well-structured schema
- Real-time cart updates
- Order management system

## 📋 Tech Stack

- **Frontend:** React.js 18.2.0, React Router DOM 6.20.0, Axios
- **Backend:** Node.js, Express.js 4.18.2
- **Database:** MySQL
- **Styling:** CSS3 (Amazon-inspired design)

## 🗄️ Database Schema

The database includes the following tables:

- **categories** - Product categories
- **products** - Product information with images and specifications
- **cart** - Shopping cart items (default user_id = 1)
- **orders** - Order records with shipping addresses
- **order_items** - Individual items in each order

## 📦 Installation & Setup

### Prerequisites
- Node.js (v14 or higher)
- MySQL (v8.0 or higher)
- npm or yarn

### Step 1: Clone the Repository
```bash
git clone <repository-url>
cd "Amazon Clone"
```

### Step 2: Database Setup

1. **Create MySQL Database:**
   ```bash
   mysql -u root -p
   ```

2. **Run the Schema:**
   ```bash
   mysql -u root -p < backend/database/schema.sql
   ```

3. **Seed the Database:**
   ```bash
   mysql -u root -p < backend/database/seed.sql
   ```

### Step 3: Backend Setup

1. **Navigate to backend directory:**
   ```bash
   cd backend
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Create `.env` file:**
   ```bash
   cp .env.example .env
   ```

4. **Update `.env` with your database credentials:**
   ```env
   DB_HOST=localhost
   DB_USER=root
   DB_PASSWORD=your_password
   DB_NAME=amazon_clone
   PORT=5000
   ```

5. **Start the backend server:**
   ```bash
   npm start
   # or for development with auto-reload:
   npm run dev
   ```

   The backend server will run on `http://localhost:5000`

### Step 4: Frontend Setup

1. **Open a new terminal and navigate to frontend directory:**
   ```bash
   cd frontend
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Create `.env` file (optional, if backend is not on localhost:5000):**
   ```env
   REACT_APP_API_URL=http://localhost:5000/api
   ```

4. **Start the React development server:**
   ```bash
   npm start
   ```

   The frontend will run on `http://localhost:3000`

## 🎯 Usage

1. **Browse Products:** Visit the home page to see all products
2. **Search:** Use the search bar to find products by name
3. **Filter:** Click on categories in the sidebar to filter products
4. **View Details:** Click on any product to see full details
5. **Add to Cart:** Click "Add to Cart" or "Buy Now" on product pages
6. **Manage Cart:** View cart, update quantities, or remove items
7. **Checkout:** Fill in shipping address and place order
8. **Order Confirmation:** View order details and confirmation

## 📁 Project Structure

```
Amazon Clone/
├── backend/
│   ├── config/
│   │   └── database.js          # MySQL connection configuration
│   ├── database/
│   │   ├── schema.sql           # Database schema
│   │   └── seed.sql             # Sample data
│   ├── routes/
│   │   ├── products.js          # Product API routes
│   │   ├── categories.js        # Category API routes
│   │   ├── cart.js              # Cart API routes
│   │   └── orders.js            # Order API routes
│   ├── .env.example             # Environment variables template
│   ├── package.json
│   └── server.js                # Express server entry point
│
├── frontend/
│   ├── public/
│   │   └── index.html
│   ├── src/
│   │   ├── api/
│   │   │   └── api.js           # API service functions
│   │   ├── components/
│   │   │   ├── Header.js        # Navigation header
│   │   │   ├── Header.css
│   │   │   ├── ProductCard.js   # Product card component
│   │   │   └── ProductCard.css
│   │   ├── pages/
│   │   │   ├── ProductListing.js    # Home/Product listing page
│   │   │   ├── ProductListing.css
│   │   │   ├── ProductDetail.js     # Product detail page
│   │   │   ├── ProductDetail.css
│   │   │   ├── Cart.js              # Shopping cart page
│   │   │   ├── Cart.css
│   │   │   ├── Checkout.js          # Checkout page
│   │   │   ├── Checkout.css
│   │   │   ├── OrderConfirmation.js # Order confirmation page
│   │   │   └── OrderConfirmation.css
│   │   ├── App.js
│   │   ├── App.css
│   │   ├── index.js
│   │   └── index.css
│   ├── package.json
│   └── .gitignore
│
└── README.md
```

## 🔌 API Endpoints

### Products
- `GET /api/products` - Get all products (with optional `?search=` and `?category=` query params)
- `GET /api/products/:id` - Get single product by ID

### Categories
- `GET /api/categories` - Get all categories

### Cart
- `GET /api/cart` - Get cart items for default user
- `POST /api/cart` - Add item to cart (body: `{product_id, quantity}`)
- `PUT /api/cart/:id` - Update cart item quantity (body: `{quantity}`)
- `DELETE /api/cart/:id` - Remove item from cart
- `DELETE /api/cart` - Clear entire cart

### Orders
- `GET /api/orders` - Get all orders for default user
- `GET /api/orders/:id` - Get single order by ID
- `POST /api/orders` - Create new order (body: `{shipping_address, cart_items}`)

## 🎨 Design Features

- **Amazon-inspired Color Scheme:**
  - Header: Dark blue (#131921)
  - Accent: Orange (#ff9900, #ffa41c)
  - Background: Light gray (#eaeded)
  - Text: Dark (#0f1111)

- **Responsive Layout:**
  - Desktop: Full grid layout with sidebar
  - Tablet: Adjusted grid columns
  - Mobile: Single column, stacked layout

- **UI Components:**
  - Sticky header with search
  - Product cards with hover effects
  - Image carousel on product detail page
  - Shopping cart with quantity controls
  - Form validation on checkout

## 🔧 Configuration

### Backend Environment Variables
- `DB_HOST` - MySQL host (default: localhost)
- `DB_USER` - MySQL username (default: root)
- `DB_PASSWORD` - MySQL password
- `DB_NAME` - Database name (default: amazon_clone)
- `PORT` - Server port (default: 5000)

### Frontend Environment Variables
- `REACT_APP_API_URL` - Backend API URL (default: http://localhost:5000/api)

## 📝 Assumptions

1. **Default User:** The application assumes a default user with `user_id = 1` is always logged in. No authentication system is implemented as per requirements.

2. **Tax Calculation:** A flat 10% tax is applied to all orders.

3. **Stock Management:** Stock is automatically decremented when orders are placed.

4. **Image URLs:** Product images use placeholder URLs from Unsplash. In production, these would be replaced with actual product images.

5. **Order Status:** All orders are created with "pending" status.

## 🚀 Deployment

### Quick Start
For a complete deployment guide, see:
- **[QUICK_DEPLOY.md](./QUICK_DEPLOY.md)** - Fast 5-minute deployment guide
- **[DEPLOYMENT_GUIDE.md](./DEPLOYMENT_GUIDE.md)** - Comprehensive deployment instructions
- **[DEPLOYMENT_CHECKLIST.md](./DEPLOYMENT_CHECKLIST.md)** - Step-by-step checklist

### Recommended Platform: Railway
**Railway is recommended** because it can host your frontend, backend, and MySQL database all in one place.

**Why Railway?**
- ✅ Native MySQL support (your project uses MySQL)
- ✅ Can host frontend, backend, and database together
- ✅ Simple deployment process
- ✅ Free tier with $5 credit monthly

### Quick Deployment Steps (Railway)
1. Push your code to GitHub
2. Create Railway account and new project
3. Add MySQL database service
4. Deploy backend service (set root directory to `backend`)
5. Deploy frontend service (set root directory to `frontend`)
6. Configure environment variables
7. Initialize database with `schema.sql`

See **[QUICK_DEPLOY.md](./QUICK_DEPLOY.md)** for detailed step-by-step instructions.

### Alternative Platforms
- **Render**: Good alternative, but uses PostgreSQL (would require migration)
- **Vercel**: Great for frontend, but not ideal for full-stack with MySQL

## 🐛 Troubleshooting

### Database Connection Issues
- Verify MySQL is running
- Check database credentials in `.env`
- Ensure database and tables are created

### CORS Errors
- Backend CORS is configured to allow all origins
- If issues persist, check backend server is running

### Port Conflicts
- Change backend port in `.env` if 5000 is in use
- Update frontend API URL if backend port changes

## 📄 License

This project is created for educational purposes as part of an SDE Intern assignment.

## 👨‍💻 Author

Built as a full-stack e-commerce platform assignment demonstrating:
- React.js SPA development
- RESTful API design
- Database schema design
- UI/UX implementation matching Amazon's design patterns

---

**Note:** This is a demonstration project. For production use, additional features like authentication, payment processing, email notifications, and enhanced security measures should be implemented.

