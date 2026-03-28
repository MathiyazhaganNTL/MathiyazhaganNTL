# MathiyazhaganNTL AI Chatbot

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                   MATHIYAZHAGAN NTL - AI CHATBOT                              ║
║                     Cyberpunk AI Assistant                                    ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

A cyberpunk-themed AI chatbot that represents **Mathiyazhagan NTL (Silent Thunder)** - answering questions about skills, projects, and experience with a unique hacker personality.

## Features

- **Cyberpunk UI** - Red wine neon theme with glowing effects
- **AI-Powered** - Claude API integration for intelligent responses
- **Hacker Mode** - Fun terminal-style messages and effects
- **Fallback System** - Works even without API (uses smart keyword matching)
- **Responsive Design** - Works on desktop and mobile
- **Easter Eggs** - Try the Konami code!

## Tech Stack

### Frontend
- HTML5, CSS3 (Custom Properties, Animations)
- Vanilla JavaScript (No frameworks needed)
- Fira Code & Orbitron fonts

### Backend
- FastAPI (Python 3.9+)
- Claude API (Anthropic)
- Pydantic for validation

## Quick Start

### 1. Backend Setup

```bash
cd chatbot/backend

# Create virtual environment
python -m venv venv

# Activate (Windows)
venv\Scripts\activate

# Activate (Linux/Mac)
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Set API key (Windows)
set ANTHROPIC_API_KEY=your_api_key_here

# Set API key (Linux/Mac)
export ANTHROPIC_API_KEY=your_api_key_here

# Run server
python main.py
```

Server runs at: `http://localhost:8000`

### 2. Frontend Setup

Simply open `frontend/index.html` in your browser, or serve it:

```bash
cd chatbot/frontend

# Using Python
python -m http.server 3000

# Using Node.js
npx serve -p 3000
```

Frontend runs at: `http://localhost:3000`

### 3. Update API URL

Edit `frontend/script.js` line 12:
```javascript
API_URL: 'http://localhost:8000',  // Change for production
```

## API Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/` | GET | Health check |
| `/health` | GET | Health status |
| `/chat` | POST | Main chat endpoint |
| `/info` | GET | Developer info |

### Chat Request Format

```json
{
    "message": "Tell me about your skills",
    "history": [],
    "hacker_mode": true
}
```

### Chat Response Format

```json
{
    "response": "⚡ [NEURAL LINK ACTIVE]\n\nMathi's skills include...",
    "hacker_prefix": "▶ Processing query...",
    "timestamp": "2026-03-28T23:00:00"
}
```

## Deployment

### Option 1: Docker

```dockerfile
# Dockerfile (backend)
FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY main.py .
EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
```

```bash
docker build -t mathi-chatbot .
docker run -p 8000:8000 -e ANTHROPIC_API_KEY=your_key mathi-chatbot
```

### Option 2: Railway/Render

1. Push to GitHub
2. Connect repository to Railway/Render
3. Set environment variable: `ANTHROPIC_API_KEY`
4. Deploy!

### Option 3: Vercel (Frontend) + Railway (Backend)

**Frontend on Vercel:**
1. Push `frontend/` to GitHub
2. Import to Vercel
3. Auto-deploys on push

**Backend on Railway:**
1. Push `backend/` to GitHub
2. Create new project on Railway
3. Add `ANTHROPIC_API_KEY` env var
4. Deploy

### Option 4: GitHub Pages (Frontend Only)

1. Copy frontend files to `docs/` folder
2. Enable GitHub Pages in repo settings
3. Works with fallback responses (no API needed)

## Configuration

### Environment Variables

| Variable | Required | Description |
|----------|----------|-------------|
| `ANTHROPIC_API_KEY` | Yes* | Claude API key |

*Optional if using fallback mode only

### Customization

**Change colors** - Edit CSS variables in `styles.css`:
```css
:root {
    --neon-red: #FF0040;
    --neon-wine: #C41E3A;
    /* ... */
}
```

**Add new responses** - Edit `FALLBACK_RESPONSES` in both:
- `backend/main.py`
- `frontend/script.js`

**Modify personality** - Edit `SYSTEM_PROMPT` in `backend/main.py`

## Project Structure

```
chatbot/
├── backend/
│   ├── main.py           # FastAPI application
│   └── requirements.txt  # Python dependencies
├── frontend/
│   ├── index.html        # Main HTML
│   ├── styles.css        # Cyberpunk styles
│   └── script.js         # Chat logic
└── README.md             # This file
```

## Sample Conversations

**User:** What are your skills?

**AI:** ⚡ [SKILL MATRIX LOADED]

Mathi's core capabilities:
• AI/ML: Claude, Gemini, Gemma, Qwen, Ollama
• Languages: Python, Java, JavaScript, TypeScript
• Web: React, Node.js, FastAPI, Streamlit
• Tools: Git, GitHub, VS Code, Linux

He's always exploring new AI tech! 🔥

---

**User:** I want to hire you

**AI:** ▓▓▓ COLLABORATION MODE ACTIVATED ▓▓▓

Interested in working with Mathi? Excellent choice!

📧 Reach out: programmermathi@gmail.com
🐙 Check his work: github.com/MathiyazhaganNTL

Let's build something amazing together! ⚡

## License

MIT License - Feel free to use and modify!

## Author

**Mathiyazhagan NTL** (Silent Thunder)
- GitHub: [github.com/MathiyazhaganNTL](https://github.com/MathiyazhaganNTL)
- Email: programmermathi@gmail.com

---

```
⚡ Neural cores standing by... Ready to assist! ⚡
```
