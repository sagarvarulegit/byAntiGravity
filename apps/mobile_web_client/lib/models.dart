// CBSE Class 10 Learning Portal Models

enum LessonType { video, note, studyGuide }

enum VideoType { mathGraph, scienceAtom, scienceCircuit, socialMap }

class Lesson {
  final String id;
  final String title;
  final LessonType type;
  final bool isFree;
  final String duration;
  final VideoType videoType;
  final String noteContent;
  final String? videoHlsUrl;

  Lesson({
    required this.id,
    required this.title,
    required this.type,
    required this.isFree,
    this.duration = "",
    this.videoType = VideoType.mathGraph,
    this.noteContent = "",
    this.videoHlsUrl,
  });
}

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

class Subject {
  final String id;
  final String name;
  final String description;
  final int chaptersCount;
  final double initialMastery;
  final List<Chapter> chapters;

  Subject({
    required this.id,
    required this.name,
    required this.description,
    required this.chaptersCount,
    required this.initialMastery,
    required this.chapters,
  });
}

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

class UserState {
  String name;
  bool isPremium;
  int streak;
  List<String> downloadedLessons; // Local cached copies
  Map<String, double> subjectMastery;
  Map<String, int> quizHighScores;
  List<double> weeklyMinutes; // Real consistency data

  UserState({
    required this.name,
    this.isPremium = false,
    this.streak = 5,
    List<String>? downloadedLessons,
    Map<String, double>? subjectMastery,
    Map<String, int>? quizHighScores,
    List<double>? weeklyMinutes,
  })  : downloadedLessons = downloadedLessons ?? [],
        subjectMastery = subjectMastery ?? {'maths': 72.0, 'science': 58.0, 'social': 81.0},
        quizHighScores = quizHighScores ?? {},
        weeklyMinutes = weeklyMinutes ?? [20.0, 45.0, 30.0, 90.0, 120.0, 70.0, 150.0];
}

class QuizAttempt {
  final String id;
  final String userId;
  final String quizId;
  final int scorePercentage;
  final bool passed;
  final DateTime attemptedAt;

  QuizAttempt({
    required this.id,
    required this.userId,
    required this.quizId,
    required this.scorePercentage,
    required this.passed,
    required this.attemptedAt,
  });

  factory QuizAttempt.fromJson(Map<String, dynamic> json) {
    return QuizAttempt(
      id: json['id'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
      quizId: json['quiz_id'] as String? ?? '',
      scorePercentage: json['score_percentage'] as int? ?? 0,
      passed: json['passed'] as bool? ?? false,
      attemptedAt: DateTime.parse(json['attempted_at'] as String? ?? DateTime.now().toIso8601String()),
    );
  }
}

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

