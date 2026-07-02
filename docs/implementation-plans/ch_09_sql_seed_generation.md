---
type: Plan
title: Implementation Plan - Generate SQL Seed for Chapter 9: Political Parties
description: We need to generate raw SQL seed statements for the database of the CBSE Class 10 Learning Portal to populate a new chapter: **Chapter 9: Political Pa...
tags: [plan]
timestamp: 2026-06-24T08:13:09Z
---
# Implementation Plan - Generate SQL Seed for Chapter 9: Political Parties

We need to generate raw SQL seed statements for the database of the CBSE Class 10 Learning Portal to populate a new chapter: **Chapter 9: Political Parties** (Subject: Social Science, Subject ID: `a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33`).

The target file is `/home/sagarv/Projects/byAntiGravity/db/temp_ch_09.sql`.

## 1. Study the Chapter Content
We have parsed the textbook text from `/home/sagarv/Projects/cbse_class10_textbooks/extracted_text/social-civics_4.txt`.
Key themes extracted:
- **Definition of Political Parties**: A group of people who come together to contest elections and hold power in the government. Three components: leaders, active members, followers.
- **Functions of Political Parties**: Contesting elections, formulating policies/programmes, playing a decisive role in making laws, forming/running governments, role of opposition, shaping public opinion, providing access to government machinery/welfare schemes.
- **Necessity of Parties**: Vital for representative democracy to manage large, complex societies and form responsible governments.
- **Party Systems**: One-party system (China), Two-party system (USA, UK), Multiparty system (India). Advantages and disadvantages.
- **National vs. State (Regional) Parties**: Detailed criteria for recognition by the Election Commission (6% votes + 2 assembly seats for State party; 6% votes in Lok Sabha/Assembly in 4 states + 4 Lok Sabha seats for National party). List of 6 recognized national parties (as of 2023).
- **Challenges to Political Parties**: Internal democracy lack, dynastic succession, money and muscle power (rich and criminals), lack of meaningful choice.
- **Reforms/Efforts**: Anti-defection law, mandatory affidavits on wealth and criminal records, organizational elections and IT returns.

## 2. Define Schema Details & UUID mappings
We will map the objects to the database schema (`db/schema.sql`):
- `chapters`:
  - `id`: `'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389090'`
  - `subject_id`: `'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33'`
  - `title`: `'Chapter 9: Political Parties'`
  - `sequence_number`: `9`
  - `description`: `'Learn about the functions, necessity, systems, national and state classifications, challenges, and reform measures of political parties in a democracy.'`
- `lessons` (Revision Note):
  - `id`: `'b0eebc99-9c0b-4ef8-bb6d-6bb9bd389090'`
  - `chapter_id`: `'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389090'`
  - `title`: `'Revision Notes: Political Parties'`
  - `type`: `'note'`
  - `note_content`: Markdown content following V2 Revision Notes Standard (11 sections, 3+ custom jargon tags).
  - `is_free`: `FALSE`
  - `sequence_number`: `1`
- `quizzes`:
  - `id`: `'d0eebc99-9c0b-4ef8-bb6d-6bb9bd389090'`
  - `chapter_id`: `'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389090'`
  - `title`: `'Chapter 9 Quiz: Political Parties'`
  - `passing_percentage`: `60`
- `quiz_questions`:
  - Question 1: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389091'`
  - Question 2: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389092'`
  - Question 3: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389093'`
  - Question 4: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389094'`
  - Question 5: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389095'`
  - Each with unique options (JSON array of strings), `correct_option_index` (int), `marks = 1`, `correct_answer_text = NULL`, and `type = 'multiple_choice'`.

## 3. Create Note under V2 Revision Notes Standard
The revision notes will be written in Markdown and contain exactly these 11 sections in order:
1. ## 1. 🎯 Chapter Goal
2. ## 2. 🪝 Hook
3. ## 3. 📖 Concept 1: Meaning and Functions of Political Parties
4. ## 4. 📖 Concept 2: Party Systems and Classifications (National vs. State)
5. ## 5. 📖 Concept 3: Challenges and Reforms of Political Parties
6. ## 6. ⚠️ Common Mistakes
7. ## 7. 💡 Memory Tricks
8. ## 8. 📝 Quick Practice
9. ## 9. 🎓 Board Tips
10. ## 10. 🔄 One-Minute Revision
11. ## 11. 🎬 Comic Recap (Priya and Rahul in ASCII box table)

We will include at least 3 custom jargon tags formatted precisely as:
`[JARGON: term | definition | example]`
For example:
- `[JARGON: Partisan | A person who is strongly committed to a party, group, or faction | A partisan voter always votes for their party, even if they disagree with specific policies.]`
- `[JARGON: Defection | Changing party allegiance from the party on which a person got elected to a different party | An elected MLA leaving their party to join the ruling party to get a ministerial post is a defection.]`
- `[JARGON: Affidavit | A signed document submitted to an officer where a person makes a sworn statement regarding their personal information | Candidates contesting elections in India must file an affidavit detailing their wealth and any pending criminal cases.]`

## 4. Draft 5 High-Quality MCQs
We will create 5 MCQs directly related to the text:
1. Which of the following is NOT one of the three main components of a political party? (Correct: D. Government officers)
2. A party system in which only one party is allowed to control and run the government is called a: (Correct: B. One-party system)
3. An electoral alliance or front is formed when: (Correct: B. Several parties join hands to contest elections and win power together)
4. Which law was passed in India to prevent elected MLAs and MPs from changing their political parties after being elected? (Correct: C. Anti-Defection Law)
5. A signed document submitted to an officer where a person makes a sworn statement about their personal assets and criminal history is called an: (Correct: A. Affidavit)

## 5. SQL String Formatting and Verification
- Ensure single quotes are correctly escaped inside string literals (e.g. replace `'` with `''`).
- Output the raw SQL code without code blocks inside the file.
- Write using `write_to_file` to `/home/sagarv/Projects/byAntiGravity/db/temp_ch_09.sql`.
- Verify the code is clean and run `flutter analyze` within `apps/mobile_web_client` to confirm no syntactic/structural breakages.
