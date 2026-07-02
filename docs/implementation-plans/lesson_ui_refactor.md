---
type: Plan
title: Implementation Plan: Lesson UI/UX Refactor
description: Refactor the UI/UX of the main lesson viewer component (`apps/mobile_web_client/lib/views/lessons_view.dart`) to improve student engagement and visual...
tags: [plan]
timestamp: 2026-06-26T11:59:20Z
---
# Implementation Plan: Lesson UI/UX Refactor

## Objective
Refactor the UI/UX of the main lesson viewer component (`apps/mobile_web_client/lib/views/lessons_view.dart`) to improve student engagement and visual hierarchy based on EdTech best practices.

## Scope of Changes

### 1. Interactive Examples (Active Recall)
*   **Current State:** Examples and their solutions are parsed as plain text, leading to static, fully visible mathematical solutions.
*   **Proposed Change:**
    *   Add state management within the parsing loop (`_parseMarkdownNotes`) to detect `**Example X.Y**` and `**Solution:**` blocks.
    *   Create a new widget `_buildExampleWidget` that takes the example question and solution.
    *   Inside this widget, display the question text clearly.
    *   Wrap the solution text in a collapsible/expandable area using a Stateful widget (or `ExpansionTile`) titled "Show Solution". This leverages active recall by keeping the solution hidden by default.

### 2. Comic Style Recap (Flexbox Chat Bubbles)
*   **Current State:** The Comic Style Recap (`inComic`) is currently parsed into a `ComicRecap` widget, but the implementation in `widgets/comic_recap.dart` (which we will verify/update) likely renders plain text or basic layouts.
*   **Proposed Change:**
    *   Inspect `lib/widgets/comic_recap.dart`.
    *   Refactor the `ComicRecap` widget to use a modern chat UI layout (Flexbox-based).
    *   Alternate message bubbles left/right based on the speaker (e.g., Student vs. Revision Officer).
    *   Apply distinct background colors to distinguish speakers and add subtle rounded corners/tails to the bubbles.

### 3. Question Block Visual Segmentation
*   **Current State:** The `**❓ QUESTIONS**` section renders questions and answers as dense blocks of text.
*   **Proposed Change:**
    *   Update `_parseMarkdownNotes` to track when we are inside the `**❓ QUESTIONS**` section.
    *   Group each question (starting with a number like `**1.`) and its answer into a single data structure.
    *   Render each question-answer pair inside a new `_buildQuestionCard` widget.
    *   Apply a subtle card-based layout with a distinct background shading (e.g., `#f8f9fa` for light mode, dark equivalent for dark mode) and a soft divider line between questions.

### 4. Board Relevance Badges
*   **Current State:** No badges exist.
*   **Proposed Change:**
    *   Create a reusable `BoardBadge` widget (small, rounded pill shape with bold text like "CBSE 2023" or "Frequent Board Question").
    *   Inject this badge strategically in `_buildExampleWidget` and `_buildQuestionCard`. We can use a deterministic method (like modulo on the index or checking for specific keywords) to place these badges next to 2 or 3 examples/questions to draw attention.

### 5. Preserving Existing Functionality
*   All existing KaTeX/MathJax string parsing (`_buildMathText`, `cleanMathText`) must be preserved and utilized inside the new structural layouts.
*   Styling must gracefully adapt to both dark and light modes, adhering to the NCERT Design Tokens defined in `theme.dart`.

## Files to be Modified
1.  `apps/mobile_web_client/lib/views/lessons_view.dart` - Main parser and UI widget construction.
2.  `apps/mobile_web_client/lib/widgets/comic_recap.dart` - UI refactor for chat bubbles.

## Next Steps
Once this plan is approved, I will implement the changes incrementally and then run `flutter analyze` to ensure there are no syntax or type errors.
