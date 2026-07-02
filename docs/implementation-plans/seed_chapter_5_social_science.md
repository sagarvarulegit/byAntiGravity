---
type: Plan
title: Implementation Plan: Seed Chapter 5: The Age of Industrialisation (Social Science)
description: This plan outlines the steps to generate SQL seed data for Chapter 5 of Class 10 Social Science ("The Age of Industrialisation") and write it to the t...
tags: [plan]
timestamp: 2026-06-24T08:13:16Z
---
# Implementation Plan: Seed Chapter 5: The Age of Industrialisation (Social Science)

This plan outlines the steps to generate SQL seed data for Chapter 5 of Class 10 Social Science ("The Age of Industrialisation") and write it to the target SQL file.

## 1. Scope and Target
- **Subject ID**: `'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33'` (Social Science)
- **Sequence Number**: `'05'`
- **Chapter Title**: `'Chapter 5: The Age of Industrialisation'`
- **Textbook Source File**: `/home/sagarv/Projects/cbse_class10_textbooks/extracted_text/social-history_4.txt`
- **Output Target**: `/home/sagarv/Projects/byAntiGravity/db/temp_ch_05.sql`

## 2. UUID Allocation
We will use the deterministic UUIDs provided in the request:
- **Chapter UUID**: `'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389050'`
- **Lesson UUID**: `'b0eebc99-9c0b-4ef8-bb6d-6bb9bd389050'`
- **Quiz UUID**: `'d0eebc99-9c0b-4ef8-bb6d-6bb9bd389050'`
- **Question UUIDs**: 
  - Q1: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389051'`
  - Q2: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389052'`
  - Q3: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389053'`
  - Q4: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389054'`
  - Q5: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389055'`

## 3. Revision Notes Structure (V2 Standard)
We will compile the revision notes with:
- **🎯 Goal**: 1-sentence outcome.
- **🪝 Hook**: Engaging hook about early machine-age dreams/realities.
- **📖 Concepts**:
  - Concept 1: Before the Industrial Revolution & Proto-industrialisation.
  - Concept 2: Pace of Industrial Change & Victorian Hand Labour.
  - Concept 3: Industrialisation in India & Weavers under Colonial Monopolies.
  - At least 3 jargon tags `[JARGON: term | definition | example]`.
- **⚠️ Common Mistakes**: 3 typical student misconceptions.
- **💡 Memory Tricks**: visual mnemonics.
- **📝 Quick Practice**: 2 practice questions with detailed answers.
- **🎓 Board Tips**: Exam guidelines.
- **🔄 One-Minute Revision**: 5 quick bullets.
- **🎬 Comic Recap**: Priya and Rahul dialogue in an ASCII table box.

## 4. Quizzes and MCQs
- We will construct 5 high-quality multiple choice questions matching the NCERT textbook concepts.
- Options will be formatted as a JSON array of strings.
- We will set `correct_option_index` and `marks = 1` for each question.

## 5. SQL Output Formatting
- Generate standard PostgreSQL INSERT statements with `ON CONFLICT (id) DO NOTHING`.
- Ensure all single quotes inside text values (e.g. `'` in text) are escaped as `''`.
- Save the result to the destination SQL file.

## 6. Verification
- We will check that the generated file contains all 4 tables (`chapters`, `lessons`, `quizzes`, `quiz_questions`).
- We will run `flutter analyze` inside the client directory to check for any static issues (though this is a database script, it's good practice).
