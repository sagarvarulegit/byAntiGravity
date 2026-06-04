-- CBSE Class 10 Learning Portal Row-Level Security (RLS) Policies
-- Run this in your Supabase SQL Editor to authorize data access.

-- ===================================================
-- 1. CATALOG TABLES (Public Read Access for all)
-- ===================================================

-- Enable RLS on catalog tables (just to ensure it is on)
ALTER TABLE subjects ENABLE ROW LEVEL SECURITY;
ALTER TABLE chapters ENABLE ROW LEVEL SECURITY;
ALTER TABLE lessons ENABLE ROW LEVEL SECURITY;
ALTER TABLE quizzes ENABLE ROW LEVEL SECURITY;
ALTER TABLE quiz_questions ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if any to prevent conflicts
DROP POLICY IF EXISTS "Allow public read access" ON subjects;
DROP POLICY IF EXISTS "Allow public read access" ON chapters;
DROP POLICY IF EXISTS "Allow public read access" ON lessons;
DROP POLICY IF EXISTS "Allow public read access" ON quizzes;
DROP POLICY IF EXISTS "Allow public read access" ON quiz_questions;

-- Create policies allowing anyone (anonymous or authenticated) to read the course content
CREATE POLICY "Allow public read access" ON subjects FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON chapters FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON lessons FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON quizzes FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON quiz_questions FOR SELECT USING (true);


-- ===================================================
-- 2. USER TABLES (Self-Service Profile & Progress)
-- ===================================================

-- Enable RLS on user-specific tables
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE subscriptions ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE quiz_attempts ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_streaks ENABLE ROW LEVEL SECURITY;
ALTER TABLE daily_activity_logs ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if any
DROP POLICY IF EXISTS "Allow users to read own profile" ON users;
DROP POLICY IF EXISTS "Allow users to update own profile" ON users;
DROP POLICY IF EXISTS "Allow users to read own subscription" ON subscriptions;
DROP POLICY IF EXISTS "Allow users to read own progress" ON user_progress;
DROP POLICY IF EXISTS "Allow users to insert own progress" ON user_progress;
DROP POLICY IF EXISTS "Allow users to update own progress" ON user_progress;
DROP POLICY IF EXISTS "Allow users to read own quiz attempts" ON quiz_attempts;
DROP POLICY IF EXISTS "Allow users to insert own quiz attempts" ON quiz_attempts;
DROP POLICY IF EXISTS "Allow users to read own streaks" ON user_streaks;
DROP POLICY IF EXISTS "Allow users to insert own streaks" ON user_streaks;
DROP POLICY IF EXISTS "Allow users to update own streaks" ON user_streaks;
DROP POLICY IF EXISTS "Allow users to read own activity logs" ON daily_activity_logs;
DROP POLICY IF EXISTS "Allow users to insert own activity logs" ON daily_activity_logs;

-- Users Profile Policies
CREATE POLICY "Allow users to read own profile" ON users FOR SELECT USING (auth.uid() = id);
CREATE POLICY "Allow users to update own profile" ON users FOR UPDATE USING (auth.uid() = id);

-- Subscriptions Policies
CREATE POLICY "Allow users to read own subscription" ON subscriptions FOR SELECT USING (auth.uid() = user_id);

-- User Progress Policies
CREATE POLICY "Allow users to read own progress" ON user_progress FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Allow users to insert own progress" ON user_progress FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Allow users to update own progress" ON user_progress FOR UPDATE USING (auth.uid() = user_id);

-- Quiz Attempts Policies
CREATE POLICY "Allow users to read own quiz attempts" ON quiz_attempts FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Allow users to insert own quiz attempts" ON quiz_attempts FOR INSERT WITH CHECK (auth.uid() = user_id);

-- User Streaks Policies
CREATE POLICY "Allow users to read own streaks" ON user_streaks FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Allow users to insert own streaks" ON user_streaks FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Allow users to update own streaks" ON user_streaks FOR UPDATE USING (auth.uid() = user_id);

-- Daily Activity Logs Policies
CREATE POLICY "Allow users to read own activity logs" ON daily_activity_logs FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Allow users to insert own activity logs" ON daily_activity_logs FOR INSERT WITH CHECK (auth.uid() = user_id);
