# Database and Curriculum Content Rules

## Learning Capture

- Record reusable database, seed, and curriculum-content learnings in this file
  after fixing related code or data.

## UTF-8 and Seed Safety

- For seed SQL containing complex Unicode, prefer binary reads/writes and use
  `.decode("utf-8", errors="replace")` and UTF-8 encoding to prevent surrogate
  failures.
- Scan edited seed files for corrupt replacement text such as `??` where an
  emoji or mathematical symbol was intended.
- Register every new `db/*.sql` seed in the `seed_files` array in
  `concat_seeds.py`; otherwise `refresh_db.sh` and `concat_seeds.py` omit it.
- Never put semicolons inside SQL string literals consumed by the local
  Supabase seed parser. Use commas instead, for example `100 W, 220 V`.
- Escape apostrophes inside SQL literals by doubling them, such as
  `doesn''t` and `''pop''`.

## NCERT Textbook Completeness

Every NCERT chapter note or study guide must include:

1. All concepts and chronological activities or experiments.
2. Every in-text question with its solution.
3. Every end-of-chapter exercise question with its solution.
4. The official end-of-chapter Group Activity.
5. Chronologically numbered and captioned `[FIGURE: ...]` placeholders that
   match the textbook and client assets.
6. A final `🧪 NCERT Activities Cheat Sheet` summarizing every activity's
   observations.

## CBSE Board Exam Readiness

- Cross-reference official CBSE papers and marking schemes.
- Include non-NCERT examples, edge cases, reasoning questions, and complex
  case-based formats that appeared in past examinations.
- Every PYQ added to `seed_pyq_questions.sql` must include its exact
  `model_answer` and `marking_scheme` value points.

