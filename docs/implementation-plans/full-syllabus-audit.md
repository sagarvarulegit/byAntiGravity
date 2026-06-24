# Full CBSE Class 10 Syllabus Content Audit

> **Created**: 2026-06-24
> **Purpose**: Map every NCERT Class 10 chapter → current DB content → gap analysis → batch 3 & 4 plan
> **Status**: PLAN ONLY — do not execute

---

## Table of Contents

1. [Current Content Inventory](#1-current-content-inventory)
2. [Full NCERT Chapter List — Mathematics (14 chapters)](#2-mathematics-14-chapters)
3. [Full NCERT Chapter List — Science (13 chapters)](#3-science-13-chapters)
4. [Full NCERT Chapter List — Social Science (22 chapters)](#4-social-science-22-chapters)
5. [Gap Summary Dashboard](#5-gap-summary-dashboard)
6. [Batch 3 Plan (Priority)](#6-batch-3-plan-priority)
7. [Batch 4 Plan (Completion)](#7-batch-4-plan-completion)
8. [Estimation Methodology](#8-estimation-methodology)

---

## 1. Current Content Inventory

### Seed Files Audited

| File | Contents |
|------|----------|
| [seed.sql](file:///home/sagarv/Projects/byAntiGravity/db/seed.sql) | 3 subjects, 5 chapters, 9 lessons (V1 notes), 3 quizzes, 12 quiz Qs |
| [seed_chapters_batch2.sql](file:///home/sagarv/Projects/byAntiGravity/db/seed_chapters_batch2.sql) | 5 chapters, 10 lessons (videos only), 5 quizzes, 25 quiz Qs |
| [seed_notes_batch1.sql](file:///home/sagarv/Projects/byAntiGravity/db/seed_notes_batch1.sql) | 2 revision notes (Electricity, Nationalism in India) — V1 format |
| [seed_notes_v2.sql](file:///home/sagarv/Projects/byAntiGravity/db/seed_notes_v2.sql) | 5 revision notes (V2 format: Real Numbers, Chemical Reactions, Polynomials, Electricity, Nationalism) |
| [seed_quizzes_batch1.sql](file:///home/sagarv/Projects/byAntiGravity/db/seed_quizzes_batch1.sql) | Additional quiz Qs for: Sci Ch1 (+6), Math Ch1 (+6), Math Ch2 (+6), Sci Ch12 (+6), SocSci History Ch1 (+6) |
| [seed_science_ch1_quizzes.sql](file:///home/sagarv/Projects/byAntiGravity/db/seed_science_ch1_quizzes.sql) | 3 more quiz Qs for Science Ch1 |

### Extracted Textbook Sources Available

| Subject | Files | Count |
|---------|-------|-------|
| Mathematics | `mathematics_1.txt` – `mathematics_14.txt` | **14 files** |
| Science | `science_1.txt` – `science_13.txt` | **13 files** |
| Social Science — History | `social-history_1.txt` – `social-history_5.txt` | **5 files** |
| Social Science — Civics | `social-civics_1.txt` – `social-civics_5.txt` | **5 files** |
| Social Science — Geography | `social-geography_1.txt` – `social-geography_7.txt` | **7 files** |
| Social Science — Economics | `social-economics_1.txt` – `social-economics_5.txt` | **5 files** |
| **Total** | | **49 files** |

> [!IMPORTANT]
> The extracted textbooks have **14 Mathematics** chapters (not 15), **13 Science** chapters (not 16), and **22 Social Science** chapters (not the initially expected 14). This matches the **latest CBSE rationalized syllabus (2024-25 onward)** where some chapters have been removed or merged.

---

## 2. Mathematics (14 Chapters)

> NCERT Textbook: *Mathematics* — 14 chapters confirmed from extracted text.

| # | Chapter Title | Source File | Chapter Seeded? | Videos? | V2 Notes? | Quiz? | Quiz Qs |
|---|---------------|-------------|:---:|:---:|:---:|:---:|:---:|
| 1 | Real Numbers | `mathematics_1.txt` (16 KB) | ✅ seed.sql | ✅ 2 | ✅ V2 | ✅ | 10+ |
| 2 | Polynomials | `mathematics_2.txt` (18 KB) | ✅ seed.sql | ✅ 2 | ✅ V2 | ✅ | 10+ |
| 3 | Pair of Linear Equations in Two Variables | `mathematics_3.txt` (22 KB) | ✅ batch2 | ✅ 2 | ❌ | ✅ | 5 |
| 4 | Quadratic Equations | `mathematics_4.txt` (17 KB) | ✅ batch2 | ✅ 2 | ❌ | ✅ | 5 |
| 5 | Arithmetic Progressions | `mathematics_5.txt` (35 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 6 | Triangles | `mathematics_6.txt` (31 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 7 | Coordinate Geometry | `mathematics_7.txt` (21 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 8 | Introduction to Trigonometry | `mathematics_8.txt` (27 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 9 | Some Applications of Trigonometry | `mathematics_9.txt` (15 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 10 | Circles | `mathematics_10.txt` (14 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 11 | Areas Related to Circles | `mathematics_11.txt` (8 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 12 | Surface Areas and Volumes | `mathematics_12.txt` (16 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 13 | Statistics | `mathematics_13.txt` (38 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 14 | Probability | `mathematics_14.txt` (27 KB) | ❌ | ❌ | ❌ | ❌ | 0 |

**Mathematics coverage: 4/14 chapters seeded (28.6%) — 10 chapters MISSING**

---

## 3. Science (13 Chapters)

> NCERT Textbook: *Science* — 13 chapters confirmed from extracted text.
> (Chapters 14–16 from older syllabus have been removed in rationalized syllabus.)

| # | Chapter Title | Source File | Chapter Seeded? | Videos? | V2 Notes? | Quiz? | Quiz Qs |
|---|---------------|-------------|:---:|:---:|:---:|:---:|:---:|
| 1 | Chemical Reactions and Equations | `science_1.txt` (32 KB) | ✅ seed.sql | ✅ 2 | ✅ V2 | ✅ | 13+ |
| 2 | Acids, Bases and Salts | `science_2.txt` (39 KB) | ✅ batch2 | ✅ 2 | ❌ | ✅ | 5 |
| 3 | Metals and Non-metals | `science_3.txt` (43 KB) | ✅ batch2 | ✅ 2 | ❌ | ✅ | 5 |
| 4 | Carbon and its Compounds | `science_4.txt` (46 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 5 | Life Processes | `science_5.txt` (53 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 6 | Control and Coordination | `science_6.txt` (31 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 7 | How do Organisms Reproduce? | `science_7.txt` (38 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 8 | Heredity | `science_8.txt` (16 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 9 | Light — Reflection and Refraction | `science_9.txt` (58 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 10 | The Human Eye and the Colourful World | `science_10.txt` (26 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 11 | Electricity | `science_11.txt` (46 KB) | ✅ seed.sql ¹ | ✅ 2 | ✅ V2 | ✅ | 10+ |
| 12 | Magnetic Effects of Electric Current | `science_12.txt` (30 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 13 | Our Environment | `science_13.txt` (20 KB) | ❌ | ❌ | ❌ | ❌ | 0 |

> ¹ Note: Electricity is seeded as "Chapter 12" in the DB (matching older syllabus numbering). The extracted textbook has it as Chapter 11 (`science_11.txt`). The source file `science_12.txt` actually contains "Magnetic Effects of Electric Current." This numbering discrepancy should be reconciled in a future migration.

**Science coverage: 4/13 chapters seeded (30.8%) — 9 chapters MISSING**

---

## 4. Social Science (22 Chapters)

> Social Science is split across 4 NCERT textbooks:
> - *India and the Contemporary World – II* (History): 5 chapters
> - *Democratic Politics – II* (Civics/Political Science): 5 chapters
> - *Contemporary India – II* (Geography): 7 chapters
> - *Understanding Economic Development* (Economics): 5 chapters

### 4a. History (5 chapters)

| # | Chapter Title | Source File | Chapter Seeded? | Videos? | V2 Notes? | Quiz? | Quiz Qs |
|---|---------------|-------------|:---:|:---:|:---:|:---:|:---:|
| 1 | The Rise of Nationalism in Europe | `social-history_1.txt` (58 KB) | ❌ ² | ❌ | ❌ | ❌ | 0 |
| 2 | Nationalism in India | `social-history_2.txt` (53 KB) | ✅ seed.sql | ✅ 1 | ✅ V2 | ✅ | 5+ |
| 3 | The Making of a Global World | `social-history_3.txt` (59 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 4 | The Age of Industrialisation | `social-history_4.txt` (52 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 5 | Print Culture and the Modern World | `social-history_5.txt` (58 KB) | ❌ | ❌ | ❌ | ❌ | 0 |

> ² The DB chapter "Nationalism in India" is seeded as `sequence_number=1` in the Social Science subject. The NCERT textbook has it as History Chapter 2. "The Rise of Nationalism in Europe" (History Ch1) has no separate DB entry.

### 4b. Civics / Political Science (5 chapters)

| # | Chapter Title | Source File | Chapter Seeded? | Videos? | V2 Notes? | Quiz? | Quiz Qs |
|---|---------------|-------------|:---:|:---:|:---:|:---:|:---:|
| 1 | Power-sharing | `social-civics_1.txt` (27 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 2 | Federalism | `social-civics_2.txt` (34 KB) | ✅ batch2 | ✅ 2 | ❌ | ✅ | 5 |
| 3 | Gender, Religion and Caste | `social-civics_3.txt` (35 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 4 | Political Parties | `social-civics_4.txt` (37 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 5 | Outcomes of Democracy | `social-civics_5.txt` (25 KB) | ❌ | ❌ | ❌ | ❌ | 0 |

### 4c. Geography (7 chapters)

| # | Chapter Title | Source File | Chapter Seeded? | Videos? | V2 Notes? | Quiz? | Quiz Qs |
|---|---------------|-------------|:---:|:---:|:---:|:---:|:---:|
| 1 | Resources and Development | `social-geography_1.txt` (27 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 2 | Forest and Wildlife Resources | `social-geography_2.txt` (13 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 3 | Water Resources | `social-geography_3.txt` (23 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 4 | Agriculture | `social-geography_4.txt` (24 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 5 | Minerals and Energy Resources | `social-geography_5.txt` (31 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 6 | Manufacturing Industries | `social-geography_6.txt` (25 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 7 | Lifelines of National Economy | `social-geography_7.txt` (26 KB) | ❌ | ❌ | ❌ | ❌ | 0 |

### 4d. Economics (5 chapters)

| # | Chapter Title | Source File | Chapter Seeded? | Videos? | V2 Notes? | Quiz? | Quiz Qs |
|---|---------------|-------------|:---:|:---:|:---:|:---:|:---:|
| 1 | Development | `social-economics_1.txt` (38 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 2 | Sectors of the Indian Economy | `social-economics_2.txt` (53 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 3 | Money and Credit | `social-economics_3.txt` (39 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 4 | Globalisation and the Indian Economy | `social-economics_4.txt` (47 KB) | ❌ | ❌ | ❌ | ❌ | 0 |
| 5 | Consumer Rights | `social-economics_5.txt` (42 KB) | ❌ | ❌ | ❌ | ❌ | 0 |

**Social Science coverage: 2/22 chapters seeded (9.1%) — 20 chapters MISSING**

---

## 5. Gap Summary Dashboard

### Overall Coverage

| Subject | Total Chapters | Seeded | With V2 Notes | With Quizzes | **MISSING** |
|---------|:-:|:-:|:-:|:-:|:-:|
| Mathematics | 14 | 4 | 2 | 4 | **10** |
| Science | 13 | 4 | 2 | 4 | **9** |
| Social Science | 22 | 2 | 1 | 2 | **20** |
| **TOTAL** | **49** | **10** | **5** | **10** | **39** |

### Content Type Gaps (Seeded Chapters)

Even among the 10 seeded chapters, some are incomplete:

| Chapter | V2 Notes | Quiz (5+ Qs) | Status |
|---------|:---:|:---:|--------|
| Math Ch3: Linear Equations | ❌ | ✅ | Needs V2 notes |
| Math Ch4: Quadratic Equations | ❌ | ✅ | Needs V2 notes |
| Sci Ch2: Acids, Bases & Salts | ❌ | ✅ | Needs V2 notes |
| Sci Ch3: Metals & Non-metals | ❌ | ✅ | Needs V2 notes |
| Civics Ch2: Federalism | ❌ | ✅ | Needs V2 notes |

> [!WARNING]
> **5 seeded chapters are missing V2-format revision notes.** These should be backfilled before or during Batch 3.

### Numbering Discrepancy

| DB Entry | DB Seq# | Actual NCERT Chapter# | Issue |
|----------|:---:|:---:|-------|
| "Chapter 12: Electricity" (Science) | 12 | **11** | Follows old syllabus numbering |
| "Nationalism in India" (Social Science) | 1 | History **Ch 2** | Mixed numbering across sub-disciplines |

> [!NOTE]
> Social Science numbering is complex because the subject spans 4 textbooks (History, Civics, Geography, Economics). A `sub_discipline` column or separate subject entries may be needed. For now, we'll use flat sequence numbering within the single Social Science subject.

---

## 6. Batch 3 Plan (Priority)

**Strategy**: Cover the most board-exam-weighted chapters first. Target all remaining Mathematics + core Science chapters.

### Batch 3A — Mathematics (10 chapters)

| Priority | Chapter | Source File (KB) | Deliverables | Est. Hours |
|:---:|---------|---------|:---:|:---:|
| P0 | Ch 5: Arithmetic Progressions | `mathematics_5.txt` (35 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 2.0h |
| P0 | Ch 6: Triangles | `mathematics_6.txt` (31 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 2.0h |
| P0 | Ch 8: Introduction to Trigonometry | `mathematics_8.txt` (27 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 2.0h |
| P1 | Ch 7: Coordinate Geometry | `mathematics_7.txt` (21 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 1.5h |
| P1 | Ch 9: Applications of Trigonometry | `mathematics_9.txt` (15 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 1.5h |
| P1 | Ch 10: Circles | `mathematics_10.txt` (14 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 1.5h |
| P1 | Ch 12: Surface Areas and Volumes | `mathematics_12.txt` (16 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 1.5h |
| P2 | Ch 11: Areas Related to Circles | `mathematics_11.txt` (8 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 1.0h |
| P2 | Ch 13: Statistics | `mathematics_13.txt` (38 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 2.5h |
| P2 | Ch 14: Probability | `mathematics_14.txt` (27 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 2.0h |

**Math subtotal: ~17.5 hours**

### Batch 3B — Science (9 chapters)

| Priority | Chapter | Source File (KB) | Deliverables | Est. Hours |
|:---:|---------|---------|:---:|:---:|
| P0 | Ch 4: Carbon and its Compounds | `science_4.txt` (46 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 2.5h |
| P0 | Ch 5: Life Processes | `science_5.txt` (53 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 3.0h |
| P0 | Ch 9: Light — Reflection and Refraction | `science_9.txt` (58 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 3.0h |
| P0 | Ch 12: Magnetic Effects of Electric Current | `science_12.txt` (30 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 2.0h |
| P1 | Ch 6: Control and Coordination | `science_6.txt` (31 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 2.0h |
| P1 | Ch 7: How do Organisms Reproduce? | `science_7.txt` (38 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 2.0h |
| P1 | Ch 10: Human Eye & Colourful World | `science_10.txt` (26 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 1.5h |
| P2 | Ch 8: Heredity | `science_8.txt` (16 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 1.5h |
| P2 | Ch 13: Our Environment | `science_13.txt` (20 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 1.5h |

**Science subtotal: ~19.0 hours**

### Batch 3C — Backfill V2 Notes for Existing Chapters

| Chapter | Source File | Deliverables | Est. Hours |
|---------|---------|:---:|:---:|
| Math Ch 3: Linear Equations | `mathematics_3.txt` | V2 notes only | 1.0h |
| Math Ch 4: Quadratic Equations | `mathematics_4.txt` | V2 notes only | 1.0h |
| Sci Ch 2: Acids, Bases & Salts | `science_2.txt` | V2 notes only | 1.0h |
| Sci Ch 3: Metals & Non-metals | `science_3.txt` | V2 notes only | 1.0h |
| Civics Ch 2: Federalism | `social-civics_2.txt` | V2 notes only | 1.0h |

**Backfill subtotal: ~5.0 hours**

### Batch 3 Total: ~41.5 hours

> [!TIP]
> After Batch 3, Math and Science will be at **100% chapter coverage** (49/49 chapters). The backfill ensures all seeded chapters also have V2-format notes.

---

## 7. Batch 4 Plan (Completion)

**Strategy**: Complete all Social Science chapters. Split across sub-disciplines.

### Batch 4A — History (4 remaining chapters)

| Priority | Chapter | Source File (KB) | Deliverables | Est. Hours |
|:---:|---------|---------|:---:|:---:|
| P0 | Ch 1: Rise of Nationalism in Europe | `social-history_1.txt` (58 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 3.0h |
| P1 | Ch 3: Making of a Global World | `social-history_3.txt` (59 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 3.0h |
| P1 | Ch 4: Age of Industrialisation | `social-history_4.txt` (52 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 2.5h |
| P2 | Ch 5: Print Culture & Modern World | `social-history_5.txt` (58 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 3.0h |

**History subtotal: ~11.5 hours**

### Batch 4B — Civics / Political Science (4 remaining chapters)

| Priority | Chapter | Source File (KB) | Deliverables | Est. Hours |
|:---:|---------|---------|:---:|:---:|
| P0 | Ch 1: Power-sharing | `social-civics_1.txt` (27 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 1.5h |
| P1 | Ch 3: Gender, Religion and Caste | `social-civics_3.txt` (35 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 2.0h |
| P1 | Ch 4: Political Parties | `social-civics_4.txt` (37 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 2.0h |
| P2 | Ch 5: Outcomes of Democracy | `social-civics_5.txt` (25 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 1.5h |

**Civics subtotal: ~7.0 hours**

### Batch 4C — Geography (7 chapters)

| Priority | Chapter | Source File (KB) | Deliverables | Est. Hours |
|:---:|---------|---------|:---:|:---:|
| P0 | Ch 1: Resources and Development | `social-geography_1.txt` (27 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 1.5h |
| P0 | Ch 4: Agriculture | `social-geography_4.txt` (24 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 1.5h |
| P1 | Ch 3: Water Resources | `social-geography_3.txt` (23 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 1.5h |
| P1 | Ch 5: Minerals and Energy Resources | `social-geography_5.txt` (31 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 2.0h |
| P1 | Ch 6: Manufacturing Industries | `social-geography_6.txt` (25 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 1.5h |
| P2 | Ch 2: Forest and Wildlife Resources | `social-geography_2.txt` (13 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 1.0h |
| P2 | Ch 7: Lifelines of National Economy | `social-geography_7.txt` (26 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 1.5h |

**Geography subtotal: ~10.5 hours**

### Batch 4D — Economics (5 chapters)

| Priority | Chapter | Source File (KB) | Deliverables | Est. Hours |
|:---:|---------|---------|:---:|:---:|
| P0 | Ch 1: Development | `social-economics_1.txt` (38 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 2.0h |
| P0 | Ch 2: Sectors of the Indian Economy | `social-economics_2.txt` (53 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 2.5h |
| P1 | Ch 3: Money and Credit | `social-economics_3.txt` (39 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 2.0h |
| P1 | Ch 4: Globalisation & Indian Economy | `social-economics_4.txt` (47 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 2.5h |
| P2 | Ch 5: Consumer Rights | `social-economics_5.txt` (42 KB) | Chapter + 2 videos + V2 notes + 5 quiz Qs | 2.0h |

**Economics subtotal: ~11.0 hours**

### Batch 4 Total: ~40.0 hours

> [!TIP]
> After Batch 4, all 49 chapters across all 3 subjects will have: chapter entries, 2 video stubs, V2-format revision notes, and 5+ quiz questions each.

---

## 8. Estimation Methodology

### Per-Chapter Deliverables

Each new chapter requires:

| Item | Description | Effort Factor |
|------|-------------|:---:|
| Chapter INSERT | UUID, subject_id, title, sequence, description | ~5 min |
| 2 Video Lessons | Stub entries with placeholder HLS URLs | ~10 min |
| 1 V2 Revision Note | Full V2 format (11 sections: goal, hook, 3 concepts with JARGON tags, mistakes, memory tricks, practice, board tips, revision, comic recap) | ~60–90 min |
| 1 Quiz + 5 Questions | MCQ questions sourced from textbook exercises and NCERT exemplar | ~30–45 min |

### Effort Scaling

- **Small chapter** (< 20 KB source): ~1.0–1.5 hours
- **Medium chapter** (20–40 KB source): ~1.5–2.0 hours
- **Large chapter** (40–60 KB source): ~2.5–3.0 hours

### V2 Notes Format Reference

All new notes must follow the V2 template established in [seed_notes_v2.sql](file:///home/sagarv/Projects/byAntiGravity/db/seed_notes_v2.sql):

```
1. 🎯 Chapter Goal
2. 🪝 Hook
3. 📖 Concept 1 (with [JARGON: Term | Definition | Example] tags)
4. 📖 Concept 2
5. 📖 Concept 3
6. ⚠️ Common Mistakes
7. 💡 Memory Tricks
8. 📝 Quick Practice (2 questions with answers)
9. 🎓 Board Tips
10. 🔄 One-Minute Revision
11. 🎬 Comic Recap (ASCII art Priya/Rahul dialogue)
```

---

## Grand Summary

| Metric | Current | After Batch 3 | After Batch 4 |
|--------|:---:|:---:|:---:|
| **Total chapters seeded** | 10 / 49 | 29 / 49 | **49 / 49** |
| **Chapters with V2 notes** | 5 / 49 | 29 / 49 | **49 / 49** |
| **Chapters with quizzes** | 10 / 49 | 29 / 49 | **49 / 49** |
| **Coverage %** | 20.4% | 59.2% | **100%** |
| **Estimated hours** | — | ~41.5h | ~40.0h |
| **Cumulative hours** | — | 41.5h | **81.5h** |

> [!IMPORTANT]
> **Open decisions before execution:**
> 1. Should Social Science be split into 4 separate DB subjects (History, Civics, Geography, Economics) or remain as one subject with sub-discipline prefixes?
> 2. Should the Electricity chapter numbering (Ch 12 → Ch 11) be fixed via migration?
> 3. Should video stubs use empty URLs or a placeholder demo HLS URL?
> 4. Should batch 3 and 4 be separate SQL files or combined into one large seed?
