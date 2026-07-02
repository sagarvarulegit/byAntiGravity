---
type: Standard
title: Chapter Look & Feel (NCERT Standard)
description: This document outlines the core decisions and conventions established while refining the **Class 10 Science - Electricity** chapter. These guidelines ...
tags: [standard]
timestamp: 2026-06-26T12:58:25Z
---
# Chapter Look & Feel (NCERT Standard)

This document outlines the core decisions and conventions established while refining the **Class 10 Science - Electricity** chapter. These guidelines serve as the source of truth for creating and formatting all future study guides (Math, Science, etc.) to ensure a consistent, premium, and highly accurate user experience.

## 1. 1-to-1 Mapping with NCERT
*   **Absolute Fidelity**: The study guide structure must be a direct 1-to-1 mapping of the NCERT textbook.
*   **Consistent Numbering**: Retain exact chapter numbers and topic section numbers (e.g., `11.1 Electric Current and Circuit`).
*   **Content Completeness**: Do not skip any sections, introductory text, diagrams, formulas, in-text examples, or in-text questions. 

## 2. Visual Polish & Diagram Accuracy
*   **High-Quality Visuals**: The platform must provide a simplified, easy-to-grasp, and beautiful version of the textbook. All diagrams must be visually stunning and feel premium.
*   **Meticulous Technical Accuracy**: Circuit diagrams (and all scientific figures) must be perfectly accurate. For example:
    *   **Bulbs**: Use a realistic "M-shaped" filament.
    *   **Batteries**: A single cell is not a battery; a battery must be depicted as multiple cells (e.g., 3 cells) connected correctly.
    *   **Polarity**: Ammeters and Voltmeters must have their `+` and `-` signs clearly marked and correctly oriented.
    *   **Keys/Switches**: Must include the standard label (e.g., "K").
    *   **Flow Direction**: Electric current arrows must point in the exact correct direction (positive to negative).
*   **Implementation**: Use Flutter `CustomPainter` (via custom tags like `[FIGURE: basic_circuit]`) instead of static images to ensure diagrams are responsive and perfectly themed.

## 3. In-Text Examples
*   **Mandatory Inclusion**: All numbered textbook examples (e.g., `Example 11.1`) must be included exactly where they appear in the book.
*   **Formatting Syntax**: Use the standard parser format in the SQL seed files:
    ```markdown
    **Example 11.1**
    [Question Text]

    **Solution:**
    [Step-by-step solution]
    ```
    *(Note: Ensure `lessons_view.dart`'s parser handles the `**Example ...**` and `**Solution:**` tags correctly as implemented).*

## 4. In-Text Questions & Answers
*   **Don't Skip Questions**: The textbook's periodic question blocks (e.g., the 3 questions after section 11.1) must be included.
*   **Provide Solutions**: Our platform must provide answers to these questions. The answers should be:
    *   Simple and easy to grasp.
    *   Accurate and rigorous.
    *   Easy to remember.
*   **Formatting Syntax**: Group questions under the specific header expected by the parser:
    ```markdown
    **❓ QUESTIONS**
    1. What does an electric circuit mean?
    Ans: A continuous and closed path...
    ```

## 5. Value-Add "Extras"
While the core content strictly follows NCERT, our platform adds its own "flavor" to make learning engaging:
*   **Tips & Tricks**: Callouts to help students solve problems faster.
*   **Things to Remember**: Key takeaways emphasized for board exams.
*   **Comic Style Recap**: A fun, visual summary at the end of the chapter to consolidate learning.

## 6. Technical Implementation Rules
*   **SQL Escaping**: When seeding text content into PostgreSQL (`seed_study_guides.sql`), always double-escape single quotes (e.g., `Ohm''s Law`) to prevent syntax errors.
*   **Parser Alignment**: The Flutter app's markdown parser (`lessons_view.dart`) must have dedicated logic to flush and render Examples, Solutions, and Question blocks seamlessly when it encounters their markdown triggers.
