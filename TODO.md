# CBSE Class 10 Learning Portal - Production Launch Checklist

This document tracks all milestones and technical tasks required to launch the CBSE Online Learning Portal to real students.

---

## 🗄️ 1. Database & Content Seeding (Supabase)
Before launch, we need to load real NCERT textbook content into the database.
- [ ] **Syllabus Content Seeding**:
  - [ ] Write a Node.js seed script to load subjects (Mathematics, Science, Social Science).
  - [ ] Load Chapters and Lesson structures (video links, HLS manifest URLs, and markdown notes).
- [ ] **Quiz Bank Seeding**:
  - [ ] Load practice quiz questions, MCQ option indices, and explanations for each chapter.

---

## 📱 2. Core Client Features (Flutter Web & Mobile)
Sync the remaining frontend components to read/write from Supabase instead of mock arrays.
- [ ] **Dynamic Curriculum Loader**:
  - [ ] Fetch subjects, chapters, and notes from Supabase at runtime.
  - [ ] Implement local database caching (e.g., Hive or SQLite) so students can read lessons offline.
- [ ] **Interactive Progress & Streaks**:
  - [ ] Record watched video durations and completed notes to the `user_progress` table.
  - [ ] Save daily streaks and increment current/longest streaks via daily activity logs.
- [ ] **Board Exam Quizzes**:
  - [ ] Load dynamic quiz questions per chapter.
  - [ ] Grade answers on the client, submit scores to `quiz_attempts`, and recalculate subject mastery.

---

## 💳 3. Billing & Payment Gateway (India Region)
Establish the subscription paywall to convert free users to premium.
- [ ] **Payment Integration**:
  - [ ] Integrate **Razorpay** SDK (preferred for India/CBSE) or **Stripe** into the Flutter client.
  - [ ] Set up secure checkout page and webhook endpoint (using a Supabase Deno Edge Function).
- [ ] **Paywall Enforcement**:
  - [ ] Guard premium assets (`is_free = false` lessons) on the client.
  - [ ] Verify subscription status (`active`, `expired`) directly from the `subscriptions` table.

---

## 🔒 4. Production Security & Performance
Secure student data and optimize loading times for low-bandwidth environments.
- [ ] **Row Level Security (RLS)**:
  - [ ] Enable Supabase RLS policies on all tables.
  - [ ] Add policies: Students can only read/update their *own* progress, streaks, and quiz attempts.
  - [ ] Prevent public read access to paid lessons or quiz answer keys.
- [ ] **HLS Video Encryption**:
  - [ ] Set up video manifest protection (AES-128 encryption) to prevent students from ripping video files.
- [ ] **Performance Optimization**:
  - [ ] Pre-render critical landing page assets.
  - [ ] Enable GZIP compression on Firebase Hosting.

---

## 🚀 5. App Store Builds & Domain Configuration
Deploy native applications and connect professional branding.
- [ ] **Custom Domain**:
  - [ ] Connect a custom domain (e.g. `cbsecore.com`) to Firebase Hosting.
- [ ] **Android Build (Google Play)**:
  - [ ] Generate production Keystore.
  - [ ] Build Android App Bundle (`flutter build appbundle`).
  - [ ] Set up Google Play Developer Console and submit for review.
- [ ] **iOS Build (Apple App Store)**:
  - [ ] Set up Apple Developer Program account.
  - [ ] Configure provisioning profiles and signing keys.
  - [ ] Build iOS archive and upload to App Store Connect / TestFlight.
