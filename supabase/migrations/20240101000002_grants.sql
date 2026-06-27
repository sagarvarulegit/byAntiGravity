-- Default Supabase Grants for PostgREST API
GRANT USAGE ON SCHEMA public TO anon, authenticated;
GRANT ALL ON ALL TABLES IN SCHEMA public TO anon, authenticated;
GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO anon, authenticated;

-- (Re-apply the quiz_questions revoke from schema.sql just to be safe)
REVOKE ALL ON quiz_questions FROM anon, authenticated;
GRANT SELECT (id, quiz_id, question_text, type, options, marks) ON quiz_questions TO authenticated;
