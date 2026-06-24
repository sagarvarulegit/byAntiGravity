# Implementation Plan - NCERT-Faithful Revision Notes (Batch 1)

Create NCERT-faithful revision notes for two CBSE Class 10 chapters:
1. **Science Chapter 12: Electricity** (sourced from `extracted_text/science_11.txt`)
2. **Social Science Chapter 1: Nationalism in India** (sourced from `extracted_text/social-history_2.txt`)

The notes will be written in simple, NCERT-compliant English appropriate for weak/struggling students.

## 1. Revision Notes Content Structure
Each revision note will follow a standard layout:
- **Chapter Goal**: A clear 1-2 sentence statement of what the student will learn.
- **Key Concepts (3-5)**: Fundamental topics broken down into easy-to-understand bullet points.
- **Important Formulas (Science) / Key Dates (History)**: Essential equations/chronology for quick reference.
- **Common Exam Mistakes**: Pitfalls and misconceptions students frequently get wrong on exams.
- **Quick Revision Summary**: A final wrap-up bullet list for last-minute cramming.
- **Length**: ~500 to 800 words each.

---

## 2. Note 1: Science Chapter 12 (Electricity)
- **Chapter ID**: `c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222` (Chapter 12: Electricity)
- **New Lesson ID**: `b0eebc99-9c0b-4ef8-bb6d-6bb9bd380122` (Following `seed.sql` convention, note type)
- **Title**: `Revision Notes: Electricity`
- **Sequence Number**: `3` (since videos have sequence numbers 1 and 2)
- **Textbook Source**: `science_11.txt` (which has Chapter 11 "Electricity" content, mapped to Database Chapter 12)
- **Topics Covered**:
  1. Electric Current & Potential Difference
  2. Ohm's Law ($V = IR$) & Circuit Symbols
  3. Factors Affecting Resistance & Resistivity ($\rho$)
  4. Resistors in Series & Parallel
  5. Heating Effects of Electric Current (Joule's Law: $H = I^2Rt$) & Electric Power ($P = VI$)
- **Formulas**: $I = Q/t$, $V = W/Q$, $V = IR$, $R = \rho l/A$, $R_s = R_1 + R_2 + R_3$, $1/R_p = 1/R_1 + 1/R_2 + 1/R_3$, $H = I^2Rt$, $P = VI = I^2R = V^2/R$.

---

## 3. Note 2: Social Science Chapter 1 (Nationalism in India)
- **Chapter ID**: `c0eebc99-9c0b-4ef8-bb6d-6bb9bd380331` (Chapter 1: Nationalism in India)
- **New Lesson ID**: `b0eebc99-9c0b-4ef8-bb6d-6bb9bd380080` (Following `seed.sql` convention, note type)
- **Title**: `Revision Notes: Nationalism in India`
- **Sequence Number**: `2` (since the video lesson has sequence number 1)
- **Textbook Source**: `social-history_2.txt` (Chapter II "Nationalism in India" content)
- **Topics Covered**:
  1. Impact of First World War & Khilafat Movement
  2. Idea of Satyagraha & Early Struggles (Champaran, Kheda, Ahmedabad)
  3. Rowlatt Act, Jallianwala Bagh, & Non-Cooperation Movement
  4. Civil Disobedience Movement & Salt March
  5. Sense of Collective Belonging (Bharat Mata, folklore, icons)
- **Dates**: 1915 (Gandhi returns), 1917 (Champaran), 1918 (Kheda/Ahmedabad), 1919 (Rowlatt/Jallianwala Bagh), 1921 (Non-Cooperation), 1922 (Chauri Chaura), 1930 (Dandi March/Civil Disobedience), 1931 (Gandhi-Irwin Pact), 1932 (Poona Pact).

---

## 4. SQL File Specification
- **Target File**: `db/seed_notes_batch1.sql`
- **SQL Format**:
  - `INSERT INTO lessons (...) VALUES (...) ON CONFLICT (id) DO NOTHING;` to ensure re-runs are safe.
  - Proper escaping of single quotes (e.g. `'` becomes `''` or using standard SQL formatting).
  - Use markdown within the `note_content` column.
  - Include GitHub-style alerts like `> [!NOTE]` and `> [!WARNING]` to match the styling of other notes.

---

## 5. Verification Plan
- Verify that `db/seed_notes_batch1.sql` is successfully created.
- Check syntax correctness of the SQL insert statements.
- Verify word count of notes is ~500-800 words.
- Run `flutter analyze` inside `apps/mobile_web_client/` to check that the client compiles correctly.
