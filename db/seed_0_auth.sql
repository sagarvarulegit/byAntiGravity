-- Automatically provision a test user to avoid manual signups after DB reset
INSERT INTO auth.users (
  instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, confirmation_token, email_change, email_change_token_new, recovery_token
) VALUES (
  '00000000-0000-0000-0000-000000000000',
  'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380000',
  'authenticated',
  'authenticated',
  'sagar.varule@gmail.com',
  crypt('Password@123', gen_salt('bf')),
  now(),
  '{"provider": "email", "providers": ["email"]}',
  '{"name": "Sagar Varule"}',
  now(),
  now(),
  '', '', '', ''
) ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (
  id, provider_id, user_id, identity_data, provider, created_at, updated_at, last_sign_in_at
) VALUES (
  'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380000',
  'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380000',
  'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380000',
  format('{"sub":"%s","email":"%s"}', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380000', 'sagar.varule@gmail.com')::jsonb,
  'email',
  now(),
  now(),
  now()
) ON CONFLICT (id) DO NOTHING;
