---
type: Plan
title: Implementation Plan - Chapter 17 SQL Seed Generation: Lifelines of National Economy
description: This plan details the generation and verification of SQL seed data for Chapter 17: Lifelines of National Economy, mapping to the CBSE Class 10 Social ...
tags: [plan]
timestamp: 2026-06-24T08:13:14Z
---
# Implementation Plan - Chapter 17 SQL Seed Generation: Lifelines of National Economy

This plan details the generation and verification of SQL seed data for Chapter 17: Lifelines of National Economy, mapping to the CBSE Class 10 Social Science curriculum.

## 1. Chapter and Subject Details
- **Subject ID**: `a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33` (Social Science)
- **Sequence Number**: `17`
- **Chapter Title**: `Chapter 17: Lifelines of National Economy`
- **Source Textbook File**: `/home/sagarv/Projects/cbse_class10_textbooks/extracted_text/social-geography_7.txt`
- **Base UUIDs**:
  - Chapter: `c0eebc99-9c0b-4ef8-bb6d-6bb9bd389170`
  - Lesson (Notes): `b0eebc99-9c0b-4ef8-bb6d-6bb9bd389170`
  - Quiz: `d0eebc99-9c0b-4ef8-bb6d-6bb9bd389170`
  - Quiz Questions: `f0eebc99-9c0b-4ef8-bb6d-6bb9bd389171` to `f0eebc99-9c0b-4ef8-bb6d-6bb9bd389175`
- **Target SQL File**: `/home/sagarv/Projects/byAntiGravity/db/temp_ch_17.sql`

## 2. V2 Notes Structure
Revision notes will be formatted using the standard V2 markdown structure with the following key components:
1. **🎯 Chapter Goal**: High-level learning goals.
2. **🪝 Hook**: An interesting hook about transport/communication networks.
3. **📖 Concepts**:
   - **Concept 1: Roadways and Railways (Land Transport)**: Coverage of roadways (including Golden Quadrilateral, National, State, District, and Border Roads) and railways (distribution pattern, zones, advantages/challenges).
   - **Concept 2: Pipelines and Waterways**: Gas/liquid pipelines (HVJ pipeline) and national waterways (NW 1-5, sea ports like Deendayal/Kandla, Tuticorin, Mormugao, Chennai, Vishakhapatnam).
   - **Concept 3: Airways, Communication, and International Trade**: Air transport (UDAN scheme, Pawanhans), personal/mass communication (postal mail classes, channels, digital India), and international trade (balance of trade, tourism as a trade).
   - *Requirement*: Include at least 3 custom `[JARGON: term | definition | example]` tags.
4. **⚠️ Common Mistakes**: Avoid confusing trade balance types, misidentifying waterways, etc.
5. **💡 Memory Tricks**: Mnemonics for waterways and port features.
6. **📝 Quick Practice**: 2 quick conceptual practice questions.
7. **🎓 Board Tips**: Scoring guidelines for transport importance.
8. **🔄 One-Minute Revision**: 5 quick bullet points summarizing the chapter.
9. **🎬 Comic Recap**: Structured ASCII table containing dialogues between Priya and Rahul.

## 3. Quiz & MCQs Details
5 multiple choice questions mapping closely to NCERT concepts, formatted as a JSON array string for options:
- Marks: 1
- `correct_answer_text`: NULL
- Options must be explicitly labeled (A, B, C, D) inside the JSON array.
- Indexes: 0-indexed correct option index.

## 4. SQL Seeding Format
- Insert statements targeting tables `chapters`, `lessons`, `quizzes`, and `quiz_questions`.
- Use `ON CONFLICT (id) DO NOTHING` for idempotence.
- Properly escape single quotes (e.g. `''` for any `'` in text/JSON).
- `is_free` will be set to `FALSE`.

## 5. Verification Checklist
- [ ] Check SQL syntax and ensure single quotes are correctly escaped.
- [ ] Verify UUIDs strictly match user specifications.
- [ ] Run `flutter analyze` inside `apps/mobile_web_client/` to check for any static issues.
- [ ] Perform manual validation of generated files.
