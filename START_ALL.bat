@echo off
echo ========================================
echo   Amazon Clone - Starting Application
echo ========================================
echo.

echo Step 1: Setting up database...
call setup-database-password.bat
if %errorlevel% neq 0 (
    echo Database setup failed. Please check MySQL.
    pause
    exit /b 1
)

echo.
echo Step 2: Starting Backend Server...
start "Backend Server" cmd /k "cd backend && npm start"

timeout /t 5 /nobreak >nul

echo.
echo Step 3: Starting Frontend Server...
start "Frontend Server" cmd /k "cd frontend && npm start"

echo.
echo ========================================
echo   ✅ Application Starting!
echo ========================================
echo.
echo Backend:  http://localhost:5000
echo Frontend: http://localhost:3000
echo.
echo Both servers are starting in separate windows.
echo The frontend will open automatically in your browser.
echo.
pause




