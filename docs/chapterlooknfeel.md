---
type: Standard
title: Chapter Look & Feel Guidelines
description: This document outlines the standard UI/UX improvements and patterns implemented in the main lesson viewer component to improve student engagement and ...
tags: [standard]
timestamp: 2026-06-26T12:55:43Z
---
# Chapter Look & Feel Guidelines

This document outlines the standard UI/UX improvements and patterns implemented in the main lesson viewer component to improve student engagement and visual hierarchy based on EdTech best practices. These patterns should be repeated and maintained across all subject chapters.

## 1. Interactive Examples (Active Recall)
- **Concept:** Mathematical or scientific examples should not display their full solutions immediately. Hiding the solution promotes active recall and deeper understanding.
- **Implementation:** 
  - Wrap example blocks in the `InteractiveExample` widget (`lib/widgets/interactive_example.dart`).
  - This widget uses an `ExpansionTile` titled "Show Solution" to keep the solution portion hidden by default.
- **Markdown Format:** 
  - The parser expects examples to start with `**Example X.Y**` and solutions to begin with `**Solution:**`. The `_parseMarkdownNotes` function automatically handles wrapping these structures into the interactive UI.

## 2. Comic Style Recap (Flexbox Chat Bubbles)
- **Concept:** Convert plain text recap paragraphs into an engaging, modern chat UI.
- **Implementation:** 
  - Use the `ComicRecap` widget (`lib/widgets/comic_recap.dart`).
  - The UI uses responsive, alternating message bubbles with small tails. Characters have distinct background colors and tailored avatars (e.g., Student vs. Revision Officer).
- **Markdown Format:** 
  - Start the comic recap section with `### Activity: Comic Recap`.
  - The markdown parser detects dialog patterned as `[Emoji] **[Name]:** [Text]` (e.g., `👦 **Student:** Phew...`) and automatically maps them into the character-driven chat bubbles.

## 3. Question Block Visual Segmentation
- **Concept:** Visually separate dense question-and-answer lists into clear, digestible blocks to reduce cognitive load.
- **Implementation:**
  - Wrap each individual question and its answer in the `QuestionCard` widget (`lib/widgets/question_card.dart`).
  - This widget provides a subtle card-based layout with a distinct background shading (e.g., `#f8f9fa` for light mode, `#1E293B` for dark mode) and a soft visual divider line between the question and the answer.
- **Markdown Format:**
  - Start the questions section with `**❓ QUESTIONS**`.
  - Format individual questions as `**1. Question text**` and answers as `*Answer:* Answer text`. The parser will extract and wrap each pair automatically.

## 4. Board Relevance Badges
- **Concept:** Highlight important or frequently asked questions to immediately draw student attention to high-yield material.
- **Implementation:**
  - Use the reusable `BoardBadge` component (`lib/widgets/board_badge.dart`), which is a visually distinct UI Badge (small, rounded pill shape with a star icon and amber styling).
  - The badges can display text like "CBSE 2023" or "Frequent Board Question".
  - These badges are integrated seamlessly into the headers of the `InteractiveExample` and `QuestionCard` widgets to elevate priority content.
