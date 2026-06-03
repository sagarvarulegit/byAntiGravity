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
    passing_percentage INT NOT NULL DEFAULT 60 CHECK (passing_percentage > 0 AND passing_percentage <= 100)
);

-- QUIZ QUESTIONS
CREATE TYPE question_type AS ENUM ('multiple_choice', 'true_false', 'short_answer');
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
