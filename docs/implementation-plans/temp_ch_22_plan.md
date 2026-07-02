---
type: Plan
title: Implementation Plan - Generate SQL Seed for Chapter 22: Consumer Rights
description: We need to generate raw SQL seed statements for the database of the CBSE Class 10 Learning Portal to populate a new chapter: **Chapter 22: Consumer Ri...
tags: [plan]
timestamp: 2026-06-24T08:13:11Z
---
# Implementation Plan - Generate SQL Seed for Chapter 22: Consumer Rights

We need to generate raw SQL seed statements for the database of the CBSE Class 10 Learning Portal to populate a new chapter: **Chapter 22: Consumer Rights** (Subject: Social Science, ID: `a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33`).

The target file is `/home/sagarv/Projects/byAntiGravity/db/temp_ch_22.sql`.

## 1. Study the Chapter Content
We have parsed the textbook text from `/home/sagarv/Projects/cbse_class10_textbooks/extracted_text/social-economics_5.txt`.
Key themes extracted:
- The Consumer in the Marketplace: Unfair trade practices (underweighing, adulteration, false claims, hiding charges).
- Consumer Movement: Origin in the 1960s (food shortages, hoarding, black marketing), Consumers International (1985 guidelines), enactment of COPRA (1986) and its 2019 amendment.
- Consumer Rights: Safety (hazardous goods/services), Information (MRP, ingredients, date of manufacture/expiry, RTI Act 2005), Choice (right to choose), Redressal and Representation.
- Redressal System: Three-tier quasi-judicial machinery:
  - District Commission (up to Rs 1 crore)
  - State Commission (Rs 1 crore to Rs 10 crore)
  - National Commission (exceeding Rs 10 crore)
- Standardization Marks: ISI (industrial/safety items), Agmark (agricultural products), Hallmark (gold/jewelry), +F (fortified foods).
- Challenges and Progress: 2000+ consumer groups (50-60 organized), expensive/cumbersome legal procedures, lack of cash memos as evidence, importance of active consumer involvement.

## 2. Define Schema Details & UUID mappings
We will map the objects to the database schema (`db/schema.sql`):
- `chapters`:
  - `id`: `'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389220'`
  - `subject_id`: `'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33'`
  - `title`: `'Chapter 22: Consumer Rights'`
  - `sequence_number`: `22`
  - `description`: `'Understand the mechanisms of consumer exploitation, the history of the consumer movement, and the legal framework under COPRA including consumer rights, redressal forums, and quality standardization.'`
- `lessons` (Revision Note):
  - `id`: `'b0eebc99-9c0b-4ef8-bb6d-6bb9bd389220'`
  - `chapter_id`: `'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389220'`
  - `title`: `'Revision Notes: Consumer Rights'`
  - `type`: `'note'`
  - `note_content`: Markdown content following V2 Revision Notes Standard (11 sections, 4 jargon tags).
  - `is_free`: `FALSE`
  - `sequence_number`: `1`
- `quizzes`:
  - `id`: `'d0eebc99-9c0b-4ef8-bb6d-6bb9bd389220'`
  - `chapter_id`: `'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389220'`
  - `title`: `'Chapter 22 Quiz: Consumer Rights'`
  - `passing_percentage`: `60`
- `quiz_questions`:
  - Question 1: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389221'`
  - Question 2: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389222'`
  - Question 3: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389223'`
  - Question 4: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389224'`
  - Question 5: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389225'`
  - Each with unique options (JSON array), correct_option_index, marks = 1, type = `'multiple_choice'`.

## 3. Create Note under V2 Revision Notes Standard
The revision notes will be written in Markdown and contain exactly these 11 sections in order:
1. ## 1. 🎯 Chapter Goal
2. ## 2. 🪝 Hook
3. ## 3. 📖 Concept 1: The Consumer in the Marketplace & Exploitation
4. ## 4. 📖 Concept 2: The Consumer Movement and COPRA
5. ## 5. 📖 Concept 3: Consumer Rights and the Redressal Machinery
6. ## 6. ⚠️ Common Mistakes
7. ## 7. 💡 Memory Tricks
8. ## 8. 📝 Quick Practice
9. ## 9. 🎓 Board Tips
10. ## 10. 🔄 One-Minute Revision
11. ## 11. 🎬 Comic Recap (Priya and Rahul in ASCII box table)

We will include 4 custom jargon tags formatted precisely as:
`[JARGON: term | definition | example]`
- `[JARGON: Consumer Exploitation | Unfair practices by sellers such as underweighing, adulteration, or hiding charges | A shopkeeper selling expired medicine or charging more than the Maximum Retail Price (MRP)]`
- `[JARGON: COPRA | The Consumer Protection Act enacted in 1986 (amended in 2019) to protect consumers from marketplace exploitation | Under COPRA 2019, e-commerce transactions are protected and mediation cells are established at all three tiers]`
- `[JARGON: Consumer Disputes Redressal Commission | A three-tier quasi-judicial system at district, state, and national levels for resolving consumer grievances | A district commission handling a claim of Rs 50 lakh for a defective vehicle]`
- `[JARGON: Quality Standardization Mark | Certification logos like ISI, Agmark, or Hallmark ensuring product quality and safety | The ISI mark on an LPG cylinder or Agmark on honey to certify purity]`

## 4. Draft 5 High-Quality MCQs
We will create 5 MCQs directly related to the text:
1. Under COPRA 2019, which consumer commission handles claims up to Rs 1 crore? (Correct: District Consumer Disputes Redressal Commission)
2. When is National Consumer's Day celebrated in India? (Correct: 24 December)
3. Which quality certification mark should a consumer look for when buying agricultural products like honey? (Correct: Agmark)
4. In which year was the Right to Information (RTI) Act enacted in India to cover government department functions? (Correct: 2005)
5. Which international umbrella body coordinates the activities of over 200 consumer organizations across more than 100 countries? (Correct: Consumers International)

## 5. SQL String Formatting and Verification
- Ensure single quotes are correctly escaped inside string literals (e.g. replace `'` with `''`).
- Output the raw SQL code without code blocks inside the file.
- Write using `write_to_file` to `/home/sagarv/Projects/byAntiGravity/db/temp_ch_22.sql`.
- Verify the code is clean and run `flutter analyze` within `apps/mobile_web_client` to confirm no syntactic/structural breakages.
