# Execution Plan: Schema Migrations 001–006

> **Purpose**: This document contains EXACT, copy-pasteable instructions for every step of migrations 001–006. A smaller execution agent (Gemini Flash) should be able to apply every change with **ZERO interpretation or decision-making**.
>
> **Source Plan**: [schema-migrations-for-board-papers.md](file:///home/sagarv/Projects/byAntiGravity/docs/implementation-plans/schema-migrations-for-board-papers.md)

---

## Pre-Execution Checklist

Before starting, verify:
1. You have access to the Supabase SQL Editor (or `psql` connected to the project database)
2. You can edit files at these absolute paths:
   - `/home/sagarv/Projects/byAntiGravity/db/schema.sql` (157 lines currently)
   - `/home/sagarv/Projects/byAntiGravity/apps/mobile_web_client/lib/models.dart` (135 lines currently)
   - `/home/sagarv/Projects/byAntiGravity/apps/mobile_web_client/lib/services/database_service.dart` (500 lines currently)
3. After ALL code changes, run: `cd /home/sagarv/Projects/byAntiGravity/apps/mobile_web_client && flutter analyze`

---

## Migration 001: Extend `question_type` Enum

### 001-A: Apply SQL to Live Database

> [!IMPORTANT]
> Each `ALTER TYPE ... ADD VALUE` statement MUST be run as a **separate statement** (not inside a transaction block). In the Supabase SQL Editor, paste all 20 lines together — it handles auto-commit. If using `psql`, run each line individually outside of `BEGIN/COMMIT`.

**Execute this SQL in the Supabase SQL Editor (or psql):**

```sql
ALTER TYPE question_type ADD VALUE IF NOT EXISTS 'assertion_reason';
ALTER TYPE question_type ADD VALUE IF NOT EXISTS 'short_answer_2mark';
ALTER TYPE question_type ADD VALUE IF NOT EXISTS 'short_answer_3mark';
ALTER TYPE question_type ADD VALUE IF NOT EXISTS 'long_answer_5mark';
ALTER TYPE question_type ADD VALUE IF NOT EXISTS 'case_study';
ALTER TYPE question_type ADD VALUE IF NOT EXISTS 'diagram_label';
ALTER TYPE question_type ADD VALUE IF NOT EXISTS 'map_marking';
ALTER TYPE question_type ADD VALUE IF NOT EXISTS 'source_based';
ALTER TYPE question_type ADD VALUE IF NOT EXISTS 'numerical';
ALTER TYPE question_type ADD VALUE IF NOT EXISTS 'proof';
ALTER TYPE question_type ADD VALUE IF NOT EXISTS 'give_reason';
ALTER TYPE question_type ADD VALUE IF NOT EXISTS 'long_answer';
ALTER TYPE question_type ADD VALUE IF NOT EXISTS 'letter_writing';
ALTER TYPE question_type ADD VALUE IF NOT EXISTS 'paragraph_writing';
ALTER TYPE question_type ADD VALUE IF NOT EXISTS 'grammar_fill';
ALTER TYPE question_type ADD VALUE IF NOT EXISTS 'editing_omission';
ALTER TYPE question_type ADD VALUE IF NOT EXISTS 'reading_comprehension';
ALTER TYPE question_type ADD VALUE IF NOT EXISTS 'story_completion';
ALTER TYPE question_type ADD VALUE IF NOT EXISTS 'image_interpretation';
ALTER TYPE question_type ADD VALUE IF NOT EXISTS 'extract_based';
```

**Order matters**: The 20 values above are listed in the exact order they must be added. Execute them top-to-bottom. Do NOT reorder.

**Existing enum values** (already in the database, do NOT re-add):
1. `'multiple_choice'`
2. `'true_false'`
3. `'short_answer'`

**New values being added** (in order):
4. `'assertion_reason'`
5. `'short_answer_2mark'`
6. `'short_answer_3mark'`
7. `'long_answer_5mark'`
8. `'case_study'`
9. `'diagram_label'`
10. `'map_marking'`
11. `'source_based'`
12. `'numerical'`
13. `'proof'`
14. `'give_reason'`
15. `'long_answer'`
16. `'letter_writing'`
17. `'paragraph_writing'`
18. `'grammar_fill'`
19. `'editing_omission'`
20. `'reading_comprehension'`
21. `'story_completion'`
22. `'image_interpretation'`
23. `'extract_based'`

### 001-B: Update `db/schema.sql` (Source-of-Truth DDL)

**File**: `/home/sagarv/Projects/byAntiGravity/db/schema.sql`
**Action**: REPLACE line 89
**Current line 89**:
```sql
CREATE TYPE question_type AS ENUM ('multiple_choice', 'true_false', 'short_answer');
```

**Replace with** (single line → multi-line for readability):
```sql
CREATE TYPE question_type AS ENUM (
    'multiple_choice',
    'true_false',
    'short_answer',
    'assertion_reason',
    'short_answer_2mark',
    'short_answer_3mark',
    'long_answer_5mark',
    'case_study',
    'diagram_label',
    'map_marking',
    'source_based',
    'numerical',
    'proof',
    'give_reason',
    'long_answer',
    'letter_writing',
    'paragraph_writing',
    'grammar_fill',
    'editing_omission',
    'reading_comprehension',
    'story_completion',
    'image_interpretation',
    'extract_based'
);
```

**Exact edit instruction**: Find the text `CREATE TYPE question_type AS ENUM ('multiple_choice', 'true_false', 'short_answer');` on line 89 and replace it with the multi-line version above. This will shift all subsequent line numbers down by ~23 lines.

### 001-C: Flutter Model Changes

**File**: `/home/sagarv/Projects/byAntiGravity/apps/mobile_web_client/lib/models.dart`
**Action**: INSERT new `QuestionType` enum and helper function BEFORE the existing `QuizQuestion` class.
**Insert BEFORE line 55** (the line that says `class QuizQuestion {`).

**Insert this exact Dart code between line 54 and line 55**:
```dart
/// Enum matching the PostgreSQL question_type enum.
/// Values map 1:1 to the DB enum values via [questionTypeFromString].
enum QuestionType {
  multipleChoice,
  trueFalse,
  shortAnswer,
  assertionReason,
  shortAnswer2mark,
  shortAnswer3mark,
  longAnswer5mark,
  caseStudy,
  diagramLabel,
  mapMarking,
  sourceBased,
  numerical,
  proof,
  giveReason,
  longAnswer,
  letterWriting,
  paragraphWriting,
  grammarFill,
  editingOmission,
  readingComprehension,
  storyCompletion,
  imageInterpretation,
  extractBased,
}

/// Maps DB snake_case enum values to Dart enum.
/// Falls back to [QuestionType.multipleChoice] for unknown values.
QuestionType questionTypeFromString(String value) {
  const map = {
    'multiple_choice': QuestionType.multipleChoice,
    'true_false': QuestionType.trueFalse,
    'short_answer': QuestionType.shortAnswer,
    'assertion_reason': QuestionType.assertionReason,
    'short_answer_2mark': QuestionType.shortAnswer2mark,
    'short_answer_3mark': QuestionType.shortAnswer3mark,
    'long_answer_5mark': QuestionType.longAnswer5mark,
    'case_study': QuestionType.caseStudy,
    'diagram_label': QuestionType.diagramLabel,
    'map_marking': QuestionType.mapMarking,
    'source_based': QuestionType.sourceBased,
    'numerical': QuestionType.numerical,
    'proof': QuestionType.proof,
    'give_reason': QuestionType.giveReason,
    'long_answer': QuestionType.longAnswer,
    'letter_writing': QuestionType.letterWriting,
    'paragraph_writing': QuestionType.paragraphWriting,
    'grammar_fill': QuestionType.grammarFill,
    'editing_omission': QuestionType.editingOmission,
    'reading_comprehension': QuestionType.readingComprehension,
    'story_completion': QuestionType.storyCompletion,
    'image_interpretation': QuestionType.imageInterpretation,
    'extract_based': QuestionType.extractBased,
  };
  return map[value] ?? QuestionType.multipleChoice;
}

/// Maps Dart enum back to DB snake_case string for inserts/updates.
String questionTypeToString(QuestionType type) {
  const map = {
    QuestionType.multipleChoice: 'multiple_choice',
    QuestionType.trueFalse: 'true_false',
    QuestionType.shortAnswer: 'short_answer',
    QuestionType.assertionReason: 'assertion_reason',
    QuestionType.shortAnswer2mark: 'short_answer_2mark',
    QuestionType.shortAnswer3mark: 'short_answer_3mark',
    QuestionType.longAnswer5mark: 'long_answer_5mark',
    QuestionType.caseStudy: 'case_study',
    QuestionType.diagramLabel: 'diagram_label',
    QuestionType.mapMarking: 'map_marking',
    QuestionType.sourceBased: 'source_based',
    QuestionType.numerical: 'numerical',
    QuestionType.proof: 'proof',
    QuestionType.giveReason: 'give_reason',
    QuestionType.longAnswer: 'long_answer',
    QuestionType.letterWriting: 'letter_writing',
    QuestionType.paragraphWriting: 'paragraph_writing',
    QuestionType.grammarFill: 'grammar_fill',
    QuestionType.editingOmission: 'editing_omission',
    QuestionType.readingComprehension: 'reading_comprehension',
    QuestionType.storyCompletion: 'story_completion',
    QuestionType.imageInterpretation: 'image_interpretation',
    QuestionType.extractBased: 'extract_based',
  };
  return map[type] ?? 'multiple_choice';
}

```

> [!NOTE]
> After this insertion, the `class QuizQuestion {` line will have shifted down. All subsequent line references in this plan refer to the file AFTER all prior edits in the same migration have been applied.

---

## Migration 002: Add Metadata Columns to `quiz_questions`

### 002-A: Apply SQL to Live Database

**Execute this SQL in the Supabase SQL Editor:**

```sql
-- Migration 002: Add board-paper metadata to quiz_questions
-- All columns use IF NOT EXISTS to be safely re-runnable

-- Explanation text (shown after answering)
ALTER TABLE quiz_questions
  ADD COLUMN IF NOT EXISTS explanation TEXT;

-- Difficulty tier: 'easy', 'medium', 'hard', 'basic', 'standard'
ALTER TABLE quiz_questions
  ADD COLUMN IF NOT EXISTS difficulty VARCHAR(20) DEFAULT 'medium';

-- CBSE board code: '041', '241', '086', '087', '184', '085'
ALTER TABLE quiz_questions
  ADD COLUMN IF NOT EXISTS board_code VARCHAR(10);

-- Source year: '2026-set1', '2025-sample', '2024-compartment', 'original'
ALTER TABLE quiz_questions
  ADD COLUMN IF NOT EXISTS source_year VARCHAR(30);

-- Granular topic within chapter (e.g., "Ohm's Law", "BPT Proof")
ALTER TABLE quiz_questions
  ADD COLUMN IF NOT EXISTS topic VARCHAR(200);

-- Full model answer for descriptive / non-MCQ questions
ALTER TABLE quiz_questions
  ADD COLUMN IF NOT EXISTS model_answer TEXT;

-- Step-wise marking scheme as plain text with line breaks
ALTER TABLE quiz_questions
  ADD COLUMN IF NOT EXISTS marking_scheme TEXT;

-- URL to associated diagram/image
ALTER TABLE quiz_questions
  ADD COLUMN IF NOT EXISTS diagram_url VARCHAR(500);

-- Parent question ID for case_study sub-questions (self-referential FK)
ALTER TABLE quiz_questions
  ADD COLUMN IF NOT EXISTS parent_question_id UUID REFERENCES quiz_questions(id) ON DELETE CASCADE;

-- Sequence within a case study or source-based parent
ALTER TABLE quiz_questions
  ADD COLUMN IF NOT EXISTS sub_question_sequence INT;

-- Expected numerical answer (for 'numerical' type)
ALTER TABLE quiz_questions
  ADD COLUMN IF NOT EXISTS expected_numerical_answer DECIMAL;

-- Unit for numerical answer (e.g., 'Ω', 'A', 'cm')
ALTER TABLE quiz_questions
  ADD COLUMN IF NOT EXISTS expected_unit VARCHAR(30);

-- Index for sub-question ordering within case studies
CREATE INDEX IF NOT EXISTS idx_quiz_questions_parent
  ON quiz_questions(parent_question_id);
```

**Summary of 12 new columns being added:**

| # | Column Name | Type | Default | Nullable | Notes |
|:-:|-------------|------|---------|:--------:|-------|
| 1 | `explanation` | `TEXT` | `NULL` | Yes | Shown after answering |
| 2 | `difficulty` | `VARCHAR(20)` | `'medium'` | Yes | easy/medium/hard/basic/standard |
| 3 | `board_code` | `VARCHAR(10)` | `NULL` | Yes | CBSE board code |
| 4 | `source_year` | `VARCHAR(30)` | `NULL` | Yes | Year + set identifier |
| 5 | `topic` | `VARCHAR(200)` | `NULL` | Yes | Granular topic within chapter |
| 6 | `model_answer` | `TEXT` | `NULL` | Yes | Full expected answer for descriptive Qs |
| 7 | `marking_scheme` | `TEXT` | `NULL` | Yes | Step-wise marks breakdown |
| 8 | `diagram_url` | `VARCHAR(500)` | `NULL` | Yes | Image/diagram URL |
| 9 | `parent_question_id` | `UUID` | `NULL` | Yes | FK to quiz_questions(id) ON DELETE CASCADE |
| 10 | `sub_question_sequence` | `INT` | `NULL` | Yes | Order within parent |
| 11 | `expected_numerical_answer` | `DECIMAL` | `NULL` | Yes | For numerical type |
| 12 | `expected_unit` | `VARCHAR(30)` | `NULL` | Yes | Unit string |

**1 new index:**
- `idx_quiz_questions_parent` on `quiz_questions(parent_question_id)`

### 002-B: Update `db/schema.sql` (Source-of-Truth DDL)

**File**: `/home/sagarv/Projects/byAntiGravity/db/schema.sql`

After migration 001-B was applied, the `CREATE TABLE quiz_questions` block starts at approximately line 112 (it was at line 90 before 001-B added ~23 lines for the expanded enum). The exact target: find the `CREATE TABLE quiz_questions (` block.

**Current `quiz_questions` table definition** (find these exact lines):
```sql
CREATE TABLE quiz_questions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    quiz_id UUID NOT NULL REFERENCES quizzes(id) ON DELETE CASCADE,
    question_text TEXT NOT NULL,
    type question_type NOT NULL DEFAULT 'multiple_choice',
    options JSONB, -- Array of strings e.g. ["A. Newton", "B. Einstein", "C. Galileo", "D. Bohr"]
    correct_option_index INT, -- Index for MCQs (0 to 3)
    correct_answer_text TEXT,  -- For short answer fallback
    marks INT NOT NULL DEFAULT 1
);
```

**Replace with:**
```sql
CREATE TABLE quiz_questions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    quiz_id UUID NOT NULL REFERENCES quizzes(id) ON DELETE CASCADE,
    question_text TEXT NOT NULL,
    type question_type NOT NULL DEFAULT 'multiple_choice',
    options JSONB, -- Array of strings e.g. ["A. Newton", "B. Einstein", "C. Galileo", "D. Bohr"]
    correct_option_index INT, -- Index for MCQs (0 to 3)
    correct_answer_text TEXT,  -- For short answer fallback
    marks INT NOT NULL DEFAULT 1,
    explanation TEXT,                                          -- Shown after answering
    difficulty VARCHAR(20) DEFAULT 'medium',                   -- easy/medium/hard/basic/standard
    board_code VARCHAR(10),                                    -- CBSE board code: '041', '241', etc.
    source_year VARCHAR(30),                                   -- '2026-set1', '2025-sample', 'original'
    topic VARCHAR(200),                                        -- Granular topic within chapter
    model_answer TEXT,                                         -- Full model answer for descriptive Qs
    marking_scheme TEXT,                                       -- Step-wise marks breakdown
    diagram_url VARCHAR(500),                                  -- Image/diagram URL
    parent_question_id UUID REFERENCES quiz_questions(id) ON DELETE CASCADE, -- Case study parent
    sub_question_sequence INT,                                 -- Order within parent question
    expected_numerical_answer DECIMAL,                         -- For 'numerical' type
    expected_unit VARCHAR(30)                                  -- Unit: 'ohm', 'A', 'cm', etc.
);
```

**Also add the new index.** Find the existing index block (the lines starting with `CREATE INDEX idx_`). After the last existing index line (`CREATE INDEX idx_subscriptions_user_status ...`), add:

```sql
CREATE INDEX idx_quiz_questions_parent ON quiz_questions(parent_question_id);
```

### 002-C: Flutter Model Changes — Replace `QuizQuestion` Class

**File**: `/home/sagarv/Projects/byAntiGravity/apps/mobile_web_client/lib/models.dart`

After step 001-C, the `QuestionType` enum + helper functions were inserted before the `QuizQuestion` class. Now find the **existing** `QuizQuestion` class (which currently looks like this):

```dart
class QuizQuestion {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  QuizQuestion({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });
}
```

**Replace the entire `QuizQuestion` class** (from `class QuizQuestion {` through its closing `}`) with:

```dart
class QuizQuestion {
  final String id;
  final String questionText;
  final QuestionType type;
  final int marks;

  // MCQ / Assertion-Reason fields
  final List<String> options;
  final int? correctAnswerIndex;

  // Descriptive answer fields (non-MCQ)
  final String? correctAnswerText;
  final String? modelAnswer;
  final String? markingScheme;
  final String? explanation;

  // Metadata
  final String? difficulty;      // 'easy', 'medium', 'hard', 'basic', 'standard'
  final String? boardCode;       // '041', '086', etc.
  final String? sourceYear;      // '2026-set1', 'original'
  final String? topic;           // Granular topic within chapter

  // Diagram / Image
  final String? diagramUrl;

  // Numerical answer
  final double? expectedNumericalAnswer;
  final String? expectedUnit;

  // Case study / Source-based sub-questions
  final String? parentQuestionId;
  final int? subQuestionSequence;
  final List<QuizQuestion> subQuestions;  // Populated client-side for parent questions

  QuizQuestion({
    this.id = '',
    required this.questionText,
    this.type = QuestionType.multipleChoice,
    this.marks = 1,
    this.options = const [],
    this.correctAnswerIndex,
    this.correctAnswerText,
    this.modelAnswer,
    this.markingScheme,
    this.explanation,
    this.difficulty,
    this.boardCode,
    this.sourceYear,
    this.topic,
    this.diagramUrl,
    this.expectedNumericalAnswer,
    this.expectedUnit,
    this.parentQuestionId,
    this.subQuestionSequence,
    this.subQuestions = const [],
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      id: json['id'] as String? ?? '',
      questionText: json['question_text'] as String? ?? '',
      type: questionTypeFromString(json['type'] as String? ?? 'multiple_choice'),
      marks: json['marks'] as int? ?? 1,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ?? [],
      correctAnswerIndex: json['correct_option_index'] as int?,
      correctAnswerText: json['correct_answer_text'] as String?,
      modelAnswer: json['model_answer'] as String?,
      markingScheme: json['marking_scheme'] as String?,
      explanation: json['explanation'] as String?,
      difficulty: json['difficulty'] as String?,
      boardCode: json['board_code'] as String?,
      sourceYear: json['source_year'] as String?,
      topic: json['topic'] as String?,
      diagramUrl: json['diagram_url'] as String?,
      expectedNumericalAnswer: (json['expected_numerical_answer'] as num?)?.toDouble(),
      expectedUnit: json['expected_unit'] as String?,
      parentQuestionId: json['parent_question_id'] as String?,
      subQuestionSequence: json['sub_question_sequence'] as int?,
    );
  }

  /// Whether this question type is auto-gradeable (MCQ-style)
  bool get isAutoGradeable => type == QuestionType.multipleChoice
      || type == QuestionType.trueFalse
      || type == QuestionType.assertionReason
      || type == QuestionType.grammarFill
      || type == QuestionType.editingOmission
      || type == QuestionType.readingComprehension;

  /// Whether this question requires text input
  bool get isDescriptive => type == QuestionType.shortAnswer2mark
      || type == QuestionType.shortAnswer3mark
      || type == QuestionType.longAnswer5mark
      || type == QuestionType.longAnswer
      || type == QuestionType.letterWriting
      || type == QuestionType.paragraphWriting
      || type == QuestionType.storyCompletion
      || type == QuestionType.proof
      || type == QuestionType.giveReason;

  /// Whether this question type requires image/diagram display
  bool get hasDiagram => type == QuestionType.diagramLabel
      || type == QuestionType.mapMarking
      || type == QuestionType.imageInterpretation;
}
```

> [!IMPORTANT]
> **Breaking change**: `correctAnswerIndex` changed from `final int` (required) to `final int?` (nullable optional). The `id` field was added as optional with default `''`. This preserves backward compatibility with the existing call site in `database_service.dart` line 75–79 which passes `correctAnswerIndex:` as a positional named argument — it will still compile because the value `qJson['correct_option_index'] as int? ?? 0` is an `int`, which is assignable to `int?`.

### 002-D: Update `database_service.dart` — fetchQuizzes() query + QuizQuestion construction

**File**: `/home/sagarv/Projects/byAntiGravity/apps/mobile_web_client/lib/services/database_service.dart`

#### Step 002-D-1: Update the Supabase select query to fetch new columns

Find this exact text on line 61:
```dart
        .select('id, title, chapter_id, chapters(subject_id), quiz_questions(id, question_text, type, options, correct_option_index, correct_answer_text, marks)');
```

Replace with:
```dart
        .select('id, title, chapter_id, chapters(subject_id), quiz_questions(id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme, diagram_url, parent_question_id, sub_question_sequence, expected_numerical_answer, expected_unit)');
```

#### Step 002-D-2: Update the QuizQuestion construction to use `.fromJson()`

Find this exact code block (lines 71–80):
```dart
      final List<QuizQuestion> questions = questionsJson.map((qJson) {
        final List<dynamic> optsJson = qJson['options'] as List<dynamic>? ?? [];
        final List<String> options = optsJson.map((e) => e.toString()).toList();

        return QuizQuestion(
          questionText: qJson['question_text'] as String? ?? '',
          options: options,
          correctAnswerIndex: qJson['correct_option_index'] as int? ?? 0,
        );
      }).toList();
```

Replace with:
```dart
      final List<QuizQuestion> questions = questionsJson.map((qJson) {
        return QuizQuestion.fromJson(qJson as Map<String, dynamic>);
      }).toList();
```

---

## Migration 003: Add `assessment_scope` to `chapters`

### 003-A: Apply SQL to Live Database

**Execute this SQL in the Supabase SQL Editor:**

```sql
-- Migration 003: Tag chapters by assessment scope
ALTER TABLE chapters
  ADD COLUMN IF NOT EXISTS assessment_scope VARCHAR(30) NOT NULL DEFAULT 'board_exam';

-- All existing chapters default to 'board_exam'.
-- Future chapters for activities/projects can use 'periodic_test', 'project_only', or 'internal_assessment'.
-- No CHECK constraint — values are VARCHAR to allow CBSE flexibility.
```

> [!NOTE]
> We intentionally do NOT add a CHECK constraint. The plan document specifies VARCHAR for flexibility because CBSE changes scope categories. The valid values are documented as: `'board_exam'`, `'periodic_test'`, `'project_only'`, `'internal_assessment'`.

### 003-B: Update `db/schema.sql`

**File**: `/home/sagarv/Projects/byAntiGravity/db/schema.sql`

Find the `CREATE TABLE chapters` block. Currently it looks like:
```sql
CREATE TABLE chapters (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    subject_id UUID NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
    title VARCHAR(150) NOT NULL,
    sequence_number INT NOT NULL,
    description TEXT,
    UNIQUE(subject_id, sequence_number)
);
```

Replace with:
```sql
CREATE TABLE chapters (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    subject_id UUID NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
    title VARCHAR(150) NOT NULL,
    sequence_number INT NOT NULL,
    description TEXT,
    assessment_scope VARCHAR(30) NOT NULL DEFAULT 'board_exam', -- 'board_exam', 'periodic_test', 'project_only', 'internal_assessment'
    UNIQUE(subject_id, sequence_number)
);
```

### 003-C: Flutter Model Changes — Update `Chapter` Class

**File**: `/home/sagarv/Projects/byAntiGravity/apps/mobile_web_client/lib/models.dart`

Find the existing `Chapter` class (currently lines 27–35):
```dart
class Chapter {
  final String title;
  final List<Lesson> lessons;

  Chapter({
    required this.title,
    required this.lessons,
  });
}
```

Replace with:
```dart
class Chapter {
  final String id;
  final String title;
  final String? assessmentScope;  // 'board_exam', 'periodic_test', 'project_only', 'internal_assessment'
  final List<Lesson> lessons;

  Chapter({
    this.id = '',
    required this.title,
    this.assessmentScope,
    required this.lessons,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      assessmentScope: json['assessment_scope'] as String?,
      lessons: [],  // Populated separately by the caller
    );
  }
}
```

### 003-D: Update `database_service.dart` — Chapter construction

**File**: `/home/sagarv/Projects/byAntiGravity/apps/mobile_web_client/lib/services/database_service.dart`

#### Step 003-D-1: Update the Supabase select query to include `assessment_scope`

Find this exact text on line 37:
```dart
        .select('id, name, code, description, thumbnail_url, chapters(id, title, sequence_number, description, lessons(id, title, type, video_hls_url, video_duration_seconds, is_free, sequence_number))');
```

Replace with:
```dart
        .select('id, name, code, description, thumbnail_url, chapters(id, title, sequence_number, description, assessment_scope, lessons(id, title, type, video_hls_url, video_duration_seconds, is_free, sequence_number))');
```

#### Step 003-D-2: Update the Chapter construction to pass `id` and `assessmentScope`

Find this exact code block (lines 453–456):
```dart
        return Chapter(
          title: chapterJson['title'] as String? ?? '',
          lessons: lessons,
        );
```

Replace with:
```dart
        return Chapter(
          id: chapterJson['id'] as String? ?? '',
          title: chapterJson['title'] as String? ?? '',
          assessmentScope: chapterJson['assessment_scope'] as String?,
          lessons: lessons,
        );
```

---

## Migration 004: Expand `quizzes` Table

### 004-A: Apply SQL to Live Database

**Execute this SQL in the Supabase SQL Editor:**

```sql
-- Migration 004: Add timed exam support to quizzes

-- Time limit in seconds (NULL = untimed for chapter quizzes)
ALTER TABLE quizzes
  ADD COLUMN IF NOT EXISTS time_limit_seconds INT;

-- Total marks for mock paper validation
ALTER TABLE quizzes
  ADD COLUMN IF NOT EXISTS total_marks INT;

-- Quiz kind: 'chapter_quiz' (default/existing) or 'mock_paper'
ALTER TABLE quizzes
  ADD COLUMN IF NOT EXISTS quiz_kind VARCHAR(20) NOT NULL DEFAULT 'chapter_quiz';

-- Board code for mock papers: '041', '241', '086', '087', '184', '085'
ALTER TABLE quizzes
  ADD COLUMN IF NOT EXISTS board_code VARCHAR(10);
```

**Summary of 4 new columns:**

| # | Column Name | Type | Default | Nullable |
|:-:|-------------|------|---------|:--------:|
| 1 | `time_limit_seconds` | `INT` | `NULL` | Yes |
| 2 | `total_marks` | `INT` | `NULL` | Yes |
| 3 | `quiz_kind` | `VARCHAR(20)` | `'chapter_quiz'` | No (NOT NULL) |
| 4 | `board_code` | `VARCHAR(10)` | `NULL` | Yes |

### 004-B: Update `db/schema.sql`

**File**: `/home/sagarv/Projects/byAntiGravity/db/schema.sql`

Find the `CREATE TABLE quizzes` block. Currently:
```sql
CREATE TABLE quizzes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    chapter_id UUID NOT NULL REFERENCES chapters(id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,
    passing_percentage INT NOT NULL DEFAULT 60 CHECK (passing_percentage > 0 AND passing_percentage <= 100)
);
```

Replace with:
```sql
CREATE TABLE quizzes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    chapter_id UUID NOT NULL REFERENCES chapters(id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,
    passing_percentage INT NOT NULL DEFAULT 60 CHECK (passing_percentage > 0 AND passing_percentage <= 100),
    time_limit_seconds INT,                                    -- NULL = untimed (chapter quizzes)
    total_marks INT,                                           -- Calculated or stored total
    quiz_kind VARCHAR(20) NOT NULL DEFAULT 'chapter_quiz',     -- 'chapter_quiz' or 'mock_paper'
    board_code VARCHAR(10)                                     -- CBSE board code for mock papers
);
```

### 004-C: Flutter Model Changes — Update `Quiz` Class

**File**: `/home/sagarv/Projects/byAntiGravity/apps/mobile_web_client/lib/models.dart`

Find the existing `Quiz` class (currently lines 67–81, but shifted after 001-C and 002-C edits — search for `class Quiz {`):
```dart
class Quiz {
  final String id;
  final String subjectId;
  final String title;
  final String duration;
  final List<QuizQuestion> questions;

  Quiz({
    required this.id,
    required this.subjectId,
    required this.title,
    required this.duration,
    required this.questions,
  });
}
```

Replace with:
```dart
class Quiz {
  final String id;
  final String subjectId;
  final String chapterId;
  final String title;
  final String duration;
  final int passingPercentage;
  final int? timeLimitSeconds;
  final int? totalMarks;
  final String quizKind;       // 'chapter_quiz' or 'mock_paper'
  final String? boardCode;
  final List<QuizQuestion> questions;

  Quiz({
    required this.id,
    this.subjectId = '',
    this.chapterId = '',
    required this.title,
    this.duration = '',
    this.passingPercentage = 60,
    this.timeLimitSeconds,
    this.totalMarks,
    this.quizKind = 'chapter_quiz',
    this.boardCode,
    required this.questions,
  });

  factory Quiz.fromJson(Map<String, dynamic> json, List<QuizQuestion> questions) {
    return Quiz(
      id: json['id'] as String? ?? '',
      chapterId: json['chapter_id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      passingPercentage: json['passing_percentage'] as int? ?? 60,
      timeLimitSeconds: json['time_limit_seconds'] as int?,
      totalMarks: json['total_marks'] as int?,
      quizKind: json['quiz_kind'] as String? ?? 'chapter_quiz',
      boardCode: json['board_code'] as String?,
      questions: questions,
    );
  }

  /// Formatted time limit for display
  String get formattedTimeLimit {
    if (timeLimitSeconds == null) return 'Untimed';
    final hours = timeLimitSeconds! ~/ 3600;
    final minutes = (timeLimitSeconds! % 3600) ~/ 60;
    if (hours > 0) return '${hours}h ${minutes}m';
    return '${minutes}m';
  }
}
```

### 004-D: Update `database_service.dart` — fetchQuizzes() query + Quiz construction

**File**: `/home/sagarv/Projects/byAntiGravity/apps/mobile_web_client/lib/services/database_service.dart`

#### Step 004-D-1: Update the Supabase select query to fetch new quiz columns

The select on the quizzes table (already modified in 002-D-1) currently reads (after 002-D-1):

```dart
        .select('id, title, chapter_id, chapters(subject_id), quiz_questions(id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme, diagram_url, parent_question_id, sub_question_sequence, expected_numerical_answer, expected_unit)');
```

Replace with:
```dart
        .select('id, title, chapter_id, passing_percentage, time_limit_seconds, total_marks, quiz_kind, board_code, chapters(subject_id), quiz_questions(id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme, diagram_url, parent_question_id, sub_question_sequence, expected_numerical_answer, expected_unit)');
```

#### Step 004-D-2: Update the Quiz construction block

Find this exact code block (which builds the `Quiz` object):
```dart
      return Quiz(
        id: id,
        subjectId: subjectId,
        title: title,
        duration: "${questions.length} mins",
        questions: questions,
      );
```

Replace with:
```dart
      return Quiz(
        id: id,
        subjectId: subjectId,
        chapterId: quizJson['chapter_id'] as String? ?? '',
        title: title,
        duration: "${questions.length} mins",
        passingPercentage: quizJson['passing_percentage'] as int? ?? 60,
        timeLimitSeconds: quizJson['time_limit_seconds'] as int?,
        totalMarks: quizJson['total_marks'] as int?,
        quizKind: quizJson['quiz_kind'] as String? ?? 'chapter_quiz',
        boardCode: quizJson['board_code'] as String?,
        questions: questions,
      );
```

---

## Migration 005: Insert English & Hindi Subjects

### 005-A: Apply SQL to Live Database

**Execute this SQL in the Supabase SQL Editor:**

```sql
-- Migration 005: Add English and Hindi B subjects
-- Uses deterministic UUIDs following existing pattern (a0eebc99-...-380aXX)

INSERT INTO subjects (id, name, code, description, thumbnail_url) VALUES
  (
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44',
    'English Language & Literature',
    'ENG10',
    'Reading Comprehension, Grammar, Creative Writing & Literature — Code 184',
    'https://images.unsplash.com/photo-1457369804613-52c61a468e7d?w=500&auto=format&fit=crop&q=60'
  ),
  (
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a55',
    'Hindi Course B',
    'HIN10',
    'अपठित बोध, व्यावहारिक व्याकरण, पाठ्यपुस्तक एवं रचनात्मक लेखन — Code 085',
    'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?w=500&auto=format&fit=crop&q=60'
  )
ON CONFLICT (code) DO NOTHING;
```

**UUID mapping:**
| Subject | UUID | Code |
|---------|------|------|
| English Language & Literature | `a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44` | `ENG10` |
| Hindi Course B | `a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a55` | `HIN10` |

**Existing subjects (for reference):**
| Subject | UUID | Code |
|---------|------|------|
| Mathematics | `a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11` | `MATH10` |
| Science | `a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22` | `SCI10` |
| Social Science | `a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33` | `SOC10` |

### 005-B: Update `db/seed.sql`

**File**: `/home/sagarv/Projects/byAntiGravity/db/seed.sql`

Find the existing subjects INSERT block (lines 15–18):
```sql
INSERT INTO subjects (id, name, code, description, thumbnail_url) VALUES
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Mathematics', 'MATH10', 'Algebra, Quadratic Equations, Trigonometry & Geometry.', 'https://images.unsplash.com/photo-1509228468518-180dd4864904?w=500&auto=format&fit=crop&q=60'),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'Science', 'SCI10', 'Chemical Reactions, Electricity, Light & Life Processes.', 'https://images.unsplash.com/photo-1532094349884-543bc11b234d?w=500&auto=format&fit=crop&q=60'),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Social Science', 'SOC10', 'History, Democratic Politics, Geography & Economics.', 'https://images.unsplash.com/photo-1447069387593-a5de0862481e?w=500&auto=format&fit=crop&q=60');
```

Replace with (add comma after Social Science row, append two new rows):
```sql
INSERT INTO subjects (id, name, code, description, thumbnail_url) VALUES
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Mathematics', 'MATH10', 'Algebra, Quadratic Equations, Trigonometry & Geometry.', 'https://images.unsplash.com/photo-1509228468518-180dd4864904?w=500&auto=format&fit=crop&q=60'),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'Science', 'SCI10', 'Chemical Reactions, Electricity, Light & Life Processes.', 'https://images.unsplash.com/photo-1532094349884-543bc11b234d?w=500&auto=format&fit=crop&q=60'),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Social Science', 'SOC10', 'History, Democratic Politics, Geography & Economics.', 'https://images.unsplash.com/photo-1447069387593-a5de0862481e?w=500&auto=format&fit=crop&q=60'),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'English Language & Literature', 'ENG10', 'Reading Comprehension, Grammar, Creative Writing & Literature — Code 184', 'https://images.unsplash.com/photo-1457369804613-52c61a468e7d?w=500&auto=format&fit=crop&q=60'),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a55', 'Hindi Course B', 'HIN10', 'अपठित बोध, व्यावहारिक व्याकरण, पाठ्यपुस्तक एवं रचनात्मक लेखन — Code 085', 'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?w=500&auto=format&fit=crop&q=60');
```

### 005-C: No Flutter Model Changes Required

The existing `Subject` model already handles any new subjects returned by the Supabase query. No Dart code changes are needed for this migration.

### 005-D: Update `db/schema.sql` — No Changes Required

The `schema.sql` file defines the table structure, not seed data. No changes to schema.sql for this migration.

---

## Migration 006: Create Mock Paper Tables

### 006-A: Apply SQL to Live Database

**Execute this entire SQL block in the Supabase SQL Editor in a single execution:**

```sql
-- ============================================================
-- Migration 006: Mock paper structure tables
-- ============================================================

-- 006-A1: mock_papers — A full 80-mark CBSE board exam simulation
CREATE TABLE IF NOT EXISTS mock_papers (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    subject_id UUID NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,                  -- e.g., "Mathematics Standard Mock Paper 1"
    board_code VARCHAR(10) NOT NULL,              -- '041', '241', '086', '087', '184', '085'
    total_marks INT NOT NULL DEFAULT 80,
    time_limit_seconds INT NOT NULL DEFAULT 10800, -- 3 hours = 10800s
    year VARCHAR(10),                              -- '2026', '2025-sample'
    description TEXT,
    is_published BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 006-A2: mock_paper_sections — Sections within a mock paper (Section A, B, C, D, E)
CREATE TABLE IF NOT EXISTS mock_paper_sections (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    mock_paper_id UUID NOT NULL REFERENCES mock_papers(id) ON DELETE CASCADE,
    title VARCHAR(100) NOT NULL,                   -- e.g., "Section A"
    description TEXT,                               -- e.g., "All questions are compulsory (1 mark each)"
    sequence_number INT NOT NULL,
    section_total_marks INT NOT NULL,
    has_internal_choice BOOLEAN NOT NULL DEFAULT FALSE,
    UNIQUE(mock_paper_id, sequence_number)
);

-- 006-A3: mock_paper_questions — Join table: links quiz_questions into sections
CREATE TABLE IF NOT EXISTS mock_paper_questions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    section_id UUID NOT NULL REFERENCES mock_paper_sections(id) ON DELETE CASCADE,
    question_id UUID NOT NULL REFERENCES quiz_questions(id) ON DELETE CASCADE,
    sequence_number INT NOT NULL,                   -- Question number within section
    is_choice_for UUID REFERENCES mock_paper_questions(id), -- Internal choice alternative
    UNIQUE(section_id, sequence_number, is_choice_for)
);

-- 006-A4: mock_paper_attempts — User attempts on mock papers
CREATE TABLE IF NOT EXISTS mock_paper_attempts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    mock_paper_id UUID NOT NULL REFERENCES mock_papers(id) ON DELETE CASCADE,
    total_score INT,                                -- Out of total_marks
    time_taken_seconds INT,                         -- Actual time used
    status VARCHAR(20) NOT NULL DEFAULT 'in_progress', -- 'in_progress', 'submitted', 'timed_out'
    started_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    submitted_at TIMESTAMP WITH TIME ZONE
);

-- 006-A5: mock_paper_answers — Individual answers within a mock paper attempt
CREATE TABLE IF NOT EXISTS mock_paper_answers (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    attempt_id UUID NOT NULL REFERENCES mock_paper_attempts(id) ON DELETE CASCADE,
    question_id UUID NOT NULL REFERENCES quiz_questions(id) ON DELETE CASCADE,
    selected_option_index INT,                       -- For MCQ / assertion-reason
    answer_text TEXT,                                 -- For descriptive answers
    answer_image_url VARCHAR(500),                    -- For diagram uploads
    marks_awarded INT,                               -- NULL until graded
    UNIQUE(attempt_id, question_id)
);

-- 006-A6: Performance indexes
CREATE INDEX IF NOT EXISTS idx_mock_papers_subject ON mock_papers(subject_id);
CREATE INDEX IF NOT EXISTS idx_mock_paper_sections_paper ON mock_paper_sections(mock_paper_id);
CREATE INDEX IF NOT EXISTS idx_mock_paper_questions_section ON mock_paper_questions(section_id);
CREATE INDEX IF NOT EXISTS idx_mock_paper_attempts_user ON mock_paper_attempts(user_id);
CREATE INDEX IF NOT EXISTS idx_mock_paper_answers_attempt ON mock_paper_answers(attempt_id);

-- ============================================================
-- 006-A7: RLS Policies
-- Per GEMINI.md: content tables -> SELECT for ALL; user-private -> own rows only
-- ============================================================

-- Enable RLS on all 5 tables
ALTER TABLE mock_papers ENABLE ROW LEVEL SECURITY;
ALTER TABLE mock_paper_sections ENABLE ROW LEVEL SECURITY;
ALTER TABLE mock_paper_questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE mock_paper_attempts ENABLE ROW LEVEL SECURITY;
ALTER TABLE mock_paper_answers ENABLE ROW LEVEL SECURITY;

-- Content tables: SELECT for ALL roles (anon + authenticated)
CREATE POLICY "mock_papers_select_all" ON mock_papers
    FOR SELECT USING (true);

CREATE POLICY "mock_paper_sections_select_all" ON mock_paper_sections
    FOR SELECT USING (true);

CREATE POLICY "mock_paper_questions_select_all" ON mock_paper_questions
    FOR SELECT USING (true);

-- User-private: mock_paper_attempts — own rows only
CREATE POLICY "mock_paper_attempts_select_own" ON mock_paper_attempts
    FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "mock_paper_attempts_insert_own" ON mock_paper_attempts
    FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "mock_paper_attempts_update_own" ON mock_paper_attempts
    FOR UPDATE USING (auth.uid() = user_id)
    WITH CHECK (auth.uid() = user_id);

-- User-private: mock_paper_answers — own attempts only
CREATE POLICY "mock_paper_answers_select_own" ON mock_paper_answers
    FOR SELECT USING (
        attempt_id IN (
            SELECT id FROM mock_paper_attempts WHERE user_id = auth.uid()
        )
    );

CREATE POLICY "mock_paper_answers_insert_own" ON mock_paper_answers
    FOR INSERT WITH CHECK (
        attempt_id IN (
            SELECT id FROM mock_paper_attempts WHERE user_id = auth.uid()
        )
    );

CREATE POLICY "mock_paper_answers_update_own" ON mock_paper_answers
    FOR UPDATE USING (
        attempt_id IN (
            SELECT id FROM mock_paper_attempts WHERE user_id = auth.uid()
        )
    )
    WITH CHECK (
        attempt_id IN (
            SELECT id FROM mock_paper_attempts WHERE user_id = auth.uid()
        )
    );
```

### 006-B: Update `db/schema.sql`

**File**: `/home/sagarv/Projects/byAntiGravity/db/schema.sql`

**Add the following block at the END of the file**, immediately BEFORE the `-- SUPABASE AUTH USER TRIGGER SYNC` comment block (which is the trigger function). The new tables should go after the existing indexes block and before the trigger.

Find this exact line:
```sql
-- SUPABASE AUTH USER TRIGGER SYNC
```

Insert the following block **immediately before** that line:

```sql
-- MOCK PAPER TABLES (Migration 006)
-- A mock paper represents a full 80-mark CBSE board exam simulation
CREATE TABLE mock_papers (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    subject_id UUID NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,
    board_code VARCHAR(10) NOT NULL,
    total_marks INT NOT NULL DEFAULT 80,
    time_limit_seconds INT NOT NULL DEFAULT 10800,
    year VARCHAR(10),
    description TEXT,
    is_published BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Sections within a mock paper (e.g., "Section A — MCQs")
CREATE TABLE mock_paper_sections (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    mock_paper_id UUID NOT NULL REFERENCES mock_papers(id) ON DELETE CASCADE,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    sequence_number INT NOT NULL,
    section_total_marks INT NOT NULL,
    has_internal_choice BOOLEAN NOT NULL DEFAULT FALSE,
    UNIQUE(mock_paper_id, sequence_number)
);

-- Join table: links quiz_questions into mock paper sections with ordering
CREATE TABLE mock_paper_questions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    section_id UUID NOT NULL REFERENCES mock_paper_sections(id) ON DELETE CASCADE,
    question_id UUID NOT NULL REFERENCES quiz_questions(id) ON DELETE CASCADE,
    sequence_number INT NOT NULL,
    is_choice_for UUID REFERENCES mock_paper_questions(id),
    UNIQUE(section_id, sequence_number, is_choice_for)
);

-- User attempts on mock papers
CREATE TABLE mock_paper_attempts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    mock_paper_id UUID NOT NULL REFERENCES mock_papers(id) ON DELETE CASCADE,
    total_score INT,
    time_taken_seconds INT,
    status VARCHAR(20) NOT NULL DEFAULT 'in_progress',
    started_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    submitted_at TIMESTAMP WITH TIME ZONE
);

-- Individual answers within a mock paper attempt
CREATE TABLE mock_paper_answers (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    attempt_id UUID NOT NULL REFERENCES mock_paper_attempts(id) ON DELETE CASCADE,
    question_id UUID NOT NULL REFERENCES quiz_questions(id) ON DELETE CASCADE,
    selected_option_index INT,
    answer_text TEXT,
    answer_image_url VARCHAR(500),
    marks_awarded INT,
    UNIQUE(attempt_id, question_id)
);

-- Mock paper indexes
CREATE INDEX idx_mock_papers_subject ON mock_papers(subject_id);
CREATE INDEX idx_mock_paper_sections_paper ON mock_paper_sections(mock_paper_id);
CREATE INDEX idx_mock_paper_questions_section ON mock_paper_questions(section_id);
CREATE INDEX idx_mock_paper_attempts_user ON mock_paper_attempts(user_id);
CREATE INDEX idx_mock_paper_answers_attempt ON mock_paper_answers(attempt_id);

```

### 006-C: Flutter Model Changes — Add 4 New Model Classes

**File**: `/home/sagarv/Projects/byAntiGravity/apps/mobile_web_client/lib/models.dart`

**Add the following 4 classes at the END of the file** (after the closing `}` of the last class, which is `QuizAttempt`). Append this exact Dart code:

```dart
// ============================================================
// Mock Paper Models (Migration 006)
// ============================================================

/// Represents a full CBSE mock board exam paper (e.g., 80-mark, 3-hour).
class MockPaper {
  final String id;
  final String subjectId;
  final String title;
  final String boardCode;
  final int totalMarks;
  final int timeLimitSeconds;
  final String? year;
  final String? description;
  final bool isPublished;
  final List<MockPaperSection> sections;

  MockPaper({
    required this.id,
    required this.subjectId,
    required this.title,
    required this.boardCode,
    this.totalMarks = 80,
    this.timeLimitSeconds = 10800,
    this.year,
    this.description,
    this.isPublished = false,
    this.sections = const [],
  });

  factory MockPaper.fromJson(Map<String, dynamic> json) {
    return MockPaper(
      id: json['id'] as String? ?? '',
      subjectId: json['subject_id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      boardCode: json['board_code'] as String? ?? '',
      totalMarks: json['total_marks'] as int? ?? 80,
      timeLimitSeconds: json['time_limit_seconds'] as int? ?? 10800,
      year: json['year'] as String?,
      description: json['description'] as String?,
      isPublished: json['is_published'] as bool? ?? false,
    );
  }

  /// Formatted time limit for display (e.g., "3h" or "3h 0m")
  String get formattedTime {
    final hours = timeLimitSeconds ~/ 3600;
    final minutes = (timeLimitSeconds % 3600) ~/ 60;
    return '${hours}h${minutes > 0 ? ' ${minutes}m' : ''}';
  }
}

/// A section within a mock paper (e.g., "Section A — MCQs (20 x 1 = 20 marks)").
class MockPaperSection {
  final String id;
  final String title;
  final String? description;
  final int sequenceNumber;
  final int sectionTotalMarks;
  final bool hasInternalChoice;
  final List<QuizQuestion> questions;

  MockPaperSection({
    required this.id,
    required this.title,
    this.description,
    required this.sequenceNumber,
    required this.sectionTotalMarks,
    this.hasInternalChoice = false,
    this.questions = const [],
  });

  factory MockPaperSection.fromJson(Map<String, dynamic> json) {
    return MockPaperSection(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String?,
      sequenceNumber: json['sequence_number'] as int? ?? 0,
      sectionTotalMarks: json['section_total_marks'] as int? ?? 0,
      hasInternalChoice: json['has_internal_choice'] as bool? ?? false,
    );
  }
}

/// A user's attempt at completing a full mock paper.
class MockPaperAttempt {
  final String id;
  final String userId;
  final String mockPaperId;
  final int? totalScore;
  final int? timeTakenSeconds;
  final String status;            // 'in_progress', 'submitted', 'timed_out'
  final DateTime startedAt;
  final DateTime? submittedAt;

  MockPaperAttempt({
    required this.id,
    required this.userId,
    required this.mockPaperId,
    this.totalScore,
    this.timeTakenSeconds,
    this.status = 'in_progress',
    required this.startedAt,
    this.submittedAt,
  });

  factory MockPaperAttempt.fromJson(Map<String, dynamic> json) {
    return MockPaperAttempt(
      id: json['id'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
      mockPaperId: json['mock_paper_id'] as String? ?? '',
      totalScore: json['total_score'] as int?,
      timeTakenSeconds: json['time_taken_seconds'] as int?,
      status: json['status'] as String? ?? 'in_progress',
      startedAt: DateTime.parse(json['started_at'] as String? ?? DateTime.now().toIso8601String()),
      submittedAt: json['submitted_at'] != null
          ? DateTime.parse(json['submitted_at'] as String)
          : null,
    );
  }

  /// Whether the attempt is still in progress
  bool get isActive => status == 'in_progress';

  /// Formatted score display
  String get scoreDisplay => totalScore != null ? '$totalScore' : '—';
}

/// An individual answer within a mock paper attempt.
class MockPaperAnswer {
  final String id;
  final String attemptId;
  final String questionId;
  final int? selectedOptionIndex;
  final String? answerText;
  final String? answerImageUrl;
  final int? marksAwarded;

  MockPaperAnswer({
    required this.id,
    required this.attemptId,
    required this.questionId,
    this.selectedOptionIndex,
    this.answerText,
    this.answerImageUrl,
    this.marksAwarded,
  });

  factory MockPaperAnswer.fromJson(Map<String, dynamic> json) {
    return MockPaperAnswer(
      id: json['id'] as String? ?? '',
      attemptId: json['attempt_id'] as String? ?? '',
      questionId: json['question_id'] as String? ?? '',
      selectedOptionIndex: json['selected_option_index'] as int?,
      answerText: json['answer_text'] as String?,
      answerImageUrl: json['answer_image_url'] as String?,
      marksAwarded: json['marks_awarded'] as int?,
    );
  }
}
```

### 006-D: No `database_service.dart` Changes Required

The mock paper service methods (fetch, submit, etc.) will be implemented in a future task. Migration 006 only creates the tables and Dart models. No service changes now.

---

## Post-Migration Verification

### Step V-1: Verify Flutter Compiles

Run:
```bash
cd /home/sagarv/Projects/byAntiGravity/apps/mobile_web_client && flutter analyze
```

**Expected result**: 0 errors, 0 warnings (or only pre-existing warnings unrelated to these changes).

If there are errors, check:
1. Missing commas in model constructors
2. Type mismatches on `correctAnswerIndex` (should be `int?` now, not `int`)
3. Missing import if any file references `QuestionType` without importing `models.dart`

### Step V-2: Verify SQL was Applied

Run these verification queries in the Supabase SQL Editor:

```sql
-- Verify Migration 001: Check enum values
SELECT unnest(enum_range(NULL::question_type));
-- Expected: 23 values (3 original + 20 new)

-- Verify Migration 002: Check new columns exist
SELECT column_name, data_type, column_default
FROM information_schema.columns
WHERE table_name = 'quiz_questions'
  AND column_name IN ('explanation', 'difficulty', 'board_code', 'source_year', 'topic', 'model_answer', 'marking_scheme', 'diagram_url', 'parent_question_id', 'sub_question_sequence', 'expected_numerical_answer', 'expected_unit')
ORDER BY ordinal_position;
-- Expected: 12 rows

-- Verify Migration 003: Check assessment_scope exists
SELECT column_name, data_type, column_default
FROM information_schema.columns
WHERE table_name = 'chapters' AND column_name = 'assessment_scope';
-- Expected: 1 row, VARCHAR, default 'board_exam'

-- Verify Migration 004: Check quiz columns
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'quizzes'
  AND column_name IN ('time_limit_seconds', 'total_marks', 'quiz_kind', 'board_code')
ORDER BY ordinal_position;
-- Expected: 4 rows

-- Verify Migration 005: Check subjects
SELECT id, name, code FROM subjects WHERE code IN ('ENG10', 'HIN10');
-- Expected: 2 rows

-- Verify Migration 006: Check tables exist
SELECT table_name FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_name IN ('mock_papers', 'mock_paper_sections', 'mock_paper_questions', 'mock_paper_attempts', 'mock_paper_answers')
ORDER BY table_name;
-- Expected: 5 rows
```

---

## Summary of All File Changes

| File | Migrations | Type | Action |
|------|-----------|------|--------|
| `/home/sagarv/Projects/byAntiGravity/db/schema.sql` | 001, 002, 003, 004, 006 | SQL DDL | Edit existing tables + append new tables |
| `/home/sagarv/Projects/byAntiGravity/db/seed.sql` | 005 | SQL DML | Append 2 new subject rows |
| `/home/sagarv/Projects/byAntiGravity/apps/mobile_web_client/lib/models.dart` | 001, 002, 003, 004, 006 | Dart | Add enum + modify 3 classes + add 4 new classes |
| `/home/sagarv/Projects/byAntiGravity/apps/mobile_web_client/lib/services/database_service.dart` | 002, 003, 004 | Dart | Update 2 select queries + 2 construction blocks |

### Execution Order (CRITICAL)

Execute in this exact order:
1. **001-A** → SQL: Extend enum (Supabase SQL Editor)
2. **001-B** → Edit: schema.sql line 89
3. **001-C** → Edit: models.dart — insert QuestionType enum before line 55
4. **002-A** → SQL: Add 12 metadata columns + 1 index (Supabase SQL Editor)
5. **002-B** → Edit: schema.sql — replace quiz_questions CREATE TABLE + add index
6. **002-C** → Edit: models.dart — replace QuizQuestion class
7. **002-D** → Edit: database_service.dart — 2 changes (query + construction)
8. **003-A** → SQL: Add assessment_scope column (Supabase SQL Editor)
9. **003-B** → Edit: schema.sql — replace chapters CREATE TABLE
10. **003-C** → Edit: models.dart — replace Chapter class
11. **003-D** → Edit: database_service.dart — 2 changes (query + construction)
12. **004-A** → SQL: Add 4 quiz columns (Supabase SQL Editor)
13. **004-B** → Edit: schema.sql — replace quizzes CREATE TABLE
14. **004-C** → Edit: models.dart — replace Quiz class
15. **004-D** → Edit: database_service.dart — 2 changes (query + construction)
16. **005-A** → SQL: Insert 2 subjects (Supabase SQL Editor)
17. **005-B** → Edit: seed.sql — add 2 rows to subjects INSERT
18. **006-A** → SQL: Create 5 tables + 5 indexes + 9 RLS policies (Supabase SQL Editor)
19. **006-B** → Edit: schema.sql — append mock paper tables before trigger
20. **006-C** → Edit: models.dart — append 4 new classes at end of file
21. **V-1** → Run: `flutter analyze` (must pass with 0 errors)
22. **V-2** → Run: 6 verification SQL queries (all must return expected row counts)

> [!WARNING]
> Steps labeled SQL (e.g., 001-A) must be executed against the **live Supabase database** via the SQL Editor or psql. Steps labeled Edit modify local source files. Both must be done — the SQL applies the migration live, the file edits keep the source-of-truth DDL and Dart models in sync.
