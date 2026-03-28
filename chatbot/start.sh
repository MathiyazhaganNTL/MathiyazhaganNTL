#!/bin/bash
# ╔═══════════════════════════════════════════════════════════════════════════════╗
# ║               MATHIYAZHAGAN NTL - AI CHATBOT STARTUP SCRIPT                   ║
# ╚═══════════════════════════════════════════════════════════════════════════════╝

set -e

echo "╔═══════════════════════════════════════════════════════════════════════════════╗"
echo "║                                                                               ║"
echo "║   ███╗   ███╗ █████╗ ████████╗██╗  ██╗██╗                                    ║"
echo "║   ████╗ ████║██╔══██╗╚══██╔══╝██║  ██║██║                                    ║"
echo "║   ██╔████╔██║███████║   ██║   ███████║██║                                    ║"
echo "║   ██║╚██╔╝██║██╔══██║   ██║   ██╔══██║██║                                    ║"
echo "║   ██║ ╚═╝ ██║██║  ██║   ██║   ██║  ██║██║                                    ║"
echo "║   ╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝                                    ║"
echo "║                                                                               ║"
echo "║                  AI CHATBOT STARTUP                                           ║"
echo "║                                                                               ║"
echo "╚═══════════════════════════════════════════════════════════════════════════════╝"

echo ""
echo "[SYSTEM] Checking Python installation..."
if ! command -v python3 &> /dev/null; then
    echo "[ERROR] Python3 not found. Please install Python 3.9+"
    exit 1
fi
echo "[OK] Python found."

echo ""
echo "[SYSTEM] Setting up virtual environment..."
if [ ! -d "venv" ]; then
    python3 -m venv venv
    echo "[OK] Virtual environment created."
else
    echo "[OK] Virtual environment exists."
fi

echo ""
echo "[SYSTEM] Activating virtual environment..."
source venv/bin/activate

echo ""
echo "[SYSTEM] Installing dependencies..."
pip install -r backend/requirements.txt -q
echo "[OK] Dependencies installed."

echo ""
echo "[SYSTEM] Checking API key..."
if [ -f ".env" ]; then
    source .env
    echo "[OK] Environment loaded from .env"
elif [ -z "$ANTHROPIC_API_KEY" ]; then
    echo "[WARNING] ANTHROPIC_API_KEY not set. Using fallback mode."
    echo "          Set your key: export ANTHROPIC_API_KEY=sk-ant-..."
else
    echo "[OK] API key configured."
fi

echo ""
echo "[SYSTEM] Starting server..."
echo ""
echo "╔═══════════════════════════════════════════════════════════════════════════════╗"
echo "║  ⚡ Neural cores active.                                                      ║"
echo "║                                                                               ║"
echo "║  Backend API:  http://localhost:8000                                          ║"
echo "║  API Docs:     http://localhost:8000/docs                                     ║"
echo "║  Health:       http://localhost:8000/health                                    ║"
echo "║                                                                               ║"
echo "║  Open frontend/index.html in your browser to chat!                            ║"
echo "╚═══════════════════════════════════════════════════════════════════════════════╝"
echo ""

cd backend
python main.py
