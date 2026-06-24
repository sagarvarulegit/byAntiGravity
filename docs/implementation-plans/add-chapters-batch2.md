# Implementation Plan - Add CBSE Class 10 Chapters, Lessons & Quizzes (Batch 2)

We need to add 5 new chapters to the database:
1. Maths Ch3: Pair of Linear Equations in Two Variables (Subject: Mathematics)
2. Maths Ch4: Quadratic Equations (Subject: Mathematics)
3. Science Ch2: Acids, Bases and Salts (Subject: Science)
4. Science Ch3: Metals and Non-metals (Subject: Science)
5. Social Science Ch2: Federalism (Subject: Social Science)

All database insertions will go into a new seed file: `db/seed_chapters_batch2.sql`.

## 1. Study the Schema & Existing Seed Data
- Identify correct subject UUIDs:
  - Mathematics: `'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11'`
  - Science: `'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22'`
  - Social Science: `'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33'`
- Check schemas for:
  - `chapters`: `id`, `subject_id`, `title`, `sequence_number`, `description`
  - `lessons`: `id`, `chapter_id`, `title`, `type`, `video_hls_url`, `video_duration_seconds`, `note_content`, `is_free`, `sequence_number`
  - `quizzes`: `id`, `chapter_id`, `title`, `passing_percentage`
  - `quiz_questions`: `id`, `quiz_id`, `question_text`, `type`, `options`, `correct_option_index`, `correct_answer_text`, `marks`

## 2. Extract MCQ Material from Textbooks
We will read / parse key sections from:
- `cbse_class10_textbooks/extracted_text/mathematics_3.txt`
- `cbse_class10_textbooks/extracted_text/mathematics_4.txt`
- `cbse_class10_textbooks/extracted_text/science_2.txt`
- `cbse_class10_textbooks/extracted_text/science_3.txt`
- `cbse_class10_textbooks/extracted_text/social-civics_2.txt`
to craft 5 highly relevant MCQs per chapter.

## 3. Structure the Content for Batch 2 Seed
For each of the 5 chapters, we will:
1. Create a `chapters` record (generate unique UUIDs).
2. Create 2 video lessons (type = `'video'`, `video_hls_url = ''` placeholder, generate UUIDs, sequence numbers 1 and 2).
3. Create 1 quiz (generate UUID, `passing_percentage = 60`).
4. Create 5 quiz questions (generate UUIDs, MCQs with 4 options, `correct_option_index`, `marks = 1`).

All SQL insert statements will use `ON CONFLICT (id) DO NOTHING`.

## 4. Verification Plan
- Verify that `db/seed_chapters_batch2.sql` is generated properly and contains syntactically valid PostgreSQL statements.
- Verify that it uses the correct target tables, types, and column names.
- Verify the file is non-empty and stored in `db/seed_chapters_batch2.sql`.
- Run Flutter analysis if needed (though no Dart files are modified, we should ensure codebase remains clean).
