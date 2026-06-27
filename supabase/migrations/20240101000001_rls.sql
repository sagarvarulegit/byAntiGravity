-- ============================================================================
-- Row Level Security (RLS) Policies — CBSE 10th Learning Portal
-- Target: Supabase (PostgreSQL 14+)
-- Copy-paste this entire file into the Supabase SQL Editor and run it.
-- ============================================================================

-- ============================================================================
-- 1. USERS TABLE
-- Rule: Students can only read and update their own profile row.
-- ============================================================================
ALTER TABLE users ENABLE ROW LEVEL SECURITY;

-- Allow a student to read only their own profile.
CREATE POLICY "users_select_own"
  ON users FOR SELECT
  USING (auth.uid() = id);

-- Allow a student to update only their own profile (name, etc.).
CREATE POLICY "users_update_own"
  ON users FOR UPDATE
  USING (auth.uid() = id)
  WITH CHECK (auth.uid() = id);

-- INSERT is handled by the handle_new_user() SECURITY DEFINER trigger,
-- so no INSERT policy is needed for regular clients.

-- DELETE is intentionally omitted — account deletion should go through
-- a server-side admin function, not direct client access.


-- ============================================================================
-- 2. SUBJECTS TABLE
-- Rule: Any authenticated user can browse subjects (read-only catalog).
-- ============================================================================
ALTER TABLE subjects ENABLE ROW LEVEL SECURITY;

-- All logged-in users can view the full subject catalog.
CREATE POLICY "subjects_select_authenticated"
  ON subjects FOR SELECT
  USING (TRUE);


-- ============================================================================
-- 3. CHAPTERS TABLE
-- Rule: Any authenticated user can browse chapters (read-only catalog).
-- ============================================================================
ALTER TABLE chapters ENABLE ROW LEVEL SECURITY;

-- All logged-in users can view chapters within any subject.
CREATE POLICY "chapters_select_authenticated"
  ON chapters FOR SELECT
  USING (TRUE);


-- ============================================================================
-- 4. LESSONS TABLE
-- Rule: Authenticated users can see free lessons.
--       Premium (is_free = FALSE) lessons require an active subscription.
-- ============================================================================
ALTER TABLE lessons ENABLE ROW LEVEL SECURITY;

-- Free lessons are visible to every authenticated user.
-- Premium lessons are visible only if the user has an active/trialing subscription
-- whose date range covers the current moment.
CREATE POLICY "lessons_select_gated"
  ON lessons FOR SELECT
  USING (
    auth.role() = 'authenticated'
    AND (
      -- Free content is always accessible
      is_free = TRUE
      OR
      -- Premium content requires a valid, active subscription
      EXISTS (
        SELECT 1
        FROM subscriptions s
        WHERE s.user_id = auth.uid()
          AND s.status IN ('active', 'trialing')
          AND now() BETWEEN s.starts_at AND s.ends_at
      )
    )
  );


-- ============================================================================
-- 5. USER_PROGRESS TABLE
-- Rule: Students can CRUD only their own progress rows.
-- ============================================================================
ALTER TABLE user_progress ENABLE ROW LEVEL SECURITY;

-- Students can read their own progress records.
CREATE POLICY "user_progress_select_own"
  ON user_progress FOR SELECT
  USING (auth.uid() = user_id);

-- Students can insert new progress records for themselves.
CREATE POLICY "user_progress_insert_own"
  ON user_progress FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- Students can update their own progress (e.g. mark completed, update watch time).
CREATE POLICY "user_progress_update_own"
  ON user_progress FOR UPDATE
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- Students can delete their own progress entries (e.g. reset progress).
CREATE POLICY "user_progress_delete_own"
  ON user_progress FOR DELETE
  USING (auth.uid() = user_id);


-- ============================================================================
-- 6. USER_STREAKS TABLE
-- Rule: Students can CRUD only their own streak row.
-- ============================================================================
ALTER TABLE user_streaks ENABLE ROW LEVEL SECURITY;

-- Read own streak data.
CREATE POLICY "user_streaks_select_own"
  ON user_streaks FOR SELECT
  USING (auth.uid() = user_id);

-- Create initial streak row for self.
CREATE POLICY "user_streaks_insert_own"
  ON user_streaks FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- Update own streak counters (e.g. after daily check-in).
CREATE POLICY "user_streaks_update_own"
  ON user_streaks FOR UPDATE
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- Delete own streak record.
CREATE POLICY "user_streaks_delete_own"
  ON user_streaks FOR DELETE
  USING (auth.uid() = user_id);


-- ============================================================================
-- 7. QUIZ_ATTEMPTS TABLE
-- Rule: Students can CRUD only their own quiz attempt records.
-- ============================================================================
ALTER TABLE quiz_attempts ENABLE ROW LEVEL SECURITY;

-- Read own past quiz attempts and scores.
CREATE POLICY "quiz_attempts_select_own"
  ON quiz_attempts FOR SELECT
  USING (auth.uid() = user_id);

-- Submit a new quiz attempt for self.
CREATE POLICY "quiz_attempts_insert_own"
  ON quiz_attempts FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- Update own attempt (e.g. if the grading is done async).
CREATE POLICY "quiz_attempts_update_own"
  ON quiz_attempts FOR UPDATE
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- Delete own attempt records.
CREATE POLICY "quiz_attempts_delete_own"
  ON quiz_attempts FOR DELETE
  USING (auth.uid() = user_id);


-- ============================================================================
-- 8. DAILY_ACTIVITY_LOGS TABLE
-- Rule: Students can CRUD only their own activity log entries.
-- ============================================================================
ALTER TABLE daily_activity_logs ENABLE ROW LEVEL SECURITY;

-- Read own activity history.
CREATE POLICY "daily_activity_logs_select_own"
  ON daily_activity_logs FOR SELECT
  USING (auth.uid() = user_id);

-- Log a new activity for self.
CREATE POLICY "daily_activity_logs_insert_own"
  ON daily_activity_logs FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- Update own activity entry.
CREATE POLICY "daily_activity_logs_update_own"
  ON daily_activity_logs FOR UPDATE
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- Delete own activity entry.
CREATE POLICY "daily_activity_logs_delete_own"
  ON daily_activity_logs FOR DELETE
  USING (auth.uid() = user_id);


-- ============================================================================
-- 9. SUBSCRIPTIONS TABLE
-- Rule: Students can only read their own subscription status.
--       Writes are handled server-side (webhook / admin function).
-- ============================================================================
ALTER TABLE subscriptions ENABLE ROW LEVEL SECURITY;

-- Students can view their own subscription(s).
CREATE POLICY "subscriptions_select_own"
  ON subscriptions FOR SELECT
  USING (auth.uid() = user_id);

-- No INSERT/UPDATE/DELETE policies — subscription lifecycle is managed
-- exclusively by server-side webhook handlers (Razorpay/Stripe callbacks)
-- running with the service_role key, which bypasses RLS.


-- ============================================================================
-- 10. QUIZZES TABLE
-- Rule: Any authenticated user can browse available quizzes (read-only catalog).
-- ============================================================================
ALTER TABLE quizzes ENABLE ROW LEVEL SECURITY;

-- All logged-in users can see quizzes.
CREATE POLICY "quizzes_select_authenticated"
  ON quizzes FOR SELECT
  USING (TRUE);


-- ============================================================================
-- 11. QUIZ_QUESTIONS TABLE
-- Rule: Authenticated users can read questions, BUT the correct_option_index
--       and correct_answer_text columns must be hidden from direct client
--       access to prevent cheating.
--
-- Strategy: We allow RLS SELECT for authenticated users on the raw table,
--           but REVOKE column-level access to the answer columns from the
--           anon and authenticated roles. Then we expose a secure VIEW
--           (quiz_questions_safe) that omits the answer columns.
--           A separate SECURITY DEFINER function allows answer-checking
--           server-side without ever revealing the correct answer to the client.
-- ============================================================================
ALTER TABLE quiz_questions ENABLE ROW LEVEL SECURITY;

-- Authenticated users can read quiz questions via the raw table (but column
-- grants below will block the answer columns).
CREATE POLICY "quiz_questions_select_authenticated"
  ON quiz_questions FOR SELECT
  USING (TRUE);


-- ============================================================================
-- 11a. COLUMN-LEVEL GRANTS — Hide correct answers from clients
-- ============================================================================

-- Revoke ALL on the table first, then grant back only safe columns.
-- This prevents the 'authenticated' and 'anon' roles from reading
-- correct_option_index and correct_answer_text directly.

REVOKE ALL ON quiz_questions FROM anon, authenticated;

GRANT SELECT (id, quiz_id, question_text, type, options, marks)
  ON quiz_questions TO authenticated;

-- anon gets nothing (they shouldn't be taking quizzes anyway).


-- ============================================================================
-- 11b. SAFE VIEW — quiz_questions_safe
-- Provides a convenient, answer-free view for the Flutter client to query.
-- ============================================================================
CREATE OR REPLACE VIEW quiz_questions_safe AS
  SELECT
    id,
    quiz_id,
    question_text,
    type,
    options,
    marks
  FROM quiz_questions;

-- Grant SELECT on the safe view to authenticated users.
GRANT SELECT ON quiz_questions_safe TO authenticated;

COMMENT ON VIEW quiz_questions_safe IS
  'Client-safe projection of quiz_questions that omits correct_option_index '
  'and correct_answer_text to prevent cheating. Use this view from the app.';


-- ============================================================================
-- 11c. SERVER-SIDE ANSWER CHECKER — check_quiz_answer()
-- A SECURITY DEFINER function that compares a student's submitted answer
-- against the stored correct answer without revealing it to the client.
-- Returns TRUE if correct, FALSE otherwise.
-- ============================================================================
CREATE OR REPLACE FUNCTION check_quiz_answer(
  p_question_id UUID,
  p_selected_index INT
)
RETURNS BOOLEAN
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_correct_index INT;
BEGIN
  SELECT correct_option_index
    INTO v_correct_index
    FROM quiz_questions
   WHERE id = p_question_id;

  IF NOT FOUND THEN
    RAISE EXCEPTION 'Question not found: %', p_question_id;
  END IF;

  RETURN v_correct_index = p_selected_index;
END;
$$;

COMMENT ON FUNCTION check_quiz_answer IS
  'Securely checks a student''s selected option against the correct answer '
  'without exposing correct_option_index to the client. Called via supabase.rpc().';

-- Allow authenticated users to call this function.
GRANT EXECUTE ON FUNCTION check_quiz_answer(UUID, INT) TO authenticated;


-- ============================================================================
-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║                        VERIFICATION QUERIES                            ║
-- ║  To verify, run these in Supabase SQL Editor after applying the above. ║
-- ╚══════════════════════════════════════════════════════════════════════════╝
-- ============================================================================

-- 1. Confirm RLS is enabled on every table:
--    All rows should show 'rowsecurity = true'.
/*
SELECT
  schemaname,
  tablename,
  rowsecurity
FROM pg_tables
WHERE schemaname = 'public'
  AND tablename IN (
    'users', 'subscriptions', 'subjects', 'chapters', 'lessons',
    'user_progress', 'user_streaks', 'quiz_attempts',
    'daily_activity_logs', 'quizzes', 'quiz_questions'
  )
ORDER BY tablename;
*/

-- 2. List all RLS policies and confirm every table has the expected policies:
/*
SELECT
  schemaname,
  tablename,
  policyname,
  permissive,
  roles,
  cmd,
  qual,
  with_check
FROM pg_policies
WHERE schemaname = 'public'
ORDER BY tablename, policyname;
*/

-- 3. Verify column grants on quiz_questions — authenticated should NOT
--    have access to correct_option_index or correct_answer_text:
/*
SELECT
  grantee,
  table_name,
  column_name,
  privilege_type
FROM information_schema.column_privileges
WHERE table_schema = 'public'
  AND table_name = 'quiz_questions'
  AND grantee IN ('anon', 'authenticated')
ORDER BY grantee, column_name;
*/

-- 4. Verify the safe view exists and returns only non-answer columns:
/*
SELECT column_name
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'quiz_questions_safe'
ORDER BY ordinal_position;
-- Expected: id, quiz_id, question_text, type, options, marks
-- Should NOT contain: correct_option_index, correct_answer_text
*/

-- 5. Verify the answer-checking function exists:
/*
SELECT
  routine_name,
  security_type
FROM information_schema.routines
WHERE routine_schema = 'public'
  AND routine_name = 'check_quiz_answer';
-- Expected: security_type = 'DEFINER'
*/

-- 6. Quick smoke test — call the answer checker (use a real question UUID):
/*
SELECT check_quiz_answer(
  '00000000-0000-0000-0000-000000000000'::UUID, -- replace with a real question id
  2                                                -- replace with a test index
);
*/
