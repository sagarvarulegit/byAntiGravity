# Implementation Plan - Generate SQL Seed for Chapter 14: Agriculture

We need to generate raw SQL seed statements for the database of the CBSE Class 10 Learning Portal to populate a new chapter: **Chapter 14: Agriculture** (Subject: Social Science, ID: `a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33`).

The target file is `/home/sagarv/Projects/byAntiGravity/db/temp_ch_14.sql`.

## 1. Study the Chapter Content
We have parsed the textbook text from `/home/sagarv/Projects/cbse_class10_textbooks/extracted_text/social-geography_4.txt`.
Key themes extracted:
- **Importance of Agriculture**: Two-thirds of India's population engaged; primary activity producing food and raw materials.
- **Types of Farming**:
  - Primitive Subsistence (small patches, hoe/dao/digging sticks, monsoon-dependent, slash-and-burn/shifting cultivation with local names like Jhumming, Milpa, Ladang, Bewar, etc.).
  - Intensive Subsistence (high population pressure, high chemical input and irrigation, labour intensive, fragmentation of holdings).
  - Commercial Farming (modern inputs: HYV seeds, fertilizers, pesticides; plantation agriculture as a single crop over a large area like tea in Assam/West Bengal and coffee in Karnataka).
- **Cropping Pattern**:
  - Rabi (sown winter Oct-Dec, harvested Apr-Jun; wheat, barley, gram; winter rain due to western temperate cyclones; Green Revolution).
  - Kharif (onset of monsoon, harvested Sep-Oct; paddy, maize, jowar, bajra, pulses, cotton, jute). Aus, Aman, Boro are three paddy crops in Assam, West Bengal, Odisha.
  - Zaid (short summer season; watermelon, muskmelon, cucumber, vegetables).
- **Major Crops**:
  - Rice (staple, second largest, kharif, >25°C, humidity, >100cm rain).
  - Wheat (second cereal, rabi, cool season/bright sun, 50-75cm rain).
  - Millets (Jowar, Bajra, Ragi; coarse but high nutrients like calcium/iron).
  - Maize (food & fodder, kharif/rabi in Bihar, old alluvial soil, 21-27°C).
  - Pulses (leguminous crops restoring nitrogen, dry conditions; arhar/tur, gram, etc.).
  - Sugarcane (tropical/subtropical, 21-27°C, 75-100cm rain, India second after Brazil).
  - Oil Seeds (groundnut - half of oilseeds, Gujarat largest, linseed/mustard are rabi, castor is both).
  - Tea (plantation, warm/moist frost-free, labour-intensive, processed in gardens).
  - Coffee (Arabica from Yemen, Baba Budan hills, Karnataka/Kerala/Tamil Nadu).
  - Horticulture (second largest, tropical/temperate fruits like Nagpur oranges, Cherrapunjee oranges, apples).
- **Non-Food Crops**:
  - Rubber (equatorial/tropical/subtropical, >200cm rain, >25°C).
  - Fibre Crops (cotton - Deccan black soil, 210 frost-free days; jute - golden fibre, fertile flood plains).
- **Technological & Institutional Reforms**:
  - Post-independence land reforms, Green/White revolutions, Grameen banks, cooperative societies, Kisan Credit Card (KCC), Personal Accident Insurance Scheme (PAIS), Minimum Support Price (MSP).
  - Bhoodan-Gramdan (Vinoba Bhave, Pochampally, Shri Ram Chandra Reddy; Blood-less Revolution).

## 2. Define Schema Details & UUID mappings
We will map the objects to the database schema (`db/schema.sql`):
- `chapters`:
  - `id`: `'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389140'`
  - `subject_id`: `'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33'`
  - `title`: `'Chapter 14: Agriculture'`
  - `sequence_number`: `14`
  - `description`: `'Explore the diverse types of farming, cropping seasons, major food and non-food crops of India, and key techno-institutional reforms like Bhoodan-Gramdan.'`
- `lessons` (Revision Note):
  - `id`: `'b0eebc99-9c0b-4ef8-bb6d-6bb9bd389140'`
  - `chapter_id`: `'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389140'`
  - `title`: `'Revision Notes: Agriculture'`
  - `type`: `'note'`
  - `note_content`: Markdown content following V2 Revision Notes Standard (11 sections, 3+ custom jargon tags).
  - `is_free`: `FALSE` (as per user request)
  - `sequence_number`: `1`
- `quizzes`:
  - `id`: `'d0eebc99-9c0b-4ef8-bb6d-6bb9bd389140'`
  - `chapter_id`: `'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389140'`
  - `title`: `'Chapter 14 Quiz: Agriculture'`
  - `passing_percentage`: `60`
- `quiz_questions`:
  - Question 1 (UUID): `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389141'`
  - Question 2 (UUID): `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389142'`
  - Question 3 (UUID): `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389143'`
  - Question 4 (UUID): `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389144'`
  - Question 5 (UUID): `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389145'`

## 3. Create Note under V2 Revision Notes Standard
The revision notes will contain exactly these 11 sections in order:
1. Goal
2. Hook
3. Concept 1 (Types of Farming)
4. Concept 2 (Cropping Patterns & Major Crops)
5. Concept 3 (Technological-Institutional Reforms & Bhoodan-Gramdan)
6. Common Mistakes
7. Memory Tricks
8. Quick Practice (2 questions with answers)
9. Board Tips
10. One-Minute Revision
11. Comic Recap (Priya & Rahul in ASCII box table)

We will include at least 3 custom jargon tags formatted precisely as:
`[JARGON: term | definition | example]`
For example:
- `[JARGON: Jhumming | A slash-and-burn farming method where land is cleared, crops are grown, and farmers shift to a new patch when soil fertility declines | In north-eastern India, shifting cultivation is widely called jhumming.]`
- `[JARGON: Plantation Agriculture | A type of commercial farming where a single crop is grown on a large area using capital-intensive inputs and migrant labour | Tea in Assam and North Bengal is a major example of plantation agriculture.]`
- `[JARGON: Leguminous Crops | Plants (like pulses) that have root nodules containing nitrogen-fixing bacteria, helping restore soil fertility naturally | Pulses like gram and peas are leguminous crops that enrich the soil with nitrogen.]`
- `[JARGON: Bhoodan | A voluntary land gift movement initiated to distribute land to poor, landless farmers | The Bhoodan movement was started by Vinoba Bhave in 1951 at Pochampally in Telangana.]`

## 4. Draft 5 High-Quality MCQs
We will create 5 MCQs directly related to the text:
1. Which type of agriculture is also known as "slash and burn" cultivation? (Correct: Jhumming / Shifting Agriculture)
2. What are the three cropping seasons of India? (Correct: Rabi, Kharif, Zaid)
3. Which of the following is a leguminous crop that helps restore soil fertility by fixing nitrogen from the air? (Correct: Pulses)
4. Which movement initiated by Vinoba Bhave is also known as the "Blood-less Revolution"? (Correct: Bhoodan-Gramdan movement)
5. What geographical condition is required for the growth of cotton? (Correct: High temperature, light rainfall, and 210 frost-free days)

## 5. SQL String Formatting and Verification
- Ensure single quotes are correctly escaped inside string literals (e.g. replace `'` with `''`).
- Write using `write_to_file` to `/home/sagarv/Projects/byAntiGravity/db/temp_ch_14.sql`.
- Confirm completion.
