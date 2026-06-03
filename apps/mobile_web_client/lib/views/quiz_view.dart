import 'package:flutter/material.dart';
import '../models.dart';
import '../theme.dart';

class QuizView extends StatefulWidget {
  final UserState userState;
  final Function(int) onStreakUpdated;
  final Function(String, double) onMasteryUpdated;

  const QuizView({
    super.key,
    required this.userState,
    required this.onStreakUpdated,
    required this.onMasteryUpdated,
  });

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  final List<Quiz> _quizzes = [
    Quiz(
      id: "quiz-math-1",
      subjectId: "maths",
      title: "Algebra & Real Numbers Practice Test",
      duration: "5 mins",
      questions: [
        QuizQuestion(
          questionText: "If HCF(306, 657) = 9, what is their LCM?",
          options: ["22,338", "18,220", "24,558", "12,680"],
          correctAnswerIndex: 0,
        ),
        QuizQuestion(
          questionText: "Euclid's Division Lemma states that for positive integers a and b, there exist unique integers q and r satisfying a = bq + r. What is the range of r?",
          options: ["0 < r < b", "0 ≤ r < b", "0 < r ≤ b", "0 ≤ r ≤ b"],
          correctAnswerIndex: 1,
        ),
        QuizQuestion(
          questionText: "Which of the following is an irrational number?",
          options: ["3.1415", "22/7", "3.141414...", "√5"],
          correctAnswerIndex: 3,
        ),
        QuizQuestion(
          questionText: "If α and β are zeroes of the quadratic polynomial ax² + bx + c, then α + β equals:",
          options: ["c/a", "-b/a", "b/a", "-c/a"],
          correctAnswerIndex: 1,
        ),
        QuizQuestion(
          questionText: "The decimal expansion of 13/3125 terminates after how many decimal places?",
          options: ["3 places", "4 places", "5 places", "6 places"],
          correctAnswerIndex: 2,
        ),
      ],
    ),
    Quiz(
      id: "quiz-science-1",
      subjectId: "science",
      title: "Electricity & Circuit Theory Test",
      duration: "5 mins",
      questions: [
        QuizQuestion(
          questionText: "What is the SI unit of electric potential difference?",
          options: ["Ampere", "Ohm", "Volt", "Joule"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion(
          questionText: "How does the resistance of a wire change if its length is doubled and cross-sectional area is halved?",
          options: ["Remains the same", "Doubles", "Halves", "Quadruples (4x)"],
          correctAnswerIndex: 3,
        ),
        QuizQuestion(
          questionText: "Three resistors of 2Ω, 3Ω, and 6Ω are connected in parallel. What is their equivalent resistance?",
          options: ["1 Ω", "11 Ω", "5 Ω", "0.5 Ω"],
          correctAnswerIndex: 0,
        ),
        QuizQuestion(
          questionText: "Ohm's law states that the current flowing through a conductor is directly proportional to the potential difference, provided which factor remains constant?",
          options: ["Length", "Area of cross-section", "Temperature", "Resistance"],
          correctAnswerIndex: 2,
        ),
      ],
    ),
  ];

  Quiz? _activeQuiz;
  int _questionIndex = 0;
  int? _selectedAnswerIndex;
  List<int> _userAnswers = [];
  bool _quizFinished = false;

  void _startQuiz(Quiz quiz) {
    setState(() {
      _activeQuiz = quiz;
      _questionIndex = 0;
      _selectedAnswerIndex = null;
      _userAnswers = [];
      _quizFinished = false;
    });
  }

  void _submitAnswer() {
    if (_selectedAnswerIndex == null) return;
    _userAnswers.add(_selectedAnswerIndex!);

    setState(() {
      if (_questionIndex < _activeQuiz!.questions.length - 1) {
        _questionIndex++;
        _selectedAnswerIndex = null;
      } else {
        _quizFinished = true;
        _evaluateQuizResults();
      }
    });
  }

  void _evaluateQuizResults() {
    int correctCount = 0;
    for (int i = 0; i < _activeQuiz!.questions.length; i++) {
      if (_userAnswers[i] == _activeQuiz!.questions[i].correctAnswerIndex) {
        correctCount++;
      }
    }
    final pct = (correctCount / _activeQuiz!.questions.length) * 100;
    
    // If passed, update streaks & mastery
    if (pct >= 60) {
      widget.onStreakUpdated(widget.userState.streak + 1);
      final double currentMastery = widget.userState.subjectMastery[_activeQuiz!.subjectId] ?? 50.0;
      final double newMastery = (currentMastery + 6.0).clamp(0.0, 100.0);
      widget.onMasteryUpdated(_activeQuiz!.subjectId, newMastery);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (_activeQuiz == null) {
      return _buildQuizListScreen(isDark);
    }

    if (_quizFinished) {
      return _buildQuizResultScreen(isDark);
    }

    return _buildQuizRunningScreen(isDark);
  }

  Widget _buildQuizListScreen(bool isDark) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Icon(Icons.psychology_rounded, size: 56, color: AppColors.purple),
          const SizedBox(height: 16),
          Text(
            "CBSE Class 10 Smart Quizzes",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          const Text(
            "Test your knowledge on the chapters you've studied. Achieve >60% to gain Mastery Points and secure your daily study streak!",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 13, height: 1.4),
          ),
          const SizedBox(height: 40),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Select a Practice Quiz:",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _quizzes.length,
            itemBuilder: (context, index) {
              final quiz = _quizzes[index];
              return Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: isDark ? AppColors.borderDark : AppColors.borderLight),
                ),
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  title: Text(quiz.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text("${quiz.questions.length} Questions • ${quiz.duration} • Subject: ${quiz.subjectId.toUpperCase()}"),
                  trailing: ElevatedButton(
                    onPressed: () => _startQuiz(quiz),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.purpleLight,
                      foregroundColor: AppColors.purple,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text("Attempt"),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildQuizRunningScreen(bool isDark) {
    final question = _activeQuiz!.questions[_questionIndex];
    final progress = (_questionIndex) / _activeQuiz!.questions.length;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: isDark ? AppColors.borderDark : AppColors.borderLight),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_activeQuiz!.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.purpleLight,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          _activeQuiz!.subjectId.toUpperCase(),
                          style: const TextStyle(color: AppColors.purple, fontSize: 9, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Question ${_questionIndex + 1} of ${_activeQuiz!.questions.length}",
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      SizedBox(
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: progress,
                            backgroundColor: isDark ? Colors.white10 : Colors.black12,
                            valueColor: const AlwaysStoppedAnimation(AppColors.purple),
                            minHeight: 4,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const Divider(height: 32),
              
              // Question text
              Text(
                question.questionText,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, height: 1.4),
              ),
              const SizedBox(height: 24),
              
              // Options list
              Column(
                children: question.options.asMap().entries.map((entry) {
                  final idx = entry.key;
                  final opt = entry.value;
                  final isSelected = _selectedAnswerIndex == idx;

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _selectedAnswerIndex = idx;
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(18),
                        alignment: Alignment.centerLeft,
                        side: BorderSide(
                          color: isSelected ? AppColors.purple : (isDark ? AppColors.borderDark : AppColors.borderLight),
                          width: isSelected ? 2.0 : 1.0,
                        ),
                        backgroundColor: isSelected
                            ? (isDark ? AppColors.purpleDark.withOpacity(0.2) : AppColors.purpleLight)
                            : (isDark ? AppColors.cardDark : Colors.transparent),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text(
                        opt,
                        style: TextStyle(
                          color: isSelected
                              ? AppColors.purple
                              : (isDark ? Colors.white : AppColors.textLightPrimary),
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          fontSize: 13.5,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              
              // Action buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _activeQuiz = null;
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    ),
                    child: const Text("Exit Quiz"),
                  ),
                  ElevatedButton(
                    onPressed: _selectedAnswerIndex != null ? _submitAnswer : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.purple,
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: isDark ? Colors.white10 : Colors.black12,
                      disabledForegroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    ),
                    child: Text(_questionIndex == _activeQuiz!.questions.length - 1 ? "Finish Quiz" : "Next Question"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuizResultScreen(bool isDark) {
    int correctCount = 0;
    for (int i = 0; i < _activeQuiz!.questions.length; i++) {
      if (_userAnswers[i] == _activeQuiz!.questions[i].correctAnswerIndex) {
        correctCount++;
      }
    }
    final pct = (correctCount / _activeQuiz!.questions.length) * 100;
    final passed = pct >= 60;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.all(32.0),
          decoration: BoxDecoration(
            color: isDark ? AppColors.cardDark : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
          ),
          child: Column(
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: passed ? AppColors.greenLight : AppColors.orangeLight,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  passed ? Icons.emoji_events_rounded : Icons.info_outline_rounded,
                  color: passed ? AppColors.green : AppColors.orange,
                  size: 36,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                passed ? "Quiz Completed!" : "Attempt Finished",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'Outfit'),
              ),
              const SizedBox(height: 6),
              Text(
                passed ? "You did an amazing job, congrats!" : "Study revision notes and try again to unlock streak rewards.",
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const Divider(height: 40),
              
              // Score board
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildResultStat("SCORE", "$correctCount/${_activeQuiz!.questions.length}"),
                  _buildResultStat("ACCURACY", "${pct.toInt()}%"),
                  _buildResultStat(
                    "STATUS",
                    passed ? "PASSED" : "FAILED",
                    color: passed ? AppColors.green : AppColors.orange,
                  ),
                ],
              ),
              
              const Divider(height: 40),
              if (passed) ...[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.orangeLight,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.orange.withOpacity(0.15)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.local_fire_department_rounded, color: AppColors.orange),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "Daily study streak secured! Streak updated to ${widget.userState.streak} Days.",
                          style: const TextStyle(
                            color: AppColors.orangeDark,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
              ],
              
              // Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () => _startQuiz(_activeQuiz!),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    ),
                    child: const Text("Try Again"),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _activeQuiz = null;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.purple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    ),
                    child: const Text("Quiz Dashboard"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultStat(String label, String value, {Color? color}) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            fontFamily: 'Outfit',
            color: color ?? AppColors.purple,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
