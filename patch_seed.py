import re

with open('db/seed_batch3_math_science.sql', 'r') as f:
    content = f.read()

# Replace ON CONFLICT for lessons
parts = content.split('INSERT INTO ')
for i in range(1, len(parts)):
    if parts[i].startswith('lessons'):
        # Find the next ON CONFLICT (id) DO NOTHING;
        parts[i] = parts[i].replace('ON CONFLICT (id) DO NOTHING;', 'ON CONFLICT (id) DO UPDATE SET note_content = EXCLUDED.note_content;')

new_content = 'INSERT INTO '.join(parts)
with open('db/seed_batch3_math_science_patched.sql', 'w') as f:
    f.write(new_content)
