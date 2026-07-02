---
type: Plan
title: Implementation Plan - Flutter Polish Features
description: This plan implements shimmer loading skeletons, pull-to-refresh capability, and a global error boundary for the CBSE Class 10 Learning Portal.
tags: [plan]
timestamp: 2026-06-23T19:39:52Z
---
# Implementation Plan - Flutter Polish Features

This plan implements shimmer loading skeletons, pull-to-refresh capability, and a global error boundary for the CBSE Class 10 Learning Portal.

## 1. Add Shimmer Dependency (`pubspec.yaml`)
- Add `shimmer: ^3.0.0` under dependencies in `apps/mobile_web_client/pubspec.yaml`.
- Run `flutter pub get`.

## 2. Shimmer Loading Skeletons (`lessons_view.dart`, `dashboard_view.dart`)
- **Dashboard Skeleton (`dashboard_view.dart`)**:
  - Replace the single `CircularProgressIndicator` on line 49 with a rich shimmer structure using `Shimmer.fromColors()`.
  - The skeleton should feature:
    - Large rounded rectangle for the Study Streak Banner.
    - Medium rounded rectangle for the Continue Learning Card.
    - A row of three small rounded rectangles representing the Stat Cards.
    - A grid/list of mock subject cards.
- **Lessons Skeleton (`lessons_view.dart`)**:
  - Replace the loading indicator for note content on line 738 inside `_buildTextNotesContent()` with `Shimmer.fromColors()`.
  - The skeleton should render multiple thin horizontal rectangles of variable widths representing loading text lines.

## 3. Pull-To-Refresh (`dashboard_view.dart`, `quiz_view.dart`)
- **Dashboard View (`dashboard_view.dart`)**:
  - Wrap the `SingleChildScrollView` on line 157 with a `RefreshIndicator`.
  - Implement `onRefresh` to trigger state update by recreating the `_dashboardDataFuture` with fresh database queries and awaiting it.
  - Apply `AlwaysScrollableScrollPhysics` on the `SingleChildScrollView` to ensure pull-to-refresh works even on short viewport screens.
- **Quiz View (`quiz_view.dart`)**:
  - Wrap the `SingleChildScrollView` in `_buildQuizListScreen()` (line 182) with a `RefreshIndicator`.
  - Implement `onRefresh` to trigger `_loadQuizzes()` and await `_quizzesFuture`.
  - Apply `AlwaysScrollableScrollPhysics` on the `SingleChildScrollView`.

## 4. Global Error Boundary & FutureBuilder Retry (`main.dart`, `progress_view.dart`)
- **Global Error Boundary (`main.dart`)**:
  - Override `ErrorWidget.builder` inside `main()` or via the `builder` callback in `MaterialApp`. We will override it in `main()` to define a custom error screen rendering a friendly card showing the warning icon, the error message, and applying the NCERT font and background tokens.
- **Progress View Retry Button (`progress_view.dart`)**:
  - Update `FutureBuilder` error state in `ProgressView` to display a user-friendly error card and a Retry button.
  - Implement the retry callback to re-trigger the data fetch by calling `setState(() { _dataFuture = _loadData(); });`.

## 5. Verification Plan
- Run `flutter pub get` inside `apps/mobile_web_client`.
- Run `flutter analyze` from `apps/mobile_web_client/` to check for syntax and type issues.
- Validate shimmer layouts, pull-to-refresh functionality, and retry features manually in the views.
