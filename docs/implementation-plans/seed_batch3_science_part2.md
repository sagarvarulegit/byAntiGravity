---
type: Plan
title: Implementation Plan - CBSE Class 10 Science Revision Notes & Seed Data (Batch 3, Part 2)
description: This plan details the generation of PostgreSQL seed data for Science Chapters 9, 10, 12, and 13.
tags: [plan]
timestamp: 2026-06-24T08:06:35Z
---
# Implementation Plan - CBSE Class 10 Science Revision Notes & Seed Data (Batch 3, Part 2)

This plan details the generation of PostgreSQL seed data for Science Chapters 9, 10, 12, and 13.

## 1. Scope & Mapping
- **Subject**: Science (`a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22`)
- **Chapters**:
  - Ch 9: Light — Reflection and Refraction (Sequence 9)
  - Ch 10: The Human Eye and the Colourful World (Sequence 10)
  - Ch 12: Magnetic Effects of Electric Current (Sequence 11)
  - Ch 13: Our Environment (Sequence 13)

## 2. Content Standards (V2 Revision Notes)
Each chapter's notes will include:
1. 🎯 Chapter Goal
2. 🪝 Hook
3. 📖 3 Concepts with `[JARGON: term | definition | example]` tags
4. ⚠️ Common Mistakes
5. 💡 Memory Tricks
6. 📝 Quick Practice (2 Qs)
7. 🎓 Board Tips
8. 🔄 One-Minute Revision
9. 🎬 Comic Recap (Priya & Rahul, 3-4 panel ASCII art box)

## 3. Database Seed File
- **Target Path**: `db/seed_batch3_science_part2.sql`
- **Tables Populated**:
  - `chapters` (using `ON CONFLICT (id) DO NOTHING`)
  - `lessons` (using `ON CONFLICT (id) DO NOTHING` or `DO UPDATE` for the notes, sequence_number = 3, type = 'note', is_free = true)
  - `quizzes` (using `ON CONFLICT (id) DO NOTHING`)
  - `quiz_questions` (5 multiple choice questions per chapter, marks = 1, options as JSONB, using `ON CONFLICT (id) DO NOTHING`)

## 4. Verification
- Validate the generated SQL code.
- Run `flutter analyze` inside `apps/mobile_web_client/` to check for any errors.
