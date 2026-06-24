# Implementation Plan - Generate SQL Seed for Chapter 7: Power-sharing

We need to generate raw SQL seed statements for the database of the CBSE Class 10 Learning Portal to populate a new chapter: **Chapter 7: Power-sharing** (Subject: Social Science, ID: `a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33`).

The target file is `/home/sagarv/Projects/byAntiGravity/db/temp_ch_07.sql`.

## 1. Study the Chapter Content
We have viewed the textbook text from `/home/sagarv/Projects/cbse_class10_textbooks/extracted_text/social-civics_1.txt`.
Key themes extracted:
- **Belgium and Sri Lanka Stories**:
  - Ethnic composition: Belgium (59% Flemish speaking Dutch, 40% Walloon speaking French, 1% German; Capital Brussels 80% French, 20% Dutch). Sri Lanka (74% Sinhala speakers, 18% Tamil speakers including 13% Sri Lankan Tamils and 5% Indian Tamils).
  - Contrasting paths: Sri Lanka chose **Majoritarianism** (preferential treatment, Sinhala as only official language in 1956, state protection of Buddhism), leading to alienation of Tamils and a brutal **Civil War**. Belgium chose **Accommodation** (amended Constitution 4 times, equal representation in central government, federal division, community government), maintaining unity and peace.
- **Why Power-sharing is Desirable**:
  - **Prudential Reasons**: Reduces social conflict, ensures political stability (careful calculation of benefits).
  - **Moral Reasons**: Power-sharing is the very spirit of democracy; citizens have a right to be consulted.
- **Forms of Power-sharing**:
  - **Horizontal division** (Legislature, Executive, Judiciary - Checks and Balances).
  - **Vertical division** / Federal division (Central, State, and Local governments).
  - **Social groups** (linguistic/religious representation, e.g. Community Government in Belgium, reserved constituencies in India).
  - **Political parties, pressure groups, and coalitions** (multi-party competition, coalition governments, interest groups).

## 2. Define Schema Details & UUID mappings
We will map the objects to the database schema (`db/schema.sql`):
- `chapters`:
  - `id`: `'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389070'`
  - `subject_id`: `'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33'`
  - `title`: `'Chapter 7: Power-sharing'`
  - `sequence_number`: `7`
  - `description`: `'Analyze how democracies handle demands for power-sharing through the contrasting stories of Belgium and Sri Lanka, and explore different forms of power-sharing.'`
- `lessons` (Revision Note):
  - `id`: `'b0eebc99-9c0b-4ef8-bb6d-6bb9bd389070'`
  - `chapter_id`: `'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389070'`
  - `title`: `'Revision Notes: Power-sharing'`
  - `type`: `'note'`
  - `note_content`: Markdown content following V2 Revision Notes Standard.
  - `is_free`: `FALSE`
  - `sequence_number`: `1`
- `quizzes`:
  - `id`: `'d0eebc99-9c0b-4ef8-bb6d-6bb9bd389070'`
  - `chapter_id`: `'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389070'`
  - `title`: `'Chapter 7 Quiz: Power-sharing'`
  - `passing_percentage`: `60`
- `quiz_questions`:
  - Question 1: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389071'`
  - Question 2: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389072'`
  - Question 3: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389073'`
  - Question 4: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389074'`
  - Question 5: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389075'`
  - Each with unique options, correct_option_index, marks = 1, type = `'multiple_choice'`.

## 3. Create Note under V2 Revision Notes Standard
The revision notes will contain exactly these 11 sections in order:
1. ## 1. 🎯 Chapter Goal
2. ## 2. 🪝 Hook
3. ## 3. 📖 Concept 1: Belgium and Sri Lanka - Ethnic Mix & Contrasting Paths
4. ## 4. 📖 Concept 2: Why Power-sharing is Desirable (Prudential vs Moral)
5. ## 5. 📖 Concept 3: Forms of Power-sharing (Horizontal, Vertical, Social, Coalitions)
6. ## 6. ⚠️ Common Mistakes
7. ## 7. 💡 Memory Tricks
8. ## 8. 📝 Quick Practice (2 Qs)
9. ## 9. 🎓 Board Tips
10. ## 10. 🔄 One-Minute Revision
11. ## 11. 🎬 Comic Recap (Priya and Rahul in ASCII box table)

We will include at least 3 custom jargon tags formatted precisely as:
`[JARGON: term | definition | example]`
We will define:
- `[JARGON: Ethnic | A social division based on shared culture and common descent | In Belgium, the population is divided into Flemish-speaking and Walloon-speaking ethnic groups.]`
- `[JARGON: Majoritarianism | A belief that the majority community should be able to rule a country by disregarding the minority | Sri Lanka adopted majoritarianism in 1956 by making Sinhala the only official language.]`
- `[JARGON: Civil War | A violent conflict between opposing groups within a country that becomes so intense it looks like a war | The conflict between Sinhalas and Tamils in Sri Lanka turned into a long civil war.]`
- `[JARGON: Prudential | Based on careful calculation of gains and losses rather than purely moral values | Prudential reasons for power-sharing show that it helps reduce social conflict.]`

## 4. Draft 5 High-Quality MCQs
We will create 5 MCQs directly related to the text:
1. What is the ethnic composition of Brussels, the capital of Belgium? (Correct: A. 80% French-speaking, 20% Dutch-speaking)
2. Which measure did the Sri Lankan government adopt in 1956 to establish Sinhala supremacy? (Correct: B. Recognised Sinhala as the only official language)
3. What is a key element of the Belgian model of accommodation? (Correct: C. The number of Dutch and French-speaking ministers is equal in the central government)
4. Which of the following is a "prudential" reason for power-sharing? (Correct: B. It helps reduce the possibility of conflict between social groups)
5. When power is shared among different organs of government, such as the legislature, executive, and judiciary, it is called: (Correct: C. Horizontal division of power)

## 5. SQL String Formatting and Verification
- Ensure single quotes are correctly escaped inside string literals (e.g. replace `'` with `''`).
- Write using `write_to_file` to `/home/sagarv/Projects/byAntiGravity/db/temp_ch_07.sql`.
- Verify the code is clean and run `flutter analyze` within `apps/mobile_web_client` to confirm no syntactic/structural breakages.
