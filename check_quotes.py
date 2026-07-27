import re

with open('supabase/seed.sql', 'r', encoding='utf-8') as f:
    text = f.read()

# find anything bounded by single quotes (but not two single quotes)
# only if it contains 20 chars or fewer (like a word)
matches = re.findall(r"(?<!')'[a-zA-Z0-9 _-]{1,20}'(?!')", text)
for m in set(matches):
    if m not in ["'note'", "'medium'", "'hard'", "'easy'", "'original'", "'short_answer'", "'assertion_reason'", "'long_answer'"]:
        print(m)
