# Implementation Plan - LaTeX Math Rendering for Revision Notes

Enable rich rendering of mathematical formulas and equations written in LaTeX format ($...$ for inline and $$...$$ or 3607150...3607150 for display equations) using `flutter_math_fork`.

## 1. Add Dependency (`pubspec.yaml`)
- Add `flutter_math_fork: ^0.7.2` to the dependencies section in `apps/mobile_web_client/pubspec.yaml`.

## 2. Install Packages
- Run `flutter pub get` in `apps/mobile_web_client`.

## 3. Implement LaTeX Math Rendering Logic (`lessons_view.dart`)
- Import `package:flutter_math_fork/flutter_math.dart` in `lessons_view.dart`.
- Identify places where math is rendered (like `_parseMarkdownNotes`).
- Design a parser function that handles inline math (`$...$`) and display math (`$$...$$` or `3607150...3607150`).
- Build a widget mapping:
  - If text contains display/block math delimiters (`$$` or `3607150`), split the text. Alternating parts represent block math and normal text.
  - For normal text parts, split by inline math delimiter (`$`). Alternating parts represent inline math and regular text.
  - Regular text should still support bold (`**`) styling via `buildRichTextLine` or equivalent.
  - Return a widget structure (e.g. `Column`, `Wrap` or `RichText` with `WidgetSpan`) representing the mixed math and normal text.
  - Fallback: Non-math text will render as normal text, keeping the existing markdown/bold formatting intact.

## 4. Verification Plan
- Run `cd apps/mobile_web_client && flutter pub get`
- Run `flutter analyze` from `apps/mobile_web_client/` to verify code compiles correctly without errors.
- Validate rendering logic.
