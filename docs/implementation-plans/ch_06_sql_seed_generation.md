---
type: Plan
title: Implementation Plan: Chapter 6 - Print Culture and the Modern World SQL Seed Generation
description: This plan details the generation and seeding of Chapter 6 (Print Culture and the Modern World) for Subject ID: `a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33` ...
tags: [plan]
timestamp: 2026-06-24T08:13:14Z
---
# Implementation Plan: Chapter 6 - Print Culture and the Modern World SQL Seed Generation

This plan details the generation and seeding of Chapter 6 (Print Culture and the Modern World) for Subject ID: `a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33` (Social Science).

## 1. Scope & Identifiers
* **Subject ID**: `'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33'` (Social Science)
* **Chapter Title**: `'Chapter 6: Print Culture and the Modern World'`
* **Sequence Number**: `6`
* **Base Chapter UUID**: `'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389060'`
* **Base Lesson UUID**: `'b0eebc99-9c0b-4ef8-bb6d-6bb9bd389060'`
* **Base Quiz UUID**: `'d0eebc99-9c0b-4ef8-bb6d-6bb9bd389060'`
* **Base Question UUIDs**: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389061'` to `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389065'`
* **Source Path**: `/home/sagarv/Projects/cbse_class10_textbooks/extracted_text/social-history_5.txt`
* **Target SQL Path**: `/home/sagarv/Projects/byAntiGravity/db/temp_ch_06.sql`

## 2. SQL Insert Strategy
All INSERT statements will target tables:
1. `chapters` (id, subject_id, title, sequence_number, description)
2. `lessons` (id, chapter_id, title, type, note_content, is_free, sequence_number)
3. `quizzes` (id, chapter_id, title, passing_percentage)
4. `quiz_questions` (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks)

Constraints & Settings:
* Use `ON CONFLICT (id) DO NOTHING`.
* Set `is_free` = `FALSE` for the lesson.
* Set `passing_percentage` = `60`.
* Set `type` = `'note'` for the lesson, and `type` = `'multiple_choice'` for questions.
* Escape all single quotes properly by doubling them (`''`).

## 3. V2 Notes Specifications
The note content will contain:
* **🎯 Goal & Hook**
* **Concepts**: 
  1. Evolution of Print (China, Japan, Korea, Marco Polo, Scribes)
  2. The Gutenberg Printing Press & Protestant Reformation (Luther, Dissent, Index of Prohibited Books)
  3. The Reading Mania, Print in India, and Censorship (Mercier, Vernacular Press Act, caste reform)
* **Jargon tags**: At least 3 detailed Jargon tags mapping `[JARGON: term | definition | example]`. We will include 9 jargon terms to ensure high quality coverage.
* **Common Mistakes & Memory Tricks**
* **Quick Practice**: 2 conceptual questions with answers.
* **Board Tips & One-Minute Revision**
* **Comic Recap**: ASCII box table depicting dialogue between Priya and Rahul.

## 4. Verification Plan
1. Generate the raw SQL seed script.
2. Check for syntax correctness and single quote escaping.
3. Validate output file existence at `/home/sagarv/Projects/byAntiGravity/db/temp_ch_06.sql`.
4. Run `flutter analyze` in `apps/mobile_web_client/` to verify that there are no static errors.
