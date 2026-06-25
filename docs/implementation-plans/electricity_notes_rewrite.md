# Implementation Plan: Rewrite Science Chapter 12 (Electricity) Notes

## Goal
Rewrite the revision notes for Science Chapter 12 (Electricity) to align with the depth and comprehensiveness of the NCERT textbook, covering all necessary topics, activities, derivations, and reasoning questions needed to top the CBSE board exams.

## Current State
The existing notes for Electricity (`db/seed_notes_v2.sql`) are too brief. They act as a mere formula sheet, omitting crucial explanations like:
- Circuit diagram symbols
- Explanations of activities
- Step-by-step derivations for series and parallel resistor combinations
- V-I graph for Ohm's law
- Reasoning behind practical applications (e.g., domestic wiring, fuses, bulb filaments)

## Steps
1. **Prepare Comprehensive Notes Content**:
   - Section 1: Electric Current & Potential Difference (definitions, formulas, units, direction of flow).
   - Section 2: Circuit Diagrams (list of symbols).
   - Section 3: Ohm's Law (statement, formula, V-I graph, `[FIGURE: ohms_law_circuit]`, Activity 11.1).
   - Section 4: Resistance & Resistivity (factors affecting resistance, resistivity, Activity 11.2).
   - Section 5: Resistors in Series and Parallel (derivations, equivalent resistance formulas, reasoning for parallel circuits in domestic wiring).
   - Section 6: Heating Effect of Electric Current (Joule's law of heating, practical applications like bulb filament and fuse).
   - Section 7: Electric Power (formulas, commercial unit).
   - Add Comic Recap and Quick Revision.
2. **Update Database Seed**:
   - Modify the `INSERT INTO lessons` block for Electricity in `db/seed_notes_v2.sql`.
   - Use the `ON CONFLICT (id) DO UPDATE` feature to overwrite the existing `note_content`.
3. **Execute SQL to update Live DB**:
   - Run the updated SQL script via `docker exec -i supabase_db_byAntiGravity psql -U postgres -d postgres < db/seed_notes_v2.sql`.
4. **Validation**:
   - Query the database to ensure `note_content` length has increased significantly.
   - Run `flutter analyze` to ensure no syntax issues (per global rules).
