-- CBSE 10th standard Online Learning Portal Database Schema
-- Target Database: PostgreSQL 14+

-- Enable UUID extension for secure identifiers
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- USERS TABLE
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255), -- Nullable because Supabase manages authentication/hashes internally
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- SUBSCRIPTIONS TABLE (Revenue Model)
CREATE TYPE subscription_status AS ENUM ('free_tier', 'trialing', 'active', 'past_due', 'canceled', 'expired');
CREATE TABLE subscriptions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    status subscription_status NOT NULL DEFAULT 'free_tier',
    provider VARCHAR(50) NOT NULL, -- 'razorpay', 'stripe', 'google_play', 'apple_appstore'
    external_subscription_id VARCHAR(255) UNIQUE, -- ID from payment provider
    external_payment_id VARCHAR(255),            -- Last transaction / payment ID
    starts_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ends_at TIMESTAMP WITH TIME ZONE NOT NULL, -- Expiry date (e.g. 1 year from billing)
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_dates CHECK (ends_at > starts_at)
);

-- COURSE CATALOG: SUBJECTS
CREATE TABLE subjects (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL UNIQUE, -- 'Mathematics', 'Science', etc.
    code VARCHAR(10) UNIQUE NOT NULL,  -- 'MATH10', 'SCI10'
    description TEXT,
    thumbnail_url VARCHAR(500)
);

-- COURSE CATALOG: CHAPTERS
CREATE TABLE chapters (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    subject_id UUID NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
    title VARCHAR(150) NOT NULL,
    sequence_number INT NOT NULL,
    description TEXT,
    assessment_scope VARCHAR(30) NOT NULL DEFAULT 'board_exam', -- 'board_exam', 'periodic_test', 'project_only', 'internal_assessment'
    UNIQUE(subject_id, sequence_number)
);

-- COURSE CATALOG: LESSONS (Videos and Notes)
CREATE TYPE lesson_type AS ENUM ('video', 'note');
CREATE TABLE lessons (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    chapter_id UUID NOT NULL REFERENCES chapters(id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,
    type lesson_type NOT NULL,
    video_hls_url VARCHAR(500),         -- CloudFront HLS m3u8 URL (Level 1 encrypted HLS)
    video_duration_seconds INT,         -- Track total length
    note_content TEXT,                  -- Notes text, formatted in Markdown
    is_free BOOLEAN NOT NULL DEFAULT FALSE, -- Some content free as starter
    sequence_number INT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(chapter_id, sequence_number)
);

-- USER PROGRESS & MASTERY METRICS
CREATE TABLE user_progress (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    lesson_id UUID NOT NULL REFERENCES lessons(id) ON DELETE CASCADE,
    completed BOOLEAN NOT NULL DEFAULT FALSE,
    watch_time_seconds INT DEFAULT 0,
    mastery_score INT DEFAULT 0 CHECK (mastery_score >= 0 AND mastery_score <= 100), -- Combination of watch time & quiz results
    last_accessed_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, lesson_id)
);

-- QUIZZES TABLE
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

-- QUIZ QUESTIONS
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

-- QUIZ ATTEMPTS
CREATE TABLE quiz_attempts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    quiz_id UUID NOT NULL REFERENCES quizzes(id) ON DELETE CASCADE,
    score_percentage INT NOT NULL CHECK (score_percentage >= 0 AND score_percentage <= 100),
    passed BOOLEAN NOT NULL,
    attempted_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- GAMIFICATION: USER STREAKS
CREATE TABLE user_streaks (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL UNIQUE REFERENCES users(id) ON DELETE CASCADE,
    current_streak INT NOT NULL DEFAULT 0,
    longest_streak INT NOT NULL DEFAULT 0,
    last_activity_date DATE, -- To verify if active yesterday to increment or reset streak
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- GAMIFICATION: DAILY ACTIVITY LOGS
CREATE TABLE daily_activity_logs (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    activity_date DATE NOT NULL DEFAULT CURRENT_DATE,
    activity_type VARCHAR(50) NOT NULL, -- 'watch_video', 'read_note', 'take_quiz'
    reference_id UUID,                 -- ID of the related quiz/lesson
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, activity_date, activity_type, reference_id)
);

-- INDEXES FOR PERFORMANCE
CREATE INDEX idx_user_progress_user ON user_progress(user_id);
CREATE INDEX idx_lessons_chapter ON lessons(chapter_id);
CREATE INDEX idx_quiz_attempts_user ON quiz_attempts(user_id);
CREATE INDEX idx_daily_activity_user_date ON daily_activity_logs(user_id, activity_date);
CREATE INDEX idx_subscriptions_user_status ON subscriptions(user_id, status);
CREATE INDEX idx_quiz_questions_parent ON quiz_questions(parent_question_id);

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


-- SUPABASE AUTH USER TRIGGER SYNC
-- Automatically create a user profile in public.users when a new user signs up in auth.users
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.users (id, full_name, email)
  VALUES (
    new.id,
    COALESCE(new.raw_user_meta_data->>'full_name', 'Student'),
    new.email
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE OR REPLACE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();
