require("dotenv").config();
const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const db = require("./config/db");

const app = express();
const PORT = process.env.PORT;

// CORS configuration - MUST be before routes
const allowedOrigins = [
  process.env.FRONTEND_URL_VERCEL,
  process.env.FRONTEND_URL_RAILWAY,
  "http://localhost:3000"
].filter(Boolean); // Remove undefined values

app.use(cors({
  origin: allowedOrigins,
  methods: ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
  allowedHeaders: ["Content-Type", "Authorization"],
  credentials: true
}));

// Explicitly allow OPTIONS
app.options("*", cors());

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.get("/", (req, res) => {
  res.send("Backend running");
});

app.get("/health", (req, res) => {
  res.status(200).send("OK");
});

app.get('/api', (req, res) => {
  res.json({ 
    message: 'Amazon Clone API', 
    version: '1.0.0',
    endpoints: {
      products: '/api/products',
      cart: '/api/cart',
      orders: '/api/orders',
      returns: '/api/returns',
      categories: '/api/categories',
      health: '/health'
    }
  });
});

app.use('/api/products', require('./routes/products'));
app.use('/api/cart', require('./routes/cart'));
app.use('/api/orders', require('./routes/orders'));
app.use('/api/returns', require('./routes/returns'));
app.use('/api/categories', require('./routes/categories'));

app.get('/api/health', (req, res) => {
  res.status(200).send("OK");
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(`Server running on port ${PORT}`);
});

