# Implementation Plan: Jargon Callout Cards & Chemistry Subscripts in Revision Notes

This plan details the changes required to parse jargon markers from lesson revision notes and render them directly to the screen as custom Callout Cards, while cleaning up formatting and adding support for subscripts in chemical/math formulas.

---

## 1. Objectives

1. **Jargon Identification & Extraction:**
   - Detect patterns matching `[JARGON: Term | Definition | Example]`.
   - Strip any surrounding brackets, braces (e.g., `{` or `}`), and the jargon tags themselves, leaving only the bolded Term inside the original paragraph/sentence text to ensure natural flow.

2. **Beautiful Callout Card Component:**
   - Map the extracted Term, Definition, and Example into a beautiful custom Callout Card.
   - **Background:** Soft pastel light blue/teal (`Color(0xFFE0F2FE)` in light mode, `Color(0xFF0C4A6E).withOpacity(0.2)` in dark mode).
   - **Icon:** Book or dictionary icon (`Icons.menu_book_rounded`).
   - **Term:** Bolded Term in Outfit font.
   - **Definition:** Clear Georgia text (with LaTeX/KaTeX support by forwarding to math text renderer).
   - **Example:** Distinct italicized sub-block with a left accent border.

3. **Subscript Formatting for Chemical/Math Formulas:**
   - Update the text parser to convert plain text chemical/math subscripts (e.g., `H_2O`, `CO_2`, `O_2`, `C_6H_12O_6` or standard `H2O`/`CO2` chemical formulas) to Unicode subscripts (e.g., `H₂O`, `CO₂`, `O₂`, `C₆H₁₂O₆`), while leaving standard LaTeX math/KaTeX blocks (enclosed in `$`) completely untouched.

4. **Verify & Validate:**
   - Ensure syntactical correctness via `flutter analyze` inside `apps/mobile_web_client`.

---

## 2. Technical Specification & Design

### A. Jargon Parser Regex & Replacer
- **Regex:** `r'[\{\[]?\s*\[JARGON:\s*([^|\]]+)\s*\|\s*([^|\]]+)\s*\|\s*([^|\]]+)\s*\]\s*[\}\]]?'`
  - Captures the three components: Term, Definition, and Example.
  - Matches optional leading/trailing brackets `[` or `]` and curly braces `{` or `}` to clean them up.
- **Replacement:** The entire match is replaced with just the `Term` (e.g., `**Term**` stays bolded if surrounded by asterisks in the markdown).

### B. Chemistry and Math Subscripts Formatting
A helper `formatSubscripts(String text)` will split the text by `$` to isolate LaTeX math blocks. For non-math (plain text) parts, it will:
1. Replace chemical patterns like `([A-Z][a-z]?)_?(\d+)` by mapping the digits to Unicode subscripts:
   `0-9` -> `₀-₉`
2. Replace math subscripts like `([a-zA-Z])_([0-9nixy])` by mapping the subscript variable/number to Unicode subscripts.
Finally, the parts will be joined back with `$`.

### C. Jargon Callout Card UI Widget
We will implement `_buildJargonCalloutCard(String term, String definition, String example, bool isDark)` in `LessonsView`.
- Main container with border and rounded corners.
- Left-aligned book icon and term header.
- Sub-block for the example with a left border accent and italicized text.

---

## 3. Implementation Steps

1. **Modify `apps/mobile_web_client/lib/views/lessons_view.dart`:**
   - Implement `_buildJargonCalloutCard(String term, String definition, String example, bool isDark)` to render the Callout Card.
   - Implement `formatSubscripts(String text)` helper.
   - Update `cleanMathText(String text)` to call `formatSubscripts`.
   - Update `_parseMarkdownNotes(String content)` to match and extract Jargon, clean up the original lines, and append Callout Cards right below the corresponding lines.

2. **Verify Code Quality:**
   - Run `cd apps/mobile_web_client && flutter analyze`.
   - Resolve any warnings or errors.

---

## 4. Verification Plan

- Execute `flutter analyze` inside the client directory to check compile-time validity.
- Verify that standard LaTeX syntax is not affected.
- Verify that chemical formulas outside LaTeX (like `H2O`, `CO_2`) are transformed into beautiful subscript representations.
