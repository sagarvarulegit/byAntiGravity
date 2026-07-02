---
type: Plan
title: Implementation Plan: Global Diagram and Activity Rendering in Revision Notes
description: This plan details the changes required to parse and display textbook opener diagrams (including QR codes and Flask drawings) globally for all chapters...
tags: [plan]
timestamp: 2026-06-24T21:44:14Z
---
# Implementation Plan: Global Diagram and Activity Rendering in Revision Notes

This plan details the changes required to parse and display textbook opener diagrams (including QR codes and Flask drawings) globally for all chapters across all subjects, as well as NCERT Activity Boxes.

---

## 1. Objectives

1. **Global Chapter Opener Layout:**
   - Modify the `# ` H1 title parser in `_parseMarkdownNotes` to render a beautiful NCERT-style **Chapter Opener Header** instead of plain text.
   - Use `FlaskPainter` to draw a science-themed icon in the header.
   - Use `QRCodePainter` to draw a textbook-style QR Code on the right side of the header.
   - This applies globally to all chapters across all subjects (Mathematics, Science, Social Science, English, Hindi).

2. **NCERT Activity Boxes:**
   - Implement an Activity block parser within the main line loop to capture `### Activity` blocks, including Caution guidelines and steps.
   - Render these using the pre-existing (currently unused) `_buildActivityBox` and `_buildBulletItem` components.

3. **Inline Science Diagrams:**
   - Keep the inline Magnesium Ribbon Combustion diagram (`_buildFigureBox`) when magnesium burning is mentioned in the notes.

4. **Code Correctness:**
   - Resolve all compilation warnings regarding unused painters (`FlaskPainter`, `QRCodePainter`) and widgets (`_buildActivityBox`, `_buildBulletItem`, `_buildFigureBox`).

---

## 2. Technical Specification & Design

### A. Global Chapter Opener Header
We will implement `_buildChapterOpenerHeader(String fullTitle, bool isDark)` in `LessonsView`:
- **Layout**: Row containing:
  - Left column: Flask icon (CustomPaint with `FlaskPainter`) + chapter label block.
  - Middle: Chapter title in Outfit font.
  - Right column: QR Code (CustomPaint with `QRCodePainter`) + "NCERT" subtitle.
- Triggered whenever a line starts with `# `.

### B. Activity Block Parser
In the `_parseMarkdownNotes` loop:
- Introduce state variables: `bool inActivity`, `String activityTitle`, `String activityCaution`, `List<String> activitySteps`.
- Detect `### Activity` to enter activity parsing.
- Extract caution text and numbered steps.
- Flush and render `_buildActivityBox` when another block starts or the note ends.

---

## 3. Implementation Steps

1. **Modify `apps/mobile_web_client/lib/views/lessons_view.dart`:**
   - Implement `_buildChapterOpenerHeader` to construct the layout.
   - Integrate `_buildChapterOpenerHeader` for `# ` lines.
   - Integrate Activity parser state machine in `_parseMarkdownNotes` to build `_buildActivityBox`.
   - Ensure the parser cleans up the original lines and inserts the widgets at the correct positions.

2. **Verify Code Quality:**
   - Run `cd apps/mobile_web_client && flutter analyze`.
   - Run `flutter build web` for manual build validation.

---

## 4. Verification Plan

- Verify that no unused element warnings remain for painters or widgets.
- Build the web app successfully and run the local development server to inspect the visual rendering of the chapter headers and activities.
