// CBSE Class 10 Learning Portal Models

enum LessonType { video, note }

enum VideoType { mathGraph, scienceAtom, scienceCircuit, socialMap }

class Lesson {
  final String id;
  final String title;
  final LessonType type;
  final bool isFree;
  final String duration;
  final VideoType videoType;

  Lesson({
    required this.id,
    required this.title,
    required this.type,
    required this.isFree,
    this.duration = "",
    this.videoType = VideoType.mathGraph,
  });
}

class Chapter {
  final String title;
  final List<Lesson> lessons;

  Chapter({
    required this.title,
    required this.lessons,
  });
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

class UserState {
  String name;
  bool isPremium;
  int streak;
  List<String> downloadedLessons; // Local cached copies
  Map<String, double> subjectMastery;
  Map<String, int> quizHighScores;

  UserState({
    required this.name,
    this.isPremium = false,
    this.streak = 5,
    List<String>? downloadedLessons,
    Map<String, double>? subjectMastery,
    Map<String, int>? quizHighScores,
  })  : downloadedLessons = downloadedLessons ?? [],
        subjectMastery = subjectMastery ?? {'maths': 72.0, 'science': 58.0, 'social': 81.0},
        quizHighScores = quizHighScores ?? {};
}
