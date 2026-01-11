const mysql = require("mysql2/promise");

const db = mysql.createPool({
  host: process.env.MYSQLHOST,        // ✅ Railway internal host
  user: process.env.MYSQLUSER,        // ✅ root
  password: process.env.MYSQLPASSWORD,
  database: process.env.MYSQLDATABASE,
  port: process.env.MYSQLPORT || 3306,
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
