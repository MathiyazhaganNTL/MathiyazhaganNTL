import re

def fix_layout():
    with open('assets/tech-stack.svg', 'r', encoding='utf-8') as f:
        svg = f.read()

    # Find the starting of icons
    # They are enclosed in <g transform="translate(...)">
    # We will replace them one by one
    
    counter = [0]
    
    def transform_repl(m):
        i = counter[0]
        counter[0] += 1
        x = 25 + i * 80  # Start slightly to left to ensure it fits better, maybe 20? Wait, 20 + 65 = 85. 85 + 11*80 = 85 + 880 = 965. Perfect.
        return f'<g transform="translate({x}, 25)">'
        
    svg = re.sub(r'<g transform="translate\(\d+, \d+\)">', transform_repl, svg)
    
    # Now fix the rect stroke-dasharray
    # <rect x="0" y="0" width="65" height="65" rx="12" fill="#0d1117" stroke="url(#borderAnim)" stroke-width="2">
    def rect_repl(m):
        return m.group(0)[:-1] + ' stroke-dasharray="30 15">'
        
    svg = re.sub(r'<rect x="0" y="0" width="65" height="65" rx="12" fill="#0d1117" stroke="url\([^)]+\)" stroke-width="2">', rect_repl, svg)
    
    # Improve viewbox width to ensure no clipping, let's say 1020
    svg = re.sub(r'viewBox="0 0 1000 120"', 'viewBox="0 0 1020 120"', svg)
    
    with open('assets/tech-stack.svg', 'w', encoding='utf-8') as f:
        f.write(svg)

if __name__ == '__main__':
    fix_layout()
