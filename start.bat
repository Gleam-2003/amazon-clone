@echo off
echo Starting Amazon Clone Application...
echo.

echo Starting Backend Server...
start "Backend Server" cmd /k "cd backend && npm start"

timeout /t 3 /nobreak >nul

echo Starting Frontend Server...
start "Frontend Server" cmd /k "cd frontend && npm start"

echo.
echo Both servers are starting...
echo Backend will run on http://localhost:5000
echo Frontend will run on http://localhost:3000
echo.
echo Press any key to exit this window (servers will continue running)...
pause >nul

