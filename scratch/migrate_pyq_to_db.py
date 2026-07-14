import json
import uuid
import os

def escape_sql_string(text):
    if not text:
        return "''"
    # Replace single quotes with double single quotes for SQL escaping
    return "'" + text.replace("'", "''") + "'"

def main():
    # We are in c:\Sagar\Projects\CBSE\byAntiGravity\scratch
    json_path = os.path.join(os.path.dirname(__file__), 'board_exam_questions.json')
    out_path = os.path.join(os.path.dirname(__file__), '..', 'db', 'seed_pyq_questions.sql')
    
    with open(json_path, 'r', encoding='utf-8') as f:
        data = json.load(f)

    # Group questions by chapter
    chapters = {}
    for q in data:
        ch_seq = q['chapter_id']
        if ch_seq not in chapters:
            chapters[ch_seq] = {
                'title': q['chapter_title'],
                'questions': []
            }
        chapters[ch_seq]['questions'].append(q)

    with open(out_path, 'w', encoding='utf-8') as out:
        out.write("-- SEED DATA: Previous Year Board Questions (PYQ)\n")
        out.write("-- Auto-generated from board_exam_questions.json\n\n")

        out.write("DO $$\n")
        out.write("DECLARE\n")
        out.write("    v_subject_id UUID;\n")
        out.write("    v_chapter_id UUID;\n")
        out.write("    v_quiz_id UUID;\n")
        out.write("BEGIN\n")
        out.write("    -- Get Science Subject ID\n")
        out.write("    SELECT id INTO v_subject_id FROM subjects WHERE name = 'Science';\n")
        out.write("    IF v_subject_id IS NULL THEN\n")
        out.write("        RAISE NOTICE 'Science subject not found. Skipping PYQ seeds.';\n")
        out.write("        RETURN;\n")
        out.write("    END IF;\n\n")

        for ch_seq, ch_data in chapters.items():
            out.write(f"    -- Chapter: {ch_data['title']} (Seq: {ch_seq})\n")
            out.write(f"    SELECT id INTO v_chapter_id FROM chapters WHERE subject_id = v_subject_id AND sequence_number = {ch_seq} LIMIT 1;\n")
            
            out.write(f"    IF v_chapter_id IS NOT NULL THEN\n")
            out.write(f"        DELETE FROM quizzes WHERE chapter_id = v_chapter_id AND quiz_kind = 'pyq_practice';\n")
            
            out.write(f"        INSERT INTO quizzes (chapter_id, title, quiz_kind, total_marks)\n")
            out.write(f"        VALUES (v_chapter_id, 'Previous Years Board Questions', 'pyq_practice', 0)\n")
            out.write(f"        RETURNING id INTO v_quiz_id;\n\n")
            
            # Insert questions
            for q in ch_data['questions']:
                q_text = escape_sql_string(q['question_text'])
                marks = q.get('marks', 1)
                years_str = escape_sql_string(", ".join(q['years']))
                
                # We can also store the 'topic' field if we can map it, but for now we'll put the years in source_year
                out.write(f"        INSERT INTO quiz_questions (quiz_id, question_text, type, marks, source_year, difficulty)\n")
                out.write(f"        VALUES (v_quiz_id, {q_text}, 'short_answer', {marks}, {years_str}, 'medium');\n")
            
            out.write(f"    ELSE\n")
            out.write(f"        RAISE NOTICE 'Chapter {ch_seq} not found. Skipping PYQ insertion.';\n")
            out.write(f"    END IF;\n\n")

        out.write("END $$;\n")

    print(f"Successfully generated {out_path}")

if __name__ == '__main__':
    main()
