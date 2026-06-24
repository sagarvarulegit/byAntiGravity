# Implementation Plan - Generate SQL Seed for Chapter 13: Water Resources

We need to generate raw SQL seed statements for the database of the CBSE Class 10 Learning Portal to populate a new chapter: **Chapter 13: Water Resources** (Subject: Social Science, ID: `a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33`).

The target file is `/home/sagarv/Projects/byAntiGravity/db/temp_ch_13.sql`.

## 1. Study the Chapter Content
We have parsed the textbook text from `/home/sagarv/Projects/cbse_class10_textbooks/extracted_text/social-geography_3.txt`.
Key themes extracted:
- **Water Scarcity, Conservation, and Management**: 
  - Causes of scarcity: Over-exploitation, excessive use, unequal access, and water pollution (agricultural/industrial waste).
  - Modern initiatives: Jal Jeevan Mission (JJM) targeting 55 litres per capita per day for rural households, and Atal Bhujal Yojana (Atal Jal) targeting sustainable groundwater management.
- **Multi-Purpose River Projects**:
  - Purpose: Integrated water management combining hydel power, irrigation, flood control, navigation, recreation, and pisciculture.
  - Key projects: Bhakra-Nangal (Sutluj-Beas basin), Hirakud (Mahanadi basin), and Sardar Sarovar (Narmada River).
  - Criticisms and issues: Excessive sedimentation, disruption of natural river flow, aquatic habitat degradation, submergence of local ecosystems, displacement of communities, inter-state water disputes (e.g., Koyna diversion / Krishna-Godavari dispute).
- **Rainwater Harvesting**:
  - Traditional techniques: Western Himalayas' 'guls' or 'kuls', Bengal's inundation channels, Rajasthan's 'khadins', 'johads', and underground 'tankas' (storing 'palar pani').
  - Modern/regional success: Shillong's rooftop harvesting, Tamil Nadu's compulsory rainwater harvesting law, Gendathur's community-led rainwater harvesting, and Meghalaya's 200-year-old Bamboo Drip Irrigation system.

## 2. Define Schema Details & UUID Mappings
We will map the objects to the database schema (`db/schema.sql`):
- `chapters`:
  - `id`: `'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389130'`
  - `subject_id`: `'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33'`
  - `title`: `'Chapter 13: Water Resources'`
  - `sequence_number`: `13`
  - `description`: `'Examine water scarcity, explore the benefits and conflicts surrounding multi-purpose river valley projects, and study traditional and modern rainwater harvesting systems.'`
- `lessons` (Revision Note):
  - `id`: `'b0eebc99-9c0b-4ef8-bb6d-6bb9bd389130'`
  - `chapter_id`: `'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389130'`
  - `title`: `'Revision Notes: Water Resources'`
  - `type`: `'note'`
  - `note_content`: Markdown content following V2 Revision Notes Standard.
  - `is_free`: `FALSE`
  - `sequence_number`: `1`
- `quizzes`:
  - `id`: `'d0eebc99-9c0b-4ef8-bb6d-6bb9bd389130'`
  - `chapter_id`: `'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389130'`
  - `title`: `'Chapter 13 Quiz: Water Resources'`
  - `passing_percentage`: `60`
- `quiz_questions`:
  - Question 1: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389131'`
  - Question 2: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389132'`
  - Question 3: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389133'`
  - Question 4: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389134'`
  - Question 5: `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389135'`
  - Each with unique options, correct_option_index, marks = 1, type = `'multiple_choice'`.

## 3. Create Note under V2 Revision Notes Standard
The revision notes will contain exactly these 11 sections in order:
1. ## 1. 🎯 Chapter Goal
2. ## 2. 🪝 Hook
3. ## 3. 📖 Concept 1: Water Scarcity and the Need for Water Conservation and Management
4. ## 4. 📖 Concept 2: Multi-Purpose River Projects and Integrated Water Resources Management
5. ## 5. 📖 Concept 3: Rainwater Harvesting (Traditional and Modern Systems)
6. ## 6. ⚠️ Common Mistakes
7. ## 7. 💡 Memory Tricks
8. ## 8. 📝 Quick Practice (2 Qs)
9. ## 9. 🎓 Board Tips
10. ## 10. 🔄 One-Minute Revision
11. ## 11. 🎬 Comic Recap (Priya and Rahul in ASCII box table)

We will include custom jargon tags formatted precisely as:
`[JARGON: term | definition | example]`
For example:
- `[JARGON: Hydrological Cycle | The continuous movement of water on, above, and below the surface of the Earth, ensuring water is a renewable resource | Evaporation of water from oceans forming clouds that result in rain, replenishing rivers and groundwater, is part of the hydrological cycle.]`
- `[JARGON: Multi-purpose River Project | A large-scale project involving the construction of a dam on a river to serve multiple integrated purposes simultaneously, such as irrigation, electricity generation, flood control, and navigation | The Bhakra-Nangal Project on the Sutluj-Beas basin, which provides water for irrigation and produces hydroelectricity, is a multi-purpose river project.]`
- `[JARGON: Tanka | A traditional underground rainwater storage system built inside the main house or courtyard in the arid and semi-arid regions of Rajasthan | Homes in Bikaner and Phalodi collect rooftop rainwater through pipes into large tankas to ensure drinking water supply during the hot summer months.]`
- `[JARGON: Bamboo Drip Irrigation | A 200-year-old traditional system prevalent in Meghalaya of tapping stream and spring water using bamboo pipes to deliver water directly to the plant roots | Mountain streams in Meghalaya are diverted via gravity through a network of bamboo channels, reducing the water flow to 20-80 drops per minute at the plant site.]`

## 4. Draft 5 High-Quality MCQs
We will create 5 MCQs directly related to the text:
1. Which of the following is the primary objective of the Jal Jeevan Mission (JJM)?
2. What are the key reasons why multi-purpose projects have faced opposition in recent years?
3. Which project in the Mahanadi basin integrates water conservation with flood control?
4. In which state is rooftop rainwater harvesting legally mandatory for all houses?
5. What is the traditional name given to the purest form of natural water stored in the tankas of Rajasthan?

## 5. SQL String Formatting and Verification
- Ensure single quotes are correctly escaped inside string literals (e.g. replace `'` with `''`).
- Write using `write_to_file` to `/home/sagarv/Projects/byAntiGravity/db/temp_ch_13.sql`.
- Verify code syntax by running a quick flutter analysis check in `apps/mobile_web_client`.
