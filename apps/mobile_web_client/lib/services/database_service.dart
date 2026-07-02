import 'package:flutter/foundation.dart';
import '../models.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

/// Interface for loading course catalog details (subjects, chapters, lessons).
abstract class DatabaseService {
  Future<List<Subject>> fetchSyllabus();
  Future<String> fetchLessonNoteContent(String lessonId);
  Future<List<Quiz>> fetchQuizzes();
  Future<void> submitQuizAttempt({required String quizId, required int scorePercentage, required bool passed});
  Future<int> fetchUserStreak();
  Future<int> recordActivityAndIncrementStreak({required String activityType, required String referenceId});
  Future<void> recordLessonCompletion({
    required String lessonId,
    int watchTimeSeconds = 0,
    int masteryScore = 100,
    bool completed = true,
  });
  Future<List<String>> fetchCompletedLessonIds();
  Future<bool> checkUserPremiumStatus();
  Future<void> createUserMockSubscription();
  Future<Map<String, QuizAttempt>> fetchQuizAttemptHistory();
  Future<int> fetchTotalStudyTime();
  Future<List<double>> fetchWeeklyActivity();
  Future<Map<String, dynamic>?> fetchLastAccessedLesson();
}

/// Supabase production database loader.
class SupabaseDatabaseService implements DatabaseService {
  final sb.SupabaseClient _client = sb.Supabase.instance.client;

  @override
  Future<List<Subject>> fetchSyllabus() async {
    // Relational select: fetch subjects, nested chapters, and nested lessons in one query.
    final List<dynamic> response = await _client
        .from('subjects')
        .select('id, name, code, description, thumbnail_url, chapters(id, title, sequence_number, description, assessment_scope, lessons(id, title, type, video_hls_url, video_duration_seconds, is_free, sequence_number))');

    return fromJsonList(response);
  }

  @override
  Future<String> fetchLessonNoteContent(String lessonId) async {
    try {
      final response = await _client
          .from('lessons')
          .select('note_content')
          .eq('id', lessonId)
          .single();
      return response['note_content'] as String? ?? '';
    } catch (e) {
      return '';
    }
  }

  @override
  Future<List<Quiz>> fetchQuizzes() async {
    // Relational select: fetch quizzes, nested quiz_questions, and their subject_id through chapters.
    final List<dynamic> response = await _client
        .from('quizzes')
        .select('id, title, chapter_id, passing_percentage, time_limit_seconds, total_marks, quiz_kind, board_code, chapters(subject_id), quiz_questions(id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme, diagram_url, parent_question_id, sub_question_sequence, expected_numerical_answer, expected_unit)');

    return response.map((quizJson) {
      final String id = quizJson['id'] as String;
      final String title = quizJson['title'] as String? ?? '';

      final chaptersJson = quizJson['chapters'] as Map<String, dynamic>?;
      final String subjectId = chaptersJson != null ? (chaptersJson['subject_id'] as String? ?? '') : '';

      final List<dynamic> questionsJson = quizJson['quiz_questions'] as List<dynamic>? ?? [];
      final List<QuizQuestion> questions = questionsJson.map((qJson) {
        return QuizQuestion.fromJson(qJson as Map<String, dynamic>);
      }).toList();

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
    }).toList();
  }

  @override
  Future<void> submitQuizAttempt({
    required String quizId,
    required int scorePercentage,
    required bool passed,
  }) async {
    final user = _client.auth.currentUser;
    if (user == null) {
      throw Exception("Authentication required to submit quiz attempts.");
    }
    await _client.from('quiz_attempts').insert({
      'user_id': user.id,
      'quiz_id': quizId,
      'score_percentage': scorePercentage,
      'passed': passed,
    });
  }

  @override
  Future<Map<String, QuizAttempt>> fetchQuizAttemptHistory() async {
    final user = _client.auth.currentUser;
    if (user == null) return {};

    try {
      final List<dynamic> response = await _client
          .from('quiz_attempts')
          .select('id, user_id, quiz_id, score_percentage, passed, attempted_at')
          .eq('user_id', user.id)
          .order('attempted_at', ascending: true);

      final Map<String, QuizAttempt> history = {};
      for (final item in response) {
        final attempt = QuizAttempt.fromJson(item as Map<String, dynamic>);
        history[attempt.quizId] = attempt;
      }
      return history;
    } catch (e) {
      debugPrint("Failed to fetch quiz attempt history: $e");
      return {};
    }
  }

  @override
  Future<int> fetchUserStreak() async {
    final user = _client.auth.currentUser;
    if (user == null) return 0;
    try {
      final response = await _client
          .from('user_streaks')
          .select('current_streak')
          .eq('user_id', user.id)
          .maybeSingle();
      if (response == null) return 0;
      return response['current_streak'] as int? ?? 0;
    } catch (e) {
      debugPrint("Failed to fetch user streak: $e");
      return 0;
    }
  }

  @override
  Future<int> recordActivityAndIncrementStreak({
    required String activityType,
    required String referenceId,
  }) async {
    final user = _client.auth.currentUser;
    if (user == null) return 0;

    try {
      // 1. Log activity in daily_activity_logs
      final todayStr = DateTime.now().toIso8601String().split('T')[0];
      await _client.from('daily_activity_logs').upsert({
        'user_id': user.id,
        'activity_date': todayStr,
        'activity_type': activityType,
        'reference_id': referenceId,
      });

      // 2. Fetch existing streak record
      final streakRecord = await _client
          .from('user_streaks')
          .select('id, current_streak, last_activity_date, longest_streak')
          .eq('user_id', user.id)
          .maybeSingle();

      int currentStreak = 0;
      int longestStreak = 0;
      String? lastActivityDateStr;
      String? streakId;

      if (streakRecord != null) {
        streakId = streakRecord['id'] as String;
        currentStreak = streakRecord['current_streak'] as int? ?? 0;
        longestStreak = streakRecord['longest_streak'] as int? ?? 0;
        lastActivityDateStr = streakRecord['last_activity_date'] as String?;
      }

      final today = DateTime.now();
      final todayDate = DateTime(today.year, today.month, today.day);

      bool increment = false;
      bool reset = false;

      if (lastActivityDateStr != null) {
        final lastActivityDate = DateTime.parse(lastActivityDateStr);
        final difference = todayDate.difference(DateTime(lastActivityDate.year, lastActivityDate.month, lastActivityDate.day)).inDays;

        if (difference == 1) {
          // Active yesterday, increment streak
          increment = true;
        } else if (difference > 1) {
          // Missed a day or more, reset streak
          reset = true;
        }
      } else {
        // First activity ever, start streak at 1
        increment = true;
      }

      if (increment) {
        currentStreak += 1;
        if (currentStreak > longestStreak) {
          longestStreak = currentStreak;
        }
      } else if (reset) {
        currentStreak = 1;
      }

      // 3. Update or Insert user_streaks
      final streakData = {
        'user_id': user.id,
        'current_streak': currentStreak,
        'longest_streak': longestStreak,
        'last_activity_date': todayStr,
        'updated_at': DateTime.now().toIso8601String(),
      };

      if (streakId != null) {
        streakData['id'] = streakId;
      }

      await _client.from('user_streaks').upsert(streakData);

      return currentStreak;
    } catch (e) {
      debugPrint("Failed to update streak: $e");
      return 0;
    }
  }

  @override
  Future<void> recordLessonCompletion({
    required String lessonId,
    int watchTimeSeconds = 0,
    int masteryScore = 100,
    bool completed = true,
  }) async {
    final user = _client.auth.currentUser;
    if (user == null) return;

    try {
      await _client.from('user_progress').upsert({
        'user_id': user.id,
        'lesson_id': lessonId,
        'completed': completed,
        'watch_time_seconds': watchTimeSeconds,
        'mastery_score': masteryScore,
        'last_accessed_at': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      debugPrint("Failed to record lesson completion: $e");
    }
  }

  @override
  Future<int> fetchTotalStudyTime() async {
    final user = _client.auth.currentUser;
    if (user == null) return 0;
    try {
      final List<dynamic> response = await _client
          .from('user_progress')
          .select('watch_time_seconds')
          .eq('user_id', user.id);
      
      int totalSeconds = 0;
      for (final item in response) {
        totalSeconds += item['watch_time_seconds'] as int? ?? 0;
      }
      return totalSeconds;
    } catch (e) {
      debugPrint("Failed to fetch total study time: $e");
      return 0;
    }
  }

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

  @override
  Future<List<String>> fetchCompletedLessonIds() async {
    final user = _client.auth.currentUser;
    if (user == null) return [];

    try {
      final List<dynamic> response = await _client
          .from('user_progress')
          .select('lesson_id')
          .eq('user_id', user.id)
          .eq('completed', true);
      return response.map((r) => r['lesson_id'] as String).toList();
    } catch (e) {
      debugPrint("Failed to fetch completed lessons: $e");
      return [];
    }
  }

  @override
  Future<bool> checkUserPremiumStatus() async {
    final user = _client.auth.currentUser;
    if (user == null) return false;

    try {
      final todayStr = DateTime.now().toIso8601String();
      final List<dynamic> response = await _client
          .from('subscriptions')
          .select('status, ends_at')
          .eq('user_id', user.id)
          .inFilter('status', ['active', 'trialing'])
          .gt('ends_at', todayStr);
      
      return response.isNotEmpty;
    } catch (e) {
      debugPrint("Failed to check subscription status: $e");
      return false;
    }
  }

  @override
  Future<void> createUserMockSubscription() async {
    final user = _client.auth.currentUser;
    if (user == null) return;

    try {
      final now = DateTime.now();
      final endsAt = now.add(const Duration(days: 365)); // 1 year pass

      await _client.from('subscriptions').insert({
        'user_id': user.id,
        'status': 'active',
        'provider': 'stripe',
        'external_subscription_id': 'mock_sub_${DateTime.now().millisecondsSinceEpoch}',
        'external_payment_id': 'mock_pay_${DateTime.now().millisecondsSinceEpoch}',
        'starts_at': now.toIso8601String(),
        'ends_at': endsAt.toIso8601String(),
      });
    } catch (e) {
      debugPrint("Failed to create mock subscription: $e");
    }
  }

  @override
  Future<List<double>> fetchWeeklyActivity() async {
    final user = _client.auth.currentUser;
    if (user == null) return [20.0, 45.0, 30.0, 90.0, 120.0, 70.0, 150.0];

    try {
      final sevenDaysAgo = DateTime.now().subtract(const Duration(days: 6));
      final sevenDaysAgoStr = DateTime(sevenDaysAgo.year, sevenDaysAgo.month, sevenDaysAgo.day).toIso8601String().split('T')[0];

      final List<dynamic> response = await _client
          .from('daily_activity_logs')
          .select('activity_date, activity_type')
          .eq('user_id', user.id)
          .gte('activity_date', sevenDaysAgoStr);

      final List<double> weeklyMinutes = List.filled(7, 0.0);
      final today = DateTime.now();
      final todayDate = DateTime(today.year, today.month, today.day);

      for (final item in response) {
        final dateStr = item['activity_date'] as String;
        final date = DateTime.parse(dateStr);
        final dateClean = DateTime(date.year, date.month, date.day);
        final difference = todayDate.difference(dateClean).inDays;

        if (difference >= 0 && difference < 7) {
          final int index = 6 - difference;
          final String type = item['activity_type'] as String? ?? '';
          
          double minutes = 10.0;
          if (type == 'watch_video') {
            minutes = 20.0;
          } else if (type == 'read_note') {
            minutes = 15.0;
          } else if (type == 'take_quiz') {
            minutes = 25.0;
          }
          
          weeklyMinutes[index] += minutes;
        }
      }
      return weeklyMinutes;
    } catch (e) {
      debugPrint("Failed to fetch weekly activity: $e");
      return [20.0, 45.0, 30.0, 90.0, 120.0, 70.0, 150.0];
    }
  }

  /// Maps Supabase PostgREST JSON response to Flutter strongly typed Models.
  static List<Subject> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((subjectJson) {
      final List<dynamic> chaptersJson = subjectJson['chapters'] as List<dynamic>? ?? [];
      
      // Map chapters
      final List<Chapter> chapters = chaptersJson.map((chapterJson) {
        final List<dynamic> lessonsJson = chapterJson['lessons'] as List<dynamic>? ?? [];
        
        // Map lessons
        final List<Lesson> lessons = lessonsJson.map((lessonJson) {
          final typeStr = lessonJson['type'] as String? ?? 'video';
          LessonType type;
          if (typeStr == 'note') {
            type = LessonType.note;
          } else if (typeStr == 'study_guide') {
            type = LessonType.studyGuide;
          } else {
            type = LessonType.video;
          }
          
          final durationSecs = lessonJson['video_duration_seconds'] as int?;
          final String durationText = durationSecs != null 
              ? _formatDuration(durationSecs) 
              : '';

          return Lesson(
            id: lessonJson['id'] as String,
            title: lessonJson['title'] as String? ?? '',
            type: type,
            isFree: lessonJson['is_free'] as bool? ?? false,
            duration: durationText,
            videoType: _mapVideoType(lessonJson['title'] as String? ?? ''),
            noteContent: lessonJson['note_content'] as String? ?? '',
            videoHlsUrl: lessonJson['video_hls_url'] as String?,
          );
        }).toList();

        // Sort lessons by sequence number
        lessons.sort((a, b) {
          final aSeq = lessonsJson.firstWhere((x) => x['id'] == a.id)['sequence_number'] as int? ?? 0;
          final bSeq = lessonsJson.firstWhere((x) => x['id'] == b.id)['sequence_number'] as int? ?? 0;
          return aSeq.compareTo(bSeq);
        });

        return Chapter(
          id: chapterJson['id'] as String? ?? '',
          title: chapterJson['title'] as String? ?? '',
          assessmentScope: chapterJson['assessment_scope'] as String?,
          lessons: lessons,
        );
      }).toList();

      // Sort chapters by sequence number
      chapters.sort((a, b) {
        final aSeq = chaptersJson.firstWhere((x) => x['title'] == a.title)['sequence_number'] as int? ?? 0;
        final bSeq = chaptersJson.firstWhere((x) => x['title'] == b.title)['sequence_number'] as int? ?? 0;
        return aSeq.compareTo(bSeq);
      });

      return Subject(
        id: subjectJson['id'] as String,
        name: subjectJson['name'] as String? ?? '',
        description: subjectJson['description'] as String? ?? '',
        chaptersCount: chapters.length,
        initialMastery: 0.0,
        chapters: chapters,
      );
    }).toList();
  }

  /// Maps lesson duration in seconds to MM:SS string.
  static String _formatDuration(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainingSeconds = seconds % 60;
    final String secPad = remainingSeconds.toString().padLeft(2, '0');
    return '$minutes:$secPad';
  }

  /// Assigns vector whiteboards diagrams based on title context keywords.
  static VideoType _mapVideoType(String title) {
    final lower = title.toLowerCase();
    if (lower.contains('combination')) {
      return VideoType.scienceCombination;
    }
    if (lower.contains('decomposition')) {
      return VideoType.scienceDecomposition;
    }
    if (lower.contains('displacement')) {
      return VideoType.scienceDisplacement;
    }
    if (lower.contains('ohm') || lower.contains('elect')) {
      return VideoType.scienceCircuit;
    }
    if (lower.contains('reaction') || lower.contains('chemical') || lower.contains('equation')) {
      return VideoType.scienceAtom;
    }
    if (lower.contains('satyagraha') || lower.contains('india') || lower.contains('movement')) {
      return VideoType.socialMap;
    }
    return VideoType.mathGraph;
  }
}
