import os

seed_files = [
    "db/seed_0_auth.sql",
    "db/seed.sql",
    "db/seed_chapters_batch2.sql",
    "db/seed_batch3_math_science_patched.sql",
    "db/seed_batch4_social_science.sql",
    "db/seed_english_batch1.sql",
    "db/seed_notes_batch1.sql",
    "db/seed_notes_v2.sql",
    "db/seed_quizzes_batch1.sql",
    "db/seed_science_ch1_quizzes.sql",
    "db/seed_question_types_batch1.sql",
    "db/seed_study_guides.sql",
    "db/seed_science_ch2_notes.sql",
    "db/seed_pyq_questions.sql",
]

with open("supabase/seed.sql", "w", encoding="utf-8") as outfile:
    for f in seed_files:
        if os.path.exists(f):
            with open(f, "r", encoding="utf-8") as infile:
                outfile.write(f"\n\n-- --- FROM FILE {f} ---\n\n")
                outfile.write(infile.read())
