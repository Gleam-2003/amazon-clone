require("dotenv").config();
const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const db = require("./config/db");

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
// CORS configuration - allow frontend URL from environment or default to allow all in development
// const allowedOrigins = process.env.FRONTEND_URL 
//   ? [process.env.FRONTEND_URL, 'http://localhost:3000']
//   : ['http://localhost:3000'];

// const corsOptions = {
//   origin: function (origin, callback) {
//     // Allow requests with no origin (like mobile apps or curl requests)
//     if (!origin) return callback(null, true);
//     if (allowedOrigins.indexOf(origin) !== -1 || process.env.NODE_ENV !== 'production') {
//       callback(null, true);
//     } else {
//       callback(new Error('Not allowed by CORS'));
//     }
//   },
//   credentials: true,
// };

app.use(cors({
  origin: '*',
}));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Test route
app.get("/", (req, res) => {
  res.send("Backend running");
});

// Routes
app.use('/api/products', require('./routes/products'));
app.use('/api/cart', require('./routes/cart'));
app.use('/api/orders', require('./routes/orders'));
app.use('/api/returns', require('./routes/returns'));
app.use('/api/categories', require('./routes/categories'));

// Health check
app.get('/api/health', (req, res) => {
  res.json({ status: 'OK', message: 'Server is running' });
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});

