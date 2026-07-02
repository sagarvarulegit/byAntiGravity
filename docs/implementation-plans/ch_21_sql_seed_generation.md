---
type: Plan
title: Implementation Plan: Seed Chapter 21 (Globalisation and the Indian Economy) SQL Data
description: This plan outlines the generation and seeding of Chapter 21 data for CBSE Class 10 Social Science (Economics).
tags: [plan]
timestamp: 2026-06-24T08:14:03Z
---
# Implementation Plan: Seed Chapter 21 (Globalisation and the Indian Economy) SQL Data

This plan outlines the generation and seeding of Chapter 21 data for CBSE Class 10 Social Science (Economics).

## 1. Metadata and Requirements
- **Subject ID**: `a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33` (Social Science)
- **Sequence Number**: `21`
- **Chapter Title**: `Chapter 21: Globalisation and the Indian Economy`
- **Base UUIDs**:
  - Chapter: `c0eebc99-9c0b-4ef8-bb6d-6bb9bd389210`
  - Lesson: `b0eebc99-9c0b-4ef8-bb6d-6bb9bd389210`
  - Quiz: `d0eebc99-9c0b-4ef8-bb6d-6bb9bd389210`
  - Questions: `f0eebc99-9c0b-4ef8-bb6d-6bb9bd389211` to `f0eebc99-9c0b-4ef8-bb6d-6bb9bd389215`
- **Textbook File**: `/home/sagarv/Projects/cbse_class10_textbooks/extracted_text/social-economics_4.txt`
- **Target SQL File**: `/home/sagarv/Projects/byAntiGravity/db/temp_ch_21.sql`

## 2. Note Structure (V2 Standard)
1. **Chapter Goal**: Bulleted target outcomes for understanding MNCs, factors enabling globalisation, and its multi-faceted impacts.
2. **Hook**: Transition from Ambassador/Fiat era to current global brands and consumer choices in Indian markets.
3. **Concepts**:
   - Concept 1: Production Across Countries & Interlinking by MNCs (cheap labour, joint ventures, buying local companies).
   - Concept 2: Factors Enabling Globalisation: Technology, Liberalisation, and the role of WTO.
   - Concept 3: Impact of Globalisation in India: Benefits to consumers and large producers, challenges faced by small producers (e.g., Ravi and capacitors) and garment workers (temporary/flexible employment).
4. **Jargon Tags**:
   - `[JARGON: Multinational Corporation (MNC) | A company that owns or controls production in more than one nation | Cargill Foods is an American MNC that expanded by purchasing Parakh Foods in India.]`
   - `[JARGON: Foreign Investment | Investment made by a multinational corporation (MNC) to buy assets such as land, buildings, or machinery in another country | Ford Motors investing Rs 1700 crore in 1995 to set up a plant near Chennai is a foreign investment.]`
   - `[JARGON: Liberalisation | The removal of barriers or restrictions set by the government on foreign trade and investment | In 1991, India removed trade barriers to allow foreign companies to set up factories and offices easily.]`
   - `[JARGON: Special Economic Zone (SEZ) | An industrial zone with world-class facilities set up by the government to attract foreign companies, offering tax exemptions for an initial period | The Indian government set up SEZs where companies do not have to pay taxes on production units for the first five years.]`
5. **Common Mistakes**: Confusing foreign trade (exchange of goods) with foreign investment (MNC assets/production), or assuming globalisation benefits all stakeholders equally.
6. **Memory Tricks**: Mnemonic "T-I-L-E" (Technology, International trade/WTO, Liberalisation, Expansion of MNCs) for factors driving globalisation.
7. **Quick Practice**: 2 practice questions with answers.
8. **Board Tips**: Standard keywords for definitions and highlighting balanced/fair globalisation arguments.
9. **One-Minute Revision**: 5 quick points summarizing the chapter.
10. **Comic Recap**: Dialogue between Priya and Rahul inside an ASCII box table.

## 3. Quiz Questions (5 MCQs)
1. MCQ 1: Primary reason MNCs set up offices and factories in developing countries (Cheap labor and low production costs).
2. MCQ 2: Year when major economic reforms and liberalisation policies were introduced in India (1991).
3. MCQ 3: Role of World Trade Organisation (WTO) (To liberalise international trade).
4. MCQ 4: What is a Special Economic Zone (SEZ)? (Industrial zones with world-class facilities and tax holidays to attract foreign investment).
5. MCQ 5: Impact of liberalisation of capacitors imports on local small producers like Ravi (Forced to cut down production and lay off workers).

## 4. Verification
- Validate the generated SQL file and syntax.
- Run `flutter analyze` inside the client application directory to confirm integrity.
