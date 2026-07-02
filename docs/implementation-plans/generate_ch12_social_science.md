---
type: Plan
title: Implementation Plan: Chapter 12 Forest and Wildlife Resources Content Generation
description: This plan details the steps for generating CBSE Class 10 Social Science Chapter 12 ("Forest and Wildlife Resources") SQL seed data.
tags: [plan]
timestamp: 2026-06-24T08:13:04Z
---
# Implementation Plan: Chapter 12 Forest and Wildlife Resources Content Generation

This plan details the steps for generating CBSE Class 10 Social Science Chapter 12 ("Forest and Wildlife Resources") SQL seed data.

## 1. Scope & Meta Info
* **Subject ID**: `a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33` (Social Science)
* **Sequence Number**: `12`
* **Chapter Title**: `Chapter 12: Forest and Wildlife Resources`
* **Textbook Source File**: `/home/sagarv/Projects/cbse_class10_textbooks/extracted_text/social-geography_2.txt`
* **Base Chapter UUID**: `c0eebc99-9c0b-4ef8-bb6d-6bb9bd389120`
* **Base Lesson UUID**: `b0eebc99-9c0b-4ef8-bb6d-6bb9bd389120`
* **Base Quiz UUID**: `d0eebc99-9c0b-4ef8-bb6d-6bb9bd389120`
* **Base Question UUIDs**: `f0eebc99-9c0b-4ef8-bb6d-6bb9bd389121` to `f0eebc99-9c0b-4ef8-bb6d-6bb9bd389125`
* **Target SQL File**: `/home/sagarv/Projects/byAntiGravity/db/temp_ch_12.sql`

## 2. Table Mappings & Key Columns
1. **`chapters`**:
   - `id`: `c0eebc99-9c0b-4ef8-bb6d-6bb9bd389120`
   - `subject_id`: `a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33`
   - `title`: `'Chapter 12: Forest and Wildlife Resources'`
   - `sequence_number`: `12`
   - `description`: A 1-sentence overview summarizing biodiversity and conservation in India.
2. **`lessons`**:
   - `id`: `b0eebc99-9c0b-4ef8-bb6d-6bb9bd389120`
   - `chapter_id`: `c0eebc99-9c0b-4ef8-bb6d-6bb9bd389120`
   - `title`: `'Chapter 12: Forest and Wildlife Resources Revision Notes'`
   - `type`: `'note'`
   - `note_content`: High-quality V2 Markdown revision notes.
   - `is_free`: `FALSE`
   - `sequence_number`: `1`
3. **`quizzes`**:
   - `id`: `d0eebc99-9c0b-4ef8-bb6d-6bb9bd389120`
   - `chapter_id`: `c0eebc99-9c0b-4ef8-bb6d-6bb9bd389120`
   - `title`: `'Chapter 12: Forest and Wildlife Resources Quiz'`
   - `passing_percentage`: `60`
4. **`quiz_questions`**:
   - 5 MCQ entries mapping indices `f0eebc99-9c0b-4ef8-bb6d-6bb9bd389121` through `f0eebc99-9c0b-4ef8-bb6d-6bb9bd389125`.
   - `correct_answer_text` set to `NULL`.
   - `marks` set to `1`.

## 3. V2 Revision Notes Structure
The revision notes will be written in high-quality Markdown and contain:
- **🎯 Chapter Goal**: Target learning outcome.
- **🪝 Hook**: Engaging introduction to biodiversity.
- **📖 Concepts**:
  - Concept 1: Biodiversity & Ecological Web (with jargon tag)
  - Concept 2: State Conservation Initiatives (Wildlife Act 1972, Project Tiger, list of reserves, jargon tag)
  - Concept 3: Forest Classification & Community Conservation (Reserved/Protected/Unclassed, Bhairodev Dakav, Chipko, JFM, jargon tag)
- **⚠️ Common Mistakes**: Launch years of Wildlife Act vs. Project Tiger, role of local village institutions in JFM.
- **💡 Memory Tricks**: Mnemonics for reserves and forest types.
- **📝 Quick Practice**: 2 Qs and solutions.
- **🎓 Board Tips**: Scoring strategies.
- **🔄 One-Minute Revision**: 5 quick points.
- **🎬 Comic Recap**: Priya and Rahul conversation in ASCII table box.

## 4. MCQs
1. Year of Indian Wildlife Protection Act (1972).
2. State with largest permanent forest (Madhya Pradesh).
3. Strategy without direct community participation (Demarcation of Wildlife Sanctuaries).
4. Alwar district Sonchuri (Bhairodev Dakav 'Sonchuri').
5. First JFM resolution (1988, Odisha).

## 5. Verification
- Validate the generated SQL file structure.
- Run `flutter analyze` inside the `apps/mobile_web_client/` folder to check overall client stability.
