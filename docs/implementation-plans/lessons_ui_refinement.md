---
type: Plan
title: Implementation Plan — Lessons UI Refinement (Sections 10 and 11)
description: Refine the UI rendering of revision notes inside `lessons_view.dart` for two key sections:
tags: [plan]
timestamp: 2026-06-24T14:21:08Z
---
# Implementation Plan — Lessons UI Refinement (Sections 10 and 11)

Refine the UI rendering of revision notes inside `lessons_view.dart` for two key sections:
1. **Section 10 (One-Minute Revision)**: Render as a custom green styled container with a border accent and header.
2. **Section 11 (Comic Recap)**: Intercept ASCII art blocks, parse Priya/Rahul dialogue lines, clean border symbols, format the "REMEMBER THIS!" callout using LaTeX, and render with the `ComicRecap` widget.

## 1. Modify `comic_recap.dart`
Update the `ComicRecap` widget signature to accept a `Widget` instead of `String` for the `rememberThis` field, allowing math-enabled rendering of the callout content.
- Path: `apps/mobile_web_client/lib/widgets/comic_recap.dart`
- Change `final String rememberThis` to `final Widget rememberThis`.
- Modify `_buildRememberThisBox(BuildContext context, String text)` to `_buildRememberThisBox(BuildContext context, Widget child)` and replace the `Text(text, ...)` widget with the passed `child`.

## 2. Implement Parsing and Helper Methods in `lessons_view.dart`
- Path: `apps/mobile_web_client/lib/views/lessons_view.dart`
- Import `import '../widgets/comic_recap.dart';`
- In `_parseMarkdownNotes`, introduce state tracking variables:
  - `bool inRevision = false;`
  - `bool inComic = false;`
  - `List<String>? revisionLines;`
  - `List<String>? comicLines;`
- During line iteration:
  - If a header line (`# ` or `## `) is encountered:
    - If `inRevision` is true, flush the revision lines to a new widget using `_buildRevisionWidget(revisionLines, isDark)` and set `inRevision = false`.
    - If `inComic` is true, flush the comic lines to a new widget using `_buildComicRecapWidget(comicLines, isDark)` and set `inComic = false`.
    - Check if the header contains `'One-Minute Revision'` or `'Comic Recap'`. If so, initialize the respective state and list, and `continue` (skip rendering the header line as-is).
  - If `inRevision` is true, append the line to `revisionLines`.
  - If `inComic` is true, append the line to `comicLines`.
- After the iteration loop:
  - Flush any remaining active section (such as the `ComicRecap` at the end of notes).

### Helper Methods:
1. **`Widget _buildRevisionWidget(List<String> lines, bool isDark)`**:
   - Parses the list of bullet/text lines.
   - Builds bullet points using a green circle indicator and `_buildMathText`.
   - Wraps the items in a styled `Container` with:
     - Rounded corners of `12`.
     - Background: `#F0FDF4` (light mode) / `#0F291B` (dark mode).
     - Left border: `3px` solid `#22C55E`.
     - Header: Row containing `🔄 Quick Revision` label.
2. **`Widget _buildComicRecapWidget(List<String> lines, bool isDark)`**:
   - Cleans each line by stripping ASCII borders (`│┌└├┤┐┘─┬┴┼────────────`).
   - Group contiguous lines for Priya and Rahul dialogue.
   - Strip quotes and speaker prefixes (e.g. `"Priya: ..."`).
   - Construct `ComicPanel` instances.
   - Extract the `rememberThis` block.
   - Call `_buildRememberThisWidget(rememberThisText, isDark)` to generate the math-enabled callout.
   - Return `ComicRecap(panels: panels, rememberThis: rememberThisWidget)`.
3. **`Widget _buildRememberThisWidget(String text, bool isDark)`**:
   - Split by line.
   - Detect if a line contains math (`*`, `×`, `/`, `=`, etc.).
   - If it has math, substitute `*` and `×` with `\times`, replace fraction formats (e.g., `-b/a` with `-\frac{b}{a}`), wrap keywords `Sum`, `Product`, `HCF`, `LCM` in `\text{...}`, and wrap in `Math.tex()`.
   - Otherwise, render as a clean standard text block.

## 3. Verification Plan
- Run `cd apps/mobile_web_client && flutter analyze` to verify the codebase compiles without errors.
- Confirm math rendering works correctly.
