# ============================================================
# Build Script: Modern Cyberpunk Header with advanced animations
# ============================================================

$b64 = [System.IO.File]::ReadAllText("g:\github\MathiyazhaganNTL\assets\b64.txt")

# Detect MIME type
$bytes = [System.IO.File]::ReadAllBytes("g:\github\MathiyazhaganNTL\assets\developer-cartoon.png")
if ($bytes[0] -eq 0xFF -and $bytes[1] -eq 0xD8) { $mime = "image/jpeg" } else { $mime = "image/png" }
Write-Host "MIME: $mime | Base64: $($b64.Length) chars"

# ── SVG PART 1: Everything before the base64 image data ──
$svgPart1 = @'
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1200 400" width="1200" height="400">
  <defs>
    <!-- ═══ ADVANCED GRADIENTS ═══ -->
    <linearGradient id="neonGrad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="#FF0040">
        <animate attributeName="stop-color" values="#FF0040;#FF0080;#FF0040" dur="3s" repeatCount="indefinite"/>
      </stop>
      <stop offset="50%" stop-color="#FF0020"/>
      <stop offset="100%" stop-color="#FF0060">
        <animate attributeName="stop-color" values="#FF0060;#FF0020;#FF0060" dur="3s" repeatCount="indefinite"/>
      </stop>
    </linearGradient>

    <linearGradient id="nameGrad" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" stop-color="#FFFFFF">
        <animate attributeName="stop-color" values="#FFFFFF;#FF6B6B;#FFFFFF" dur="2s" repeatCount="indefinite"/>
      </stop>
      <stop offset="30%" stop-color="#FF0040"/>
      <stop offset="70%" stop-color="#FF0040"/>
      <stop offset="100%" stop-color="#FFFFFF">
        <animate attributeName="stop-color" values="#FFFFFF;#FF6B6B;#FFFFFF" dur="2s" repeatCount="indefinite"/>
      </stop>
    </linearGradient>

    <linearGradient id="lineGrad" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" stop-color="#FF0040" stop-opacity="0"/>
      <stop offset="50%" stop-color="#FF0040" stop-opacity="0.8"/>
      <stop offset="100%" stop-color="#FF0040" stop-opacity="0"/>
    </linearGradient>

    <linearGradient id="scanGrad" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" stop-color="#FF0040" stop-opacity="0"/>
      <stop offset="50%" stop-color="#FF0040" stop-opacity="0.15"/>
      <stop offset="100%" stop-color="#FF0040" stop-opacity="0"/>
    </linearGradient>

    <radialGradient id="spotlight" cx="50%" cy="50%" r="50%">
      <stop offset="0%" stop-color="#FF0040" stop-opacity="0.08"/>
      <stop offset="100%" stop-color="#FF0040" stop-opacity="0"/>
    </radialGradient>

    <!-- ═══ ADVANCED GLOW FILTERS ═══ -->
    <filter id="glowNeon" x="-50%" y="-50%" width="200%" height="200%">
      <feGaussianBlur stdDeviation="3" result="blur1"/>
      <feGaussianBlur stdDeviation="8" result="blur2"/>
      <feFlood flood-color="#FF0040" flood-opacity="0.6" result="color1"/>
      <feFlood flood-color="#FF0080" flood-opacity="0.3" result="color2"/>
      <feComposite in="color1" in2="blur1" operator="in" result="glow1"/>
      <feComposite in="color2" in2="blur2" operator="in" result="glow2"/>
      <feMerge>
        <feMergeNode in="glow2"/>
        <feMergeNode in="glow1"/>
        <feMergeNode in="glow1"/>
        <feMergeNode in="SourceGraphic"/>
      </feMerge>
    </filter>

    <filter id="glowText" x="-20%" y="-20%" width="140%" height="140%">
      <feGaussianBlur stdDeviation="2" result="blur"/>
      <feFlood flood-color="#FF0040" flood-opacity="0.7" result="color"/>
      <feComposite in="color" in2="blur" operator="in" result="glow"/>
      <feMerge>
        <feMergeNode in="glow"/>
        <feMergeNode in="SourceGraphic"/>
      </feMerge>
    </filter>

    <filter id="glowPulse" x="-30%" y="-30%" width="160%" height="160%">
      <feGaussianBlur stdDeviation="4" result="blur"/>
      <feFlood flood-color="#FF0040" flood-opacity="0.5" result="color"/>
      <feComposite in="color" in2="blur" operator="in" result="glow"/>
      <feMerge>
        <feMergeNode in="glow"/>
        <feMergeNode in="SourceGraphic"/>
      </feMerge>
    </filter>

    <filter id="glitch" x="-10%" y="-10%" width="120%" height="120%">
      <feFlood flood-color="#FF0040" flood-opacity="0.1" result="color"/>
      <feComposite in="color" in2="SourceGraphic" operator="in" result="tint"/>
      <feMerge>
        <feMergeNode in="SourceGraphic"/>
        <feMergeNode in="tint"/>
      </feMerge>
    </filter>

    <!-- ═══ PATTERNS ═══ -->
    <pattern id="grid" width="40" height="40" patternUnits="userSpaceOnUse">
      <path d="M 40 0 L 0 0 0 40" fill="none" stroke="rgba(255,0,64,0.04)" stroke-width="0.5"/>
    </pattern>

    <pattern id="scanlines" width="2" height="4" patternUnits="userSpaceOnUse">
      <rect width="2" height="2" fill="rgba(255,255,255,0.015)"/>
      <rect y="2" width="2" height="2" fill="rgba(0,0,0,0.1)"/>
    </pattern>

    <pattern id="noise" width="100" height="100" patternUnits="userSpaceOnUse">
      <rect width="100" height="100" fill="transparent"/>
      <circle cx="10" cy="20" r="0.5" fill="rgba(255,0,64,0.1)"/>
      <circle cx="30" cy="50" r="0.3" fill="rgba(255,0,64,0.08)"/>
      <circle cx="70" cy="80" r="0.4" fill="rgba(255,0,64,0.1)"/>
      <circle cx="90" cy="30" r="0.3" fill="rgba(255,0,64,0.06)"/>
    </pattern>

    <!-- ═══ CLIP PATHS ═══ -->
    <clipPath id="charClip">
      <circle cx="195" cy="200" r="115"/>
    </clipPath>
  </defs>

  <style>
    /* ═══ MODERN ANIMATIONS ═══ */

    /* Breathing character */
    @keyframes breathe {
      0%, 100% { transform: translateY(0) scale(1); }
      50% { transform: translateY(-5px) scale(1.02); }
    }

    /* Neon flicker */
    @keyframes neonFlicker {
      0%, 19%, 21%, 23%, 25%, 54%, 56%, 100% { opacity: 1; }
      20%, 24%, 55% { opacity: 0.85; }
    }

    /* Scan line sweep */
    @keyframes scanSweep {
      0% { transform: translateY(-400px); }
      100% { transform: translateY(400px); }
    }

    /* Typing cursor blink */
    @keyframes cursorBlink {
      0%, 100% { opacity: 1; }
      50% { opacity: 0; }
    }

    /* Code typing effect */
    @keyframes typeReveal {
      0% { width: 0; }
      100% { width: var(--char-width); }
    }

    /* Glitch effect */
    @keyframes glitch1 {
      0%, 90%, 100% { transform: translate(0); }
      91% { transform: translate(-3px, 1px); }
      92% { transform: translate(3px, -1px); }
      93% { transform: translate(-2px, -1px); }
      94% { transform: translate(0); }
    }

    @keyframes glitch2 {
      0%, 90%, 100% { transform: translate(0); opacity: 0; }
      91% { transform: translate(3px, 1px); opacity: 0.7; }
      93% { transform: translate(-2px, 1px); opacity: 0.5; }
      94% { transform: translate(0); opacity: 0; }
    }

    /* Ring rotation */
    @keyframes ringRotate {
      0% { stroke-dashoffset: 0; }
      100% { stroke-dashoffset: -1000; }
    }

    /* Pulse glow */
    @keyframes pulseGlow {
      0%, 100% { opacity: 0.3; }
      50% { opacity: 0.6; }
    }

    /* Floating particles */
    @keyframes float {
      0%, 100% { transform: translateY(0) translateX(0); opacity: 0; }
      10% { opacity: 0.6; }
      90% { opacity: 0.3; }
      50% { transform: translateY(-30px) translateX(10px); }
    }

    /* Border dash animation */
    @keyframes borderDash {
      0% { stroke-dashoffset: 0; }
      100% { stroke-dashoffset: 60; }
    }

    /* Text gradient shift */
    @keyframes gradientShift {
      0% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
      100% { background-position: 0% 50%; }
    }

    /* Status dot pulse */
    @keyframes dotPulse {
      0%, 100% { opacity: 0.4; transform: scale(1); }
      50% { opacity: 1; transform: scale(1.3); }
    }

    /* Code line typing */
    @keyframes typeLine1 { 0%, 10% { opacity: 0; } 15%, 90% { opacity: 0.8; } 95%, 100% { opacity: 0; } }
    @keyframes typeLine2 { 0%, 20% { opacity: 0; } 25%, 90% { opacity: 0.8; } 95%, 100% { opacity: 0; } }
    @keyframes typeLine3 { 0%, 30% { opacity: 0; } 35%, 90% { opacity: 0.8; } 95%, 100% { opacity: 0; } }
    @keyframes typeLine4 { 0%, 40% { opacity: 0; } 45%, 90% { opacity: 0.8; } 95%, 100% { opacity: 0; } }
    @keyframes typeLine5 { 0%, 50% { opacity: 0; } 55%, 90% { opacity: 0.8; } 95%, 100% { opacity: 0; } }

    /* ═══ TERMINAL BOOT SEQUENCE ANIMATIONS ═══ */
    @keyframes bootText {
      0%, 5% { opacity: 0; transform: translateX(-10px); }
      10%, 90% { opacity: 1; transform: translateX(0); }
      95%, 100% { opacity: 0.9; }
    }

    @keyframes bootPrompt {
      0%, 15% { opacity: 0; }
      20%, 90% { opacity: 1; }
      95%, 100% { opacity: 0.8; }
    }

    @keyframes bootTyping {
      0%, 30% { opacity: 0; }
      35%, 90% { opacity: 1; }
      95%, 100% { opacity: 0.8; }
    }

    @keyframes textGlow {
      0%, 100% { filter: url(#glowText); fill: #FF0000; }
      50% { filter: url(#glowNeon); fill: #FF4444; }
    }

    @keyframes cursorMove {
      0%, 15% { opacity: 0; }
      16%, 18% { opacity: 1; }
      19%, 100% { opacity: 0; }
    }

    @keyframes bootGlow {
      0%, 100% { opacity: 0.7; }
      50% { opacity: 1; }
    }

    /* ═══ ELEMENT STYLES ═══ */
    .breathe { animation: breathe 4s ease-in-out infinite; }
    .flicker { animation: neonFlicker 4s ease-in-out infinite; }
    .glitch { animation: glitch1 5s ease-in-out infinite; }
    .glitch-red { animation: glitch2 5s ease-in-out infinite; }
    .cursor-blink { animation: cursorBlink 0.7s step-end infinite; }
    .ring-anim { animation: ringRotate 30s linear infinite; }
    .pulse-anim { animation: pulseGlow 3s ease-in-out infinite; }
    .dash-anim { animation: borderDash 3s linear infinite; }
    .dot-pulse { animation: dotPulse 2s ease-in-out infinite; }

    .type-line-1 { animation: typeLine1 15s infinite; }
    .type-line-2 { animation: typeLine2 15s infinite; }
    .type-line-3 { animation: typeLine3 15s infinite; }
    .type-line-4 { animation: typeLine4 15s infinite; }
    .type-line-5 { animation: typeLine5 15s infinite; }

    /* ═══ TERMINAL BOOT CLASSES ═══ */
    .boot-text { animation: bootText 12s ease-out infinite; }
    .boot-prompt { animation: bootPrompt 12s ease-out infinite; }
    .boot-typing { animation: bootTyping 12s ease-out infinite; }
    .text-glow { animation: textGlow 3s ease-in-out infinite; }
    .boot-cursor { animation: cursorMove 12s step-end infinite; }
    .boot-glow { animation: bootGlow 2s ease-in-out infinite; }
  </style>

  <!-- ═══ BACKGROUND LAYERS ═══ -->
  <rect width="1200" height="400" rx="8" fill="#080810"/>
  <rect width="1200" height="400" rx="8" fill="url(#grid)"/>
  <rect width="1200" height="400" rx="8" fill="url(#scanlines)"/>
  <rect width="1200" height="400" rx="8" fill="url(#noise)"/>

  <!-- Animated spotlight -->
  <circle cx="600" cy="200" r="500" fill="url(#spotlight)">
    <animate attributeName="r" values="450;550;450" dur="8s" repeatCount="indefinite"/>
    <animate attributeName="opacity" values="0.5;0.8;0.5" dur="8s" repeatCount="indefinite"/>
  </circle>

  <!-- Animated scan line -->
  <rect x="0" y="0" width="1200" height="3" fill="url(#scanGrad)" class="flicker">
    <animateTransform attributeName="transform" type="translate" values="0 -10;0 410" dur="6s" repeatCount="indefinite"/>
  </rect>

  <!-- ═══ CORNER BRACKETS ═══ -->
  <g class="flicker">
    <!-- Top left -->
    <path d="M 25 50 L 25 20 L 55 20" fill="none" stroke="#FF0040" stroke-width="1.5"/>
    <circle cx="25" cy="20" r="2" fill="#FF0040"/>

    <!-- Top right -->
    <path d="M 1175 50 L 1175 20 L 1145 20" fill="none" stroke="#FF0040" stroke-width="1.5"/>
    <circle cx="1175" cy="20" r="2" fill="#FF0040"/>

    <!-- Bottom left -->
    <path d="M 25 350 L 25 380 L 55 380" fill="none" stroke="#FF0040" stroke-width="1.5"/>
    <circle cx="25" cy="380" r="2" fill="#FF0040"/>

    <!-- Bottom right -->
    <path d="M 1175 350 L 1175 380 L 1145 380" fill="none" stroke="#FF0040" stroke-width="1.5"/>
    <circle cx="1175" cy="380" r="2" fill="#FF0040"/>
  </g>

  <!-- Animated border -->
  <rect x="3" y="3" width="1194" height="394" rx="6" fill="none" stroke="url(#neonGrad)" stroke-width="1" class="dash-anim" stroke-dasharray="10 5"/>

  <!-- ═══ LEFT: DEVELOPER CHARACTER ═══ -->
  <g class="breathe">
    <!-- Outer rotating ring -->
    <circle cx="195" cy="200" r="135" fill="none" stroke="#FF0040" stroke-width="0.8" stroke-dasharray="30 20" opacity="0.2" class="ring-anim"/>

    <!-- Glow ring -->
    <circle cx="195" cy="200" r="125" fill="none" stroke="#FF0040" stroke-width="25" opacity="0.04">
      <animate attributeName="r" values="120;130;120" dur="4s" repeatCount="indefinite"/>
    </circle>

    <!-- Inner breathing ring -->
    <circle cx="195" cy="200" r="118" fill="none" stroke="#FF0040" stroke-width="0.5" opacity="0.3" class="pulse-anim"/>

    <!-- Dark background -->
    <circle cx="195" cy="200" r="113" fill="#0a0a12" stroke="#1a0a15" stroke-width="0.5"/>

    <!-- Developer cartoon image -->
    <image x="70" y="78" width="250" height="250" preserveAspectRatio="xMidYMid slice" clip-path="url(#charClip)" href="data:MIME_PLACEHOLDER;base64,
'@

$svgPart1 = $svgPart1 -replace "MIME_PLACEHOLDER", $mime

# ── SVG PART 2: Everything after the base64 image data ──
$svgPart2 = @'
"/>

    <!-- Screen glow overlay -->
    <circle cx="195" cy="200" r="113" fill="none" stroke="#FF0040" stroke-width="2" opacity="0.05" class="pulse-anim"/>
  </g>

  <!-- ═══ TYPING CODE OVERLAY ═══ -->
  <g>
    <text x="70" y="145" font-family="'Fira Code', 'Courier New', monospace" font-size="5.5" fill="#FF6B8A" opacity="0" class="type-line-1">const dev = {</text>
    <text x="70" y="155" font-family="'Fira Code', 'Courier New', monospace" font-size="5.5" fill="#FF4A6A" opacity="0" class="type-line-2">  name: "Mathi",</text>
    <text x="70" y="165" font-family="'Fira Code', 'Courier New', monospace" font-size="5.5" fill="#FF6B8A" opacity="0" class="type-line-3">  role: "Builder",</text>
    <text x="70" y="175" font-family="'Fira Code', 'Courier New', monospace" font-size="5.5" fill="#FF4A6A" opacity="0" class="type-line-4">  mission: "Build"</text>
    <text x="70" y="185" font-family="'Fira Code', 'Courier New', monospace" font-size="5.5" fill="#FF6B8A" opacity="0" class="type-line-5">  system.ready()</text>

    <!-- Blinking cursor -->
    <rect x="68" y="140" width="5" height="8" fill="#FF0040" class="cursor-blink" opacity="0.6">
      <animate attributeName="y" values="140;140;148;148;156;156;164;164;172;172;180;180;140" dur="15s" repeatCount="indefinite"/>
    </rect>
  </g>

  <!-- Floating code symbols -->
  <text x="45" y="100" font-family="'Fira Code', monospace" font-size="12" fill="#FF0040" opacity="0.08">
    <animate attributeName="opacity" values="0.04;0.15;0.04" dur="4s" repeatCount="indefinite"/>
    &lt;/&gt;
  </text>
  <text x="320" y="140" font-family="'Fira Code', monospace" font-size="10" fill="#FF0040" opacity="0.06">
    <animate attributeName="opacity" values="0.03;0.12;0.03" dur="5s" repeatCount="indefinite" begin="1s"/>
    { }
  </text>
  <text x="55" y="320" font-family="'Fira Code', monospace" font-size="9" fill="#FF0040" opacity="0.07">
    <animate attributeName="opacity" values="0.03;0.1;0.03" dur="6s" repeatCount="indefinite" begin="2s"/>
    const
  </text>
  <text x="310" y="290" font-family="'Fira Code', monospace" font-size="10" fill="#FF0040" opacity="0.05">
    <animate attributeName="opacity" values="0.02;0.1;0.02" dur="5s" repeatCount="indefinite" begin="0.5s"/>
    return
  </text>

  <!-- ═══ VERTICAL DIVIDER ═══ -->
  <line x1="380" y1="70" x2="380" y2="330" stroke="url(#lineGrad)" stroke-width="0.6" class="pulse-anim"/>

  <!-- ═══ RIGHT: TERMINAL BOOT SEQUENCE ═══ -->

  <!-- ═══ LINE 1: SYSTEM ACCESS GRANTED ═══ -->
  <g class="boot-text">
    <!-- Glitch layer 1 -->
    <text x="780" y="120" text-anchor="middle" font-family="'Fira Code', 'Courier New', monospace" font-size="32" font-weight="bold" fill="#FF0000" letter-spacing="8" class="glitch" opacity="0.6" filter="url(#glowNeon)">
      SYSTEM ACCESS GRANTED
    </text>
    <!-- Main text with glow -->
    <text x="780" y="120" text-anchor="middle" font-family="'Fira Code', 'Courier New', monospace" font-size="32" font-weight="bold" fill="#FF0000" letter-spacing="8" class="text-glow" filter="url(#glowNeon)">
      SYSTEM ACCESS GRANTED
    </text>
  </g>

  <!-- ═══ LINE 2: AUTHORIZATION: SUCCESS ═══ -->
  <g class="boot-prompt">
    <text x="780" y="165" text-anchor="middle" font-family="'Fira Code', 'Courier New', monospace" font-size="18" fill="#FF0040" letter-spacing="4" class="boot-glow" filter="url(#glowText)">
      &gt; AUTHORIZATION: SUCCESS
    </text>
    <!-- Cursor for line 2 -->
    <rect x="985" y="152" width="8" height="14" fill="#FF0000" class="boot-cursor" opacity="0.8"/>
  </g>

  <!-- ═══ LINE 3: INITIALIZING DEV PROFILE ═══ -->
  <g class="boot-typing">
    <text x="780" y="205" text-anchor="middle" font-family="'Fira Code', 'Courier New', monospace" font-size="18" fill="#CC0000" letter-spacing="4" filter="url(#glowText)">
      &gt; INITIALIZING DEV PROFILE
    </text>
    <!-- Animated dots for typing effect -->
    <circle cx="990" cy="198" r="2" fill="#FF0000" class="dot-pulse"/>
    <circle cx="1000" cy="198" r="2" fill="#FF0000" class="dot-pulse">
      <animate attributeName="opacity" values="0.3;1;0.3" dur="1s" repeatCount="indefinite" begin="0.3s"/>
    </circle>
    <circle cx="1010" cy="198" r="2" fill="#FF0000" class="dot-pulse">
      <animate attributeName="opacity" values="0.3;1;0.3" dur="1s" repeatCount="indefinite" begin="0.6s"/>
    </circle>
  </g>

  <!-- Decorative lines -->
  <line x1="500" y1="235" x2="1060" y2="235" stroke="url(#lineGrad)" stroke-width="1" class="pulse-anim"/>

  <!-- ═══ SYSTEM STATUS ═══ -->
  <g>
    <text x="780" y="270" text-anchor="middle" font-family="'Fira Code', 'Courier New', monospace" font-size="11" fill="#8B0000" letter-spacing="3" opacity="0.6" class="flicker">
      NTL CYBERPUNK SYSTEM v2026.03
    </text>
  </g>

  <!-- ═══ STATUS PANELS ═══ -->

  <!-- Panel 1: System Online -->
  <g>
    <rect x="530" y="290" rx="4" width="200" height="40" fill="rgba(10,10,18,0.9)" stroke="#FF0040" stroke-width="0.6" opacity="0.8">
      <animate attributeName="stroke-opacity" values="0.3;0.8;0.3" dur="2.5s" repeatCount="indefinite"/>
    </rect>
    <circle cx="548" cy="308" r="3" fill="#FF0040" class="dot-pulse"/>
    <text x="560" y="311" font-family="'Fira Code', monospace" font-size="8" fill="#666" letter-spacing="2">STATUS</text>
    <text x="548" y="322" font-family="'Fira Code', monospace" font-size="11" fill="#FF0040" letter-spacing="1.5" class="flicker">
      &gt; SYSTEM ONLINE
    </text>
  </g>

  <!-- Panel 2: Always Building -->
  <g>
    <rect x="750" y="290" rx="4" width="200" height="40" fill="rgba(10,10,18,0.9)" stroke="#FF2080" stroke-width="0.6" opacity="0.8">
      <animate attributeName="stroke-opacity" values="0.3;0.8;0.3" dur="2.5s" repeatCount="indefinite" begin="1s"/>
    </rect>
    <circle cx="768" cy="308" r="3" fill="#FF2080" class="dot-pulse">
      <animate attributeName="fill" values="#FF2080;#FF0040;#FF2080" dur="2s" repeatCount="indefinite"/>
    </circle>
    <text x="780" y="311" font-family="'Fira Code', monospace" font-size="8" fill="#666" letter-spacing="2">BUILDING</text>
    <text x="768" y="322" font-family="'Fira Code', monospace" font-size="11" fill="#FF2080" letter-spacing="1.5" class="flicker">
      &gt; ALWAYS BUILDING
    </text>
  </g>

  <!-- ═══ BOTTOM BAR ═══ -->
  <line x1="420" y1="355" x2="1140" y2="355" stroke="#FF0040" stroke-width="0.4" stroke-dasharray="6 6" opacity="0.2">
    <animate attributeName="stroke-dashoffset" values="0;-36" dur="3s" repeatCount="indefinite"/>
  </line>

  <text x="780" y="375" text-anchor="middle" font-family="'Fira Code', monospace" font-size="8" fill="#333" letter-spacing="4">v2026.03 // NTL CYBERPUNK SYSTEM</text>

  <!-- Indicator dots -->
  <g>
    <circle cx="960" cy="372" r="1.5" fill="#FF0040" class="dot-pulse"/>
    <circle cx="970" cy="372" r="1.5" fill="#FF2080" class="dot-pulse">
      <animate attributeName="opacity" values="0.3;1;0.3" dur="2s" repeatCount="indefinite" begin="0.3s"/>
    </circle>
    <circle cx="980" cy="372" r="1.5" fill="#FF0040" class="dot-pulse">
      <animate attributeName="opacity" values="0.3;1;0.3" dur="2s" repeatCount="indefinite" begin="0.6s"/>
    </circle>
  </g>

  <!-- ═══ FLOATING PARTICLES ═══ -->
  <circle cx="420" cy="120" r="1.5" fill="#FF0040">
    <animate attributeName="opacity" values="0;0.5;0" dur="5s" repeatCount="indefinite"/>
    <animate attributeName="cy" values="120;100;120" dur="5s" repeatCount="indefinite"/>
    <animate attributeName="cx" values="420;430;420" dur="5s" repeatCount="indefinite"/>
  </circle>
  <circle cx="950" cy="300" r="1" fill="#FF2080">
    <animate attributeName="opacity" values="0;0.4;0" dur="6s" repeatCount="indefinite" begin="2s"/>
    <animate attributeName="cy" values="300;285;300" dur="6s" repeatCount="indefinite" begin="2s"/>
  </circle>
  <circle cx="1100" cy="150" r="1.5" fill="#FF0040">
    <animate attributeName="opacity" values="0;0.4;0" dur="7s" repeatCount="indefinite" begin="1s"/>
    <animate attributeName="cy" values="150;135;150" dur="7s" repeatCount="indefinite" begin="1s"/>
  </circle>
  <circle cx="600" cy="80" r="1" fill="#FF2080">
    <animate attributeName="opacity" values="0;0.3;0" dur="5s" repeatCount="indefinite" begin="3s"/>
    <animate attributeName="cy" values="80;68;80" dur="5s" repeatCount="indefinite" begin="3s"/>
  </circle>
  <circle cx="850" cy="350" r="1.2" fill="#FF0040">
    <animate attributeName="opacity" values="0;0.4;0" dur="6s" repeatCount="indefinite" begin="0.5s"/>
    <animate attributeName="cy" values="350;335;350" dur="6s" repeatCount="indefinite" begin="0.5s"/>
  </circle>

</svg>
'@

# ── Assemble final SVG ──
$fullSvg = $svgPart1 + $b64 + $svgPart2

# ── Write output ──
[System.IO.File]::WriteAllText("g:\github\MathiyazhaganNTL\assets\header.svg", $fullSvg, [System.Text.Encoding]::UTF8)

$sizeKB = [math]::Round($fullSvg.Length / 1024, 1)
Write-Host "OK - header.svg built successfully ($sizeKB KB)"