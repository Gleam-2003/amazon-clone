@echo off
echo Setting up Amazon Clone Database...
echo Using password: Root@123
echo.

echo Creating database schema...
mysql -u root -pRoot@123 < backend\database\schema.sql
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Could not create schema. Please check:
    echo 1. MySQL is installed and running
    echo 2. MySQL is in your PATH
    echo 3. Password is correct
    pause
    exit /b 1
)

echo.
echo Seeding database with 60 products...
mysql -u root -pRoot@123 < backend\database\seed.sql
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Could not seed database.
    pause
    exit /b 1
)

echo.
echo ✅ Database setup complete!
echo You should now have 60 products in the database.
echo.
pause

