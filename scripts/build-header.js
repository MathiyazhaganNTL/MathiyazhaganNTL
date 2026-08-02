const fs = require('fs');
const path = require('path');

const photoPath = path.join(__dirname, '../assets/avatar-opt.jpg');
const bgPath = path.join(__dirname, '../assets/header-bg.jpg');
const outputPath = path.join(__dirname, '../assets/header.svg');

const photoB64 = fs.readFileSync(photoPath).toString('base64');
const bgB64 = fs.readFileSync(bgPath).toString('base64');

const svgContent = `<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="100%" viewBox="0 0 1200 520" fill="none">
  <defs>
    <style>
      @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&amp;display=swap');
      
      * { font-family: 'Inter', system-ui, -apple-system, sans-serif; }
      .name { font-weight: 800; font-size: 38px; fill: #0f172a; letter-spacing: -0.6px; }
      .title { font-weight: 600; font-size: 16.5px; fill: #2563eb; letter-spacing: 0.1px; }
      .bio { font-weight: 400; font-size: 14.5px; fill: #334155; line-height: 1.5; }
      .contact-text { font-weight: 500; font-size: 12.5px; fill: #475569; }
      
      .working-header { font-weight: 700; font-size: 14.5px; fill: #0f172a; letter-spacing: 0.8px; }
      .working-item { font-weight: 500; font-size: 14px; fill: #334155; }
      
      .stat-val { font-weight: 800; font-size: 20px; fill: #0f172a; }
      .stat-label { font-weight: 500; font-size: 12px; fill: #64748b; }
    </style>

    <filter id="card-shadow" x="-2%" y="-2%" width="104%" height="104%">
      <feDropShadow dx="0" dy="4" stdDeviation="12" flood-color="#0f172a" flood-opacity="0.08"/>
    </filter>

    <clipPath id="card-clip">
      <rect x="10" y="10" width="1180" height="500" rx="16" />
    </clipPath>

    <clipPath id="avatar-clip">
      <circle cx="170" cy="195" r="105" />
    </clipPath>
  </defs>

  <!-- Outer Card Shadow & Border Container -->
  <rect x="10" y="10" width="1180" height="500" rx="16" fill="#ffffff" filter="url(#card-shadow)" stroke="#cbd5e1" stroke-width="1.5" />

  <!-- 100% Full Visibility Finspark Background Image -->
  <g clip-path="url(#card-clip)">
    <image href="data:image/jpeg;base64,${bgB64}" x="10" y="10" width="1180" height="500" preserveAspectRatio="xMidYMid slice" opacity="1.0" />
  </g>

  <!-- Elegant Semi-Translucent Glass Panel for Optimal Legibility while keeping Finspark Background vibrant -->
  <rect x="25" y="25" width="1150" height="470" rx="12" fill="#ffffff" fill-opacity="0.68" stroke="#ffffff" stroke-width="1" />

  <!-- ==================== LEFT COLUMN: PROFILE PHOTO ==================== -->
  <!-- Outer Accent Ring -->
  <circle cx="170" cy="195" r="109" fill="none" stroke="#2563eb" stroke-width="3.5" />
  <circle cx="170" cy="195" r="106" fill="#ffffff" />

  <!-- Profile Image from Black_court_Mathi.png -->
  <image href="data:image/jpeg;base64,${photoB64}" x="65" y="90" width="210" height="210" clip-path="url(#avatar-clip)" preserveAspectRatio="xMidYMid slice" />

  <!-- ==================== MIDDLE COLUMN: BIO & DETAILS ==================== -->
  <text x="315" y="105" class="name">Mathiyazhagan T</text>
  <text x="315" y="138" class="title">Software Developer | AI Engineer | Full Stack Developer | R&amp;D</text>
  
  <!-- Accent Line -->
  <rect x="315" y="154" width="45" height="3" rx="1.5" fill="#2563eb" />

  <!-- Bio Paragraph -->
  <text x="315" y="188" class="bio">Building production-grade AI systems, intelligent automation,</text>
  <text x="315" y="210" class="bio">modern web applications, and developer tools.</text>
  <text x="315" y="232" class="bio">Focused on solving real-world problems with scalable,</text>
  <text x="315" y="254" class="bio">efficient, and user-centric solutions.</text>

  <!-- Contact Information Grid (2 Balanced Rows - NO OVERLAP) -->
  <g transform="translate(315, 278)">
    <!-- Row 1: Location & Email -->
    <g transform="translate(0, 0)">
      <rect x="-4" y="-3" width="92" height="22" rx="4" fill="#ffffff" fill-opacity="0.8" stroke="#cbd5e1" stroke-width="0.8"/>
      <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5z" fill="#64748b" transform="scale(0.8) translate(2, -3)"/>
      <text x="22" y="12" class="contact-text">India</text>
    </g>

    <g transform="translate(105, 0)">
      <rect x="-4" y="-3" width="195" height="22" rx="4" fill="#ffffff" fill-opacity="0.8" stroke="#cbd5e1" stroke-width="0.8"/>
      <path d="M20 4H4c-1.1 0-1.99.9-1.99 2L2 18c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z" fill="#2563eb" transform="scale(0.75) translate(2, -2)"/>
      <text x="24" y="12" class="contact-text">mathiyazhaganntl@gmail.com</text>
    </g>

    <!-- Row 2: Portfolio & LinkedIn -->
    <g transform="translate(0, 28)">
      <rect x="-4" y="-3" width="165" height="22" rx="4" fill="#ffffff" fill-opacity="0.8" stroke="#cbd5e1" stroke-width="0.8"/>
      <path d="M3.9 12c0-1.71 1.39-3.1 3.1-3.1h4V7H7c-2.76 0-5 2.24-5 5s2.24 5 5 5h4v-1.9H7c-1.71 0-3.1-1.39-3.1-3.1zM8 13h8v-2H8v2zm9-6h-4v1.9h4c1.71 0 3.1 1.39 3.1 3.1s-1.39 3.1-3.1 3.1h-4V17h4c2.76 0 5-2.24 5-5s-2.24-5-5-5z" fill="#64748b" transform="scale(0.75) translate(2, -2)"/>
      <text x="24" y="12" class="contact-text">mathintlportfolio.dev</text>
    </g>

    <g transform="translate(178, 28)">
      <rect x="-4" y="-3" width="225" height="22" rx="4" fill="#ffffff" fill-opacity="0.8" stroke="#cbd5e1" stroke-width="0.8"/>
      <rect x="2" y="-1" width="16" height="16" rx="3" fill="#0077b5" />
      <text x="6" y="11" font-size="10" font-weight="700" fill="#ffffff">in</text>
      <text x="24" y="12" class="contact-text">linkedin.com/in/mathiyazhagan-ntl</text>
    </g>
  </g>

  <!-- ==================== VERTICAL SEPARATOR ==================== -->
  <line x1="835" y1="65" x2="835" y2="335" stroke="#cbd5e1" stroke-width="1.5" />

  <!-- ==================== RIGHT COLUMN: CURRENTLY WORKING ON ==================== -->
  <g transform="translate(865, 70)">
    <text x="0" y="32" class="working-header">&lt;/&gt;  CURRENTLY WORKING ON</text>
    
    <circle cx="6" cy="74" r="3.5" fill="#2563eb" />
    <text x="20" y="78" class="working-item">AI-Powered Workflow Automation</text>

    <circle cx="6" cy="114" r="3.5" fill="#2563eb" />
    <text x="20" y="118" class="working-item">LLM-based Enterprise Applications</text>

    <circle cx="6" cy="154" r="3.5" fill="#2563eb" />
    <text x="20" y="158" class="working-item">AI Agents &amp; RAG Systems</text>

    <circle cx="6" cy="194" r="3.5" fill="#2563eb" />
    <text x="20" y="198" class="working-item">React + FastAPI Production Systems</text>

    <circle cx="6" cy="234" r="3.5" fill="#2563eb" />
    <text x="20" y="238" class="working-item">Databricks &amp; Cloud Research</text>
  </g>

  <!-- ==================== BOTTOM HORIZONTAL SEPARATOR ==================== -->
  <line x1="45" y1="365" x2="1155" y2="365" stroke="#cbd5e1" stroke-width="1.5" />

  <!-- ==================== BOTTOM STATS BAR ==================== -->
  <g transform="translate(45, 385)">
    <!-- Stat 1: Repositories -->
    <g transform="translate(40, 15)">
      <path d="M4 6H2v14c0 1.1.9 2 2 2h14v-2H4V6zm16-4H8c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm0 14H8V4h12v12z" fill="#2563eb" transform="scale(0.9) translate(-28, -5)"/>
      <g transform="translate(24, 0)">
        <text x="0" y="16" class="stat-val">50+</text>
        <text x="0" y="34" class="stat-label">Repositories</text>
      </g>
    </g>

    <line x1="240" y1="15" x2="240" y2="60" stroke="#e2e8f0" stroke-width="2" />

    <!-- Stat 2: GitHub Stars -->
    <g transform="translate(270, 15)">
      <path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z" fill="#2563eb" transform="scale(0.9) translate(-28, -5)"/>
      <g transform="translate(24, 0)">
        <text x="0" y="16" class="stat-val">500+</text>
        <text x="0" y="34" class="stat-label">GitHub Stars</text>
      </g>
    </g>

    <line x1="470" y1="15" x2="470" y2="60" stroke="#e2e8f0" stroke-width="2" />

    <!-- Stat 3: Contributors -->
    <g transform="translate(500, 15)">
      <path d="M16 11c1.66 0 2.99-1.34 2.99-3S17.66 5 16 5c-1.66 0-3 1.34-3 3s1.34 3 3 3zm-8 0c1.66 0 2.99-1.34 2.99-3S9.66 5 8 5C6.34 5 5 6.34 5 8s1.34 3 3 3zm0 2c-2.33 0-7 1.17-7 3.5V19h14v-2.5c0-2.33-4.67-3.5-7-3.5zm8 0c-.29 0-.62.02-.97.05 1.16.84 1.97 1.97 1.97 3.45V19h6v-2.5c0-2.33-4.67-3.5-7-3.5z" fill="#2563eb" transform="scale(0.9) translate(-28, -5)"/>
      <g transform="translate(24, 0)">
        <text x="0" y="16" class="stat-val">20+</text>
        <text x="0" y="34" class="stat-label">Contributors</text>
      </g>
    </g>

    <line x1="700" y1="15" x2="700" y2="60" stroke="#e2e8f0" stroke-width="2" />

    <!-- Stat 4: Years of Experience -->
    <g transform="translate(730, 15)">
      <path d="M11.99 2C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2:11.99 2zM12 20c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8zm.5-13H11v6l5.25 3.15.75-1.23-4.5-2.67z" fill="#2563eb" transform="scale(0.9) translate(-28, -5)"/>
      <g transform="translate(24, 0)">
        <text x="0" y="16" class="stat-val">3+</text>
        <text x="0" y="34" class="stat-label">Years of Experience</text>
      </g>
    </g>

    <line x1="930" y1="15" x2="930" y2="60" stroke="#e2e8f0" stroke-width="2" />

    <!-- Stat 5: Commitment -->
    <g transform="translate(960, 15)">
      <path d="M12 2C6.49 2 2 6.49 2 12s4.49 10 10 10 10-4.49 10-10S17.51 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm0-14c-3.31 0-6 2.69-6 6s2.69 6 6 6 6-2.69 6-6-2.69-6-6-6zm0 10c-2.21 0-4-1.79-4-4s1.79-4 4-4 4 1.79 4 4-1.79 4-4 4z" fill="#2563eb" transform="scale(0.9) translate(-28, -5)"/>
      <g transform="translate(24, 0)">
        <text x="0" y="16" class="stat-val">100%</text>
        <text x="0" y="34" class="stat-label">Commitment</text>
      </g>
    </g>
  </g>
</svg>`;

fs.writeFileSync(outputPath, svgContent);
console.log('Vibrant SVG Header with 100% visible Finspark background built successfully!');
