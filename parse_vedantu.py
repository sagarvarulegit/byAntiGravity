import re
from bs4 import BeautifulSoup

with open('/home/sagarv/.gemini/antigravity-cli/brain/3fe4f037-5db3-4379-82f1-e1ffa2af32df/.system_generated/steps/1085/content.md', 'r', encoding='utf-8') as f:
    html_content = f.read()

soup = BeautifulSoup(html_content, 'html.parser')
for script in soup(["script", "style", "nav", "footer", "header"]):
    script.decompose()

text = soup.get_text(separator='\n')
lines = [line.strip() for line in text.splitlines() if line.strip()]

with open('vedantu_notes.txt', 'w', encoding='utf-8') as f:
    f.write('\n'.join(lines))
