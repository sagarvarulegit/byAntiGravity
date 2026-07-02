---
type: Plan
title: Implementation Plan — CBSE Class 10 English Content Generation
description: This plan details the generation of comprehensive English content for CBSE Class 10 (Code 184) to be stored in `db/seed_english_batch1.sql`. It follow...
tags: [plan]
timestamp: 2026-06-24T17:55:41Z
---
# Implementation Plan — CBSE Class 10 English Content Generation

This plan details the generation of comprehensive English content for CBSE Class 10 (Code 184) to be stored in `db/seed_english_batch1.sql`. It follows the specifications in the codebase rules and schema definitions.

---

## 1. Objectives

- **Task 1: Database Setup**
  - Insert or check subject `English Language & Literature` (ID: `a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44`, code: `ENG10`).
  - Create 19 chapters (9 First Flight + 10 Footprints Without Feet, including the rationalized-out "The Hack Driver" to meet the 10-chapter supplementary reader count).
- **Task 2: Revision Notes for First Flight Chapters**
  - Generate revision notes for all 9 First Flight chapters containing goals, prose summary, key themes, character sketches, literary devices with `[JARGON: term | definition | example]` syntax, and a 3-panel ASCII art comic recap between Priya and Rahul.
- **Task 3: Poetry Questions**
  - For each of the 10 poems in the First Flight curriculum, create a quiz and insert 5 extract-based questions (MCQs) and 2 analytical questions (short answer 3-mark) with model answers and step-wise marking schemes.
- **Task 4: Grammar & Writing Content**
  - **Grammar**: 10 exercises per topic (Tenses, Modals, Reported Speech, Subject-Verb Concord, Editing/Omission) stored as interactive quiz questions linked to chapters 1-5.
  - **Writing**: Practical writing prompts (Formal Letter, Analytical Paragraph, Story Completion) with templates, step-by-step marking schemes, and model answers.

---

## 2. Subject and Chapters Catalog Mapping

Subject ID: `a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44`

| Book | Ch # | DB Seq | Title | Source File |
| :--- | :--- | :--- | :--- | :--- |
| **First Flight** | 1 | 1 | Chapter 1: A Letter to God | `english_jeff101.txt` |
| **First Flight** | 2 | 2 | Chapter 2: Nelson Mandela: Long Walk to Freedom | `english_jeff102.txt` |
| **First Flight** | 3 | 3 | Chapter 3: Two Stories about Flying | `english_jeff103.txt` |
| **First Flight** | 4 | 4 | Chapter 4: From the Diary of Anne Frank | `english_jeff104.txt` |
| **First Flight** | 5 | 5 | Chapter 5: Glimpses of India | `english_jeff105.txt` |
| **First Flight** | 6 | 6 | Chapter 6: Mijbil the Otter | `english_jeff106.txt` |
| **First Flight** | 7 | 7 | Chapter 7: Madam Rides the Bus | `english_jeff107.txt` |
| **First Flight** | 8 | 8 | Chapter 8: The Sermon at Benares | `english_jeff108.txt` |
| **First Flight** | 9 | 9 | Chapter 9: The Proposal | `english_jeff109.txt` |
| **Footprints** | 1 | 10 | Chapter 10: A Triumph of Surgery | `english_jefp101.txt` |
| **Footprints** | 2 | 11 | Chapter 11: The Thief's Story | `english_jefp102.txt` |
| **Footprints** | 3 | 12 | Chapter 12: The Midnight Visitor | `english_jefp103.txt` |
| **Footprints** | 4 | 13 | Chapter 13: A Question of Trust | `english_jefp104.txt` |
| **Footprints** | 5 | 14 | Chapter 14: Footprints without Feet | `english_jefp105.txt` |
| **Footprints** | 6 | 15 | Chapter 15: The Making of a Scientist | `english_jefp106.txt` |
| **Footprints** | 7 | 16 | Chapter 16: The Necklace | `english_jefp107.txt` |
| **Footprints** | 8 | 17 | Chapter 17: The Hack Driver | *Custom Generation* |
| **Footprints** | 9 | 18 | Chapter 18: Bholi | `english_jefp108.txt` |
| **Footprints** | 10 | 19 | Chapter 19: The Book That Saved the Earth | `english_jefp109.txt` |

---

## 3. Poetry Quizzes Setup

For each poem, a quiz will be registered under the corresponding chapter:
1. **Dust of Snow** (Ch 1)
2. **Fire and Ice** (Ch 1)
3. **A Tiger in the Zoo** (Ch 2)
4. **How to Tell Wild Animals** (Ch 3)
5. **The Ball Poem** (Ch 3)
6. **Amanda!** (Ch 4)
7. **The Trees** (Ch 5)
8. **Fog** (Ch 6)
9. **The Tale of Custard the Dragon** (Ch 7)
10. **For Anne Gregory** (Ch 8)

Each quiz will contain:
- 5 `extract_based` questions (MCQs with 1 mark, option list, correct option index, difficulty, topic, board_code='184').
- 2 `short_answer_3mark` questions (descriptive questions with 3 marks, model answer, step-wise marking scheme, difficulty, topic, board_code='184').

---

## 4. Grammar and Writing Content Structure

### A. Grammar Quizzes (10 Questions each)
1. **Tenses** (Linked to Ch 1, MCQ Grammar fills)
2. **Modals** (Linked to Ch 2, MCQ Grammar fills)
3. **Reported Speech** (Linked to Ch 3, MCQ Direct to Indirect conversion)
4. **Subject-Verb Concord** (Linked to Ch 4, MCQ verb agreement)
5. **Editing/Omission** (Linked to Ch 5, Error correction MCQs)

### B. Writing Tasks & Revision Notes
1. **Formal Letter Writing** (Linked to Ch 6):
   - Lesson Note: Formal letter template, rules, formatting.
   - Quiz Question: Prompt for a Letter to the Editor with model answer & marking scheme.
2. **Analytical Paragraph** (Linked to Ch 7):
   - Lesson Note: Paragraph parsing structure, vocabulary, templates.
   - Quiz Question: Prompt analyzing a data chart with model answer & marking scheme.
3. **Story Completion** (Linked to Ch 8):
   - Lesson Note: Story structure, narrative tips.
   - Quiz Question: Prompt for a story outline completion with model answer & marking scheme.

---

## 5. Technical Implementation Details & Automation

To avoid truncation and format errors, a Python script `scratch/generate_english_seed.py` will be created. The script will:
- Programmatically define markdown text and quiz schemas.
- Use Python's `uuid` module to generate consistent and unique UUIDs.
- Write the final raw SQL seed to `db/seed_english_batch1.sql`.
- Verify database insertion syntax and file integrity.

---

## 6. Verification Plan

1. **Syntax Check**: Execute dry run verification of the generated SQL syntax.
2. **Data Validity**: Confirm that all required tables and columns are populated:
   - UUIDs are valid and link correctly (`subject_id`, `chapter_id`, `quiz_id`).
   - Text formats adhere to rules (e.g. `[JARGON:...` format, Priya/Rahul Comic recaps inside code blocks).
   - Descriptive questions use the new columns (`model_answer`, `marking_scheme`, `difficulty`, `board_code`).
3. **Flutter Static Analysis**: Run `flutter analyze` inside the client folder to make sure no breaks or warnings occur.
