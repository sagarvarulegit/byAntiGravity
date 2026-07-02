---
type: Plan
title: Implementation Plan - seed_batch3_math_part2
description: Create NCERT-faithful PostgreSQL seed code for Mathematics Chapters 10, 11, 12, 13, 14, following the V2 Revision Notes standard and database schema c...
tags: [plan]
timestamp: 2026-06-24T08:06:14Z
---
# Implementation Plan - seed_batch3_math_part2

Create NCERT-faithful PostgreSQL seed code for Mathematics Chapters 10, 11, 12, 13, 14, following the V2 Revision Notes standard and database schema conventions.

## 1. Scope & Identifiers
* **Subject ID**: `a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11` (Mathematics)
* **Chapters**:
  * **Chapter 10**: Circles (Sequence 10)
  * **Chapter 11**: Areas Related to Circles (Sequence 11)
  * **Chapter 12**: Surface Areas and Volumes (Sequence 12)
  * **Chapter 13**: Statistics (Sequence 13)
  * **Chapter 14**: Probability (Sequence 14)
* **Output Path**: `db/seed_batch3_math_part2.sql`

## 2. Table Schemas and Inserting Rules
* **Chapters Table**: `chapters (id, subject_id, title, sequence_number, description)`
* **Lessons Table**: `lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number)`
  * `type` is `'note'`
  * `sequence_number` is `3`
  * `note_content` contains the revision notes formatted in Markdown using standard V2 formatting.
  * `is_free` is set to `TRUE` for Ch 10 and `FALSE` for the rest.
* **Quizzes Table**: `quizzes (id, chapter_id, title, passing_percentage)`
  * `passing_percentage` is set to `60`.
* **Quiz Questions Table**: `quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks)`
  * `type` is `'multiple_choice'`
  * `options` is a JSONB array of four options.
  * `marks` is `1`.
  * 5 questions per quiz.
* **UUIDs**: Generate static, unique UUIDs for all rows to prevent duplication on multiple runs.
* **On Conflict**: Append `ON CONFLICT (id) DO NOTHING` to all INSERT blocks.

## 3. V2 Revision Notes Standard Compliance
For each chapter's revision notes:
1. 🎯 **Chapter Goal**: Simple 1-2 sentence statement of learning.
2. 🪝 **Hook**: Real-world application or intriguing question.
3. 📖 **Concept 1, 2, 3**: Explanations with `[JARGON: term | definition | example]` tags.
4. ⚠️ **Common Mistakes**: Bullets highlighting frequent student errors.
5. 💡 **Memory Tricks**: Analogies or mnemonics to retain terms.
6. 📝 **Quick Practice**: 2 rapid-fire questions with answers.
7. 🎓 **Board Tips**: Standard advice from examiners.
8. 🔄 **One-Minute Revision**: 5 quick summary points.
9. 🎬 **Comic Recap**: Dialogue between Priya and Rahul formatted inside an ASCII box table.

## 4. Chapter Breakdown

### Chapter 10: Circles
* **Key Concepts**: Tangent to a circle, Theorem 10.1 (perpendicularity of tangent at point of contact), Theorem 10.2 (equality of lengths of tangents from external point).
* **Jargon Words**: Tangent, Secant, Point of Contact.

### Chapter 11: Areas Related to Circles
* **Key Concepts**: Perimeter and Area of a Circle (Revision), Area of Sector of a Circle, Area of Segment of a Circle.
* **Jargon Words**: Sector, Segment, Arc, Radian/Angle.

### Chapter 12: Surface Areas and Volumes
* **Key Concepts**: Surface Area of a Combination of Solids, Volume of a Combination of Solids, Conversion of Solid from One Shape to Another.
* **Jargon Words**: Combination of Solids, Surface Area, Volume.

### Chapter 13: Statistics
* **Key Concepts**: Mean of Grouped Data (Direct, Assumed Mean, Step Deviation), Mode of Grouped Data, Median of Grouped Data.
* **Jargon Words**: Grouped Data, Class Mark, Cumulative Frequency.

### Chapter 14: Probability
* **Key Concepts**: Theoretical Probability, Elementary Event & Complementary Event, Sure Event & Impossible Event.
* **Jargon Words**: Theoretical Probability, Elementary Event, Complementary Event.

## 5. Verification Plan
* Validate SQL syntax of the generated file.
* Check that all jargon words are properly formatted with `[JARGON: term | definition | example]`.
* Ensure each chapter contains 5 MCQs.
* Run `flutter analyze` inside the workspace `apps/mobile_web_client/` to check for client compilation.
