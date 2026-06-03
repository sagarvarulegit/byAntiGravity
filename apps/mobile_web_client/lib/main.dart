import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;
import 'config.dart';
import 'models.dart';
import 'services/auth_service.dart';
import 'theme.dart';
import 'views/auth_view.dart';
import 'views/dashboard_view.dart';
import 'views/lessons_view.dart';
import 'views/quiz_view.dart';
import 'views/progress_view.dart';
import 'views/billing_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!AppConfig.useMockAuth) {
    try {
      await sb.Supabase.initialize(
        url: AppConfig.supabaseUrl,
        anonKey: AppConfig.supabaseAnonKey,
      );
    } catch (e) {
      debugPrint("Failed to initialize Supabase: $e. Falling back to offline Mock Auth.");
    }
  }

  runApp(const CBSEPortalApp());
}

class CBSEPortalApp extends StatefulWidget {
  const CBSEPortalApp({super.key});

  @override
  State<CBSEPortalApp> createState() => _CBSEPortalAppState();
}

class _CBSEPortalAppState extends State<CBSEPortalApp> {
  ThemeMode _themeMode = ThemeMode.light;
  late final AuthService _authService;
  AuthUser? _currentUser;
  bool _isInitializingAuth = true;

  @override
  void initState() {
    super.initState();
    // Initialize corresponding service based on configuration
    if (AppConfig.useMockAuth) {
      _authService = MockAuthService();
    } else {
      _authService = SupabaseAuthService();
    }

    // Subscribe to authentication state updates
    _authService.authStateChanges.listen((user) {
      setState(() {
        _currentUser = user;
        _isInitializingAuth = false;
      });
    });
  }

  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CBSE Class 10 Learning Portal',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: _themeMode,
      home: _isInitializingAuth
          ? const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.purple),
                ),
              ),
            )
          : _currentUser == null
              ? AuthView(
                  authService: _authService,
                  onAuthSuccess: (user) {
                    setState(() {
                      _currentUser = user;
                    });
                  },
                )
              : MainShell(
                  themeMode: _themeMode,
                  onThemeToggled: toggleTheme,
                  authUser: _currentUser!,
                  authService: _authService,
                  onLogout: () {
                    _authService.signOut();
                  },
                ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainShell extends StatefulWidget {
  final ThemeMode themeMode;
  final VoidCallback onThemeToggled;
  final AuthUser authUser;
  final AuthService authService;
  final VoidCallback onLogout;

  const MainShell({
    super.key,
    required this.themeMode,
    required this.onThemeToggled,
    required this.authUser,
    required this.authService,
    required this.onLogout,
  });

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _activeNavIndex = 0; // 0: Dashboard, 1: Lessons, 2: Quiz, 3: Progress, 4: Billing
  String _activeSubjectId = "maths";
  late final UserState _userState;

  @override
  void initState() {
    super.initState();
    _userState = UserState(
      name: widget.authUser.fullName,
      isPremium: widget.authUser.isPremium,
      streak: 5,
    );
  }

  final List<Subject> _subjects = [
    Subject(
      id: "maths",
      name: "Mathematics",
      description: "Algebra, Quadratic Equations, Trigonometry & Geometry.",
      chaptersCount: 15,
      initialMastery: 72.0,
      chapters: [
        Chapter(
          title: "Chapter 1: Real Numbers",
          lessons: [
            Lesson(id: "m-1-1", title: "1.1 Euclid's Division Lemma", type: LessonType.video, isFree: true, duration: "12:45", videoType: VideoType.mathGraph),
            Lesson(id: "m-1-2", title: "1.2 Fundamental Theorem of Arithmetic", type: LessonType.video, isFree: true, duration: "18:20", videoType: VideoType.mathGraph),
            Lesson(id: "m-1-3", title: "Revision Notes: Real Numbers", type: LessonType.note, isFree: true),
          ],
        ),
        Chapter(
          title: "Chapter 2: Polynomials & Equations",
          lessons: [
            Lesson(id: "m-2-1", title: "2.1 Geometrical Meaning of Zeroes", type: LessonType.video, isFree: false, duration: "22:15", videoType: VideoType.mathGraph),
            Lesson(id: "m-2-2", title: "2.2 Relationship of Coefficients", type: LessonType.video, isFree: false, duration: "15:40", videoType: VideoType.mathGraph),
          ],
        ),
      ],
    ),
    Subject(
      id: "science",
      name: "Science",
      description: "Chemical Reactions, Electricity, Light & Life Processes.",
      chaptersCount: 16,
      initialMastery: 58.0,
      chapters: [
        Chapter(
          title: "Chapter 1: Chemical Reactions",
          lessons: [
            Lesson(id: "s-1-1", title: "1.1 Writing Chemical Equations", type: LessonType.video, isFree: true, duration: "14:10", videoType: VideoType.scienceAtom),
            Lesson(id: "s-1-2", title: "1.2 Types of Chemical Reactions", type: LessonType.video, isFree: false, duration: "24:30", videoType: VideoType.scienceAtom),
          ],
        ),
        Chapter(
          title: "Chapter 12: Electricity",
          lessons: [
            Lesson(id: "s-12-1", title: "12.1 Electric Current & Potential", type: LessonType.video, isFree: true, duration: "16:50", videoType: VideoType.scienceCircuit),
            Lesson(id: "s-12-2", title: "12.2 Ohm's Law & Circuit Elements", type: LessonType.video, isFree: false, duration: "28:15", videoType: VideoType.scienceCircuit),
          ],
        ),
      ],
    ),
    Subject(
      id: "social",
      name: "Social Science",
      description: "History, Democratic Politics, Geography & Economics.",
      chaptersCount: 21,
      initialMastery: 81.0,
      chapters: [
        Chapter(
          title: "Chapter 1: Nationalism in India",
          lessons: [
            Lesson(id: "ss-1-1", title: "1.1 First World War & Satyagraha", type: LessonType.video, isFree: true, duration: "18:40", videoType: VideoType.socialMap),
            Lesson(id: "ss-1-2", title: "1.2 Differing Strands within Movement", type: LessonType.video, isFree: false, duration: "22:50", videoType: VideoType.socialMap),
          ],
        ),
      ],
    ),
  ];

  void _routeToSubject(String subjectId) {
    setState(() {
      _activeSubjectId = subjectId;
      _activeNavIndex = 1; // Direct to Lessons View
    });
  }

  void _onUpgradeSuccessful() {
    setState(() {
      _userState.isPremium = true;
    });
  }

  void _onLessonCompleted(String lessonId) {
    // Increment streak on activity
    setState(() {
      _userState.streak++;
    });
    _showActivityNotification("Activity Completed!", "Your daily streak has increased to ${_userState.streak} Days!");
  }

  void _onStreakUpdated(int newStreak) {
    setState(() {
      _userState.streak = newStreak;
    });
  }

  void _onMasteryUpdated(String subjectId, double newMastery) {
    setState(() {
      _userState.subjectMastery[subjectId] = newMastery;
    });
  }

  void _onDownloadToggled(String lessonId) {
    setState(() {
      if (_userState.downloadedLessons.contains(lessonId)) {
        _userState.downloadedLessons.remove(lessonId);
      } else {
        _userState.downloadedLessons.add(lessonId);
      }
    });
  }

  void _showActivityNotification(String title, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.bolt, color: AppColors.orange),
            const SizedBox(width: 12),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                Text(message, style: const TextStyle(fontSize: 11)),
              ],
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isWide = MediaQuery.of(context).size.width > 800;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // View components
    final List<Widget> viewsList = [
      DashboardView(
        userState: _userState,
        subjects: _subjects,
        onSubjectSelected: _routeToSubject,
        onUpgradeClicked: () => setState(() => _activeNavIndex = 4),
      ),
      LessonsView(
        userState: _userState,
        subjects: _subjects,
        activeSubjectId: _activeSubjectId,
        onSubjectChanged: (subId) => setState(() => _activeSubjectId = subId),
        onLessonCompleted: _onLessonCompleted,
        onDownloadToggled: _onDownloadToggled,
        onUpgradeClicked: () => setState(() => _activeNavIndex = 4),
      ),
      QuizView(
        userState: _userState,
        onStreakUpdated: _onStreakUpdated,
        onMasteryUpdated: _onMasteryUpdated,
      ),
      ProgressView(
        userState: _userState,
      ),
      BillingView(
        userState: _userState,
        onPaymentSuccessful: _onUpgradeSuccessful,
      ),
    ];

    final headerTitles = [
      "Welcome back, ${_userState.name}!",
      "Animated Video Lessons & Notes",
      "CBSE Board Practice Quizzes",
      "Syllabus Mastery Analytics",
      "Premium Membership Plan",
    ];
    final headerSubtitles = [
      "Stay consistent. Academic success is a daily habit.",
      "Visual geometry representations and textbook transcripts.",
      "Check your concepts and secure study streak marks.",
      "Deep summary analyses of your academic readiness.",
      "Gain full animation and offline download capabilities.",
    ];

    Widget mainScreenBody = Column(
      children: [
        // Custom Top Bar
        Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: isDark ? AppColors.cardDark : Colors.white,
            border: Border(bottom: BorderSide(color: isDark ? AppColors.borderDark : AppColors.borderLight)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      headerTitles[_activeNavIndex],
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Outfit'),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      headerSubtitles[_activeNavIndex],
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Row(
                children: [
                  // Streak Widget
                  Tooltip(
                    message: "Study daily to extend streak!",
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.orangeLight,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.local_fire_department_rounded, color: AppColors.orange, size: 16),
                          const SizedBox(width: 6),
                          Text(
                            "${_userState.streak} Days",
                            style: const TextStyle(color: AppColors.orange, fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Theme toggler
                  IconButton(
                    onPressed: widget.onThemeToggled,
                    icon: Icon(widget.themeMode == ThemeMode.light ? Icons.dark_mode_rounded : Icons.light_mode_rounded),
                    style: IconButton.styleFrom(
                      backgroundColor: isDark ? Colors.white10 : AppColors.bgLight,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  if (!isWide) ...[
                    const SizedBox(width: 12),
                    IconButton(
                      onPressed: widget.onLogout,
                      icon: const Icon(Icons.logout_rounded),
                      style: IconButton.styleFrom(
                        backgroundColor: isDark ? Colors.white10 : AppColors.bgLight,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      tooltip: "Logout",
                    ),
                  ],
                  if (!_userState.isPremium) ...[
                    const SizedBox(width: 12),
                    ElevatedButton.icon(
                      onPressed: () => setState(() => _activeNavIndex = 4),
                      icon: const Icon(Icons.star_rounded, size: 14),
                      label: const Text("Unlock Core", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.orange,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    )
                  ]
                ],
              )
            ],
          ),
        ),
        // Content Area
        Expanded(child: viewsList[_activeNavIndex]),
      ],
    );

    // Wide screen Sidebar layout vs Mobile BottomBar layout
    if (isWide) {
      return Scaffold(
        body: Row(
          children: [
            // Sidebar Navigation Menu
            Container(
              width: 250,
              color: isDark ? AppColors.cardDark : AppColors.textLightPrimary,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.purple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.school_rounded, color: Colors.white, size: 20),
                      ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CBSE Core",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            "Class 10th Portal",
                            style: TextStyle(color: Colors.white54, fontSize: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  
                  // Menu Items
                  Expanded(
                    child: Column(
                      children: [
                        _buildSidebarItem(0, Icons.dashboard_rounded, "Dashboard"),
                        _buildSidebarItem(1, Icons.play_circle_rounded, "Video Lessons"),
                        _buildSidebarItem(2, Icons.psychology_rounded, "Quizzes"),
                        _buildSidebarItem(3, Icons.analytics_rounded, "Mastery Metrics"),
                        _buildSidebarItem(4, Icons.credit_card_rounded, "Premium Plan"),
                      ],
                    ),
                  ),

                  // Bottom Profile Summary
                  const Divider(color: Colors.white10, height: 24),
                  Row(
                    children: [
                      ClipOval(
                        child: Image.network(
                          "https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=100&h=100",
                          width: 36,
                          height: 36,
                          fit: BoxFit.cover,
                          errorBuilder: (c, o, s) => const Icon(Icons.account_circle, color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _userState.name,
                              style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              _userState.isPremium ? "Premium Tier" : "Free Plan",
                              style: const TextStyle(color: Colors.white54, fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: widget.onLogout,
                        icon: const Icon(Icons.logout_rounded, color: Colors.white70, size: 18),
                        tooltip: 'Logout',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Right core views
            Expanded(child: mainScreenBody),
          ],
        ),
      );
    }

    // Default mobile view (bottom navigation bar layout)
    return Scaffold(
      body: SafeArea(child: mainScreenBody),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _activeNavIndex,
        onTap: (index) {
          setState(() {
            _activeNavIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.purple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_rounded), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.play_circle_rounded), label: 'Lessons'),
          BottomNavigationBarItem(icon: Icon(Icons.psychology_rounded), label: 'Quiz'),
          BottomNavigationBarItem(icon: Icon(Icons.analytics_rounded), label: 'Metrics'),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card_rounded), label: 'Billing'),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(int index, IconData icon, String label) {
    final bool isActive = _activeNavIndex == index;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      width: double.infinity,
      child: TextButton.icon(
        onPressed: () {
          setState(() {
            _activeNavIndex = index;
          });
        },
        icon: Icon(
          icon,
          color: isActive ? Colors.white : Colors.white30,
          size: 18,
        ),
        label: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.white60,
            fontSize: 13,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        style: TextButton.styleFrom(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(16),
          backgroundColor: isActive ? AppColors.purple : Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
