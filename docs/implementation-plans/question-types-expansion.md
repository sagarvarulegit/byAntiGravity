---
type: Plan
title: Question Types Expansion Plan — Math, Science, Social Science
description: | Subject | Chapters | IDs (short) | Source Textbook Files |
tags: [plan]
timestamp: 2026-06-24T17:50:36Z
---
# Question Types Expansion Plan — Math, Science, Social Science

**Created:** 2026-06-24
**Status:** Planning
**Priority:** HIGH — Closes the largest board-paper readiness gap identified in [CBSE_BOARD_ALIGNMENT_AUDIT.md](file:///home/sagarv/Projects/byAntiGravity/docs/CBSE_BOARD_ALIGNMENT_AUDIT.md)

---

## 1. Current State Summary

### 1.1 Chapter Inventory (all seeded)

| Subject | Chapters | IDs (short) | Source Textbook Files |
|---------|----------|-------------|----------------------|
| **Mathematics** | 14 (Ch 1–14) | `380111`–`380119`, `380a10`–`380a14` (batch 3) | `mathematics_1.txt` – `mathematics_14.txt` |
| **Science** | 13 (Ch 1–10, 12, 13 + Electricity as Ch 12 original) | `380221`–`380229`, `383009`–`383013` | `science_1.txt` – `science_13.txt` |
| **Social Science** | 22 (History 1–5 ✦ Civics 1–5 ✦ Geography 1–7 ✦ Economics 1–5) | `380331`–`380332`, batch 4 IDs | `social-history_{1-5}.txt`, `social-civics_{1-5}.txt`, `social-geography_{1-7}.txt`, `social-economics_{1-5}.txt` |

### 1.2 Existing Question Bank

- **All questions are `multiple_choice`** with `marks = 1`
- Total: ~47 MCQs across 8 quizzes
- No descriptive, case-study, numerical, proof, source-based, or map questions exist

### 1.3 Schema Readiness

The `question_type` ENUM in [schema.sql](file:///home/sagarv/Projects/byAntiGravity/db/schema.sql#L94-L118) already supports all target types:

| ENUM Value | Marks | Relevant Subjects |
|-----------|-------|-------------------|
| `short_answer_2mark` | 2 | All |
| `short_answer_3mark` | 3 | All |
| `long_answer_5mark` | 5 | All |
| `case_study` | 4–5 | All |
| `assertion_reason` | 1 | Science, SSt |
| `numerical` | 2–3 | Math, Science |
| `proof` | 3–5 | Math |
| `diagram_label` | 2–3 | Science |
| `map_marking` | 2–5 | Social Science |
| `source_based` | 4 | Social Science |
| `image_interpretation` | 2–4 | Social Science (cartoon) |
| `give_reason` | 2 | Science |

Key schema columns available: `model_answer`, `marking_scheme`, `explanation`, `diagram_url`, `difficulty`, `board_code`, `source_year`, `topic`, `parent_question_id`, `sub_question_sequence`, `expected_numerical_answer`, `expected_unit`.

---

## 2. CBSE Board Paper Format Reference

### Mathematics (Code 041 — Standard)

| Section | Questions | Marks Each | Total | Question Types |
|---------|-----------|------------|-------|---------------|
| A | 20 (16 MCQ + 4 AR) | 1 | 20 | `multiple_choice`, `assertion_reason` |
| B | 5 | 2 | 10 | `short_answer_2mark`, `numerical` |
| C | 6 | 3 | 18 | `short_answer_3mark`, `proof`, `numerical` |
| D | 4 | 5 | 20 | `long_answer_5mark`, `proof` |
| E | 3 | 4 | 12 | `case_study` (passage + 3 sub-Qs) |
| | | **Total** | **80** | |

> [!IMPORTANT]
> Mathematics has two codes: **Standard (041)** and **Basic (241)**. Both follow the same paper structure. Standard questions are harder; Basic questions use simpler numbers and skip proofs. Every question MUST be labeled with `board_code = '041'` or `'241'` or `'041/241'` (shared).

### Science (Code 086)

| Section | Questions | Marks Each | Total | Question Types |
|---------|-----------|------------|-------|---------------|
| A | 20 (16 MCQ + 4 AR) | 1 | 20 | `multiple_choice`, `assertion_reason` |
| B | 5 | 2 | 10 | `short_answer_2mark`, `give_reason`, `diagram_label` |
| C | 6 | 3 | 18 | `short_answer_3mark`, `numerical`, `diagram_label` |
| D | 4 | 5 | 20 | `long_answer_5mark` (with diagram) |
| E | 3 | 4 | 12 | `case_study` (passage + 3 sub-Qs) |
| | | **Total** | **80** | |

### Social Science (Code 087)

| Section | Questions | Marks Each | Total | Question Types |
|---------|-----------|------------|-------|---------------|
| A | 20 (MCQ + AR) | 1 | 20 | `multiple_choice`, `assertion_reason` |
| B | 5 | 2 | 10 | `short_answer_2mark` |
| C | 6 | 3 | 18 | `short_answer_3mark`, `source_based` |
| D | 4 | 5 | 20 | `long_answer_5mark`, `map_marking` |
| E | 3 | 4 | 12 | `case_study`, `source_based`, `image_interpretation` |
| | | **Total** | **80** | |

---

## 3. Question Generation Plan — Per Subject

### 3.1 Mathematics (14 Chapters)

#### Universal types (all 14 chapters)

| Type | ENUM | Per Chapter | Total | Marks | Priority |
|------|------|-------------|-------|-------|----------|
| 2-mark short answer | `short_answer_2mark` | 3 | 42 | 2 | P1 |
| 3-mark short answer | `short_answer_3mark` | 2 | 28 | 3 | P1 |
| 5-mark long answer | `long_answer_5mark` | 1 | 14 | 5 | P1 |
| Assertion-reason | `assertion_reason` | 2 | 28 | 1 | P2 |

#### Subject-specific types

| Type | ENUM | Applicable Chapters | Per Unit | Total | Priority |
|------|------|---------------------|----------|-------|----------|
| **Proof** | `proof` | Ch 1 (irrationality), Ch 6 (BPT, Pythagoras), Ch 10 (tangent theorems) | 2 | 6 | P1 |
| **Numerical** | `numerical` | Ch 5 (AP), Ch 7 (coord geo), Ch 8–9 (trig), Ch 11 (areas), Ch 12 (volumes), Ch 13 (stats), Ch 14 (probability) | 3 | 24 | P1 |
| **Case study** | `case_study` | 1 per 3 chapters ≈ 5 case studies | 1 parent + 3 sub-Qs | 5 × 4 = 20 | P1 |
| **Graphical solution** | `short_answer_3mark` | Ch 2 (polynomial graphs), Ch 3 (pair of linear eqs) | 2 | 4 | P2 |

**Case study groupings:**
1. Ch 1–3: Real Numbers + Polynomials + Linear Equations (algebraic reasoning)
2. Ch 4–5: Quadratic Equations + AP (sequence & pattern)
3. Ch 6–7: Triangles + Coordinate Geometry (measurement)
4. Ch 8–9: Trigonometry + Applications (heights & distances)
5. Ch 10–12: Circles + Areas + Volumes (geometry applications)

> [!NOTE]
> Chapters 13 (Statistics) and 14 (Probability) pair better as data-interpretation case studies for mock papers rather than a standalone case study here.

#### Math difficulty labeling

| `board_code` | `difficulty` | Description |
|---|---|---|
| `041` | `standard` | Standard paper — includes proofs, harder word problems |
| `241` | `basic` | Basic paper — simpler numbers, no proofs, direct formula application |
| `041/241` | `medium` | Shared between both papers |

#### Math totals

| Category | Count |
|----------|-------|
| 2-mark | 42 |
| 3-mark | 28 + 4 graphical = 32 |
| 5-mark | 14 |
| Case study (parent+sub) | 20 |
| Proof | 6 |
| Numerical | 24 |
| Assertion-reason | 28 |
| **Grand total** | **166** |

#### Source textbook files

| Chapter | Source File |
|---------|-----------|
| Ch 1: Real Numbers | [mathematics_1.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/mathematics_1.txt) |
| Ch 2: Polynomials | [mathematics_2.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/mathematics_2.txt) |
| Ch 3: Pair of Linear Equations | [mathematics_3.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/mathematics_3.txt) |
| Ch 4: Quadratic Equations | [mathematics_4.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/mathematics_4.txt) |
| Ch 5: Arithmetic Progressions | [mathematics_5.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/mathematics_5.txt) |
| Ch 6: Triangles | [mathematics_6.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/mathematics_6.txt) |
| Ch 7: Coordinate Geometry | [mathematics_7.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/mathematics_7.txt) |
| Ch 8: Intro to Trigonometry | [mathematics_8.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/mathematics_8.txt) |
| Ch 9: Applications of Trig | [mathematics_9.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/mathematics_9.txt) |
| Ch 10: Circles | [mathematics_10.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/mathematics_10.txt) |
| Ch 11: Areas Related to Circles | [mathematics_11.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/mathematics_11.txt) |
| Ch 12: Surface Areas & Volumes | [mathematics_12.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/mathematics_12.txt) |
| Ch 13: Statistics | [mathematics_13.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/mathematics_13.txt) |
| Ch 14: Probability | [mathematics_14.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/mathematics_14.txt) |

---

### 3.2 Science (13 Chapters)

#### Universal types (all 13 chapters)

| Type | ENUM | Per Chapter | Total | Marks | Priority |
|------|------|-------------|-------|-------|----------|
| 2-mark short answer | `short_answer_2mark` | 3 | 39 | 2 | P1 |
| 3-mark short answer | `short_answer_3mark` | 2 | 26 | 3 | P1 |
| 5-mark long answer | `long_answer_5mark` | 1 | 13 | 5 | P1 |
| Assertion-reason | `assertion_reason` | 2 | 26 | 1 | P1 |

#### Subject-specific types

| Type | ENUM | Applicable Chapters | Per Unit | Total | Priority |
|------|------|---------------------|----------|-------|----------|
| **Numerical** | `numerical` | Ch 1 (balancing), Ch 11 (electricity: V=IR, P=VI, H=I²Rt), Ch 9 (mirror/lens formula), Ch 12 (magnetic force) | 3 | 12 | P1 |
| **Diagram/Label** | `diagram_label` | Ch 5 (digestive/respiratory), Ch 6 (neuron, brain), Ch 7 (reproductive organs, flower), Ch 8 (Mendel cross), Ch 9 (ray diagrams), Ch 10 (eye), Ch 11 (circuits), Ch 12 (solenoid, motor) | 2 | 16 | P1 |
| **Give reason** | `give_reason` | All chapters | 1 | 13 | P2 |
| **Experiment/observation** | `short_answer_2mark` | Ch 1 (activity observations), Ch 2 (pH indicators), Ch 3 (reactivity), Ch 5 (starch test), Ch 11 (Ohm's law) | 2 | 10 | P2 |
| **Case study** | `case_study` | 1 per 3 chapters ≈ 4 case studies | 1 parent + 3 sub-Qs | 4 × 4 = 16 | P1 |

**Case study groupings:**
1. Ch 1–3: Chemical Reactions + Acids/Bases + Metals (Chemistry block)
2. Ch 4–6: Carbon Compounds + Life Processes + Control/Coordination (Biochemistry)
3. Ch 7–8: Reproduction + Heredity (Biology)
4. Ch 9–12: Light + Human Eye + Electricity + Magnetism (Physics)

> [!NOTE]
> Ch 13 (Our Environment) is lighter; pair it with Physics case study or add as a standalone ecology passage.

#### Science totals

| Category | Count |
|----------|-------|
| 2-mark | 39 + 10 experiment = 49 |
| 3-mark | 26 |
| 5-mark | 13 |
| Case study (parent+sub) | 16 |
| Assertion-reason | 26 |
| Numerical | 12 |
| Diagram/Label | 16 |
| Give reason | 13 |
| **Grand total** | **171** |

#### Source textbook files

| Chapter | Source File |
|---------|-----------|
| Ch 1: Chemical Reactions | [science_1.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/science_1.txt) |
| Ch 2: Acids, Bases & Salts | [science_2.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/science_2.txt) |
| Ch 3: Metals & Non-metals | [science_3.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/science_3.txt) |
| Ch 4: Carbon Compounds | [science_4.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/science_4.txt) |
| Ch 5: Life Processes | [science_5.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/science_5.txt) |
| Ch 6: Control & Coordination | [science_6.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/science_6.txt) |
| Ch 7: Reproduction | [science_7.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/science_7.txt) |
| Ch 8: Heredity | [science_8.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/science_8.txt) |
| Ch 9: Light — Reflection & Refraction | [science_9.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/science_9.txt) |
| Ch 10: Human Eye | [science_10.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/science_10.txt) |
| Ch 11: Electricity | [science_11.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/science_11.txt) |
| Ch 12: Magnetic Effects | [science_12.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/science_12.txt) |
| Ch 13: Our Environment | [science_13.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/science_13.txt) |

---

### 3.3 Social Science (22 Chapters)

Social Science spans 4 domains under one board subject (Code 087):
- **History** (5 chapters) — NCERT "India and the Contemporary World – II"
- **Political Science** (5 chapters) — NCERT "Democratic Politics – II"
- **Geography** (7 chapters) — NCERT "Contemporary India – II"
- **Economics** (5 chapters) — NCERT "Understanding Economic Development"

#### Universal types (all 22 chapters)

| Type | ENUM | Per Chapter | Total | Marks | Priority |
|------|------|-------------|-------|-------|----------|
| 2-mark short answer | `short_answer_2mark` | 3 | 66 | 2 | P1 |
| 3-mark short answer | `short_answer_3mark` | 2 | 44 | 3 | P1 |
| 5-mark long answer | `long_answer_5mark` | 1 | 22 | 5 | P1 |
| Assertion-reason | `assertion_reason` | 1 | 22 | 1 | P2 |

#### Subject-specific types

| Type | ENUM | Applicable Chapters | Per Unit | Total | Priority |
|------|------|---------------------|----------|-------|----------|
| **Source-based** | `source_based` | History Ch 1–5, Economics Ch 1–5 | 1 per 2 ch | 5 passages × 4 sub-Qs = 20 | P1 |
| **Map marking** | `map_marking` | Geography Ch 1–7 (physical features, resources, industries), History Ch 1 (civil disobedience centres) | 2 per applicable chapter | 16 | P1 |
| **Cartoon/image interpretation** | `image_interpretation` | Civics Ch 1–5, History Ch 3–5 (print culture posters) | 1 per 3 ch | 3 passages × 3 sub-Qs = 9 | P2 |
| **Case study** | `case_study` | 1 per 3 chapters ≈ 7 case studies | 1 parent + 3 sub-Qs | 7 × 4 = 28 | P1 |

**Case study groupings:**
1. History Ch 1–2: Nationalism in India + Nationalism in Europe
2. History Ch 3–5: Industrialisation + Global World + Print Culture
3. Civics Ch 1–3: Power-sharing + Federalism + Gender/Religion/Caste
4. Civics Ch 4–5: Political Parties + Outcomes of Democracy
5. Geography Ch 1–3: Resources + Forest & Wildlife + Water Resources
6. Geography Ch 4–7: Agriculture + Minerals + Manufacturing + Lifelines
7. Economics Ch 1–4: Development + Sectors + Money & Credit + Globalisation

> [!NOTE]
> Economics Ch 5 (Consumer Rights) pairs with a standalone case study if needed for mock papers.

**Map marking breakdown:**

| Map Type | Chapters | Questions |
|----------|----------|-----------|
| India outline — mark cities/movements | History Ch 1 (Champaran, Dandi, Kheda) | 2 |
| India — soil types, resource distribution | Geography Ch 1, 3, 5 | 6 |
| India — agriculture regions, industries | Geography Ch 4, 6, 7 | 6 |
| India — forest cover, wildlife | Geography Ch 2 | 2 |
| **Total** | | **16** |

#### Social Science totals

| Category | Count |
|----------|-------|
| 2-mark | 66 |
| 3-mark | 44 |
| 5-mark | 22 |
| Case study (parent+sub) | 28 |
| Source-based (parent+sub) | 20 |
| Map marking | 16 |
| Image/cartoon interpretation | 9 |
| Assertion-reason | 22 |
| **Grand total** | **227** |

#### Source textbook files

| Domain | Chapters | Source Files |
|--------|----------|-------------|
| History | Ch 1–5 | [social-history_1.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/social-history_1.txt) – `social-history_5.txt` |
| Civics | Ch 1–5 | [social-civics_1.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/social-civics_1.txt) – `social-civics_5.txt` |
| Geography | Ch 1–7 | [social-geography_1.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/social-geography_1.txt) – `social-geography_7.txt` |
| Economics | Ch 1–5 | [social-economics_1.txt](file:///home/sagarv/Projects/cbse_class10_textbooks/extracted_text/social-economics_1.txt) – `social-economics_5.txt` |

---

## 4. Grand Totals

| Subject | Universal (2+3+5) | Case Study | Subject-Specific | AR | **Grand Total** |
|---------|-------------------|------------|-------------------|----|----------------|
| Mathematics | 88 | 20 | 34 (proof+numerical+graphical) | 28 | **166** |
| Science | 78 | 16 | 51 (numerical+diagram+give-reason+expt) | 26 | **171** |
| Social Science | 132 | 28 | 45 (source+map+cartoon) | 22 | **227** |
| **All 3 subjects** | **298** | **64** | **130** | **76** | **564** |

---

## 5. SQL INSERT Format

### 5.1 Standard descriptive question (2/3/5-mark)

```sql
INSERT INTO quiz_questions (
  id, quiz_id, question_text, type, marks,
  correct_answer_text, model_answer, marking_scheme,
  explanation, difficulty, board_code, source_year, topic
) VALUES (
  uuid_generate_v4(),
  '<chapter_quiz_id>',
  'State the Fundamental Theorem of Arithmetic. Use it to find HCF and LCM of 12 and 18.',
  'short_answer_2mark',
  2,
  'HCF = 6, LCM = 36',
  'The Fundamental Theorem of Arithmetic states that every composite number can be expressed as a product of primes uniquely (up to order).\n12 = 2² × 3\n18 = 2 × 3²\nHCF = 2¹ × 3¹ = 6\nLCM = 2² × 3² = 36',
  '½ mark: statement of theorem\n½ mark: prime factorization of both numbers\n½ mark: HCF\n½ mark: LCM',
  'Use prime factorization. HCF = lowest powers of common primes. LCM = highest powers of all primes.',
  'medium',
  '041/241',
  'original',
  'Fundamental Theorem of Arithmetic — HCF and LCM'
);
```

### 5.2 Case study (parent + sub-questions)

```sql
-- Parent question (the passage)
INSERT INTO quiz_questions (
  id, quiz_id, question_text, type, marks,
  difficulty, board_code, source_year, topic
) VALUES (
  'PARENT_UUID',
  '<chapter_quiz_id>',
  'A sports teacher arranges students in rows for a drill practice. She wants to arrange 32 boys and 40 girls in separate rows such that each row has the same number of students and all rows have only boys or only girls.\n\nBased on the above information, answer the following questions:',
  'case_study',
  4,
  'medium',
  '041/241',
  '2025-sample',
  'Real Numbers — HCF applications'
);

-- Sub-question 1
INSERT INTO quiz_questions (
  id, quiz_id, question_text, type, marks,
  correct_answer_text, model_answer, marking_scheme,
  parent_question_id, sub_question_sequence,
  difficulty, board_code
) VALUES (
  uuid_generate_v4(),
  '<chapter_quiz_id>',
  '(i) Find the HCF of 32 and 40.',
  'short_answer_2mark',
  1,
  '8',
  '32 = 2⁵\n40 = 2³ × 5\nHCF = 2³ = 8',
  '½ mark: factorization, ½ mark: HCF',
  'PARENT_UUID',
  1,
  'easy',
  '041/241'
);
```

### 5.3 Assertion-reason

```sql
INSERT INTO quiz_questions (
  id, quiz_id, question_text, type, options,
  correct_option_index, marks, explanation,
  difficulty, board_code, topic
) VALUES (
  uuid_generate_v4(),
  '<chapter_quiz_id>',
  'Assertion (A): The reaction of iron nails with copper sulphate solution is a displacement reaction.\nReason (R): Iron is more reactive than copper.',
  'assertion_reason',
  '["A. Both A and R are true and R is the correct explanation of A.",
    "B. Both A and R are true but R is NOT the correct explanation of A.",
    "C. A is true but R is false.",
    "D. A is false but R is true."]',
  0,
  1,
  'Iron displaces copper from CuSO₄ because iron is above copper in the reactivity series. So both assertion and reason are true, and the reason correctly explains the assertion.',
  'medium',
  '086',
  'Chemical Reactions — Displacement'
);
```

### 5.4 Numerical (Science)

```sql
INSERT INTO quiz_questions (
  id, quiz_id, question_text, type, marks,
  correct_answer_text, model_answer, marking_scheme,
  expected_numerical_answer, expected_unit,
  difficulty, board_code, topic
) VALUES (
  uuid_generate_v4(),
  '<chapter_quiz_id>',
  'An electric iron draws a current of 4 A from a 220 V supply. What is the resistance of the electric iron? Also calculate the power consumed.',
  'numerical',
  3,
  'R = 55 Ω, P = 880 W',
  'Given: I = 4 A, V = 220 V\nR = V/I = 220/4 = 55 Ω\nP = V × I = 220 × 4 = 880 W',
  '1 mark: formula + substitution for R\n1 mark: correct R = 55 Ω\n1 mark: P = 880 W',
  55.0,
  'ohm',
  'medium',
  '086',
  'Electricity — Ohm''s Law and Power'
);
```

### 5.5 Proof (Math)

```sql
INSERT INTO quiz_questions (
  id, quiz_id, question_text, type, marks,
  model_answer, marking_scheme,
  difficulty, board_code, topic
) VALUES (
  uuid_generate_v4(),
  '<chapter_quiz_id>',
  'Prove that √3 is irrational.',
  'proof',
  3,
  'Assume √3 is rational, so √3 = a/b where a,b are coprime integers, b ≠ 0.\nSquaring: 3 = a²/b² → a² = 3b²\nSo 3 divides a² → 3 divides a (by Theorem 1.2)\nLet a = 3c, then 9c² = 3b² → b² = 3c²\nSo 3 divides b² → 3 divides b.\nBut 3 divides both a and b, contradicting that a,b are coprime.\nHence √3 is irrational.',
  '1 mark: correct assumption and setup\n1 mark: showing 3 divides a\n½ mark: substitution and showing 3 divides b\n½ mark: contradiction and conclusion',
  'standard',
  '041',
  'Real Numbers — Irrationality proof'
);
```

### 5.6 Map marking (Social Science)

```sql
INSERT INTO quiz_questions (
  id, quiz_id, question_text, type, marks,
  correct_answer_text, model_answer, diagram_url,
  difficulty, board_code, topic
) VALUES (
  uuid_generate_v4(),
  '<chapter_quiz_id>',
  'On the given outline map of India, locate and label the following:\n(a) The place where the Indian National Congress Session of 1927 was held.\n(b) The place associated with the Peasant Satyagraha of 1917.',
  'map_marking',
  2,
  '(a) Madras (b) Champaran',
  '(a) Madras (Chennai) — marked on the southeastern coast of India.\n(b) Champaran — marked in northern Bihar.',
  NULL,
  'medium',
  '087',
  'Nationalism in India — Map work'
);
```

### 5.7 Source-based (Social Science)

```sql
-- Parent (passage)
INSERT INTO quiz_questions (
  id, quiz_id, question_text, type, marks,
  difficulty, board_code, topic
) VALUES (
  'SOURCE_PARENT_UUID',
  '<chapter_quiz_id>',
  'Read the source given below and answer the questions that follow:\n\n"The Simon Commission arrived in India in 1928. It was greeted with the slogan ''Go back Simon''. All parties, including the Congress and the Muslim League, participated in the demonstrations..."',
  'source_based',
  4,
  'medium',
  '087',
  'Nationalism in India — Simon Commission'
);

-- Sub-question 1
INSERT INTO quiz_questions (
  id, quiz_id, question_text, type, marks,
  correct_answer_text, model_answer,
  parent_question_id, sub_question_sequence,
  difficulty, board_code
) VALUES (
  uuid_generate_v4(),
  '<chapter_quiz_id>',
  '(i) Why was the Simon Commission sent to India?',
  'short_answer_2mark',
  1,
  'To review the constitutional system in India and suggest changes.',
  'The Simon Commission was set up in response to the nationalist movement. It was to look into the functioning of the constitutional system in India and suggest changes.',
  'SOURCE_PARENT_UUID',
  1,
  'easy',
  '087'
);
```

---

## 6. Execution Strategy

### 6.1 Priority Batches

| Batch | Contents | Questions | Seed File | Priority |
|-------|----------|-----------|-----------|----------|
| **Batch A** | Math 2/3/5-mark + proofs (Ch 1–7) | ~65 | `db/seed_q_math_descriptive_a.sql` | 🔴 P1 |
| **Batch B** | Math 2/3/5-mark + numericals (Ch 8–14) | ~65 | `db/seed_q_math_descriptive_b.sql` | 🔴 P1 |
| **Batch C** | Math case studies (5 passages) | 20 | `db/seed_q_math_case_studies.sql` | 🔴 P1 |
| **Batch D** | Math assertion-reason (all 14 ch) | 28 | `db/seed_q_math_ar.sql` | 🟡 P2 |
| **Batch E** | Science 2/3/5-mark + diagrams (Ch 1–7) | ~65 | `db/seed_q_science_descriptive_a.sql` | 🔴 P1 |
| **Batch F** | Science 2/3/5-mark + numericals (Ch 8–13) | ~50 | `db/seed_q_science_descriptive_b.sql` | 🔴 P1 |
| **Batch G** | Science case studies (4 passages) + AR | 42 | `db/seed_q_science_case_ar.sql` | 🔴 P1 |
| **Batch H** | Science give-reason + experiment | 23 | `db/seed_q_science_special.sql` | 🟡 P2 |
| **Batch I** | SSt 2/3/5-mark (History + Civics, 10 ch) | ~60 | `db/seed_q_sst_descriptive_a.sql` | 🔴 P1 |
| **Batch J** | SSt 2/3/5-mark (Geography + Economics, 12 ch) | ~72 | `db/seed_q_sst_descriptive_b.sql` | 🔴 P1 |
| **Batch K** | SSt source-based + case studies | 48 | `db/seed_q_sst_case_source.sql` | 🔴 P1 |
| **Batch L** | SSt map marking | 16 | `db/seed_q_sst_map.sql` | 🔴 P1 |
| **Batch M** | SSt cartoon/image interpretation + AR | 31 | `db/seed_q_sst_special.sql` | 🟡 P2 |

### 6.2 Generation Workflow (per batch)

```
1. Read extracted textbook file(s) for the chapter(s)
2. Identify NCERT exercises, in-text questions, and examples
3. Generate questions aligned to CBSE marking scheme
4. Fill: question_text, model_answer, marking_scheme, explanation
5. Assign: type, marks, difficulty, board_code, topic, source_year
6. For case/source: create parent question, then sub-questions with parent_question_id
7. Output as INSERT INTO quiz_questions ... ON CONFLICT (id) DO NOTHING;
8. Create/use quiz record: one quiz per chapter (reuse existing or create new)
```

### 6.3 Quiz Record Strategy

Each chapter should have **one comprehensive quiz** (the existing MCQ quizzes). New descriptive questions are inserted into the same quiz, differentiated by `type` and `marks`. The Flutter UI will filter by `type` to present different practice modes:

- **Quick MCQ Quiz** → `type IN ('multiple_choice', 'assertion_reason')`
- **Descriptive Practice** → `type IN ('short_answer_2mark', 'short_answer_3mark', 'long_answer_5mark')`
- **Board Exam Prep** → all types, grouped by marks
- **Mock Paper Assembly** → via `mock_paper_questions` join table

For chapters that don't yet have a quiz record, create one with:
```sql
INSERT INTO quizzes (id, chapter_id, title, passing_percentage)
VALUES (uuid_generate_v4(), '<chapter_id>', '<Subject> Chapter N Assessment', 60)
ON CONFLICT (id) DO NOTHING;
```

---

## 7. Quality Checklist (per question)

- [ ] `question_text` is clear, unambiguous, uses NCERT terminology
- [ ] `model_answer` provides a complete, step-by-step solution
- [ ] `marking_scheme` breaks marks into ½-mark or 1-mark steps
- [ ] `marks` matches the question type (2/3/5)
- [ ] `difficulty` is set (`easy` / `medium` / `hard` / `basic` / `standard`)
- [ ] `board_code` is set (`041`, `241`, `041/241`, `086`, `087`)
- [ ] `topic` is specific (e.g., "Pythagoras Theorem" not just "Triangles")
- [ ] `source_year` is set (`original`, `2025-sample`, `2026-set1`, etc.)
- [ ] Case study sub-questions have correct `parent_question_id` and `sub_question_sequence`
- [ ] Numerical questions have `expected_numerical_answer` and `expected_unit`
- [ ] No duplicate questions across batches

---

## 8. Flutter UI Implications

> [!WARNING]
> The current `quiz_view.dart` only handles `multiple_choice` questions. New question types require UI changes.

### Required UI updates (tracked separately)

| Feature | Description | Priority |
|---------|-------------|----------|
| **Descriptive answer input** | `TextField` for typing short/long answers | P1 |
| **Model answer reveal** | Show `model_answer` and `marking_scheme` after submission | P1 |
| **Self-grading toggle** | Student marks their own descriptive answer against marking scheme | P1 |
| **Case study wrapper** | Load parent passage, present sub-questions sequentially | P1 |
| **AR option selector** | Four fixed options (A/B/C/D) with assertion+reason display | P2 |
| **Map widget** | Interactive India outline map for `map_marking` questions | P3 |
| **Diagram viewer** | Display `diagram_url` inline with label-input overlay | P3 |

> [!NOTE]
> These UI changes should be planned in a separate implementation plan after the question data is seeded. The data layer (questions in DB) is independent of the UI layer.

---

## 9. Dependencies & Risks

| Dependency | Status | Risk |
|-----------|--------|------|
| Schema supports all question types | ✅ Done | None |
| Extracted textbook files available | ✅ All 49 files | None |
| All chapters seeded in DB | ✅ Batches 1–4 | None |
| Quiz records exist for all chapters | ⚠️ ~8 chapters have quizzes | Create missing quiz records in seed files |
| Flutter UI for new types | ❌ Not started | Can seed data first, build UI after |
| Diagram/image hosting | ❌ No CDN for question images | Use text-described diagrams initially; add `diagram_url` later |

---

## 10. Timeline Estimate

| Phase | Duration | Batches | Output |
|-------|----------|---------|--------|
| **Phase 1: Math descriptive** | 2 sessions | A + B + C | ~150 questions |
| **Phase 2: Science descriptive** | 2 sessions | E + F + G | ~157 questions |
| **Phase 3: SSt descriptive** | 2 sessions | I + J + K + L | ~196 questions |
| **Phase 4: P2 special types** | 1 session | D + H + M | ~82 questions |
| **Total** | ~7 sessions | 13 batches | **564 questions** |

> [!TIP]
> Each "session" = one agent task generating a SQL seed file of ~40–75 questions. The textbook files provide source material; the agent reads the textbook, generates questions, and outputs `INSERT` statements.
