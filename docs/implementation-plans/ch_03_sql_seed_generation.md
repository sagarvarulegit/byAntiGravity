# Implementation Plan - Generate SQL Seed for Chapter 3: The Rise of Nationalism in Europe

We need to generate raw SQL seed statements for the database of the CBSE Class 10 Learning Portal to populate a new chapter: **Chapter 3: The Rise of Nationalism in Europe** (Subject: Social Science, ID: `a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33`).

The target file is `/home/sagarv/Projects/byAntiGravity/db/temp_ch_03.sql`.

## 1. Study the Chapter Content
We have parsed the textbook text from `/home/sagarv/Projects/cbse_class10_textbooks/extracted_text/social-history_1.txt`.
Key themes extracted:
- Frédéric Sorrieu's utopian vision of democratic and social republics (1848).
- The French Revolution and the collective identity measures (la patrie, le citoyen, National Assembly, etc.).
- Napoleon's Civil Code of 1804 (Napoleonic Code) and its administrative reforms.
- Liberal Nationalism, economic barriers, and the formation of Zollverein (1834).
- The Congress of Vienna (1815) hosted by Duke Metternich, restoring the conservative order.
- Giuseppe Mazzini and the secret societies (Young Italy, Young Europe).
- The Age of Revolutions (1830-1848), Greek War of Independence (Treaty of Constantinople, 1832).
- Romanticism (Herder, Volksgeist, Grimm Brothers, Polish language resistance).
- 1848 Revolution of the Liberals and the Frankfurt Parliament (Church of St Paul).
- Unification of Germany (Kaiser William I, Otto von Bismarck) and Italy (Mazzini, Cavour, Garibaldi, Victor Emmanuel II).
- The strange case of Britain (Act of Union 1707, Wolfe Tone, Ireland incorporation 1801).
- Allegorical representations of the nation (Marianne in France, Germania in Germany).
- Nationalism and Imperialism in the Balkans (Slavs, Ottoman Empire disintegration, big power rivalries leading to WWI).

## 2. Define Schema Details & UUID mappings
We will map the objects to the database schema (`db/schema.sql`):
- `chapters`:
  - `id`: `'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389030'`
  - `subject_id`: `'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33'`
  - `title`: `'Chapter 3: The Rise of Nationalism in Europe'`
  - `sequence_number`: `3`
  - `description`: `'Explore how nationalism transformed Europe from dynastic empires into nation-states through political revolutions, cultural romanticism, and crucial unifications.'`
- `lessons` (Revision Note):
  - `id`: `'b0eebc99-9c0b-4ef8-bb6d-6bb9bd389030'`
  - `chapter_id`: `'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389030'`
  - `title`: `'Revision Notes: The Rise of Nationalism in Europe'`
  - `type`: `'note'`
  - `note_content`: Markdown content following V2 Revision Notes Standard (11 sections, 3+ custom jargon tags).
  - `is_free`: `TRUE`
  - `sequence_number`: `1`
- `quizzes`:
  - `id`: `'d0eebc99-9c0b-4ef8-bb6d-6bb9bd389030'`
  - `chapter_id`: `'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389030'`
  - `title`: `'Chapter 3 Quiz: The Rise of Nationalism in Europe'`
  - `passing_percentage`: `60`
- `quiz_questions`:
  - Question 1: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389031'`
  - Question 2: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389032'`
  - Question 3: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389033'`
  - Question 4: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389034'`
  - Question 5: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389035'`
  - Each with unique options, correct_option_index, marks = 1, type = `'multiple_choice'`.

## 3. Create Note under V2 Revision Notes Standard
The revision notes will be written in Markdown and contain exactly these 11 sections in order:
1. ## 1. 🎯 Chapter Goal
2. ## 2. 🪝 Hook
3. ## 3. 📖 Concept 1 (The Idea of the Nation & Napoleon)
4. ## 4. 📖 Concept 2 (Conservatism, Liberalism, & Zollverein)
5. ## 5. 📖 Concept 3 (Unifications of Germany & Italy)
6. ## 6. ⚠️ Common Mistakes
7. ## 7. 💡 Memory Tricks
8. ## 8. 📝 Quick Practice
9. ## 9. 🎓 Board Tips
10. ## 10. 🔄 One-Minute Revision
11. ## 11. 🎬 Comic Recap (Priya and Rahul in ASCII box table)

We will include at least 3 custom jargon tags formatted precisely as:
`[JARGON: term | definition | example]`
For example:
- `[JARGON: Plebiscite | A direct vote by which all the people of a region are asked to accept or reject a proposal | Ernst Renan described the existence of a nation as a daily plebiscite.]`
- `[JARGON: Zollverein | A customs union formed in 1834 at the initiative of Prussia to remove tariff barriers | The Zollverein reduced the number of currencies from over thirty to two, binding Germany economically.]`
- `[JARGON: Conservatism | A political philosophy that stressed the importance of tradition, established institutions, and customs | European powers after 1815 were driven by conservatism to restore the Bourbon monarchy.]`

## 4. Draft 5 High-Quality MCQs
We will create 5 MCQs directly related to the text:
1. What was the main purpose of the *Zollverein* customs union formed in 1834? (Correct: A. To abolish tariff barriers and reduce currencies)
2. Who hosted the Congress of Vienna in 1815? (Correct: C. Duke Metternich)
3. Which treaty recognized Greece as an independent nation in 1832? (Correct: B. Treaty of Constantinople)
4. Who was the main architect of the German unification process? (Correct: D. Otto von Bismarck)
5. What does the German crown of oak leaves represent in Germania's visual representation? (Correct: A. Heroism)

## 5. SQL String Formatting and Verification
- Ensure single quotes are correctly escaped inside string literals (e.g. replace `'` with `''`).
- Output the raw SQL code without code blocks inside the file.
- Write using `write_to_file` to `/home/sagarv/Projects/byAntiGravity/db/temp_ch_03.sql`.
- Verify the code is clean and run `flutter analyze` within `apps/mobile_web_client` to confirm no syntactic/structural breakages.
