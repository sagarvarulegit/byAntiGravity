# Implementation Plan: Seed Chapter 11 (Resources and Development) SQL Data

This plan outlines the generation and seeding of Chapter 11 data for CBSE Class 10 Social Science (Geography).

## 1. Metadata and Requirements
- **Subject ID**: `a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33` (Social Science)
- **Sequence Number**: `11`
- **Chapter Title**: `Chapter 11: Resources and Development`
- **Base UUIDs**:
  - Chapter: `c0eebc99-9c0b-4ef8-bb6d-6bb9bd389110`
  - Lesson: `b0eebc99-9c0b-4ef8-bb6d-6bb9bd389110`
  - Quiz: `d0eebc99-9c0b-4ef8-bb6d-6bb9bd389110`
  - Questions: `f0eebc99-9c0b-4ef8-bb6d-6bb9bd389111` to `f0eebc99-9c0b-4ef8-bb6d-6bb9bd389115`
- **Textbook File**: `/home/sagarv/Projects/cbse_class10_textbooks/extracted_text/social-geography_1.txt`
- **Target SQL File**: `/home/sagarv/Projects/byAntiGravity/db/temp_ch_11.sql`

## 2. Note Structure (V2 Standard)
1. **Goal**: Target outcomes (understanding resources, classifications, sustainable development, land degradation, and soil conservation).
2. **Hook**: Real-world connection to resource depletion.
3. **Concepts**:
   - Concept 1: Resources: Definition, Classification & Sustainable Development
   - Concept 2: Land Resources, Utilisation & Degradation in India
   - Concept 3: Soils of India & Soil Conservation Techniques
4. **Jargon Tags**:
   - `[JARGON: Sustainable Development | Development that meets current needs without compromising future needs. | Rio Earth Summit 1992 focused on sustainable development.]`
   - `[JARGON: Net Sown Area | The physical area where crops are sown and harvested at least once a year. | Punjab has over 80% Net Sown Area.]`
   - `[JARGON: Gully Erosion | Water cutting deep channels in clayey soils, creating bad land. | Chambal ravines are classic examples.]`
   - `[JARGON: Laterite | Highly leached, acidic soil formed in tropical climates with heavy rains. | Cashew nuts and coffee grow well in laterite soils.]`
5. **Common Mistakes**: Bangar vs Khadar, Net Sown vs Gross Cropped Area.
6. **Memory Tricks**: Bangar = "Bhangar" (old/scrap), Khadar = "Khaddar/Khaad" (new/fertile).
7. **Quick Practice**: 2 practice questions.
8. **Board Tips**: Standard keywords for definitions and classifications.
9. **One-Minute Revision**: 5 quick points.
10. **Comic Recap**: Dialogue between Priya and Rahul inside an ASCII box table.

## 3. Quiz Questions (5 MCQs)
1. MCQ 1: Main cause of land degradation in Punjab (Over-irrigation).
2. MCQ 2: State where terrace cultivation is practiced (Uttarakhand).
3. MCQ 3: Soil type typical of the Deccan Trap lava flows (Black/Regur soil).
4. MCQ 4: Classification basis of resources into biotic and abiotic (Origin).
5. MCQ 5: Book presenting Gandhian philosophy by Schumacher (Small is Beautiful).

## 4. Verification
- Validate the generated SQL structures.
- Run `flutter analyze` inside the client application directory to confirm integrity.
