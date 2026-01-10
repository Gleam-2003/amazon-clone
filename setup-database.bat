@echo off
echo Setting up Amazon Clone Database...
echo.
echo Please enter your MySQL root password when prompted.
echo.

echo Creating database schema...
mysql -u root -p < backend\database\schema.sql

echo.
echo Seeding database with products...
mysql -u root -p < backend\database\seed.sql

echo.
echo Database setup complete!
echo You should now see 60 products in the database.
pause




