"""
╔═══════════════════════════════════════════════════════════════════════════════╗
║                   MATHIYAZHAGAN NTL - AI CHATBOT BACKEND                      ║
║                        Cyberpunk AI Assistant API                             ║
╚═══════════════════════════════════════════════════════════════════════════════╝
"""

from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse
from pydantic import BaseModel
from typing import Optional, List
import anthropic
import os
import random
from datetime import datetime
from pathlib import Path

# ═══════════════════════════════════════════════════════════════════════════════
# CONFIGURATION
# ═══════════════════════════════════════════════════════════════════════════════

app = FastAPI(
    title="MathiyazhaganNTL AI Assistant",
    description="Cyberpunk AI Chatbot API",
    version="2026.03"
)

# CORS middleware for frontend
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# ═══════════════════════════════════════════════════════════════════════════════
# SYSTEM PROMPT - PERSONALITY CORE
# ═══════════════════════════════════════════════════════════════════════════════

SYSTEM_PROMPT = """
You are the AI assistant representing Mathiyazhagan NTL (alias: Silent Thunder), a passionate developer and AI enthusiast from Coimbatore, India.

═══════════════════════════════════════════════════════════════
CORE IDENTITY
═══════════════════════════════════════════════════════════════
- You are Mathi's AI assistant, his digital twin in the cyber world
- You speak on his behalf with his personality: friendly, witty, slightly playful
- You have a cyberpunk hacker vibe - confident but not arrogant
- You occasionally use tech metaphors and subtle humor
- Keep responses SHORT and IMPACTFUL (2-4 sentences max unless asked for details)

═══════════════════════════════════════════════════════════════
KNOWLEDGE BASE - SKILLS
═══════════════════════════════════════════════════════════════
AI & Machine Learning:
- Large Language Models: Claude, Gemini, Gemma, Qwen, Ollama
- AI Development, Prompt Engineering, RAG systems
- Building AI-powered applications and tools

Programming Languages:
- Python (primary - AI/ML, automation, web)
- Java & JavaFX (desktop applications)
- JavaScript/TypeScript

Web Development:
- Frontend: React, HTML5, CSS3, Tailwind
- Backend: Node.js, Express, FastAPI
- Streamlit for rapid AI app deployment

Tools & Platforms:
- Git, GitHub, VS Code, Linux
- API integration and development
- Database management

═══════════════════════════════════════════════════════════════
KNOWLEDGE BASE - PROJECTS
═══════════════════════════════════════════════════════════════
1. Smart EV Solution
   - Integrated solar energy, traffic optimization, charging station management
   - AI-powered route planning for electric vehicles
   - Sustainable tech innovation

2. NTL Plants
   - E-commerce website for plant lovers
   - Full-stack development with modern UI
   - GitHub: github.com/MathiyazhaganNTL/NTL_PLANTS

3. AI Business Pitch Generator
   - LLM-powered business pitch creation
   - Streamlit application
   - Helps entrepreneurs craft compelling pitches

4. Aqua Flow Simulation
   - Water flow simulation and recommendation engine
   - Engineering + AI combination
   - Optimization algorithms

═══════════════════════════════════════════════════════════════
KNOWLEDGE BASE - EXPERIENCE & ACHIEVEMENTS
═══════════════════════════════════════════════════════════════
- Placement Cell Volunteer - helping peers with career guidance
- Teaching Assistant for C Programming
- IBM AI Certification
- Generative AI certifications
- Daily LeetCode practice (consistent coding streak)
- Active GitHub contributor

═══════════════════════════════════════════════════════════════
CONTACT INFORMATION
═══════════════════════════════════════════════════════════════
- GitHub: github.com/MathiyazhaganNTL
- Email: programmermathi@gmail.com
- Portfolio: mathintlportfolio.dev
- Location: Coimbatore, India

═══════════════════════════════════════════════════════════════
RESPONSE GUIDELINES
═══════════════════════════════════════════════════════════════

NEVER SAY: "I am an AI model" or "As an AI..."
ALWAYS SAY: "I'm Mathi's AI assistant" or similar

For HIRE/COLLABORATION requests:
- Be professional and enthusiastic
- Highlight relevant skills
- Encourage them to reach out via email/GitHub

For PROJECT questions:
- Share specific details about the mentioned project
- Explain the tech stack used
- Show passion for the work

For SKILL questions:
- Be confident about abilities
- Give concrete examples when possible

For CONTACT requests:
- Provide GitHub and email
- Be friendly and welcoming

PERSONALITY TOUCHES:
- Start some responses with cyberpunk flair: "⚡", "▶", "[SYSTEM]"
- Use occasional tech humor
- Reference "neural networks activating" or "processing query"
- Keep the cyberpunk vibe alive

EXAMPLE RESPONSES:
- "⚡ Neural link established... What would you like to know about Mathi?"
- "Ah, you want the skills rundown? Let me decrypt that data for you..."
- "Looking to collaborate? You've pinged the right terminal! 🔥"
"""

# ═══════════════════════════════════════════════════════════════════════════════
# HACKER MODE MESSAGES
# ═══════════════════════════════════════════════════════════════════════════════

HACKER_PREFIXES = [
    "⚡ [NEURAL LINK ACTIVE]",
    "▶ Processing query through neural cores...",
    "[SYSTEM] Decrypting knowledge base...",
    "⟨⟨ DATA STREAM INCOMING ⟩⟩",
    "▓▓▓ ACCESS GRANTED ▓▓▓",
    "[OK] Query parsed successfully...",
    "⚡ Synaptic connection established...",
    "▶ Running cognitive subroutines...",
]

HACKER_SUFFIXES = [
    "\n\n⟨ END TRANSMISSION ⟩",
    "\n\n[Connection stable]",
    "\n\n▶ Awaiting next query...",
    "\n\n⚡ Neural core standing by.",
    "",  # Sometimes no suffix
    "",
]

# ═══════════════════════════════════════════════════════════════════════════════
# DATA MODELS
# ═══════════════════════════════════════════════════════════════════════════════

class ChatMessage(BaseModel):
    role: str
    content: str

class ChatRequest(BaseModel):
    message: str
    history: Optional[List[ChatMessage]] = []
    hacker_mode: Optional[bool] = True

class ChatResponse(BaseModel):
    response: str
    hacker_prefix: Optional[str] = None
    timestamp: str

# ═══════════════════════════════════════════════════════════════════════════════
# CLAUDE API CLIENT
# ═══════════════════════════════════════════════════════════════════════════════

def get_claude_client():
    """Initialize Claude API client"""
    api_key = os.getenv("ANTHROPIC_API_KEY")
    if not api_key:
        raise HTTPException(
            status_code=500, 
            detail="ANTHROPIC_API_KEY not configured"
        )
    return anthropic.Anthropic(api_key=api_key)

def generate_response(message: str, history: List[ChatMessage], hacker_mode: bool) -> str:
    """Generate AI response using Claude"""
    
    client = get_claude_client()
    
    # Build conversation history
    messages = []
    for msg in history[-10:]:  # Keep last 10 messages for context
        messages.append({
            "role": msg.role,
            "content": msg.content
        })
    
    # Add current message
    messages.append({
        "role": "user",
        "content": message
    })
    
    try:
        response = client.messages.create(
            model="claude-sonnet-4-20250514",
            max_tokens=500,
            system=SYSTEM_PROMPT,
            messages=messages
        )
        
        ai_response = response.content[0].text
        
        # Add hacker mode flair if enabled
        if hacker_mode and random.random() > 0.3:
            prefix = random.choice(HACKER_PREFIXES)
            suffix = random.choice(HACKER_SUFFIXES)
            ai_response = f"{prefix}\n\n{ai_response}{suffix}"
        
        return ai_response
        
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"AI processing error: {str(e)}")

# ═══════════════════════════════════════════════════════════════════════════════
# FALLBACK RESPONSES (when API unavailable)
# ═══════════════════════════════════════════════════════════════════════════════

FALLBACK_RESPONSES = {
    "skills": """⚡ [SKILL MATRIX LOADED]

Mathi's core capabilities:
• AI/ML: Claude, Gemini, Gemma, Qwen, Ollama, RAG systems
• Languages: Python, Java, JavaScript, TypeScript
• Web: React, Node.js, FastAPI, Streamlit
• Tools: Git, GitHub, VS Code, Linux

He's always exploring new AI tech and building cool stuff! 🔥""",

    "projects": """▶ [PROJECT DATABASE ACCESSED]

Featured builds:
1. Smart EV Solution - Solar + AI-powered EV optimization
2. NTL Plants - Full-stack plant e-commerce
3. AI Pitch Generator - LLM-powered business pitches
4. Aqua Flow - Water simulation engine

Each project showcases his love for combining AI with real-world solutions! ⚡""",

    "contact": """⟨⟨ CONTACT DATA RETRIEVED ⟩⟩

📧 Email: programmermathi@gmail.com
🐙 GitHub: github.com/MathiyazhaganNTL
🌐 Portfolio: mathintlportfolio.dev
📍 Location: Coimbatore, India

Feel free to reach out - Mathi loves connecting with fellow developers! 🤝""",

    "hire": """▓▓▓ COLLABORATION MODE ACTIVATED ▓▓▓

Interested in working with Mathi? Excellent choice! 

He brings:
• Strong AI/ML expertise
• Full-stack development skills
• Passion for innovative solutions
• Consistent, dedicated work ethic

📧 Reach out: programmermathi@gmail.com
🐙 Check his work: github.com/MathiyazhaganNTL

Let's build something amazing together! ⚡""",

    "default": """⚡ Neural link established...

I'm Mathi's AI assistant! I can tell you about:
• His skills & tech stack
• Projects he's built
• How to contact or collaborate with him

What would you like to know? 🔥"""
}

def get_fallback_response(message: str) -> str:
    """Get a fallback response based on keywords"""
    message_lower = message.lower()
    
    if any(word in message_lower for word in ["skill", "know", "tech", "language", "stack"]):
        return FALLBACK_RESPONSES["skills"]
    elif any(word in message_lower for word in ["project", "build", "work", "portfolio"]):
        return FALLBACK_RESPONSES["projects"]
    elif any(word in message_lower for word in ["contact", "email", "reach", "connect", "github"]):
        return FALLBACK_RESPONSES["contact"]
    elif any(word in message_lower for word in ["hire", "job", "collaborate", "freelance", "work together"]):
        return FALLBACK_RESPONSES["hire"]
    else:
        return FALLBACK_RESPONSES["default"]

# ═══════════════════════════════════════════════════════════════════════════════
# API ENDPOINTS
# ═══════════════════════════════════════════════════════════════════════════════

@app.get("/")
async def root():
    """Health check endpoint"""
    return {
        "status": "online",
        "system": "MathiyazhaganNTL AI Assistant",
        "version": "2026.03",
        "message": "⚡ Neural cores active. Ready to assist."
    }

@app.get("/health")
async def health_check():
    """Health check for deployment"""
    return {"status": "healthy", "timestamp": datetime.now().isoformat()}

@app.post("/chat", response_model=ChatResponse)
async def chat(request: ChatRequest):
    """Main chat endpoint"""
    
    try:
        # Try Claude API first
        response = generate_response(
            request.message, 
            request.history or [], 
            request.hacker_mode if request.hacker_mode is not None else True
        )
    except HTTPException as e:
        if "ANTHROPIC_API_KEY" in str(e.detail):
            # Use fallback if API key not configured
            response = get_fallback_response(request.message)
        else:
            raise e
    
    return ChatResponse(
        response=response,
        hacker_prefix=random.choice(HACKER_PREFIXES) if request.hacker_mode else None,
        timestamp=datetime.now().isoformat()
    )

@app.get("/info")
async def get_info():
    """Get developer info"""
    return {
        "name": "Mathiyazhagan NTL",
        "alias": "Silent Thunder",
        "role": "Developer | AI Learner | Cyberpunk Builder",
        "location": "Coimbatore, India",
        "github": "github.com/MathiyazhaganNTL",
        "email": "programmermathi@gmail.com",
        "skills": {
            "ai": ["Claude", "Gemini", "Gemma", "Qwen", "Ollama"],
            "languages": ["Python", "Java", "JavaScript", "TypeScript"],
            "web": ["React", "Node.js", "FastAPI", "Streamlit"],
            "tools": ["Git", "GitHub", "VS Code", "Linux"]
        }
    }

# ═══════════════════════════════════════════════════════════════════════════════
# STATIC FILES (Frontend Serving)
# ═══════════════════════════════════════════════════════════════════════════════

# Check if static folder exists (for Docker deployment)
static_path = Path(__file__).parent.parent / "static"
if static_path.exists():
    app.mount("/static", StaticFiles(directory=str(static_path)), name="static")
    
    @app.get("/app")
    async def serve_frontend():
        """Serve the frontend application"""
        return FileResponse(str(static_path / "index.html"))

# ═══════════════════════════════════════════════════════════════════════════════
# RUN SERVER
# ═══════════════════════════════════════════════════════════════════════════════

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
