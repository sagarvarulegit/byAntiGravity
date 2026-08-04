# Graph Report - C:\Sagar\Projects\CBSE\byAntiGravity  (2026-07-30)

## Corpus Check
- 113 files · ~85,106 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 974 nodes · 1189 edges · 83 communities (73 shown, 10 thin omitted)
- Extraction: 100% EXTRACTED · 0% INFERRED · 0% AMBIGUOUS · INFERRED: 4 edges (avg confidence: 0.89)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `f2ab8e14`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- Question Management
- Lesson Display
- React & Remotion Setup
- Board Exam Highlight
- User Authentication
- Flutter Development Tools
- Authentication UI
- Confetti Overlay
- Quiz Management
- File Download
- Theme Configuration
- Interactive Whiteboard
- Database Interaction
- Application State
- Authentication Service
- Mock Paper Questions & Attempts
- Quiz Questions Schema
- Video Player Widget
- Animation Controller
- Comic Recap Widget
- Jargon Parsing
- Compiler Options
- Animation Handling
- Dashboard View
- Visual Elements
- User State and Billing
- Progress View
- RLS Policies
- Puppeteer Package
- RLS SQL Data
- Cinemagraph Widget
- Voiceover Generation
- Animated SVG Stub
- Interactive Example
- Questions Section
- Render All Script
- DateTime and Frontmatter
- PDF Parsing
- Generic Data Processing
- Question Card
- Video Playback Testing
- Configuration Management
- Stateless Board Badges
- Scratch Logic
- Circuit Symbol Rendering
- Shared Theme Imports
- CBSE Exam Preparation
- Comic-Style Chapter Recap
- Animated SVG Handling
- Download Interface
- Download Stub
- Remotion Rendering
- UUID Fixing Script
- Board-Paper Readiness
- Database Refresh
- Graphify Contract
- NCERT Content Injection
- CBSE Learning Portal

## God Nodes (most connected - your core abstractions)
1. `compilerOptions` - 13 edges
2. `AppColors` - 8 edges
3. `UserState` - 7 edges
4. `DatabaseService` - 7 edges
5. `users` - 7 edges
6. `users` - 7 edges
7. `quiz_questions` - 6 edges
8. `parse_pdf()` - 6 edges
9. `quiz_questions` - 6 edges
10. `Flutter Mobile and Web Client` - 6 edges

## Surprising Connections (you probably didn't know these)
- `Programmatic Vector Whiteboards` --semantically_similar_to--> `Native SVG Animation`  [INFERRED] [semantically similar]
  UNDERSTAND.md → docs/howsvg.md
- `Firebase Hosting Live Deployment` --references--> `Flutter Mobile and Web Client`  [EXTRACTED]
  .github/workflows/firebase-hosting-merge.yml → apps/mobile_web_client/pubspec.yaml
- `Firebase Hosting Preview Deployment` --references--> `Flutter Mobile and Web Client`  [EXTRACTED]
  .github/workflows/firebase-hosting-pull-request.yml → apps/mobile_web_client/pubspec.yaml
- `Production Launch Checklist` --conceptually_related_to--> `Row Level Security Foundation`  [INFERRED]
  TODO.md → Master_TODO.md
- `Firebase Hosting Live Deployment` --implements--> `Firebase Hosting CI/CD`  [EXTRACTED]
  .github/workflows/firebase-hosting-merge.yml → docs/ARCHITECTURE.md

## Import Cycles
- 2-file cycle: `apps/video_generator/src/Root.tsx -> apps/video_generator/src/index.ts -> apps/video_generator/src/Root.tsx`

## Hyperedges (group relationships)
- **Client Backend Data Stack** — docs_architecture_flutter_client, docs_architecture_supabase_backend, docs_architecture_postgresql_database [EXTRACTED 1.00]
- **Figure Token Rendering Pattern** — apps_mobile_web_client_markdown_parser, apps_mobile_web_client_figure_tokens, docs_notes_guidelines_standard_figure_tokens [EXTRACTED 1.00]
- **MVP Security Content Launch Sequence** — master_todo_row_level_security, master_todo_content_seeding, master_todo_free_mvp_first [EXTRACTED 1.00]

## Communities (83 total, 10 thin omitted)

### Community 0 - "Question Management"
Cohesion: 0.02
Nodes (91): answerImageUrl, answerText, assessmentScope, attemptedAt, attemptId, boardCode, Chapter, chapterId (+83 more)

### Community 1 - "Lesson Display"
Cohesion: 0.02
Nodes (86): activeSubjectId, build, _buildActivityBox, _buildChapterOpenerHeader, _buildChaptersPanel, _buildComicRecapWidget, _buildDoYouKnowBox, _buildDoYouKnowBoxWithTitle (+78 more)

### Community 2 - "React & Remotion Setup"
Cohesion: 0.04
Nodes (45): dependencies, react, react-dom, remotion, @remotion/cli, @remotion/google-fonts, @remotion/tailwind-v4, @remotion/transitions (+37 more)

### Community 3 - "Board Exam Highlight"
Cohesion: 0.08
Nodes (21): ActivityScene(), BoardExamHighlight(), BoardExamHighlightProps, CombinationAnimation(), ConversationScene(), DiagramScene(), DiagramSceneProps, EquationScene() (+13 more)

### Community 4 - "User Authentication"
Cohesion: 0.05
Nodes (36): _activeNavIndex, _activeSubjectId, _authService, authUser, build, _buildSidebarItem, createState, _currentUser (+28 more)

### Community 5 - "Flutter Development Tools"
Cohesion: 0.06
Nodes (35): Flutter Recommended Lints, Explicit Figure Tokens, Lesson Markdown Parser, Flutter Mobile and Web Client, flutter_math_fork Dependency, flutter_svg Dependency, supabase_flutter Dependency, Supabase Authentication Flow (+27 more)

### Community 6 - "Authentication UI"
Cohesion: 0.07
Nodes (29): _activeTab, _animationController, authService, AuthTab, build, _buildAlertBanner, _buildBranding, _buildLabel (+21 more)

### Community 7 - "Confetti Overlay"
Cohesion: 0.07
Nodes (27): build, colorIndex, colors, ConfettiOverlay, _ConfettiOverlayState, _ConfettiParticle, _controller, createState (+19 more)

### Community 8 - "Quiz Management"
Cohesion: 0.08
Nodes (26): Quiz, _activeQuiz, build, _buildFilterChip, _buildQuizListScreen, _buildQuizResultScreen, _buildQuizRunningScreen, _buildResultStat (+18 more)

### Community 9 - "File Download"
Cohesion: 0.08
Nodes (25): anchor, blob, bytes, downloadFile, url, _AnimatedSvgKeepAlive, _AnimatedSvgKeepAliveState, build (+17 more)

### Community 10 - "Theme Configuration"
Cohesion: 0.08
Nodes (25): AppColors, AppThemes, bgDark, bgLight, blue, blueDark, blueLight, borderDark (+17 more)

### Community 11 - "Interactive Whiteboard"
Cohesion: 0.09
Nodes (22): VideoType, brightness, build, _controller, createState, didUpdateWidget, dispose, _flutterTts (+14 more)

### Community 12 - "Database Interaction"
Cohesion: 0.09
Nodes (22): checkUserPremiumStatus, _client, createUserMockSubscription, DatabaseService, fetchCompletedLessonIds, fetchLastAccessedLesson, fetchLessonNoteContent, fetchQuizAttemptHistory (+14 more)

### Community 13 - "Application State"
Cohesion: 0.15
Nodes (21): CBSEPortalApp, _CBSEPortalAppState, MainShell, _MainShellState, AuthView, _AuthViewState, BillingView, _BillingViewState (+13 more)

### Community 14 - "Authentication Service"
Cohesion: 0.11
Nodes (19): AuthService, authStateChanges, AuthUser, _client, _controller, currentUser, email, fullName (+11 more)

### Community 15 - "Mock Paper Questions & Attempts"
Cohesion: 0.23
Nodes (18): chapters, daily_activity_logs, lessons, mock_paper_answers, mock_paper_attempts, mock_paper_questions, mock_paper_sections, mock_papers (+10 more)

### Community 16 - "Quiz Questions Schema"
Cohesion: 0.23
Nodes (18): chapters, daily_activity_logs, lessons, mock_paper_answers, mock_paper_attempts, mock_paper_questions, mock_paper_sections, mock_papers (+10 more)

### Community 17 - "Video Player Widget"
Cohesion: 0.12
Nodes (17): build, _controller, createState, didUpdateWidget, dispose, _errorMessage, _formatDuration, _hasError (+9 more)

### Community 18 - "Animation Controller"
Cohesion: 0.12
Nodes (16): AnimationController, _animation, animationProgress, brightness, build, ChartPainter, _controller, createState (+8 more)

### Community 19 - "Comic Recap Widget"
Cohesion: 0.12
Nodes (16): borderColor, build, _buildAvatar, _buildPanelRow, _buildRememberThisBox, color, ComicPanel, isLeft (+8 more)

### Community 20 - "Jargon Parsing"
Cohesion: 0.12
Nodes (16): build, context, definition, example, JargonParser, lastMatchEnd, parseJargonMarkers, parseJargonMarkersWithContext (+8 more)

### Community 21 - "Compiler Options"
Cohesion: 0.12
Nodes (16): compilerOptions, esModuleInterop, forceConsistentCasingInFileNames, jsx, lib, module, moduleResolution, noEmit (+8 more)

### Community 22 - "Animation Handling"
Cohesion: 0.12
Nodes (15): Animation, _animation, brightness, build, _controller, createState, didUpdateWidget, dispose (+7 more)

### Community 23 - "Dashboard View"
Cohesion: 0.13
Nodes (15): build, _buildContinueLearningCard, _buildStatCard, createState, _dashboardDataFuture, DashboardView, _DashboardViewState, dbService (+7 more)

### Community 24 - "Visual Elements"
Cohesion: 0.12
Nodes (16): BarMagnetFieldPainter, BasicCircuitPainter, CircuitSymbolsPainter, DoubleCirculationPainter, FlaskPainter, MagnesiumBurnerPainter, NeuronPainter, OhmsLawCircuitPainter (+8 more)

### Community 25 - "User State and Billing"
Cohesion: 0.13
Nodes (14): UserState, build, _buildBenefitItem, _cardNumberController, createState, dispose, _isProcessing, onPaymentSuccessful (+6 more)

### Community 26 - "Progress View"
Cohesion: 0.14
Nodes (13): build, _buildChartLabels, _buildTopicMasteryBars, _buildTopicProgressBar, createState, _dataFuture, _dbService, initState (+5 more)

### Community 27 - "RLS Policies"
Cohesion: 0.16
Nodes (13): chapters, check_quiz_answer(), daily_activity_logs, lessons, quiz_attempts, quiz_questions, quiz_questions_safe, quizzes (+5 more)

### Community 28 - "Puppeteer Package"
Cohesion: 0.14
Nodes (13): puppeteer, author, dependencies, puppeteer, description, keywords, license, main (+5 more)

### Community 29 - "RLS SQL Data"
Cohesion: 0.16
Nodes (13): chapters, check_quiz_answer(), daily_activity_logs, lessons, quiz_attempts, quiz_questions, quiz_questions_safe, quizzes (+5 more)

### Community 30 - "Cinemagraph Widget"
Cohesion: 0.18
Nodes (11): assetPath, build, CinemagraphWidget, _CinemagraphWidgetState, _controller, createState, dispose, _initialized (+3 more)

### Community 31 - "Voiceover Generation"
Cohesion: 0.24
Nodes (11): DATA_DIR, envPath, { execSync }, fs, generateSpeechWithTimestamps(), getAudioDuration(), getSpeechTextForScene(), mockAlignments() (+3 more)

### Community 32 - "Animated SVG Stub"
Cohesion: 0.20
Nodes (8): asset, buildAnimatedSvg, main, package:flutter/material.dart, package:flutter_svg/flutter_svg.dart, package:flutter_test/flutter_test.dart, package:mobile_web_client/main.dart, package:mobile_web_client/views/auth_view.dart

### Community 33 - "Interactive Example"
Cohesion: 0.25
Nodes (8): build, createState, InteractiveExample, _InteractiveExampleState, _isExpanded, questionWidget, solutionWidget, title

### Community 34 - "Questions Section"
Cohesion: 0.25
Nodes (7): answer, build, qaPairs, question, QuestionAnswerPair, title, List

### Community 35 - "Render All Script"
Cohesion: 0.25
Nodes (7): DATA_DIR, { execSync }, files, FLUTTER_WEB_VIDEOS_DIR, fs, OUT_DIR, path

### Community 36 - "DateTime and Frontmatter"
Cohesion: 0.48
Nodes (6): DateTime, extract_title_and_description(), find_links(), main(), parse_frontmatter(), serialize_frontmatter()

### Community 37 - "PDF Parsing"
Cohesion: 0.52
Nodes (6): categorize_topic(), get_section_info(), is_hindi(), main(), parse_options(), parse_pdf()

### Community 38 - "Generic Data Processing"
Cohesion: 0.53
Nodes (5): Any, detect_feedback(), get_hash_id(), main(), parse_transcript()

### Community 39 - "Question Card"
Cohesion: 0.33
Nodes (5): answerWidget, build, QuestionCard, questionWidget, Widget

### Community 40 - "Video Playback Testing"
Cohesion: 0.47
Nodes (5): http, puppeteer, runAllTests(), testRangeRequest(), testVideoPlaybackInBrowser()

### Community 41 - "Configuration Management"
Cohesion: 0.40
Nodes (4): AppConfig, supabaseAnonKey, package:flutter/foundation.dart, static const String

### Community 42 - "Stateless Board Badges"
Cohesion: 0.40
Nodes (5): BoardBadge, ComicRecap, JargonModal, QuestionsSection, StatelessWidget

### Community 43 - "Scratch Logic"
Cohesion: 0.40
Nodes (4): line, main, match, dart:core

### Community 44 - "Circuit Symbol Rendering"
Cohesion: 0.40
Nodes (4): CircuitSymbolsPainter, isDark, paint, shouldRepaint

### Community 45 - "Shared Theme Imports"
Cohesion: 0.50
Nodes (3): build, text, ../theme.dart

### Community 46 - "CBSE Exam Preparation"
Cohesion: 0.67
Nodes (3): CBSE Board Exam Readiness, NCERT Textbook Completeness, Supabase Seed Safety

### Community 47 - "Comic-Style Chapter Recap"
Cohesion: 0.67
Nodes (3): Comic-Style Chapter Recap, Content Quality Standards, Jargon Pop-up Modal

## Knowledge Gaps
- **592 isolated node(s):** `AppConfig`, `supabaseAnonKey`, `_themeMode`, `_authService`, `_currentUser` (+587 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **10 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What connects `AppConfig`, `supabaseAnonKey`, `_themeMode` to the rest of the system?**
  _592 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Question Management` be split into smaller, more focused modules?**
  _Cohesion score 0.021739130434782608 - nodes in this community are weakly interconnected._
- **Should `Lesson Display` be split into smaller, more focused modules?**
  _Cohesion score 0.022988505747126436 - nodes in this community are weakly interconnected._
- **Should `React & Remotion Setup` be split into smaller, more focused modules?**
  _Cohesion score 0.043478260869565216 - nodes in this community are weakly interconnected._
- **Should `Board Exam Highlight` be split into smaller, more focused modules?**
  _Cohesion score 0.08139534883720931 - nodes in this community are weakly interconnected._
- **Should `User Authentication` be split into smaller, more focused modules?**
  _Cohesion score 0.05405405405405406 - nodes in this community are weakly interconnected._
- **Should `Flutter Development Tools` be split into smaller, more focused modules?**
  _Cohesion score 0.058823529411764705 - nodes in this community are weakly interconnected._