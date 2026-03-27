<!-- ╔══════════════════════════════════════════════════════════════════════╗ -->
<!-- ║           MATHIYAZHAGAN NTL — CYBERPUNK DEVELOPER PROFILE          ║ -->
<!-- ╚══════════════════════════════════════════════════════════════════════╝ -->

<!-- ═══════════════════ ANIMATED RGB HERO HEADER ═══════════════════ -->

<div align="center">

<img src="./assets/header.svg" width="100%" alt="Mathiyazhagan NTL — Cyberpunk Developer Banner"/>

</div>

<br/>

<!-- ═══════════════════ LIVE TYPING ANIMATION ═══════════════════ -->

<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=600&size=24&duration=2800&pause=1000&color=FF0000&center=true&vCenter=true&multiline=false&repeat=true&width=700&height=45&lines=Silent+Thunder+Developer;AI+System+Builder;Consistent+Daily+Coding;Next+to+Learn+For+Your+Future" />

</div>

<br/>

<!-- ═══════════════════ TECH STACK — ANIMATED ICONS ═══════════════════ -->

<div align="center">

<!-- Animated Tech Stack with Glowing Borders -->
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 120" width="100%" style="max-width:800px">
  <defs>
    <!-- Gradient Glows -->
    <linearGradient id="glowBlue" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="#3b82f6"/>
      <stop offset="100%" stop-color="#06b6d4"/>
    </linearGradient>
    <linearGradient id="glowPurple" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="#8b5cf6"/>
      <stop offset="100%" stop-color="#ec4899"/>
    </linearGradient>
    <linearGradient id="glowGreen" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="#10b981"/>
      <stop offset="100%" stop-color="#06b6d4"/>
    </linearGradient>

    <!-- Animated Border Gradient -->
    <linearGradient id="borderAnim" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" stop-color="#3b82f6">
        <animate attributeName="stop-color" values="#3b82f6;#8b5cf6;#ec4899;#3b82f6" dur="3s" repeatCount="indefinite"/>
      </stop>
      <stop offset="50%" stop-color="#ec4899">
        <animate attributeName="stop-color" values="#ec4899;#06b6d4;#10b981;#ec4899" dur="3s" repeatCount="indefinite"/>
      </stop>
      <stop offset="100%" stop-color="#3b82f6">
        <animate attributeName="stop-color" values="#3b82f6;#8b5cf6;#ec4899;#3b82f6" dur="3s" repeatCount="indefinite"/>
      </stop>
    </linearGradient>

    <!-- Glow Filters -->
    <filter id="softGlow" x="-50%" y="-50%" width="200%" height="200%">
      <feGaussianBlur stdDeviation="2" result="blur"/>
      <feFlood flood-color="#3b82f6" flood-opacity="0.4" result="color"/>
      <feComposite in="color" in2="blur" operator="in" result="glow"/>
      <feMerge>
        <feMergeNode in="glow"/>
        <feMergeNode in="SourceGraphic"/>
      </feMerge>
    </filter>

    <filter id="pulseGlow" x="-50%" y="-50%" width="200%" height="200%">
      <feGaussianBlur stdDeviation="3" result="blur"/>
      <feFlood flood-color="#8b5cf6" flood-opacity="0.5" result="color"/>
      <feComposite in="color" in2="blur" operator="in" result="glow"/>
      <feMerge>
        <feMergeNode in="glow"/>
        <feMergeNode in="SourceGraphic"/>
      </feMerge>
      <animate attributeName="stdDeviation" values="3;4;3" dur="2s" repeatCount="indefinite"/>
    </filter>
  </defs>

  <!-- Background Grid -->
  <rect width="1000" height="120" fill="#0d1117" opacity="0"/>

  <!-- Icon 1: Python -->
  <g transform="translate(45, 25)">
    <rect x="0" y="0" width="65" height="65" rx="12" fill="#0d1117" stroke="url(#borderAnim)" stroke-width="2">
      <animate attributeName="stroke-dashoffset" values="0;-260" dur="2s" repeatCount="indefinite"/>
    </rect>
    <foreignObject x="12" y="12" width="40" height="40">
      <div xmlns="http://www.w3.org/1999/xhtml" style="display:flex;align-items:center;justify-content:center;width:40px;height:40px">
        <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg" width="32" height="32" style="filter:drop-shadow(0 0 4px #3b82f6)"/>
      </div>
    </foreignObject>
    <circle cx="32" cy="32" r="28" fill="none" stroke="#3b82f6" stroke-width="1" opacity="0.3">
      <animate attributeName="r" values="28;30;28" dur="3s" repeatCount="indefinite"/>
      <animate attributeName="opacity" values="0.3;0.6;0.3" dur="3s" repeatCount="indefinite"/>
    </circle>
  </g>

  <!-- Icon 2: Java -->
  <g transform="translate(125, 25)">
    <rect x="0" y="0" width="65" height="65" rx="12" fill="#0d1117" stroke="url(#borderAnim)" stroke-width="2">
      <animate attributeName="stroke-dashoffset" values="0;-260" dur="2s" repeatCount="indefinite" begin="0.2s"/>
    </rect>
    <foreignObject x="12" y="12" width="40" height="40">
      <div xmlns="http://www.w3.org/1999/xhtml" style="display:flex;align-items:center;justify-content:center;width:40px;height:40px">
        <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/java/java-original.svg" width="32" height="32" style="filter:drop-shadow(0 0 4px #f97316)"/>
      </div>
    </foreignObject>
    <circle cx="32" cy="32" r="28" fill="none" stroke="#f97316" stroke-width="1" opacity="0.3">
      <animate attributeName="r" values="28;30;28" dur="3s" repeatCount="indefinite" begin="0.5s"/>
      <animate attributeName="opacity" values="0.3;0.6;0.3" dur="3s" repeatCount="indefinite" begin="0.5s"/>
    </circle>
  </g>

  <!-- Icon 3: JavaScript -->
  <g transform="translate(205, 25)">
    <rect x="0" y="0" width="65" height="65" rx="12" fill="#0d1117" stroke="url(#borderAnim)" stroke-width="2">
      <animate attributeName="stroke-dashoffset" values="0;-260" dur="2s" repeatCount="indefinite" begin="0.4s"/>
    </rect>
    <foreignObject x="12" y="12" width="40" height="40">
      <div xmlns="http://www.w3.org/1999/xhtml" style="display:flex;align-items:center;justify-content:center;width:40px;height:40px">
        <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg" width="32" height="32" style="filter:drop-shadow(0 0 4px #fbbf24)"/>
      </div>
    </foreignObject>
    <circle cx="32" cy="32" r="28" fill="none" stroke="#fbbf24" stroke-width="1" opacity="0.3">
      <animate attributeName="r" values="28;30;28" dur="3s" repeatCount="indefinite" begin="1s"/>
      <animate attributeName="opacity" values="0.3;0.6;0.3" dur="3s" repeatCount="indefinite" begin="1s"/>
    </circle>
  </g>

  <!-- Icon 4: TypeScript -->
  <g transform="translate(285, 25)">
    <rect x="0" y="0" width="65" height="65" rx="12" fill="#0d1117" stroke="url(#borderAnim)" stroke-width="2">
      <animate attributeName="stroke-dashoffset" values="0;-260" dur="2s" repeatCount="indefinite" begin="0.6s"/>
    </rect>
    <foreignObject x="12" y="12" width="40" height="40">
      <div xmlns="http://www.w3.org/1999/xhtml" style="display:flex;align-items:center;justify-content:center;width:40px;height:40px">
        <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/typescript/typescript-original.svg" width="32" height="32" style="filter:drop-shadow(0 0 4px #3b82f6)"/>
      </div>
    </foreignObject>
    <circle cx="32" cy="32" r="28" fill="none" stroke="#3b82f6" stroke-width="1" opacity="0.3">
      <animate attributeName="r" values="28;30;28" dur="3s" repeatCount="indefinite" begin="1.5s"/>
      <animate attributeName="opacity" values="0.3;0.6;0.3" dur="3s" repeatCount="indefinite" begin="1.5s"/>
    </circle>
  </g>

  <!-- Icon 5: React -->
  <g transform="translate(365, 25)">
    <rect x="0" y="0" width="65" height="65" rx="12" fill="#0d1117" stroke="url(#borderAnim)" stroke-width="2">
      <animate attributeName="stroke-dashoffset" values="0;-260" dur="2s" repeatCount="indefinite" begin="0.8s"/>
    </rect>
    <foreignObject x="12" y="12" width="40" height="40">
      <div xmlns="http://www.w3.org/1999/xhtml" style="display:flex;align-items:center;justify-content:center;width:40px;height:40px">
        <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/react/react-original.svg" width="32" height="32" style="filter:drop-shadow(0 0 4px #06b6d4)"/>
      </div>
    </foreignObject>
    <circle cx="32" cy="32" r="28" fill="none" stroke="#06b6d4" stroke-width="1" opacity="0.3">
      <animate attributeName="r" values="28;30;28" dur="3s" repeatCount="indefinite" begin="2s"/>
      <animate attributeName="opacity" values="0.3;0.6;0.3" dur="3s" repeatCount="indefinite" begin="2s"/>
    </circle>
  </g>

  <!-- Icon 6: Node.js -->
  <g transform="translate(445, 25)">
    <rect x="0" y="0" width="65" height="65" rx="12" fill="#0d1117" stroke="url(#borderAnim)" stroke-width="2">
      <animate attributeName="stroke-dashoffset" values="0;-260" dur="2s" repeatCount="indefinite" begin="1s"/>
    </rect>
    <foreignObject x="12" y="12" width="40" height="40">
      <div xmlns="http://www.w3.org/1999/xhtml" style="display:flex;align-items:center;justify-content:center;width:40px;height:40px">
        <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nodejs/nodejs-original.svg" width="32" height="32" style="filter:drop-shadow(0 0 4px #10b981)"/>
      </div>
    </foreignObject>
    <circle cx="32" cy="32" r="28" fill="none" stroke="#10b981" stroke-width="1" opacity="0.3">
      <animate attributeName="r" values="28;30;28" dur="3s" repeatCount="indefinite" begin="0.3s"/>
      <animate attributeName="opacity" values="0.3;0.6;0.3" dur="3s" repeatCount="indefinite" begin="0.3s"/>
    </circle>
  </g>

  <!-- Row 2 -->

  <!-- Icon 7: HTML -->
  <g transform="translate(45, 95)">
    <rect x="0" y="0" width="65" height="65" rx="12" fill="#0d1117" stroke="url(#borderAnim)" stroke-width="2">
      <animate attributeName="stroke-dashoffset" values="0;-260" dur="2s" repeatCount="indefinite" begin="1.2s"/>
    </rect>
    <foreignObject x="12" y="12" width="40" height="40">
      <div xmlns="http://www.w3.org/1999/xhtml" style="display:flex;align-items:center;justify-content:center;width:40px;height:40px">
        <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original.svg" width="32" height="32" style="filter:drop-shadow(0 0 4px #f97316)"/>
      </div>
    </foreignObject>
    <circle cx="32" cy="32" r="28" fill="none" stroke="#f97316" stroke-width="1" opacity="0.3">
      <animate attributeName="r" values="28;30;28" dur="3s" repeatCount="indefinite" begin="0.7s"/>
      <animate attributeName="opacity" values="0.3;0.6;0.3" dur="3s" repeatCount="indefinite" begin="0.7s"/>
    </circle>
  </g>

  <!-- Icon 8: CSS -->
  <g transform="translate(125, 95)">
    <rect x="0" y="0" width="65" height="65" rx="12" fill="#0d1117" stroke="url(#borderAnim)" stroke-width="2">
      <animate attributeName="stroke-dashoffset" values="0;-260" dur="2s" repeatCount="indefinite" begin="1.4s"/>
    </rect>
    <foreignObject x="12" y="12" width="40" height="40">
      <div xmlns="http://www.w3.org/1999/xhtml" style="display:flex;align-items:center;justify-content:center;width:40px;height:40px">
        <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/css3/css3-original.svg" width="32" height="32" style="filter:drop-shadow(0 0 4px #3b82f6)"/>
      </div>
    </foreignObject>
    <circle cx="32" cy="32" r="28" fill="none" stroke="#3b82f6" stroke-width="1" opacity="0.3">
      <animate attributeName="r" values="28;30;28" dur="3s" repeatCount="indefinite" begin="1.2s"/>
      <animate attributeName="opacity" values="0.3;0.6;0.3" dur="3s" repeatCount="indefinite" begin="1.2s"/>
    </circle>
  </g>

  <!-- Icon 9: Git -->
  <g transform="translate(205, 95)">
    <rect x="0" y="0" width="65" height="65" rx="12" fill="#0d1117" stroke="url(#borderAnim)" stroke-width="2">
      <animate attributeName="stroke-dashoffset" values="0;-260" dur="2s" repeatCount="indefinite" begin="1.6s"/>
    </rect>
    <foreignObject x="12" y="12" width="40" height="40">
      <div xmlns="http://www.w3.org/1999/xhtml" style="display:flex;align-items:center;justify-content:center;width:40px;height:40px">
        <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg" width="32" height="32" style="filter:drop-shadow(0 0 4px #f44336)"/>
      </div>
    </foreignObject>
    <circle cx="32" cy="32" r="28" fill="none" stroke="#f44336" stroke-width="1" opacity="0.3">
      <animate attributeName="r" values="28;30;28" dur="3s" repeatCount="indefinite" begin="1.8s"/>
      <animate attributeName="opacity" values="0.3;0.6;0.3" dur="3s" repeatCount="indefinite" begin="1.8s"/>
    </circle>
  </g>

  <!-- Icon 10: GitHub -->
  <g transform="translate(285, 95)">
    <rect x="0" y="0" width="65" height="65" rx="12" fill="#0d1117" stroke="url(#borderAnim)" stroke-width="2">
      <animate attributeName="stroke-dashoffset" values="0;-260" dur="2s" repeatCount="indefinite" begin="1.8s"/>
    </rect>
    <foreignObject x="12" y="12" width="40" height="40">
      <div xmlns="http://www.w3.org/1999/xhtml" style="display:flex;align-items:center;justify-content:center;width:40px;height:40px">
        <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg" width="32" height="32" style="filter:drop-shadow(0 0 4px #ffffff)"/>
      </div>
    </foreignObject>
    <circle cx="32" cy="32" r="28" fill="none" stroke="#ffffff" stroke-width="1" opacity="0.3">
      <animate attributeName="r" values="28;30;28" dur="3s" repeatCount="indefinite" begin="0.4s"/>
      <animate attributeName="opacity" values="0.3;0.6;0.3" dur="3s" repeatCount="indefinite" begin="0.4s"/>
    </circle>
  </g>

  <!-- Icon 11: Linux -->
  <g transform="translate(365, 95)">
    <rect x="0" y="0" width="65" height="65" rx="12" fill="#0d1117" stroke="url(#borderAnim)" stroke-width="2">
      <animate attributeName="stroke-dashoffset" values="0;-260" dur="2s" repeatCount="indefinite" begin="2s"/>
    </rect>
    <foreignObject x="12" y="12" width="40" height="40">
      <div xmlns="http://www.w3.org/1999/xhtml" style="display:flex;align-items:center;justify-content:center;width:40px;height:40px">
        <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linux/linux-original.svg" width="32" height="32" style="filter:drop-shadow(0 0 4px #fbbf24)"/>
      </div>
    </foreignObject>
    <circle cx="32" cy="32" r="28" fill="none" stroke="#fbbf24" stroke-width="1" opacity="0.3">
      <animate attributeName="r" values="28;30;28" dur="3s" repeatCount="indefinite" begin="0.9s"/>
      <animate attributeName="opacity" values="0.3;0.6;0.3" dur="3s" repeatCount="indefinite" begin="0.9s"/>
    </circle>
  </g>

  <!-- Icon 12: VS Code -->
  <g transform="translate(445, 95)">
    <rect x="0" y="0" width="65" height="65" rx="12" fill="#0d1117" stroke="url(#borderAnim)" stroke-width="2">
      <animate attributeName="stroke-dashoffset" values="0;-260" dur="2s" repeatCount="indefinite" begin="2.2s"/>
    </rect>
    <foreignObject x="12" y="12" width="40" height="40">
      <div xmlns="http://www.w3.org/1999/xhtml" style="display:flex;align-items:center;justify-content:center;width:40px;height:40px">
        <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vscode/vscode-original.svg" width="32" height="32" style="filter:drop-shadow(0 0 4px #3b82f6)"/>
      </div>
    </foreignObject>
    <circle cx="32" cy="32" r="28" fill="none" stroke="#3b82f6" stroke-width="1" opacity="0.3">
      <animate attributeName="r" values="28;30;28" dur="3s" repeatCount="indefinite" begin="1.1s"/>
      <animate attributeName="opacity" values="0.3;0.6;0.3" dur="3s" repeatCount="indefinite" begin="1.1s"/>
    </circle>
  </g>
</svg>

</div>

<br/>

<img src="https://capsule-render.vercel.app/api?type=waving&height=30&color=0:0D1117,50:FF0000,100:0D1117&section=header" width="100%">

<br/>

<!-- ═══════════════════ HACKER TERMINAL — ABOUT ═══════════════════ -->

<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=500&size=18&duration=2000&pause=600&color=FF0000&center=true&vCenter=true&multiline=false&repeat=true&width=600&height=35&lines=%24+developer.load_profile();%24+initializing+systems...;%24+loading+modules...;%24+system+ready+%E2%9C%94" />

</div>

<br/>

```js
// ╔═══════════════════════════════════════════════════════════╗
// ║                SYSTEM ACCESS — AUTHORIZED                ║
// ╚═══════════════════════════════════════════════════════════╝

const developer = {
    name       : "Mathiyazhagan NTL",
    alias      : "Silent Thunder",
    role       : "Developer | AI Learner | Cyberpunk Builder",
    location   : "Coimbatore, India",
    focus      : ["Artificial Intelligence", "Automation", "Smart Systems"],
    mission    : "Next to Learn for Your Future",

    skills: {
        languages  : ["Python", "Java", "JavaScript", "TypeScript"],
        frontend   : ["React", "HTML5", "CSS3"],
        backend    : ["Node.js", "Express"],
        tools      : ["Git", "GitHub", "VS Code", "Linux"],
        exploring  : ["AI/ML", "Deep Learning", "Neural Networks"]
    },

    currentWork : "Building Intelligent Systems",
    dailyHabit  : "Consistent Coding"
};

developer.init(); // System Online
```

<br/>

<img src="https://capsule-render.vercel.app/api?type=waving&height=30&color=0:0D1117,50:FF0000,100:0D1117&section=header" width="100%">

<br/>

<!-- ═══════════════════ LIVE STREAK ═══════════════════ -->

<h2 align="center">Contribution Streak</h2>

<div align="center">

<img src="https://github-readme-streak-stats.herokuapp.com?user=MathiyazhaganNTL&theme=tokyonight&hide_border=true&background=0D1117&ring=FF0000&fire=FF0000&currStreakLabel=FF0000&sideLabels=FF0000&currStreakNum=FFFFFF&sideNums=FFFFFF&dates=555555&stroke=FF0000" width="700"/>

</div>

<br/>

<!-- ═══════════════════ CONTRIBUTION SNAKE ═══════════════════ -->

<h2 align="center">Contribution Snake</h2>

<div align="center">

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/MathiyazhaganNTL/MathiyazhaganNTL/output/github-contribution-grid-snake-dark.svg" />
  <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/MathiyazhaganNTL/MathiyazhaganNTL/output/github-contribution-grid-snake.svg" />
  <img alt="contribution snake animation" src="https://raw.githubusercontent.com/MathiyazhaganNTL/MathiyazhaganNTL/output/github-contribution-grid-snake-dark.svg" width="100%" />
</picture>

</div>

<br/>

<img src="https://capsule-render.vercel.app/api?type=waving&height=30&color=0:0D1117,50:FF0000,100:0D1117&section=header" width="100%">

<br/>

<!-- ═══════════════════ STATS DASHBOARD ═══════════════════ -->

<h2 align="center">Developer Analytics</h2>

<div align="center">

<img height="180" src="https://github-readme-stats.vercel.app/api?username=MathiyazhaganNTL&show_icons=true&theme=tokyonight&hide_border=true&bg_color=0D1117&title_color=FF0000&icon_color=FF0000&text_color=FFFFFF&ring_color=FF0000" />
&nbsp;&nbsp;
<img height="180" src="https://github-readme-stats.vercel.app/api/top-langs/?username=MathiyazhaganNTL&layout=compact&theme=tokyonight&hide_border=true&bg_color=0D1117&title_color=FF0000&text_color=FFFFFF" />

</div>

<br/>

<!-- ═══════════════════ ACTIVITY GRAPH ═══════════════════ -->

<div align="center">

<img src="https://github-readme-activity-graph.vercel.app/graph?username=MathiyazhaganNTL&bg_color=0D1117&color=FF0000&line=FF0000&point=FFFFFF&area_color=0D1117&area=true&hide_border=true&custom_title=Contribution%20Activity%20Graph" width="95%"/>

</div>

<br/>

<img src="https://capsule-render.vercel.app/api?type=waving&height=30&color=0:0D1117,50:FF0000,100:0D1117&section=header" width="100%">

<br/>

<!-- ═══════════════════ FEATURED PROJECTS ═══════════════════ -->

<h2 align="center">Featured Projects</h2>

<div align="center">

<a href="https://github.com/MathiyazhaganNTL/NTL_PLANTS">
<img src="https://github-readme-stats.vercel.app/api/pin/?username=MathiyazhaganNTL&repo=NTL_PLANTS&theme=tokyonight&hide_border=true&bg_color=0D1117&title_color=FF0000&icon_color=FF0000&text_color=AAAAAA" width="400" />
</a>
&nbsp;&nbsp;
<a href="https://github.com/MathiyazhaganNTL/Daily_Leetcode">
<img src="https://github-readme-stats.vercel.app/api/pin/?username=MathiyazhaganNTL&repo=Daily_Leetcode&theme=tokyonight&hide_border=true&bg_color=0D1117&title_color=FF0000&icon_color=FF0000&text_color=AAAAAA" width="400" />
</a>

<br/><br/>

<a href="https://github.com/MathiyazhaganNTL/Learning_NTL">
<img src="https://github-readme-stats.vercel.app/api/pin/?username=MathiyazhaganNTL&repo=Learning_NTL&theme=tokyonight&hide_border=true&bg_color=0D1117&title_color=FF0000&icon_color=FF0000&text_color=AAAAAA" width="400" />
</a>
&nbsp;&nbsp;
<a href="https://github.com/MathiyazhaganNTL/MathiyazhaganNTL">
<img src="https://github-readme-stats.vercel.app/api/pin/?username=MathiyazhaganNTL&repo=MathiyazhaganNTL&theme=tokyonight&hide_border=true&bg_color=0D1117&title_color=FF0000&icon_color=FF0000&text_color=AAAAAA" width="400" />
</a>

</div>

<br/>

<img src="https://capsule-render.vercel.app/api?type=waving&height=30&color=0:0D1117,50:FF0000,100:0D1117&section=header" width="100%">

<br/>

<!-- ═══════════════════ GITHUB TROPHIES ═══════════════════ -->

<h2 align="center">GitHub Achievements</h2>

<div align="center">

<img src="https://github-profile-trophy.vercel.app/?username=MathiyazhaganNTL&theme=matrix&no-frame=true&no-bg=true&margin-w=12&margin-h=12&column=7" width="95%"/>

</div>

<br/>

<img src="https://capsule-render.vercel.app/api?type=waving&height=30&color=0:0D1117,50:FF0000,100:0D1117&section=header" width="100%">

<br/>

<!-- ═══════════════════ VISITOR STATS ═══════════════════ -->

<div align="center">

<img src="https://komarev.com/ghpvc/?username=MathiyazhaganNTL&label=PROFILE+VISITORS&color=FF0000&style=for-the-badge&labelColor=0D1117"/>
&nbsp;&nbsp;
<img src="https://img.shields.io/github/followers/MathiyazhaganNTL?label=FOLLOWERS&color=FF0000&style=for-the-badge&labelColor=0D1117&logo=github"/>
&nbsp;&nbsp;
<img src="https://img.shields.io/github/stars/MathiyazhaganNTL?label=TOTAL%20STARS&color=FF0000&style=for-the-badge&labelColor=0D1117&logo=github"/>

</div>

<br/>

<!-- ═══════════════════ CONNECT ═══════════════════ -->

<h2 align="center">Connect</h2>

<div align="center">

<a href="mailto:programmermathi@gmail.com">
<img src="https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white" />
</a>
&nbsp;
<a href="https://www.linkedin.com">
<img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" />
</a>
&nbsp;
<a href="https://mathintlportfolio.dev/">
<img src="https://img.shields.io/badge/Portfolio-FF0000?style=for-the-badge&logo=firefox&logoColor=0D1117" />
</a>
&nbsp;
<a href="https://github.com/MathiyazhaganNTL">
<img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white" />
</a>

</div>

<br/>

<img src="https://capsule-render.vercel.app/api?type=waving&height=30&color=0:0D1117,50:FF0000,100:0D1117&section=header" width="100%">

<br/>

<!-- ═══════════════════ PHILOSOPHY ═══════════════════ -->

<div align="center">

```
╔══════════════════════════════════════════════════════════════╗
║                                                              ║
║          " Next to Learn for Your Future "                   ║
║                                                              ║
║             — Mathiyazhagan NTL | Silent Thunder             ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
```

</div>

<br/>

<!-- ═══════════════════ FOOTER ═══════════════════ -->

<img src="https://capsule-render.vercel.app/api?type=waving&height=120&color=0:0D1117,50:FF0000,100:0D1117&section=footer" width="100%"/>
