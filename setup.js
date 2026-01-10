// Setup script for Amazon Clone
const mysql = require('mysql2');
const fs = require('fs');
const path = require('path');
const { exec } = require('child_process');

console.log('🚀 Amazon Clone Setup Script\n');

// Check if .env exists
const envPath = path.join(__dirname, 'backend', '.env');
if (!fs.existsSync(envPath)) {
  console.log('📝 Creating .env file...');
  const envContent = `DB_HOST=localhost
DB_USER=root
DB_PASSWORD=
DB_NAME=amazon_clone
PORT=5000
`;
  fs.writeFileSync(envPath, envContent);
  console.log('✅ .env file created. Please update it with your MySQL credentials if needed.\n');
}

// Database setup
console.log('📦 Setting up database...');
console.log('Please make sure MySQL is running and you have the correct credentials.\n');
console.log('To set up the database manually, run:');
console.log('  mysql -u root -p < backend/database/schema.sql');
console.log('  mysql -u root -p < backend/database/seed.sql\n');

console.log('✅ Setup complete!');
console.log('\nTo start the application:');
console.log('  1. Backend: cd backend && npm start');
console.log('  2. Frontend: cd frontend && npm start');
console.log('\nOr run both servers in separate terminals.\n');




