import re

quizzes = set()
questions = set()
missing = set()

with open('supabase/seed.sql', 'r') as f:
    for line in f:
        # Check for quizzes insert
        if 'INSERT INTO quizzes' in line or 'VALUES' in line:
            # this is a bit brittle, let's use regex to find all UUIDs in the line.
            # actually it's easier to find VALUES ('id', ...)
            m_quiz = re.search(r"VALUES\s*\(\s*'([0-9a-f\-]{36})'\s*,", line)
            if m_quiz and 'quizzes' in line: # single insert
                pass
            # If it's a bulk insert we might need to parse better.
            
# Let's do a regex extraction:
with open('supabase/seed.sql', 'r') as f:
    content = f.read()

# Find all quizzes
quizzes_inserts = re.findall(r"INSERT INTO quizzes.*?VALUES\s*(.*?;)", content, re.DOTALL)
for ins in quizzes_inserts:
    matches = re.findall(r"\('([0-9a-f\-]{36})'", ins)
    for m in matches:
        quizzes.add(m)

# Find all quiz_questions
questions_inserts = re.findall(r"INSERT INTO quiz_questions.*?VALUES\s*(.*?;)", content, re.DOTALL)
for ins in questions_inserts:
    # the second UUID in the VALUES is the quiz_id (id, quiz_id, question_text...)
    matches = re.findall(r"\('[0-9a-f\-]{36}',\s*'([0-9a-f\-]{36})'", ins)
    for m in matches:
        questions.add(m)

missing = questions - quizzes
print(f"Missing quizzes: {missing}")
