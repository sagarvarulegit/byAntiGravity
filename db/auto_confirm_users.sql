-- SQL Script to Auto-Confirm users and update the signup sync trigger
-- Target: Supabase database for project: ervvgjioggfxygtjlpts

-- 1. Confirm all existing unconfirmed users (only updating email_confirmed_at, confirmed_at is generated automatically)
UPDATE auth.users
SET email_confirmed_at = COALESCE(email_confirmed_at, NOW())
WHERE email_confirmed_at IS NULL;

-- 2. Modify handle_new_user function to auto-confirm future signups
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  -- Sync user profile to public.users table
  INSERT INTO public.users (id, full_name, email)
  VALUES (
    new.id,
    COALESCE(new.raw_user_meta_data->>'full_name', 'Student'),
    new.email
  );

  -- Auto-confirm the email address in auth.users
  UPDATE auth.users
  SET email_confirmed_at = COALESCE(email_confirmed_at, NOW())
  WHERE id = new.id;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
