---
type: Plan
title: Implementation Plan - Generate SQL Seed for Chapter 15: Minerals and Energy Resources
description: We need to generate raw SQL seed statements for the database of the CBSE Class 10 Learning Portal to populate a new chapter: **Chapter 15: Minerals an...
tags: [plan]
timestamp: 2026-06-24T08:13:34Z
---
# Implementation Plan - Generate SQL Seed for Chapter 15: Minerals and Energy Resources

We need to generate raw SQL seed statements for the database of the CBSE Class 10 Learning Portal to populate a new chapter: **Chapter 15: Minerals and Energy Resources** (Subject: Social Science, ID: `a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33`).

The target file is `/home/sagarv/Projects/byAntiGravity/db/temp_ch_15.sql`.

## 1. Study the Chapter Content
We have parsed the textbook text from `/home/sagarv/Projects/cbse_class10_textbooks/extracted_text/social-geography_5.txt`.
Key themes extracted:
- **What is a mineral?**: Naturally occurring, homogenous substances with a definite internal structure.
- **Mode of occurrence**:
  - Igneous/metamorphic: veins (smaller) and lodes (larger) (tin, copper, zinc, lead).
  - Sedimentary: beds/layers (coal, iron ore) and evaporation in arid regions (gypsum, potash, sodium salt).
  - Decomposition of surface rocks: weathering removing soluble constituents, leaving residual mass (bauxite).
  - Placer deposits: alluvial deposits in sands of valley floors and bases of hills that are not corroded by water (gold, silver, tin, platinum).
  - Ocean waters & beds: common salt, magnesium, bromine from waters; manganese nodules on ocean beds.
- **Ferrous Minerals**: Iron ore (Magnetite - 70% iron, magnetic qualities; Hematite - 50-60% iron, most popular industrially). Four major belts: Odisha-Jharkhand, Durg-Bastar-Chandrapur, Ballari-Chitradurga-Chikkamagaluru-Tumakuru, Maharashtra-Goa. Manganese: used in steel manufacturing (10kg per tonne of steel), bleaching powder, insecticides, paints.
- **Non-Ferrous Minerals**: Copper (malleable, ductile, good conductor; Balaghat mines in MP, Khetri in Rajasthan, Singhbhum in Jharkhand). Bauxite (clay-like substance from which alumina and aluminium are obtained; Amarkantak, Maikal, Bilaspur-Katni, Koraput/Panchpatmali in Odisha).
- **Non-Metallic Minerals**: Mica (plates/leaves, splits easily, di-electric strength, low power loss; Koderma-Gaya-Hazaribagh in Jharkhand, Ajmer in Rajasthan, Nellore in AP).
- **Rock Minerals**: Limestone (calcium/magnesium carbonates; cement industry raw material, blast furnace smelting).
- **Hazards of Mining**: Dust/noxious fumes causing pulmonary diseases, roof collapses, fires, water pollution ("killer industry").
- **Conservation of Minerals**: Finite, non-renewable, geological process of replenishment is extremely slow. Need for sustainable usage, recycling, and substitutes.
- **Energy Resources**:
  - Conventional: Coal (Peat, Lignite - Neyveli, Bituminous, Anthracite; Gondwana vs. Tertiary rocks), Petroleum (anticlines/fault traps; Mumbai High, Ankeleshwar in Gujarat, Digboi/Naharkatiya in Assam), Natural Gas (preferred transport fuel CNG/cooking fuel PNG; Hazira-Vijaipur-Jagdishpur pipeline), Electricity (Hydro - renewable, thermal - non-renewable).
  - Non-Conventional: Solar (photovoltaic), Wind (Nagarcoil to Madurai, Jaisalmer), Biogas (gobar gas), Tidal (Khambhat, Kuchchh, Sunderbans), Geothermal (Manikaran in HP, Puga Valley in Ladakh), Nuclear (Uranium, Thorium from Jharkhand, Aravallis, Monazite sands of Kerala).
- **Conservation of Energy Resources**: "Energy saved is energy produced."

## 2. Define Schema Details & UUID mappings
We will map the objects to the database schema (`db/schema.sql`):
- `chapters`:
  - `id`: `'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389150'`
  - `subject_id`: `'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33'`
  - `title`: `'Chapter 15: Minerals and Energy Resources'`
  - `sequence_number`: `15`
  - `description`: `'A comprehensive guide to India\'s mineral wealth, their classification, mode of occurrence, environmental impact, and energy resources.'`
- `lessons` (Revision Note):
  - `id`: `'b0eebc99-9c0b-4ef8-bb6d-6bb9bd389150'`
  - `chapter_id`: `'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389150'`
  - `title`: `'Revision Notes: Minerals and Energy Resources'`
  - `type`: `'note'`
  - `note_content`: Markdown content following V2 Revision Notes Standard (11 sections, 3+ custom jargon tags).
  - `is_free`: `FALSE` (as per user request)
  - `sequence_number`: `1`
- `quizzes`:
  - `id`: `'d0eebc99-9c0b-4ef8-bb6d-6bb9bd389150'`
  - `chapter_id`: `'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389150'`
  - `title`: `'Social Science Chapter 15 Quiz'`
  - `passing_percentage`: `60`
- `quiz_questions`:
  - Question 1 (UUID): `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389151'`
  - Question 2 (UUID): `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389152'`
  - Question 3 (UUID): `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389153'`
  - Question 4 (UUID): `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389154'`
  - Question 5 (UUID): `'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389155'`

## 3. Create Note under V2 Revision Notes Standard
The revision notes will contain exactly these 11 sections in order:
1. Goal
2. Hook
3. Concept 1 (Occurrence and Classification of Minerals)
4. Concept 2 (Metallic, Non-Metallic, and Rock Minerals)
5. Concept 3 (Energy Resources: Conventional and Non-Conventional)
6. Common Mistakes
7. Memory Tricks
8. Quick Practice (2 questions with answers)
9. Board Tips
10. One-Minute Revision
11. Comic Recap (Priya & Rahul in ASCII box table)

We will include at least 3 custom jargon tags formatted precisely as:
`[JARGON: term | definition | example]`
For example:
- `[JARGON: Ore | An accumulation of any mineral mixed with other elements | Hematite is an iron ore from which metallic iron is extracted]`
- `[JARGON: Placer Deposits | Alluvial deposits of minerals found in sands of valley floors and bases of hills that are not corroded by water | Gold and platinum are commonly found as placer deposits]`
- `[JARGON: Ferrous Minerals | Metallic minerals that contain iron, providing a strong base for metallurgical industries | Magnetite and hematite are primary ferrous minerals]`

## 4. Draft 5 High-Quality MCQs
We will create 5 MCQs directly related to the text:
1. Which one of the following minerals is formed by the decomposition of rocks, leaving a residual mass of weathered material? (Correct: Bauxite)
2. Which of the following is the finest quality iron ore with excellent magnetic properties, valuable in the electrical industry? (Correct: Magnetite)
3. Koderma in Jharkhand is the leading producer of which one of the following minerals? (Correct: Mica)
4. Which geological age deposits of coal in India are about 55 million years old and occur in the north-eastern states? (Correct: Tertiary)
5. Which mineral is abundantly contained in the Monazite sands of Kerala? (Correct: Thorium)

## 5. SQL String Formatting and Verification
- Write a Python script to handle correct escaping of single quotes (replace `'` with `''`).
- Output file path: `/home/sagarv/Projects/byAntiGravity/db/temp_ch_15.sql`.
- Verify the generated SQL exists and has the correct fields.
