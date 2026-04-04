/**
 * ╔═══════════════════════════════════════════════════════════════════════════════╗
 * ║               MATHIYAZHAGAN NTL - AI CHATBOT FRONTEND                         ║
 * ║                     Cyberpunk AI Assistant Logic                              ║
 * ╚═══════════════════════════════════════════════════════════════════════════════╝
 */

// ═══════════════════════════════════════════════════════════════════════════════
// CONFIGURATION
// ═══════════════════════════════════════════════════════════════════════════════

const CONFIG = {
    // API endpoint - uses local backend in dev and fallback mode on GitHub Pages
    API_URL: (window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1')
        ? 'http://localhost:8000'
        : '',
    
    // Typing simulation delays (ms)
    TYPING_DELAY_MIN: 1000,
    TYPING_DELAY_MAX: 2500,
    
    // Hacker mode messages
    HACKER_PREFIXES: [
        '⚡ [NEURAL LINK ACTIVE]',
        '▶ Processing query through neural cores...',
        '[SYSTEM] Decrypting knowledge base...',
        '⟨⟨ DATA STREAM INCOMING ⟩⟩',
        '▓▓▓ ACCESS GRANTED ▓▓▓',
        '[OK] Query parsed successfully...',
        '⚡ Synaptic connection established...',
        '▶ Running cognitive subroutines...',
    ],
    
    HACKER_SUFFIXES: [
        '\n\n⟨ END TRANSMISSION ⟩',
        '\n\n[Connection stable]',
        '\n\n▶ Awaiting next query...',
        '\n\n⚡ Neural core standing by.',
        '',
        '',
    ],
    
    TYPING_TEXTS: [
        'Processing neural data',
        'Accessing knowledge cores',
        'Decrypting response',
        'Synthesizing answer',
        'Analyzing query patterns',
    ]
};

// ═══════════════════════════════════════════════════════════════════════════════
// FALLBACK RESPONSES (when backend is unavailable)
// ═══════════════════════════════════════════════════════════════════════════════

const FALLBACK_RESPONSES = {
    skills: `⚡ [SKILL MATRIX LOADED]

Mathi's core capabilities:
• AI/ML: Claude, Gemini, Gemma, Qwen, Ollama, RAG systems
• Languages: Python, Java, JavaScript, TypeScript
• Web: React, Node.js, FastAPI, Streamlit
• Tools: Git, GitHub, VS Code, Linux

He's always exploring new AI tech and building cool stuff! 🔥`,

    projects: `▶ [PROJECT DATABASE ACCESSED]

Featured builds:
1. Smart EV Solution - Solar + AI-powered EV optimization
2. NTL Plants - Full-stack plant e-commerce
3. AI Pitch Generator - LLM-powered business pitches
4. Aqua Flow - Water simulation engine

Each project showcases his love for combining AI with real-world solutions! ⚡`,

    contact: `⟨⟨ CONTACT DATA RETRIEVED ⟩⟩

📧 Email: programmermathi@gmail.com
🐙 GitHub: github.com/MathiyazhaganNTL
🌐 Portfolio: mathintlportfolio.dev
📍 Location: Coimbatore, India

Feel free to reach out - Mathi loves connecting with fellow developers! 🤝`,

    hire: `▓▓▓ COLLABORATION MODE ACTIVATED ▓▓▓

Interested in working with Mathi? Excellent choice!

He brings:
• Strong AI/ML expertise
• Full-stack development skills
• Passion for innovative solutions
• Consistent, dedicated work ethic

📧 Reach out: programmermathi@gmail.com
🐙 Check his work: github.com/MathiyazhaganNTL

Let's build something amazing together! ⚡`,

    default: `⚡ Neural link established...

I'm Mathi's AI assistant! I can tell you about:
• His skills & tech stack
• Projects he's built
• How to contact or collaborate with him

What would you like to know? 🔥`
};

// ═══════════════════════════════════════════════════════════════════════════════
// STATE
// ═══════════════════════════════════════════════════════════════════════════════

const state = {
    hackerMode: true,
    isProcessing: false,
    conversationHistory: []
};

// ═══════════════════════════════════════════════════════════════════════════════
// DOM ELEMENTS
// ═══════════════════════════════════════════════════════════════════════════════

const elements = {
    body: document.body,
    container: document.querySelector('.container'),
    chatMessages: document.getElementById('chat-messages'),
    userInput: document.getElementById('user-input'),
    sendBtn: document.getElementById('send-btn'),
    hackerModeBtn: document.getElementById('hacker-mode-btn'),
    widgetCloseBtn: document.getElementById('widget-close-btn'),
    widgetToggleBtn: document.getElementById('chat-widget-toggle'),
    typingIndicator: document.getElementById('typing-indicator'),
    loadingOverlay: document.getElementById('loading-overlay'),
    quickBtns: document.querySelectorAll('.quick-btn')
};

// ═══════════════════════════════════════════════════════════════════════════════
// UTILITY FUNCTIONS
// ═══════════════════════════════════════════════════════════════════════════════

/**
 * Get current time in HH:MM:SS format
 */
function getCurrentTime() {
    return new Date().toLocaleTimeString('en-US', { 
        hour12: false, 
        hour: '2-digit', 
        minute: '2-digit', 
        second: '2-digit' 
    });
}

/**
 * Get random item from array
 */
function randomChoice(arr) {
    return arr[Math.floor(Math.random() * arr.length)];
}

/**
 * Get random delay for typing simulation
 */
function getTypingDelay() {
    return Math.random() * (CONFIG.TYPING_DELAY_MAX - CONFIG.TYPING_DELAY_MIN) + CONFIG.TYPING_DELAY_MIN;
}

/**
 * Sleep for specified milliseconds
 */
function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

/**
 * Escape HTML to prevent XSS
 */
function escapeHtml(text) {
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
}

/**
 * Format response text with HTML
 */
function formatResponse(text) {
    // Convert line breaks to <br>
    let formatted = text.replace(/\n/g, '<br>');
    
    // Convert bullet points
    formatted = formatted.replace(/• /g, '<span class="bullet">•</span> ');
    
    // Highlight URLs
    formatted = formatted.replace(
        /(https?:\/\/[^\s<]+|github\.com\/[^\s<]+|[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})/g,
        '<span class="highlight-link">$1</span>'
    );
    
    return formatted;
}

/**
 * Get fallback response based on message content
 */
function getFallbackResponse(message) {
    const msgLower = message.toLowerCase();
    
    if (['skill', 'know', 'tech', 'language', 'stack', 'can you', 'what do'].some(w => msgLower.includes(w))) {
        return FALLBACK_RESPONSES.skills;
    } else if (['project', 'build', 'work', 'portfolio', 'made', 'create'].some(w => msgLower.includes(w))) {
        return FALLBACK_RESPONSES.projects;
    } else if (['contact', 'email', 'reach', 'connect', 'github', 'social'].some(w => msgLower.includes(w))) {
        return FALLBACK_RESPONSES.contact;
    } else if (['hire', 'job', 'collaborate', 'freelance', 'work together', 'opportunity'].some(w => msgLower.includes(w))) {
        return FALLBACK_RESPONSES.hire;
    }
    
    return FALLBACK_RESPONSES.default;
}

// ═══════════════════════════════════════════════════════════════════════════════
// UI FUNCTIONS
// ═══════════════════════════════════════════════════════════════════════════════

/**
 * Scroll chat to bottom
 */
function scrollToBottom() {
    elements.chatMessages.scrollTop = elements.chatMessages.scrollHeight;
}

/**
 * Show typing indicator
 */
function showTypingIndicator() {
    const typingText = elements.typingIndicator.querySelector('.typing-text');
    typingText.textContent = randomChoice(CONFIG.TYPING_TEXTS);
    elements.typingIndicator.classList.remove('hidden');
    scrollToBottom();
}

/**
 * Hide typing indicator
 */
function hideTypingIndicator() {
    elements.typingIndicator.classList.add('hidden');
}

/**
 * Add message to chat
 */
function addMessage(content, isUser = false) {
    const messageDiv = document.createElement('div');
    messageDiv.className = `message ${isUser ? 'user-message' : 'ai-message'}`;
    
    const avatarText = isUser ? 'U' : 'M';
    const senderName = isUser ? 'USER' : 'MATHI.AI';
    const currentTime = getCurrentTime();
    
    // Process content for display
    let displayContent = formatResponse(content);
    
    // Add hacker mode flair for AI messages
    let hackerPrefix = '';
    let hackerSuffix = '';
    
    if (!isUser && state.hackerMode && Math.random() > 0.3) {
        hackerPrefix = `<span class="hacker-prefix">${randomChoice(CONFIG.HACKER_PREFIXES)}</span>`;
        const suffix = randomChoice(CONFIG.HACKER_SUFFIXES);
        if (suffix) {
            hackerSuffix = `<span class="hacker-suffix">${suffix.replace(/\n/g, '')}</span>`;
        }
    }
    
    messageDiv.innerHTML = `
        <div class="message-avatar">
            <span>${avatarText}</span>
        </div>
        <div class="message-content">
            <div class="message-header">
                <span class="message-sender">${senderName}</span>
                <span class="message-time">${currentTime}</span>
            </div>
            <div class="message-text">
                ${hackerPrefix}
                <p>${displayContent}</p>
                ${hackerSuffix}
            </div>
        </div>
    `;
    
    elements.chatMessages.appendChild(messageDiv);
    scrollToBottom();
    
    // Add to conversation history
    state.conversationHistory.push({
        role: isUser ? 'user' : 'assistant',
        content: content
    });
    
    // Keep history manageable
    if (state.conversationHistory.length > 20) {
        state.conversationHistory = state.conversationHistory.slice(-20);
    }
}

/**
 * Toggle hacker mode
 */
function toggleHackerMode() {
    state.hackerMode = !state.hackerMode;
    elements.hackerModeBtn.classList.toggle('active', state.hackerMode);
    
    // Visual feedback
    const btnText = elements.hackerModeBtn.querySelector('.btn-text');
    btnText.textContent = state.hackerMode ? 'HACKER MODE' : 'NORMAL MODE';
}

function openWidget() {
    elements.body.classList.remove('widget-collapsed');
    elements.body.classList.add('widget-open');
    elements.widgetToggleBtn.setAttribute('aria-expanded', 'true');
    elements.userInput.focus();
}

function closeWidget() {
    elements.body.classList.remove('widget-open');
    elements.body.classList.add('widget-collapsed');
    elements.widgetToggleBtn.setAttribute('aria-expanded', 'false');
}

function toggleWidget() {
    if (elements.body.classList.contains('widget-open')) {
        closeWidget();
    } else {
        openWidget();
    }
}

// ═══════════════════════════════════════════════════════════════════════════════
// API FUNCTIONS
// ═══════════════════════════════════════════════════════════════════════════════

/**
 * Send message to API
 */
async function sendToAPI(message) {
    if (!CONFIG.API_URL) {
        return null;
    }

    try {
        const response = await fetch(`${CONFIG.API_URL}/chat`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                message: message,
                history: state.conversationHistory.slice(-10),
                hacker_mode: state.hackerMode
            })
        });
        
        if (!response.ok) {
            throw new Error(`API error: ${response.status}`);
        }
        
        const data = await response.json();
        return data.response;
        
    } catch (error) {
        console.warn('API unavailable, using fallback:', error.message);
        return null; // Return null to trigger fallback
    }
}

// ═══════════════════════════════════════════════════════════════════════════════
// MAIN CHAT FUNCTIONS
// ═══════════════════════════════════════════════════════════════════════════════

/**
 * Process and send user message
 */
async function sendMessage(message) {
    if (!message.trim() || state.isProcessing) return;
    
    state.isProcessing = true;
    
    // Add user message to chat
    addMessage(message, true);
    
    // Clear input
    elements.userInput.value = '';
    
    // Show typing indicator
    showTypingIndicator();
    
    // Simulate thinking time
    await sleep(getTypingDelay());
    
    // Try API first, fall back to local responses
    let response = await sendToAPI(message);
    
    if (!response) {
        // Use fallback response
        response = getFallbackResponse(message);
    }
    
    // Hide typing indicator
    hideTypingIndicator();
    
    // Add AI response
    addMessage(response, false);
    
    state.isProcessing = false;
}

// ═══════════════════════════════════════════════════════════════════════════════
// EVENT LISTENERS
// ═══════════════════════════════════════════════════════════════════════════════

/**
 * Initialize event listeners
 */
function initEventListeners() {
    // Send button click
    elements.sendBtn.addEventListener('click', () => {
        sendMessage(elements.userInput.value);
    });
    
    // Enter key press
    elements.userInput.addEventListener('keypress', (e) => {
        if (e.key === 'Enter' && !e.shiftKey) {
            e.preventDefault();
            sendMessage(elements.userInput.value);
        }
    });
    
    // Hacker mode toggle
    elements.hackerModeBtn.addEventListener('click', toggleHackerMode);

    // Widget controls
    elements.widgetToggleBtn.addEventListener('click', toggleWidget);
    elements.widgetCloseBtn.addEventListener('click', closeWidget);
    
    // Quick action buttons
    elements.quickBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            const query = btn.dataset.query;
            if (query) {
                sendMessage(query);
            }
        });
    });

    // Close widget with ESC
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && elements.body.classList.contains('widget-open')) {
            closeWidget();
        }
    });
}

// ═══════════════════════════════════════════════════════════════════════════════
// INITIALIZATION
// ═══════════════════════════════════════════════════════════════════════════════

/**
 * Initialize the chatbot
 */
function init() {
    console.log('⚡ MathiyazhaganNTL AI Assistant initializing...');

    // Start as floating launcher and open chat on demand
    elements.body.classList.add('widget-collapsed');
    
    // Set up event listeners
    initEventListeners();
    
    // Update welcome message time
    const welcomeTime = document.querySelector('.ai-message .message-time');
    if (welcomeTime) {
        welcomeTime.textContent = getCurrentTime();
    }
    
    console.log('✓ AI Assistant ready!');
}

// Start when DOM is ready
document.addEventListener('DOMContentLoaded', init);

// ═══════════════════════════════════════════════════════════════════════════════
// EASTER EGGS & FUN FEATURES
// ═══════════════════════════════════════════════════════════════════════════════

// Konami code easter egg
let konamiCode = [];
const konamiSequence = ['ArrowUp', 'ArrowUp', 'ArrowDown', 'ArrowDown', 'ArrowLeft', 'ArrowRight', 'ArrowLeft', 'ArrowRight', 'b', 'a'];

document.addEventListener('keydown', (e) => {
    konamiCode.push(e.key);
    konamiCode = konamiCode.slice(-10);
    
    if (konamiCode.join(',') === konamiSequence.join(',')) {
        // Trigger easter egg
        addMessage('🎮 KONAMI CODE DETECTED! You found the secret! Mathi approves of your gaming knowledge. Here\'s a virtual high-five! ✋', false);
        konamiCode = [];
    }
});

// Console message for curious developers
console.log(`
╔═══════════════════════════════════════════════════════════════════════════════╗
║                                                                               ║
║   ███╗   ███╗ █████╗ ████████╗██╗  ██╗██╗                                    ║
║   ████╗ ████║██╔══██╗╚══██╔══╝██║  ██║██║                                    ║
║   ██╔████╔██║███████║   ██║   ███████║██║                                    ║
║   ██║╚██╔╝██║██╔══██║   ██║   ██╔══██║██║                                    ║
║   ██║ ╚═╝ ██║██║  ██║   ██║   ██║  ██║██║                                    ║
║   ╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝                                    ║
║                                                                               ║
║   👋 Hey there, fellow developer!                                            ║
║   Looking at the console? I like your style.                                  ║
║                                                                               ║
║   🐙 GitHub: github.com/MathiyazhaganNTL                                     ║
║   📧 Email: programmermathi@gmail.com                                         ║
║                                                                               ║
║   Let's build something amazing together! ⚡                                  ║
║                                                                               ║
╚═══════════════════════════════════════════════════════════════════════════════╝
`);
