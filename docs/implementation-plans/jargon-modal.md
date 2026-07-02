---
type: Plan
title: Implementation Plan: Jargon Pop-up Modal
description: This plan describes the creation of the reusable Jargon Pop-up Modal (`jargon_modal.dart`) and the helper methods/widgets required to parse jargon mar...
tags: [plan]
timestamp: 2026-06-23T20:18:01Z
---
# Implementation Plan: Jargon Pop-up Modal

This plan describes the creation of the reusable Jargon Pop-up Modal (`jargon_modal.dart`) and the helper methods/widgets required to parse jargon markers from lessons text in the CBSE Class 10 Learning Portal.

---

## 1. Objectives

- Implement a reusable Flutter widget `JargonModal` and helper methods in [jargon_modal.dart](file:///home/sagarv/Projects/byAntiGravity/apps/mobile_web_client/lib/widgets/jargon_modal.dart).
- Provide the global function `showJargonModal(context, term, definition, example)` (and `ShowJargonModal` alias) to display the modal with custom dialog design.
- Implement the helper method `List<InlineSpan> parseJargonMarkers(BuildContext context, String text)` (and optional `List<InlineSpan> parseJargonMarkers(String text, BuildContext context)` variant) to detect `[JARGON: term | definition | example]` patterns, turning them into tappable spans.
- Adhere to the NCERT style guides: Georgia font, cream background (`#FAF9F6`) in light mode, primary magenta accent (`#BE185D`) for the term, dark mode support (theme-aware colors).
- Verify code correctness using `flutter analyze`.
- Provide a demo/usage example as a commented block at the bottom for integration in `lessons_view.dart`.

---

## 2. Technical Design & Specification

### A. Jargon Dialog (`showJargonModal` / `ShowJargonModal`)
- Use `showDialog` to display a custom `AlertDialog` containing:
  - Header: The Jargon Term (large, bold, Georgia font, magenta color `#BE185D`) and a close button `IconButton`.
  - Body: Definition text (Georgia font, regular text size 16, height 1.5, theme-colored).
  - Context Box (optional): An styled, tinted container displaying a real-world example in italics, decorated with a pink/magenta border and subtle background tint.
- Background styling:
  - Light mode: cream background `#FAF9F6` (using `Theme.of(context).scaffoldBackgroundColor`).
  - Dark mode: slate background (using `Theme.of(context).scaffoldBackgroundColor` / `Theme.of(context).cardColor`).
- Text styling:
  - Light mode: Dark primary/secondary slate.
  - Dark mode: White/light grey.
- Dismissal: Tap outside the boundary (handled by `showDialog`'s `barrierDismissible: true`) or tap the close icon.

### B. Regex Jargon Parser (`parseJargonMarkers`)
- Matches pattern: `\[JARGON:\s*([^|\]]+)\s*\|\s*([^|\]]+)\s*\|\s*([^|\]]+)\s*\]`
- Loops through matches:
  - Plain text sections before and after matches are parsed and added as `TextSpan` elements.
  - The matched jargon is wrapped in a `WidgetSpan` featuring a `GestureDetector` that calls `showJargonModal` on tap.
  - Text inside the `WidgetSpan` is styled with the NCERT Magenta `#BE185D` accent, bold weight, and a subtle dashed underline to prompt interaction.

### C. Folder Structure

```
apps/mobile_web_client/lib/
  └── widgets/
      └── jargon_modal.dart (New file containing ShowJargonModal, showJargonModal, parseJargonMarkers, and the JargonModal widget)
```

---

## 3. Implementation Steps

1. Create the new file [jargon_modal.dart](file:///home/sagarv/Projects/byAntiGravity/apps/mobile_web_client/lib/widgets/jargon_modal.dart).
2. Implement:
   - `JargonModal` stateful/stateless widget.
   - `showJargonModal` top-level function.
   - `ShowJargonModal` top-level function alias.
   - `parseJargonMarkers(String text, BuildContext context)` and `parseJargonMarkers(BuildContext context, String text)` helpers.
3. Append a commented-out usage block demonstrating integration in `lessons_view.dart`.
4. Run `flutter analyze` from `apps/mobile_web_client/`.
5. Report analytical verification results.

---

## 4. Verification Plan

- Run `flutter analyze` inside `apps/mobile_web_client` to verify syntax and type correctness.
- Ensure no warnings, errors, or lints are reported.
