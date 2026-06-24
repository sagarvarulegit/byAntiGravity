# Implementation Plan: CBSE Class 10 Social Science Content Generation (Batch 4)

This plan details the content generation and seeding of all remaining 20 Social Science chapters to achieve 100% syllabus coverage.

## 1. Subject ID & Scope
* **Subject ID**: `a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33` (Social Science)
* **Status**: 
  * Existing chapters: `Nationalism in India` (Seq 1), `Federalism` (Seq 2)
  * Remaining chapters: 20 chapters (Seq 3 to 22)
* **Output Path**: `db/seed_batch4_social_science.sql`

## 2. Chapter mapping & Sequence Numbers

### History (4 Chapters)
1. **Chapter 3: The Rise of Nationalism in Europe** -> Sequence 3 (Source: `social-history_1.txt`)
2. **Chapter 4: The Making of a Global World** -> Sequence 4 (Source: `social-history_3.txt`)
3. **Chapter 5: The Age of Industrialisation** -> Sequence 5 (Source: `social-history_4.txt`)
4. **Chapter 6: Print Culture and the Modern World** -> Sequence 6 (Source: `social-history_5.txt`)

### Civics / Political Science (4 Chapters)
5. **Chapter 7: Power-sharing** -> Sequence 7 (Source: `social-civics_1.txt`)
6. **Chapter 8: Gender, Religion and Caste** -> Sequence 8 (Source: `social-civics_3.txt`)
7. **Chapter 9: Political Parties** -> Sequence 9 (Source: `social-civics_4.txt`)
8. **Chapter 10: Outcomes of Democracy** -> Sequence 10 (Source: `social-civics_5.txt`)

### Geography (7 Chapters)
9. **Chapter 11: Resources and Development** -> Sequence 11 (Source: `social-geography_1.txt`)
10. **Chapter 12: Forest and Wildlife Resources** -> Sequence 12 (Source: `social-geography_2.txt`)
11. **Chapter 13: Water Resources** -> Sequence 13 (Source: `social-geography_3.txt`)
12. **Chapter 14: Agriculture** -> Sequence 14 (Source: `social-geography_4.txt`)
13. **Chapter 15: Minerals and Energy Resources** -> Sequence 15 (Source: `social-geography_5.txt`)
14. **Chapter 16: Manufacturing Industries** -> Sequence 16 (Source: `social-geography_6.txt`)
15. **Chapter 17: Lifelines of National Economy** -> Sequence 17 (Source: `social-geography_7.txt`)

### Economics (5 Chapters)
16. **Chapter 18: Development** -> Sequence 18 (Source: `social-economics_1.txt`)
17. **Chapter 19: Sectors of the Indian Economy** -> Sequence 19 (Source: `social-economics_2.txt`)
18. **Chapter 20: Money and Credit** -> Sequence 20 (Source: `social-economics_3.txt`)
19. **Chapter 21: Globalisation and the Indian Economy** -> Sequence 21 (Source: `social-economics_4.txt`)
20. **Chapter 22: Consumer Rights** -> Sequence 22 (Source: `social-economics_5.txt`)

---

## 3. SQL Data Generation & Schema Conformity

Each chapter must generate inserts for:
1. `chapters` (id, subject_id, title, sequence_number, description)
2. `lessons` (id, chapter_id, title, type, note_content, is_free, sequence_number)
   * `type` = `'note'`
   * `sequence_number` = `3` (Standard notes position)
   * `is_free` = `FALSE` (Except Chapter 3, which is free as a trial chapter of History)
3. `quizzes` (id, chapter_id, title, passing_percentage)
   * `passing_percentage` = `60`
4. `quiz_questions` (id, quiz_id, question_text, type, options, correct_option_index, marks)
   * 5 MCQs per quiz, `type` = `'multiple_choice'`, `marks` = `1`.

All inserts must use `ON CONFLICT (id) DO NOTHING` for idempotent executions.

### UUID Format Strategy
To avoid conflicts, we will use unique deterministic UUIDs generated using a namespace/hashing approach or static prefix format:
* Base UUID format: `c0eebc99-9c0b-4ef8-bb6d-6bb9bd384[XX][Y]`
  * Where `[XX]` is the sequence number (03 to 22)
  * Where `[Y]` is:
    * `0` for Chapter/Lesson ID
    * `q` for Quiz ID
    * `1` to `5` for Quiz Questions

---

## 4. Content Quality & V2 Notes Format

Revision notes will use the V2 Markdown standard:
1. **🎯 Chapter Goal**: Target outcomes.
2. **🪝 Hook**: High-interest real-world context.
3. **📖 Concepts (1, 2, 3)**: Core conceptual sections mapping NCERT curriculum. Include at least 3 custom `[JARGON: term | definition | example]` tags per chapter notes.
4. **⚠️ Common Mistakes**: Areas of confusion.
5. **💡 Memory Tricks**: Mnemonics or visual links.
6. **📝 Quick Practice**: 2 practice questions with solutions.
7. **🎓 Board Tips**: Scoring guidelines and representation tips.
8. **🔄 One-Minute Revision**: 5 quick summary points.
9. **🎬 Comic Recap**: Dialogue between Priya and Rahul inside an ASCII box table.

Quizzes:
* Sourced from NCERT textbook questions and boards exam patterns.
* 5 questions per chapter with 4 options each, strictly mapped to correct option index.

---

## 5. Execution Pipeline
Since there are 20 chapters, doing this sequentially in a single LLM prompt is prone to context limits and timeout. We will define an automation/scripting strategy or launch concurrent/sequential subagent calls using the `self` subagent, writing the generated SQL blocks progressively to `db/seed_batch4_social_science.sql`.

### Generation Steps
1. Create a Python runner file `scratch/generate_social_science.py` (or execute dynamically).
2. The runner will invoke a text-summary and generation model or handle file mapping to build each chapter.
3. Consolidate into `db/seed_batch4_social_science.sql`.

## 6. Verification
* Run PostgreSQL parser or inspect output structure.
* Run `flutter analyze` inside `apps/mobile_web_client/` to verify client-side static health.
