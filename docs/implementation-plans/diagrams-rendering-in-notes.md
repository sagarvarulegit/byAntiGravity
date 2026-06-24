# Implementation Plan: Diagram Rendering in Revision Notes

This plan details the changes required to parse and display textbook diagrams (like the Magnesium Ribbon Combustion diagram) inline within the revision notes transcript.

---

## 1. Objectives

1. **Enable Diagram Rendering:**
   - Detect explicit tag `[FIGURE: magnesium_burner]` or keyword `Magnesium burns with a bright white flame` in revision notes markdown content.
   - Render the pre-defined, custom-painted Magnesium Burner diagram (`_buildFigureBox`) inline right below the corresponding text.

2. **Verify & Validate:**
   - Ensure syntactical correctness via `flutter analyze` inside `apps/mobile_web_client`.

---

## 2. Technical Specification & Design

### A. Line Matcher
In the `_parseMarkdownNotes` loop:
- If a line matches `[FIGURE: magnesium_burner]` or contains `Magnesium burns with a bright white flame to form white magnesium oxide powder`, append `_buildFigureBox(isDark)` to the list of children.
- This wires up the unused `_buildFigureBox` component and displays it visually in the notes layout.

---

## 3. Implementation Steps

1. **Modify `apps/mobile_web_client/lib/views/lessons_view.dart`:**
   - Inside `_parseMarkdownNotes(String content)`, add a condition in the text rendering block to detect `Magnesium burns with a bright white flame` or `[FIGURE: magnesium_burner]` and render `_buildFigureBox(isDark)`.

2. **Verify Code Quality:**
   - Run `cd apps/mobile_web_client && flutter analyze`.
   - Run `flutter build web` for manual build validation.

---

## 4. Verification Plan

- Execute `flutter analyze` inside the client directory to check compile-time validity.
- Verify that the Magnesium Burner diagram shows up beautifully in the web app under the "Chemical Reactions" revision notes.
