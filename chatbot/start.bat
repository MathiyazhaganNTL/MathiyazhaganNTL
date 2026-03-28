@echo off
rem ╔═══════════════════════════════════════════════════════════════════════════════╗
rem ║               MATHIYAZHAGAN NTL - AI CHATBOT STARTUP (Windows)                ║
rem ╚═══════════════════════════════════════════════════════════════════════════════╝

echo.
echo ╔═══════════════════════════════════════════════════════════════╗
echo ║  MATHIYAZHAGAN NTL - AI CHATBOT STARTUP                       ║
echo ╚═══════════════════════════════════════════════════════════════╝
echo.

echo [SYSTEM] Checking Python installation...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python not found. Please install Python 3.9+ from python.org
    pause
    exit /b 1
)
echo [OK] Python found.

echo.
echo [SYSTEM] Setting up virtual environment...
if not exist "venv" (
    python -m venv venv
    echo [OK] Virtual environment created.
) else (
    echo [OK] Virtual environment exists.
)

echo.
echo [SYSTEM] Activating virtual environment...
call venv\Scripts\activate.bat

echo.
echo [SYSTEM] Installing dependencies...
pip install -r backend\requirements.txt -q
echo [OK] Dependencies installed.

echo.
echo [SYSTEM] Checking API key...
if exist ".env" (
    echo [OK] Found .env file - API key will be loaded automatically.
) else (
    echo [WARNING] ANTHROPIC_API_KEY not set. Using fallback mode.
    echo          Create a .env file with your API key.
    echo          See .env.example for reference.
)

echo.
echo ╔═══════════════════════════════════════════════════════════════╗
echo ║  Starting server...                                           ║
echo ║                                                               ║
echo ║  Backend API:  http://localhost:8000                          ║
echo ║  API Docs:     http://localhost:8000/docs                     ║
echo ║                                                               ║
echo ║  Open frontend\index.html in your browser to chat!            ║
echo ╚═══════════════════════════════════════════════════════════════╝
echo.

cd backend
python main.py
pause
