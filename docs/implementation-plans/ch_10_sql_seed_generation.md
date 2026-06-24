# Implementation Plan - Generate SQL Seed for Chapter 10: Outcomes of Democracy

We need to generate raw SQL seed statements for the database of the CBSE Class 10 Learning Portal to populate a new chapter: **Chapter 10: Outcomes of Democracy** (Subject: Social Science, ID: `a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33`).

The target file is `/home/sagarv/Projects/byAntiGravity/db/temp_ch_10.sql`.

## 1. Study the Chapter Content
We have parsed the textbook text from `/home/sagarv/Projects/cbse_class10_textbooks/extracted_text/social-civics_5.txt`.
Key themes extracted:
- **Assessing Democracy's Outcomes**: Why democracy is better than alternatives (promotes equality, enhances dignity, improves decision-making, resolves conflicts, corrects mistakes). The dilemma: good in principle, but felt to be not so good in practice.
- **Accountable, Responsive, and Legitimate Government**: Deliberation and negotiation might delay decisions, but make them more acceptable and effective. Importance of transparency (Right to Information). Overwhelming support for democracy as a legitimate (people's own) government.
- **Economic Growth and Development**: Average growth rates between 1950 and 2000 show dictatorships slightly ahead, but in poor countries, the difference is negligible. Economic growth depends on population, global situations, and policies.
- **Inequality and Poverty**: High levels of economic inequalities exist within democracies (e.g., South Africa, Brazil).
- **Social Diversity, Freedom, and Dignity**: How democracies accommodate differences (two conditions: majority working with minority, and majority rule not becoming majority community rule). Promoting the dignity and freedom of individuals, women, and discriminated castes. Complaints are a testimony to democracy's success.

## 2. Define Schema Details & UUID mappings
We will map the objects to the database schema:
- `chapters`:
  - `id`: `'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389100'`
  - `subject_id`: `'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33'`
  - `title`: `'Chapter 10: Outcomes of Democracy'`
  - `sequence_number`: `10`
  - `description`: `'Understand how to assess the political, economic, and social outcomes of democracy, focusing on accountability, responsiveness, economic growth, inequality, social accommodation, and individual dignity.'`
- `lessons` (Revision Note):
  - `id`: `'b0eebc99-9c0b-4ef8-bb6d-6bb9bd389100'`
  - `chapter_id`: `'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389100'`
  - `title`: `'Revision Notes: Outcomes of Democracy'`
  - `type`: `'note'`
  - `note_content`: Markdown content following V2 Revision Notes Standard (11 sections, 4 jargon tags).
  - `is_free`: `FALSE`
  - `sequence_number`: `1`
- `quizzes`:
  - `id`: `'d0eebc99-9c0b-4ef8-bb6d-6bb9bd389100'`
  - `chapter_id`: `'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389100'`
  - `title`: `'Chapter 10 Quiz: Outcomes of Democracy'`
  - `passing_percentage`: `60`
- `quiz_questions`:
  - Question 1: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389101'`
  - Question 2: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389102'`
  - Question 3: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389103'`
  - Question 4: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389104'`
  - Question 5: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389105'`
  - Each with unique options (JSON array), correct_option_index, marks = 1, type = `'multiple_choice'`.

## 3. Create Note under V2 Revision Notes Standard
The revision notes will contain exactly these 11 sections in order:
1. ## 1. 🎯 Chapter Goal
2. ## 2. 🪝 Hook
3. ## 3. 📖 Concept 1: Accountable, Responsive, and Legitimate Government
4. ## 4. 📖 Concept 2: Economic Growth, Inequality, and Poverty
5. ## 5. 📖 Concept 3: Accommodation of Social Diversity, Dignity, and Freedom
6. ## 6. ⚠️ Common Mistakes
7. ## 7. 💡 Memory Tricks
8. ## 8. 📝 Quick Practice
9. ## 9. 🎓 Board Tips
10. ## 10. 🔄 One-Minute Revision
11. ## 11. 🎬 Comic Recap (Priya and Rahul in ASCII box table)

We will include 4 custom jargon tags formatted precisely as:
`[JARGON: term | definition | example]`
- `[JARGON: Accountability | The obligation of a government to explain its decisions and actions to its citizens, who hold the power to choose their leaders | Regular, free, and fair elections and open public debate are mechanisms that ensure accountability in a democracy.]`
- `[JARGON: Transparency | The right and means of citizens to examine the process and criteria of government decision-making | A citizen using the Right to Information (RTI) Act to track the progress of an official application.]`
- `[JARGON: Economic Inequality | The unequal distribution of wealth and income among individuals or groups within a society | In Brazil, the top 20% of the population earns 63% of the national income, while the bottom 20% receives only 2.6%.]`
- `[JARGON: Legitimate Government | A government that is legally constituted and authorized by the citizens through their consent and vote | A democratically elected representative government, even if slow or inefficient, is preferred by citizens because it is their own government.]`

## 4. Draft 5 High-Quality MCQs
We will create 5 MCQs directly related to the text:
1. Which of the following is NOT one of the reasons why democracy is considered a better form of government than dictatorship? (Correct: It guarantees immediate and high economic growth)
2. Studies on political and social inequalities in democracies show that: (Correct: Economic inequalities exist in democracies)
3. In which country of South Asia is democracy NOT preferred over dictatorship by the majority of the population according to the textbook survey data? (Correct: Pakistan)
4. What does the example of Nannu filing an RTI application in Delhi demonstrate? (Correct: How transparency and accountability can be enforced by citizens using democratic rights)
5. A democracy can successfully accommodate social diversity only if it fulfills which of the following conditions? (Correct: The majority works with the minority, and rule by majority does not become rule by a majority community based on religion/race/caste)

## 5. SQL String Formatting and Verification
- Ensure single quotes are correctly escaped inside string literals (e.g. replace `'` with `''`).
- Output the raw SQL code without code blocks inside the file.
- Write using `write_to_file` to `/home/sagarv/Projects/byAntiGravity/db/temp_ch_10.sql`.
- Verify the code is clean and run `flutter analyze` within `apps/mobile_web_client` to confirm no syntactic/structural breakages.
