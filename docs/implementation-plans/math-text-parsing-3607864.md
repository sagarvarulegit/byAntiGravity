---
type: Plan
title: Implementation Plan - LaTeX Math Rendering with 3607864 Delimiter
description: Implement rendering of mathematical formulas and equations written in LaTeX format using `flutter_math_fork`. Splitting display equations by `3607864....
tags: [plan]
timestamp: 2026-06-23T19:31:54Z
---
# Implementation Plan - LaTeX Math Rendering with 3607864 Delimiter

Implement rendering of mathematical formulas and equations written in LaTeX format using `flutter_math_fork`. Splitting display equations by `3607864...3607864` and inline equations by `$`.

## Proposed Changes

### `apps/mobile_web_client/lib/views/lessons_view.dart`
- Add import:
  ```dart
  import 'package:flutter_math_fork/flutter_math.dart';
  ```
- Build helper method `_buildMathText(String text, [TextStyle? style])` that:
  - Splits text by the delimiter `3607864`.
  - For math blocks (odd indices in display math split), render with `Math.tex()` in display mode:
    ```dart
    Math.tex(
      part,
      mathStyle: MathStyle.display,
      textStyle: style,
      onErrorFallback: (err) => Text(part, style: style),
    )
    ```
  - For non-math blocks (even indices in display math split), process for inline math `$` segments:
    - Splits segment by `$`.
    - For math blocks (odd indices in inline split), render with `Math.tex()` in inline/text mode:
      ```dart
      WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: Math.tex(
          part,
          mathStyle: MathStyle.text,
          textStyle: style,
          onErrorFallback: (err) => Text(part, style: style),
        ),
      )
      ```
    - For non-math blocks (even indices in inline split), process bold markdown `**` and return normal `TextSpan`s.
- Replace references to `buildRichTextLine` with `_buildMathText`.
- Ensure all other existing logic is untouched.

## Verification
- Run `cd apps/mobile_web_client && flutter analyze` to verify clean analysis.
