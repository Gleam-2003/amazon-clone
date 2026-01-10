# Amazon Clone - E-Commerce Platform

A full-stack e-commerce web application that replicates Amazon's design and user experience. Built with React.js, Node.js, Express.js, and MySQL.

## Features

- Product listing with search and category filters
- Product detail pages with image carousel
- Shopping cart management
- Order placement and checkout
- Order history
- Returns management
- Responsive design
- Amazon-inspired UI

## Tech Stack

- **Frontend:** React.js, React Router, Axios
- **Backend:** Node.js, Express.js
- **Database:** MySQL
- **Styling:** CSS3

## Installation & Setup

### Prerequisites
- Node.js (v14 or higher)
- MySQL (v8.0 or higher)

### Database Setup

```bash
mysql -u root -p < backend/database/schema.sql
mysql -u root -p < backend/database/seed_products.sql
```

### Backend Setup

```bash
cd backend
npm install
```

Create `.env` file:
```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=amazon_clone
PORT=5000
```

Start server:
```bash
npm start
```

### Frontend Setup

```bash
cd frontend
npm install
npm start
```

## Project Structure

```
Amazon Clone/
├── backend/
│   ├── config/
│   │   └── db.js
│   ├── database/
│   │   ├── migrations/
│   │   │   ├── add_order_status.sql
│   │   │   ├── add_returns.sql
│   │   │   └── add_unique_product_name.sql
│   │   ├── schema.sql
│   │   ├── seed_products.sql
│   │   └── README.md
│   ├── routes/
│   │   ├── products.js
│   │   ├── categories.js
│   │   ├── cart.js
│   │   ├── orders.js
│   │   └── returns.js
│   ├── package.json
│   ├── package-lock.json
│   ├── railway.json
│   └── server.js
│
├── frontend/
│   ├── public/
│   │   └── index.html
│   ├── src/
│   │   ├── api/
│   │   │   └── api.js
│   │   ├── components/
│   │   │   ├── Header.js
│   │   │   ├── Header.css
│   │   │   ├── Footer.js
│   │   │   ├── Footer.css
│   │   │   ├── ProductCard.js
│   │   │   └── ProductCard.css
│   │   ├── pages/
│   │   │   ├── ProductListing.js
│   │   │   ├── ProductListing.css
│   │   │   ├── ProductDetail.js
│   │   │   ├── ProductDetail.css
│   │   │   ├── Cart.js
│   │   │   ├── Cart.css
│   │   │   ├── Checkout.js
│   │   │   ├── Checkout.css
│   │   │   ├── OrderConfirmation.js
│   │   │   ├── OrderConfirmation.css
│   │   │   ├── OrderHistory.js
│   │   │   ├── OrderHistory.css
│   │   │   ├── Returns.js
│   │   │   └── Returns.css
│   │   ├── utils/
│   │   │   ├── formatPrice.js
│   │   │   └── parseJson.js
│   │   ├── assets/
│   │   │   └── amazon-logo.png
│   │   ├── App.js
│   │   ├── App.css
│   │   ├── index.js
│   │   └── index.css
│   ├── package.json
│   ├── package-lock.json
│   ├── railway.json
│   └── nixpacks.toml
│
├── setup-database.sh
├── setup.js
├── start.sh
├── railway.json
└── README.md
```

## API Endpoints

**Products**
- `GET /api/products` - Get all products
- `GET /api/products/:id` - Get product by ID

**Categories**
- `GET /api/categories` - Get all categories

**Cart**
- `GET /api/cart` - Get cart items
- `POST /api/cart` - Add item to cart
- `PUT /api/cart/:id` - Update cart item
- `DELETE /api/cart/:id` - Remove item from cart

**Orders**
- `GET /api/orders` - Get all orders
- `GET /api/orders/:id` - Get order by ID
- `POST /api/orders` - Create order

**Returns**
- `GET /api/returns` - Get all returns
- `GET /api/returns/:id` - Get return by ID
- `POST /api/returns` - Create return request

## Configuration

**Backend Environment Variables**
- `DB_HOST` - MySQL host
- `DB_USER` - MySQL username
- `DB_PASSWORD` - MySQL password
- `DB_NAME` - Database name
- `PORT` - Server port

**Frontend Environment Variables**
- `REACT_APP_API_URL` - Backend API URL

