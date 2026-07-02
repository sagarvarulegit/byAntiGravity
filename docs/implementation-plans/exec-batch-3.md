---
type: Plan
title: Execution Plan: CBSE Class 10 Syllabus Audit — Batch 3
description: This document details the step-by-step execution plan for Batch 3 (10 Mathematics and 9 Science chapters) as outlined in [full-syllabus-audit.md](file...
tags: [plan]
timestamp: 2026-06-24T08:05:15Z
---
# Execution Plan: CBSE Class 10 Syllabus Audit — Batch 3

This document details the step-by-step execution plan for Batch 3 (10 Mathematics and 9 Science chapters) as outlined in [full-syllabus-audit.md](file:///home/sagarv/Projects/byAntiGravity/docs/implementation-plans/full-syllabus-audit.md).

## 1. Subject IDs and Scope
Subject IDs from `seed.sql` will be used:
* **Mathematics**: `a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11`
* **Science**: `a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22`

## 2. Chapter & Sequence Number Mapping

### Mathematics (10 Chapters)
1. **Ch 5: Arithmetic Progressions** -> Sequence 5
2. **Ch 6: Triangles** -> Sequence 6
3. **Ch 7: Coordinate Geometry** -> Sequence 7
4. **Ch 8: Introduction to Trigonometry** -> Sequence 8
5. **Ch 9: Some Applications of Trigonometry** -> Sequence 9
6. **Ch 10: Circles** -> Sequence 10
7. **Ch 11: Areas Related to Circles** -> Sequence 11
8. **Ch 12: Surface Areas and Volumes** -> Sequence 12
9. **Ch 13: Statistics** -> Sequence 13
10. **Ch 14: Probability** -> Sequence 14

### Science (9 Chapters)
1. **Ch 4: Carbon and its Compounds** -> Sequence 4
2. **Ch 5: Life Processes** -> Sequence 5
3. **Ch 6: Control and Coordination** -> Sequence 6
4. **Ch 7: How do Organisms Reproduce?** -> Sequence 7
5. **Ch 8: Heredity** -> Sequence 8
6. **Ch 9: Light — Reflection and Refraction** -> Sequence 9
7. **Ch 10: The Human Eye and the Colourful World** -> Sequence 10
8. **Ch 12: Magnetic Effects of Electric Current** -> Sequence 11 (Avoids conflict with Electricity at seq 12)
9. **Ch 13: Our Environment** -> Sequence 13

---

## 3. SQL Data Generation Guidelines

### Tables to Populate
For each chapter, we will generate inserts for:
1. `chapters` table.
2. `lessons` table (type='note') with V2 Markdown format.
3. `quizzes` table (1 quiz per chapter).
4. `quiz_questions` table (5 MCQs per chapter).

### Constraints
* **UUID generation**: All inserted rows will have unique UUIDs (v4 compatible).
* **ON CONFLICT**: Use `ON CONFLICT (id) DO NOTHING`.
* **Note Format**: Follow V2 template precisely:
  1. 🎯 Chapter Goal
  2. 🪝 Hook
  3. 📖 Concept 1 with `[JARGON: term | definition | example]` tags
  4. 📖 Concept 2 with JARGON tags
  5. 📖 Concept 3 with JARGON tags
  6. ⚠️ Common Mistakes
  7. 💡 Memory Tricks
  8. 📝 Quick Practice (2 Qs)
  9. 🎓 Board Tips
  10. 🔄 One-Minute Revision
  11. 🎬 Comic Recap (ASCII table dialogue)

---

## 4. Execution Methodology

We will define a specialized subagent `ChapterGenerator` that inherits the system prompt and is designed to process the chapter text files one by one and generate valid SQL. We will compile the SQL blocks incrementally into `db/seed_batch3_math_science.sql`.

### Verification Steps
1. Parse generated SQL file to ensure syntax correctness.
2. Run database migration tests if possible, or run analysis.
3. Run `flutter analyze` in `apps/mobile_web_client/` to verify client health.
