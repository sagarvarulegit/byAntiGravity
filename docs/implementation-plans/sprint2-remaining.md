---
type: Plan
title: Implementation Plan - Sprint 2 Remaining Features
description: Implement "Continue where you left off" card on DashboardView and Subject Filtering in QuizView.
tags: [plan]
timestamp: 2026-06-23T19:34:55Z
---
# Implementation Plan - Sprint 2 Remaining Features

Implement "Continue where you left off" card on DashboardView and Subject Filtering in QuizView.

## 1. DatabaseService Changes (`database_service.dart`)
- **New Method Interface**:
  - Add `fetchLastAccessedLesson()` to the `DatabaseService` abstract class:
    ```dart
    Future<Map<String, dynamic>?> fetchLastAccessedLesson();
    ```
- **Supabase Implementation**:
  - Implement `fetchLastAccessedLesson()` in `SupabaseDatabaseService`:
    - Retrieve the single most recently accessed lesson from the `user_progress` table:
      ```dart
      @override
      Future<Map<String, dynamic>?> fetchLastAccessedLesson() async {
        final user = _client.auth.currentUser;
        if (user == null) return null;
        try {
          final List<dynamic> response = await _client
              .from('user_progress')
              .select('lesson_id, completed, watch_time_seconds, last_accessed_at')
              .eq('user_id', user.id)
              .order('last_accessed_at', ascending: false)
              .limit(1);
          if (response.isEmpty) return null;
          return response.first as Map<String, dynamic>;
        } catch (e) {
          debugPrint("Failed to fetch last accessed lesson: $e");
          return null;
        }
      }
      ```

## 2. Main Shell Routing & Instantiation Changes (`main.dart`)
- **State Fields**:
  - Add `String? _preSelectedLessonId;` to `_MainShellState` to store the lesson that needs to be pre-selected in `LessonsView`.
- **Navigation Method**:
  - Add `_routeToLesson(String subjectId, String lessonId)` to handle click action on the dashboard card:
    ```dart
    void _routeToLesson(String subjectId, String lessonId) {
      setState(() {
        _activeSubjectId = subjectId;
        _activeNavIndex = 1; // Navigation index for LessonsView
        _preSelectedLessonId = lessonId;
      });
    }
    ```
- **DashboardView Instantiation**:
  - Pass `onContinueLesson: _routeToLesson` callback to `DashboardView`.
- **LessonsView Instantiation**:
  - Pass `initialLessonId: _preSelectedLessonId` parameter to `LessonsView`.
- **QuizView Instantiation**:
  - Pass `subjects: _subjects` parameter to `QuizView`.

## 3. DashboardView Changes (`dashboard_view.dart`)
- **Callback Signature**:
  - Update `DashboardView` constructor to accept `final Function(String subjectId, String lessonId)? onContinueLesson;`.
- **Data Fetching**:
  - Update `_dashboardDataFuture` to include `widget.dbService.fetchLastAccessedLesson()` as the 4th future in the `Future.wait` batch.
- **State Integration**:
  - In `FutureBuilder`:
    - Retrieve `lastAccessedData` from `data[3] as Map<String, dynamic>?`.
    - Search through `widget.subjects` to find the matching `Lesson`, its parent `Chapter`, and its parent `Subject`.
- **UI Integration**:
  - If a matching last accessed lesson is found:
    - Display the "Continue where you left off" card between the "Streak Banner" and the "Mini Stats Grid".
    - Render a premium themed layout with details: lesson title, type icon (video/note), chapter/subject name, progress indicator (if video & partially completed), and a "Resume" / "Review" button that triggers `widget.onContinueLesson`.
    - Apply dynamic accent colors matching the subject (Magenta for Math, Blue for Science, Orange for Social Science).

## 4. LessonsView Changes (`lessons_view.dart`)
- **Constructor Change**:
  - Add `final String? initialLessonId;` to `LessonsView` class.
- **State Initialization**:
  - Implement `_loadInitialLesson()` in `_LessonsViewState` to look up `widget.initialLessonId` across all subjects/chapters. If found, call `_selectLesson(lesson)`.
  - In `initState()`, call `_loadInitialLesson()` instead of `_loadFirstLesson()`.
- **Lifecycle Integration**:
  - In `didUpdateWidget`, detect if `widget.initialLessonId` changes. If so, call `_loadInitialLesson()`.

## 5. QuizView Changes (`quiz_view.dart`)
- **Constructor Change**:
  - Update `QuizView` constructor to accept `final List<Subject> subjects;`.
- **Filtering State**:
  - Add `String _selectedSubjectFilter = "all";` state variable to `_QuizViewState`.
- **UI Integration**:
  - In `_buildQuizListScreen(bool isDark)`, add a horizontally-scrollable row of `FilterChip` items below the smart quiz header description and above the list title.
  - The chips should display "All Subjects" and names of each subject in `widget.subjects`.
  - Style each chip using its subject accent color when active.
  - Filter quizzes shown in the list based on `_selectedSubjectFilter`:
    ```dart
    final List<Quiz> quizzes = data[0] as List<Quiz>;
    final List<Quiz> filteredQuizzes = _selectedSubjectFilter == "all"
        ? quizzes
        : quizzes.where((q) => q.subjectId == _selectedSubjectFilter).toList();
    ```

## 6. Verification Plan
- Run `flutter analyze` from `apps/mobile_web_client/` to check for compilation issues or type errors.
- Validate that the continue card dynamically updates its progress as the user watches video lessons or opens lesson notes, and accurately routes back to the correct view state on click.
- Validate that subject filtering chips in the quiz list dynamically hide/show related quizzes.
