const mysql = require("mysql2/promise");

// Support both Railway (MYSQL*) and local development (DB_*) environment variables
const db = mysql.createPool({
  host: process.env.MYSQLHOST || process.env.DB_HOST || 'localhost',
  user: process.env.MYSQLUSER || process.env.DB_USER || 'root',
  password: process.env.MYSQLPASSWORD || process.env.DB_PASSWORD || '',
  database: process.env.MYSQLDATABASE || process.env.DB_NAME || 'amazon_clone',
  port: process.env.MYSQLPORT || process.env.DB_PORT || 3306,
  waitForConnections: true,
  connectionLimit: 10,
});

// Test database connection (non-blocking)
(async () => {
  try {
    const conn = await db.getConnection();
    console.log("✅ MySQL Connected (Railway)");
    conn.release();
  } catch (err) {
    console.error("❌ MySQL Connection Failed:", err.message);
    // Don't exit - let the server start and handle connection errors at request time
  }
})();

module.exports = db;
