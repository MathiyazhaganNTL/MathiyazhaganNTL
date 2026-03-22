# ============================================================
# Build Script: Assembles the enhanced cyberpunk header SVG
# with base64-embedded developer cartoon image
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
    <!-- ═══ GRADIENTS ═══ -->
    <linearGradient id="borderGrad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="#FF0000">
        <animate attributeName="stop-color" values="#FF0000;#8B0000;#FF0000" dur="6s" repeatCount="indefinite"/>
      </stop>
      <stop offset="100%" stop-color="#8B0000">
        <animate attributeName="stop-color" values="#8B0000;#FF0000;#8B0000" dur="6s" repeatCount="indefinite"/>
      </stop>
    </linearGradient>

    <linearGradient id="nameGrad" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" stop-color="#FF0000">
        <animate attributeName="stop-color" values="#FF0000;#FF4444;#FF0000" dur="4s" repeatCount="indefinite"/>
      </stop>
      <stop offset="50%" stop-color="#FFFFFF"/>
      <stop offset="100%" stop-color="#FF0000">
        <animate attributeName="stop-color" values="#FF0000;#CC0000;#FF0000" dur="4s" repeatCount="indefinite"/>
      </stop>
    </linearGradient>

    <linearGradient id="lineGrad" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" stop-color="#FF0000" stop-opacity="0"/>
      <stop offset="50%" stop-color="#FF0000" stop-opacity="0.6"/>
      <stop offset="100%" stop-color="#FF0000" stop-opacity="0"/>
    </linearGradient>

    <!-- ═══ GLOW FILTERS ═══ -->
    <filter id="glowTitle" x="-30%" y="-30%" width="160%" height="160%">
      <feGaussianBlur stdDeviation="4" result="blur"/>
      <feFlood flood-color="#FF0000" flood-opacity="0.5" result="color"/>
      <feComposite in="color" in2="blur" operator="in" result="glow"/>
      <feMerge>
        <feMergeNode in="glow"/>
        <feMergeNode in="glow"/>
        <feMergeNode in="SourceGraphic"/>
      </feMerge>
    </filter>

    <filter id="glowSoft" x="-30%" y="-30%" width="160%" height="160%">
      <feGaussianBlur stdDeviation="2.5" result="blur"/>
      <feFlood flood-color="#FF0000" flood-opacity="0.3" result="color"/>
      <feComposite in="color" in2="blur" operator="in" result="glow"/>
      <feMerge>
        <feMergeNode in="glow"/>
        <feMergeNode in="SourceGraphic"/>
      </feMerge>
    </filter>

    <filter id="glowRing" x="-40%" y="-40%" width="180%" height="180%">
      <feGaussianBlur stdDeviation="6" result="blur"/>
      <feFlood flood-color="#FF0000" flood-opacity="0.4" result="color"/>
      <feComposite in="color" in2="blur" operator="in" result="glow"/>
      <feMerge>
        <feMergeNode in="glow"/>
        <feMergeNode in="glow"/>
        <feMergeNode in="SourceGraphic"/>
      </feMerge>
    </filter>

    <filter id="screenFlicker" x="0%" y="0%" width="100%" height="100%">
      <feFlood flood-color="#FF0000" flood-opacity="0.08" result="color"/>
      <feComposite in="color" in2="SourceGraphic" operator="in" result="tint"/>
      <feMerge>
        <feMergeNode in="SourceGraphic"/>
        <feMergeNode in="tint"/>
      </feMerge>
    </filter>

    <!-- ═══ PATTERNS ═══ -->
    <pattern id="grid" width="50" height="50" patternUnits="userSpaceOnUse">
      <path d="M 50 0 L 0 0 0 50" fill="none" stroke="rgba(255,0,0,0.03)" stroke-width="0.5"/>
    </pattern>

    <pattern id="scanlines" width="4" height="4" patternUnits="userSpaceOnUse">
      <rect width="4" height="1" fill="rgba(255,255,255,0.008)"/>
    </pattern>

    <!-- ═══ CLIP PATHS ═══ -->
    <clipPath id="charClip">
      <circle cx="195" cy="200" r="120"/>
    </clipPath>

    <clipPath id="screenClip">
      <rect x="110" y="120" width="170" height="120" rx="6"/>
    </clipPath>
  </defs>

  <style>
    /* ── Character Animations ── */
    @keyframes breathe {
      0%, 100% { transform: translateY(0); }
      50% { transform: translateY(-4px); }
    }
    @keyframes ringRotate {
      0% { stroke-dashoffset: 0; }
      100% { stroke-dashoffset: -754; }
    }
    @keyframes ringPulse {
      0%, 100% { opacity: 0.2; }
      50% { opacity: 0.5; }
    }
    @keyframes screenGlow {
      0%, 100% { opacity: 0.03; }
      30% { opacity: 0.08; }
      60% { opacity: 0.04; }
      90% { opacity: 0.1; }
    }

    /* ── Typing Cursor ── */
    @keyframes cursorBlink {
      0%, 100% { opacity: 1; }
      50% { opacity: 0; }
    }

    /* ── Code Line Typing ── */
    @keyframes typeLine1 {
      0%, 5% { opacity: 0; }
      6%, 100% { opacity: 0.7; }
    }
    @keyframes typeLine2 {
      0%, 18% { opacity: 0; }
      19%, 100% { opacity: 0.7; }
    }
    @keyframes typeLine3 {
      0%, 31% { opacity: 0; }
      32%, 100% { opacity: 0.7; }
    }
    @keyframes typeLine4 {
      0%, 44% { opacity: 0; }
      45%, 100% { opacity: 0.7; }
    }
    @keyframes typeLine5 {
      0%, 57% { opacity: 0; }
      58%, 100% { opacity: 0.7; }
    }
    @keyframes typeLine6 {
      0%, 70% { opacity: 0; }
      71%, 100% { opacity: 0.7; }
    }
    @keyframes typeLine7 {
      0%, 83% { opacity: 0; }
      84%, 95% { opacity: 0.7; }
      96%, 100% { opacity: 0; }
    }
    @keyframes typingCursorMove {
      0%, 5% { cy: 148; }
      6%, 18% { cy: 156; }
      19%, 31% { cy: 164; }
      32%, 44% { cy: 172; }
      45%, 57% { cy: 180; }
      58%, 70% { cy: 188; }
      71%, 83% { cy: 196; }
      84%, 100% { cy: 148; }
    }

    /* ── Title Glitch ── */
    @keyframes glitchFlicker {
      0%, 85%, 100% { opacity: 0; transform: translateX(0); }
      86% { opacity: 0.6; transform: translateX(-2px); }
      88% { opacity: 0.4; transform: translateX(3px); }
      90% { opacity: 0.7; transform: translateX(-1px); }
      92% { opacity: 0; transform: translateX(0); }
    }

    /* ── Subtitle Typing ── */
    @keyframes typeReveal {
      0% { width: 0; }
      60% { width: 360; }
      100% { width: 360; }
    }

    /* ── Status Indicators ── */
    @keyframes dotPulse {
      0%, 100% { opacity: 0.3; r: 3; }
      50% { opacity: 1; r: 3.5; }
    }

    /* ── Scan Line ── */
    @keyframes scanMove {
      0% { transform: translateY(-400px); }
      100% { transform: translateY(400px); }
    }

    /* ── Border Glow ── */
    @keyframes borderPulse {
      0%, 100% { stroke-opacity: 0.3; }
      50% { stroke-opacity: 0.7; }
    }

    /* ── Floating Particles ── */
    @keyframes particleFloat {
      0%, 100% { opacity: 0; transform: translateY(0); }
      30% { opacity: 0.5; }
      70% { opacity: 0.3; }
      100% { transform: translateY(-20px); }
    }

    .breathe { animation: breathe 4s ease-in-out infinite; }
    .cursor-blink { animation: cursorBlink 0.8s step-end infinite; }
    .glitch { animation: glitchFlicker 6s ease-in-out infinite; }
  </style>

  <!-- ══════════════════════════════════════════════ -->
  <!-- ═══ BACKGROUND LAYER ═══ -->
  <!-- ══════════════════════════════════════════════ -->
  <rect width="1200" height="400" rx="10" fill="#0a0a0f"/>
  <rect width="1200" height="400" rx="10" fill="url(#grid)"/>
  <rect width="1200" height="400" rx="10" fill="url(#scanlines)"/>

  <!-- Animated border -->
  <rect x="1" y="1" width="1198" height="398" rx="10" fill="none" stroke="url(#borderGrad)" stroke-width="1.5">
    <animate attributeName="stroke-opacity" values="0.3;0.7;0.3" dur="4s" repeatCount="indefinite"/>
  </rect>

  <!-- Subtle horizontal scan line sweeping down -->
  <rect x="0" y="0" width="1200" height="1" fill="#FF0000" opacity="0.08">
    <animateTransform attributeName="transform" type="translate" values="0 0;0 400" dur="8s" repeatCount="indefinite"/>
  </rect>

  <!-- ══════════════════════════════════════════════ -->
  <!-- ═══ CORNER BRACKETS ═══ -->
  <!-- ══════════════════════════════════════════════ -->
  <g opacity="0.5">
    <path d="M 18 30 L 18 16 L 40 16" fill="none" stroke="#FF0000" stroke-width="1.2">
      <animate attributeName="opacity" values="0.3;0.8;0.3" dur="3s" repeatCount="indefinite"/>
    </path>
    <path d="M 1182 30 L 1182 16 L 1160 16" fill="none" stroke="#FF0000" stroke-width="1.2">
      <animate attributeName="opacity" values="0.3;0.8;0.3" dur="3s" repeatCount="indefinite" begin="0.5s"/>
    </path>
    <path d="M 18 370 L 18 384 L 40 384" fill="none" stroke="#FF0000" stroke-width="1.2">
      <animate attributeName="opacity" values="0.3;0.8;0.3" dur="3s" repeatCount="indefinite" begin="1s"/>
    </path>
    <path d="M 1182 370 L 1182 384 L 1160 384" fill="none" stroke="#FF0000" stroke-width="1.2">
      <animate attributeName="opacity" values="0.3;0.8;0.3" dur="3s" repeatCount="indefinite" begin="1.5s"/>
    </path>
    <!-- Corner dots -->
    <circle cx="18" cy="16" r="1.5" fill="#FF0000">
      <animate attributeName="opacity" values="0.4;1;0.4" dur="3s" repeatCount="indefinite"/>
    </circle>
    <circle cx="1182" cy="16" r="1.5" fill="#FF0000">
      <animate attributeName="opacity" values="0.4;1;0.4" dur="3s" repeatCount="indefinite" begin="0.5s"/>
    </circle>
    <circle cx="18" cy="384" r="1.5" fill="#FF0000">
      <animate attributeName="opacity" values="0.4;1;0.4" dur="3s" repeatCount="indefinite" begin="1s"/>
    </circle>
    <circle cx="1182" cy="384" r="1.5" fill="#FF0000">
      <animate attributeName="opacity" values="0.4;1;0.4" dur="3s" repeatCount="indefinite" begin="1.5s"/>
    </circle>
  </g>

  <!-- ══════════════════════════════════════════════ -->
  <!-- ═══ LEFT: DEVELOPER CHARACTER ═══ -->
  <!-- ══════════════════════════════════════════════ -->
  <g class="breathe">
    <!-- Outer glow ring (rotating dashes) -->
    <circle cx="195" cy="200" r="130" fill="none" stroke="#FF0000" stroke-width="1" stroke-dasharray="20 15" opacity="0.25" filter="url(#glowRing)">
      <animateTransform attributeName="transform" type="rotate" values="0 195 200;360 195 200" dur="20s" repeatCount="indefinite"/>
    </circle>

    <!-- Inner breathing ring -->
    <circle cx="195" cy="200" r="122" fill="none" stroke="#FF0000" stroke-width="0.6" opacity="0.15">
      <animate attributeName="r" values="120;124;120" dur="4s" repeatCount="indefinite"/>
      <animate attributeName="opacity" values="0.1;0.3;0.1" dur="4s" repeatCount="indefinite"/>
    </circle>

    <!-- Dark background circle -->
    <circle cx="195" cy="200" r="118" fill="#0a0a0f" stroke="#1a0a0a" stroke-width="0.5"/>

    <!-- Radial red ambient glow -->
    <circle cx="195" cy="200" r="115" fill="none" stroke="#FF0000" stroke-width="30" opacity="0.03">
      <animate attributeName="opacity" values="0.02;0.06;0.02" dur="5s" repeatCount="indefinite"/>
    </circle>

    <!-- Developer cartoon image -->
    <image x="75" y="82" width="240" height="240" preserveAspectRatio="xMidYMid slice" clip-path="url(#charClip)" href="data:MIME_PLACEHOLDER;base64,
'@

$svgPart1 = $svgPart1 -replace "MIME_PLACEHOLDER", $mime

# ── SVG PART 2: Everything after the base64 image data ──
$svgPart2 = @'
"/>

    <!-- Screen glow overlay (simulates screen flickering on the character) -->
    <rect x="130" y="170" width="80" height="55" rx="3" fill="#FF0000" opacity="0.03">
      <animate attributeName="opacity" values="0.01;0.06;0.02;0.05;0.01" dur="3s" repeatCount="indefinite"/>
    </rect>
  </g>

  <!-- ═══ TYPING CODE OVERLAY (near character's laptop area) ═══ -->
  <g opacity="0.6">
    <!-- Simulated code lines appearing one by one -->
    <text x="88" y="148" font-family="'Courier New', monospace" font-size="6" fill="#FF4444" opacity="0">
      <animate attributeName="opacity" values="0;0.7;0.7;0.7;0.7;0.7;0.7;0" dur="12s" repeatCount="indefinite"/>
      const dev = new Dev();
    </text>
    <text x="88" y="156" font-family="'Courier New', monospace" font-size="6" fill="#FF6666" opacity="0">
      <animate attributeName="opacity" values="0;0;0.7;0.7;0.7;0.7;0.7;0" dur="12s" repeatCount="indefinite"/>
      dev.name = "Mathi";
    </text>
    <text x="88" y="164" font-family="'Courier New', monospace" font-size="6" fill="#FF4444" opacity="0">
      <animate attributeName="opacity" values="0;0;0;0.7;0.7;0.7;0.7;0" dur="12s" repeatCount="indefinite"/>
      dev.role = "Builder";
    </text>
    <text x="88" y="172" font-family="'Courier New', monospace" font-size="6" fill="#CC3333" opacity="0">
      <animate attributeName="opacity" values="0;0;0;0;0.7;0.7;0.7;0" dur="12s" repeatCount="indefinite"/>
      dev.init();
    </text>
    <text x="88" y="180" font-family="'Courier New', monospace" font-size="6" fill="#FF4444" opacity="0">
      <animate attributeName="opacity" values="0;0;0;0;0;0.7;0.7;0" dur="12s" repeatCount="indefinite"/>
      // System Online ✓
    </text>

    <!-- Blinking typing cursor that moves down -->
    <rect x="88" y="145" width="4" height="7" fill="#FF0000" opacity="0.6">
      <animate attributeName="y" values="143;143;151;151;159;159;167;167;175;175;143" dur="12s" repeatCount="indefinite"/>
      <animate attributeName="opacity" values="0.8;0;0.8;0;0.8;0;0.8;0;0.8;0;0.8" dur="1s" repeatCount="indefinite"/>
    </rect>
  </g>

  <!-- ═══ Floating code symbols around character ═══ -->
  <text x="60" y="90" font-family="'Courier New', monospace" font-size="10" fill="#FF0000" opacity="0.1">
    <animate attributeName="opacity" values="0.05;0.2;0.05" dur="5s" repeatCount="indefinite"/>
    <animate attributeName="y" values="90;82;90" dur="5s" repeatCount="indefinite"/>
    &lt;/&gt;
  </text>
  <text x="290" y="120" font-family="'Courier New', monospace" font-size="9" fill="#FF0000" opacity="0.08">
    <animate attributeName="opacity" values="0.04;0.15;0.04" dur="6s" repeatCount="indefinite" begin="1s"/>
    <animate attributeName="y" values="120;113;120" dur="6s" repeatCount="indefinite" begin="1s"/>
    { }
  </text>
  <text x="75" y="330" font-family="'Courier New', monospace" font-size="8" fill="#FF0000" opacity="0.08">
    <animate attributeName="opacity" values="0.04;0.15;0.04" dur="7s" repeatCount="indefinite" begin="2s"/>
    <animate attributeName="y" values="330;324;330" dur="7s" repeatCount="indefinite" begin="2s"/>
    //
  </text>
  <text x="300" y="300" font-family="'Courier New', monospace" font-size="9" fill="#FF0000" opacity="0.06">
    <animate attributeName="opacity" values="0.03;0.12;0.03" dur="5.5s" repeatCount="indefinite" begin="0.5s"/>
    <animate attributeName="y" values="300;294;300" dur="5.5s" repeatCount="indefinite" begin="0.5s"/>
    [ ]
  </text>

  <!-- ══════════════════════════════════════════════ -->
  <!-- ═══ VERTICAL DIVIDER LINE ═══ -->
  <!-- ══════════════════════════════════════════════ -->
  <line x1="370" y1="60" x2="370" y2="340" stroke="url(#lineGrad)" stroke-width="0.5" opacity="0.4">
    <animate attributeName="opacity" values="0.2;0.5;0.2" dur="5s" repeatCount="indefinite"/>
  </line>

  <!-- ══════════════════════════════════════════════ -->
  <!-- ═══ RIGHT: TEXT CONTENT ═══ -->
  <!-- ══════════════════════════════════════════════ -->

  <!-- ═══ MAIN TITLE ═══ -->
  <!-- Glitch layer (red shift) -->
  <text x="770" y="140" text-anchor="middle" font-family="'Courier New', 'Fira Code', monospace" font-size="44" font-weight="bold" fill="#FF0000" letter-spacing="3" class="glitch">
    MATHIYAZHAGAN NTL
  </text>
  <!-- Glitch layer (dark shift) -->
  <text x="770" y="140" text-anchor="middle" font-family="'Courier New', 'Fira Code', monospace" font-size="44" font-weight="bold" fill="#330000" letter-spacing="3" class="glitch" style="animation-delay: 0.1s">
    MATHIYAZHAGAN NTL
  </text>
  <!-- Main visible title -->
  <text x="770" y="140" text-anchor="middle" font-family="'Courier New', 'Fira Code', monospace" font-size="44" font-weight="bold" fill="url(#nameGrad)" filter="url(#glowTitle)" letter-spacing="3">
    MATHIYAZHAGAN NTL
  </text>

  <!-- ═══ SUBTITLE with typing animation ═══ -->
  <g>
    <!-- Subtitle text revealed by expanding clip -->
    <text x="770" y="185" text-anchor="middle" font-family="'Courier New', 'Fira Code', monospace" font-size="16" fill="#8B0000" filter="url(#glowSoft)" letter-spacing="5" opacity="0.85">
      <animate attributeName="opacity" values="0.6;1;0.6" dur="4s" repeatCount="indefinite"/>
      SILENT THUNDER DEVELOPER
    </text>
    <!-- Blinking cursor after subtitle -->
    <rect x="955" y="172" width="8" height="14" fill="#FF0000" class="cursor-blink" opacity="0.7"/>
  </g>

  <!-- ═══ DECORATIVE LINE ═══ -->
  <line x1="520" y1="205" x2="1020" y2="205" stroke="url(#lineGrad)" stroke-width="0.8" opacity="0.4">
    <animate attributeName="opacity" values="0.2;0.5;0.2" dur="4s" repeatCount="indefinite"/>
  </line>

  <!-- ═══ TAGLINE ═══ -->
  <text x="770" y="235" text-anchor="middle" font-family="'Courier New', 'Fira Code', monospace" font-size="13" fill="#CC0000" letter-spacing="3" opacity="0.6">
    <animate attributeName="opacity" values="0.4;0.7;0.4" dur="5s" repeatCount="indefinite"/>
    NEXT TO LEARN FOR YOUR FUTURE
  </text>

  <!-- ══════════════════════════════════════════════ -->
  <!-- ═══ STATUS PANELS ═══ -->
  <!-- ══════════════════════════════════════════════ -->

  <!-- System Online panel -->
  <g>
    <rect x="540" y="265" rx="4" width="195" height="42" fill="rgba(10,10,15,0.8)" stroke="#FF0000" stroke-width="0.5" opacity="0.7">
      <animate attributeName="stroke-opacity" values="0.2;0.6;0.2" dur="3s" repeatCount="indefinite"/>
    </rect>
    <!-- Green status dot -->
    <circle cx="554" cy="280" r="3" fill="#FF0000">
      <animate attributeName="opacity" values="0.3;1;0.3" dur="2s" repeatCount="indefinite"/>
      <animate attributeName="r" values="2.5;3.5;2.5" dur="2s" repeatCount="indefinite"/>
    </circle>
    <text x="564" y="283" font-family="'Courier New', monospace" font-size="9" fill="#666" letter-spacing="1.5">STATUS</text>
    <text x="554" y="298" font-family="'Courier New', monospace" font-size="11" fill="#FF0000" letter-spacing="1" opacity="0.9">
      <animate attributeName="opacity" values="0.6;1;0.6" dur="3s" repeatCount="indefinite"/>
      $ SYSTEM ONLINE
    </text>
  </g>

  <!-- Always Building panel -->
  <g>
    <rect x="755" y="265" rx="4" width="210" height="42" fill="rgba(10,10,15,0.8)" stroke="#8B0000" stroke-width="0.5" opacity="0.7">
      <animate attributeName="stroke-opacity" values="0.2;0.6;0.2" dur="3s" repeatCount="indefinite" begin="1s"/>
    </rect>
    <circle cx="769" cy="280" r="3" fill="#DC143C">
      <animate attributeName="opacity" values="0.3;1;0.3" dur="2s" repeatCount="indefinite" begin="0.5s"/>
      <animate attributeName="r" values="2.5;3.5;2.5" dur="2s" repeatCount="indefinite" begin="0.5s"/>
    </circle>
    <text x="779" y="283" font-family="'Courier New', monospace" font-size="9" fill="#666" letter-spacing="1.5">BUILD</text>
    <text x="769" y="298" font-family="'Courier New', monospace" font-size="11" fill="#DC143C" letter-spacing="1" opacity="0.9">
      <animate attributeName="opacity" values="0.6;1;0.6" dur="3s" repeatCount="indefinite" begin="0.5s"/>
      $ ALWAYS BUILDING
    </text>
  </g>

  <!-- ══════════════════════════════════════════════ -->
  <!-- ═══ BOTTOM BAR ═══ -->
  <!-- ══════════════════════════════════════════════ -->

  <!-- Thin animated dashed line -->
  <line x1="400" y1="340" x2="1140" y2="340" stroke="#FF0000" stroke-width="0.4" stroke-dasharray="8 8" opacity="0.15">
    <animate attributeName="stroke-dashoffset" values="0;-48" dur="4s" repeatCount="indefinite"/>
  </line>

  <!-- Bottom info -->
  <text x="770" y="370" text-anchor="middle" font-family="'Courier New', monospace" font-size="9" fill="#222" letter-spacing="3">v2026.03 // CYBERPUNK PROFILE SYSTEM</text>

  <!-- Blinking indicator dots -->
  <g>
    <circle cx="950" cy="367" r="1.5" fill="#FF0000">
      <animate attributeName="opacity" values="0;1;0" dur="1.5s" repeatCount="indefinite"/>
    </circle>
    <circle cx="958" cy="367" r="1.5" fill="#CC0000">
      <animate attributeName="opacity" values="0;1;0" dur="1.5s" repeatCount="indefinite" begin="0.3s"/>
    </circle>
    <circle cx="966" cy="367" r="1.5" fill="#880000">
      <animate attributeName="opacity" values="0;1;0" dur="1.5s" repeatCount="indefinite" begin="0.6s"/>
    </circle>
  </g>

  <!-- ══════════════════════════════════════════════ -->
  <!-- ═══ SUBTLE FLOATING PARTICLES ═══ -->
  <!-- ══════════════════════════════════════════════ -->
  <circle cx="450" cy="100" r="1.5" fill="#FF0000">
    <animate attributeName="opacity" values="0;0.4;0" dur="6s" repeatCount="indefinite"/>
    <animate attributeName="cy" values="100;85;100" dur="6s" repeatCount="indefinite"/>
  </circle>
  <circle cx="900" cy="330" r="1" fill="#FF0000">
    <animate attributeName="opacity" values="0;0.3;0" dur="5s" repeatCount="indefinite" begin="2s"/>
    <animate attributeName="cy" values="330;318;330" dur="5s" repeatCount="indefinite" begin="2s"/>
  </circle>
  <circle cx="1100" cy="150" r="1.5" fill="#CC0000">
    <animate attributeName="opacity" values="0;0.35;0" dur="7s" repeatCount="indefinite" begin="1s"/>
    <animate attributeName="cy" values="150;138;150" dur="7s" repeatCount="indefinite" begin="1s"/>
  </circle>
  <circle cx="650" cy="60" r="1" fill="#FF0000">
    <animate attributeName="opacity" values="0;0.3;0" dur="5.5s" repeatCount="indefinite" begin="3s"/>
    <animate attributeName="cy" values="60;50;60" dur="5.5s" repeatCount="indefinite" begin="3s"/>
  </circle>

</svg>
'@

# ── Assemble final SVG ──
$fullSvg = $svgPart1 + $b64 + $svgPart2

# ── Write output ──
[System.IO.File]::WriteAllText("g:\github\MathiyazhaganNTL\assets\header.svg", $fullSvg, [System.Text.Encoding]::UTF8)

$sizeKB = [math]::Round($fullSvg.Length / 1024, 1)
Write-Host "OK - header.svg built successfully ($sizeKB KB)"
