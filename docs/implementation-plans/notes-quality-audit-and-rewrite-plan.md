---
type: Plan
title: Implementation Plan: Notes Quality Audit & Rewrite
description: Audit and rewrite all 5 existing notes from `db/seed.sql` and `db/seed_notes_batch1.sql` to align with the CBSE Class 10 Online Learning Portal conten...
tags: [plan]
timestamp: 2026-06-23T20:19:29Z
---
# Implementation Plan: Notes Quality Audit & Rewrite

## Objective
Audit and rewrite all 5 existing notes from `db/seed.sql` and `db/seed_notes_batch1.sql` to align with the CBSE Class 10 Online Learning Portal content quality standards. 

## Inputs
- [CONTENT_QUALITY_STANDARDS.md](file:///home/sagarv/Projects/byAntiGravity/docs/CONTENT_QUALITY_STANDARDS.md)
- [seed.sql](file:///home/sagarv/Projects/byAntiGravity/db/seed.sql) (contains notes for Real Numbers, Chemical Reactions, and Polynomials)
- [seed_notes_batch1.sql](file:///home/sagarv/Projects/byAntiGravity/db/seed_notes_batch1.sql) (contains notes for Electricity and Nationalism in India)

## Outputs
- `docs/audit/notes-quality-audit.md` (audit report scoring the 5 notes against the 7 standards)
- `db/seed_notes_v2.sql` (re-seeded database file containing the rewritten notes)

## Standards Checklist
1. **Grade level**: Class 8 level reading ease (simple English).
2. **Sentences**: Max 20 words, one idea per sentence, active voice.
3. **Hook**: Present at the beginning of each chapter notes.
4. **Academic Jargon**: Bold, with a simple explanation in parentheses, and wrapped in `[JARGON: term | definition | example]` syntax.
5. **Comic Recap**: Dialogue between Priya and Rahul at the end of the chapter notes (3-4 panels).
6. **Structure**: 11-section structure:
   1. 🎯 Chapter Goal (1-2 sentences)
   2. 🪝 Hook (real-life story/question)
   3. 📖 Concept 1
   4. 📖 Concept 2
   5. 📖 Concept 3
   6. ⚠️ Common Mistakes (3-5 bullets)
   7. 💡 Memory Tricks
   8. 📝 Quick Practice (2-3 questions with answers)
   9. 🎓 Board Tips
   10. 🔄 One-Minute Revision (5 bullets)
   11. 🎬 Comic Recap (Priya & Rahul)

## Execution Steps

### Phase 1: Audit
- Carefully read all 5 notes in `db/seed.sql` and `db/seed_notes_batch1.sql`.
- Rate each note on the 7 criteria in `docs/CONTENT_QUALITY_STANDARDS.md`.
- Save the results in `docs/audit/notes-quality-audit.md`.

### Phase 2: Rewrite
- Rewrite the notes for the following chapters:
  - **Mathematics**: Chapter 1: Real Numbers
  - **Mathematics**: Chapter 2: Polynomials
  - **Science**: Chapter 1: Chemical Reactions & Equations
  - **Science**: Chapter 12: Electricity
  - **Social Science**: Chapter 1: Nationalism in India
- Ensure all requirements are met (Class 8 English, active voice, 11 sections, JARGON wrappers, and comic recaps).
- Format the content into a SQL seed file `db/seed_notes_v2.sql`. We will use `INSERT INTO lessons (...) ON CONFLICT (id) DO UPDATE SET note_content = EXCLUDED.note_content` to overwrite the existing notes correctly.

### Phase 3: Verification
- Verify the project passes `flutter analyze` in `apps/mobile_web_client` to confirm no client regressions are introduced.
- Run `flutter build web` to ensure compatibility.
