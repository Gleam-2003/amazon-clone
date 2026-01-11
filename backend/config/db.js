const mysql = require("mysql2/promise");

const db = mysql.createPool({
  host: process.env.DB_HOST,        // ✅ mysql.railway.internal
  user: process.env.DB_USER,        // ✅ root
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,    // ✅ railway
  port: 3306,
  waitForConnections: true,
  connectionLimit: 10,
});

(async () => {
  try {
    const conn = await db.getConnection();
    console.log("✅ MySQL Connected (Railway)");
    conn.release();
  } catch (err) {
    console.error("❌ MySQL Connection Failed:", err.message);
    process.exit(1);
  }
})();

module.exports = db;
