-- CBSE Class 10 Learning Portal Seed Data
-- Run this in your Supabase SQL Editor to populate the database tables.

-- Clear existing data safely
TRUNCATE TABLE quiz_attempts CASCADE;
TRUNCATE TABLE quiz_questions CASCADE;
TRUNCATE TABLE quizzes CASCADE;
TRUNCATE TABLE user_progress CASCADE;
TRUNCATE TABLE daily_activity_logs CASCADE;
TRUNCATE TABLE lessons CASCADE;
TRUNCATE TABLE chapters CASCADE;
TRUNCATE TABLE subjects CASCADE;

-- 1. INSERT SUBJECTS
INSERT INTO subjects (id, name, code, description, thumbnail_url) VALUES
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Mathematics', 'MATH10', 'Algebra, Quadratic Equations, Trigonometry & Geometry.', 'https://images.unsplash.com/photo-1509228468518-180dd4864904?w=500&auto=format&fit=crop&q=60'),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'Science', 'SCI10', 'Chemical Reactions, Electricity, Light & Life Processes.', 'https://images.unsplash.com/photo-1532094349884-543bc11b234d?w=500&auto=format&fit=crop&q=60'),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Social Science', 'SOC10', 'History, Democratic Politics, Geography & Economics.', 'https://images.unsplash.com/photo-1447069387593-a5de0862481e?w=500&auto=format&fit=crop&q=60');


-- 2. INSERT CHAPTERS
INSERT INTO chapters (id, subject_id, title, sequence_number, description) VALUES
-- Mathematics Chapters
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380111', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Chapter 1: Real Numbers', 1, 'Explore rational and irrational numbers, Euclid division lemma, and fundamental arithmetic theorems.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380112', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Chapter 2: Polynomials & Equations', 2, 'Understand polynomials, geometrical meaning of zeroes, and relationships between coefficients.'),

-- Science Chapters
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380221', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'Chapter 1: Chemical Reactions & Equations', 1, 'Learn about chemical changes, writing balanced chemical equations, and types of chemical reactions.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'Chapter 12: Electricity', 12, 'Electric potential, currents, Ohm''s law, resistance factors, and heating effects of currents.'),

-- Social Science Chapters
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Chapter 1: Nationalism in India', 1, 'Explore the impact of the First World War, Satyagraha, Non-Cooperation, and Civil Disobedience movements.');


-- 3. INSERT LESSONS (Videos and Notes)
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
-- Maths Chapter 1 Lessons
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380001', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380111', '1.1 Euclid''s Division Lemma', 'video', 'https://d23dyxeqlo5ps.cloudfront.net/big_buck_bunny.m3u8', 765, NULL, TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380002', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380111', '1.2 Fundamental Theorem of Arithmetic', 'video', 'https://d23dyxeqlo5ps.cloudfront.net/big_buck_bunny.m3u8', 1100, NULL, TRUE, 2),

-- Science Chapter 1 Lessons
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380003', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380221', '1.1 Writing Chemical Equations', 'video', 'https://d23dyxeqlo5ps.cloudfront.net/big_buck_bunny.m3u8', 850, NULL, TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380004', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380221', '1.2 Types of Chemical Reactions', 'video', 'https://d23dyxeqlo5ps.cloudfront.net/big_buck_bunny.m3u8', 1470, NULL, FALSE, 2),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380005', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380221', 'Revision Notes: Chemical Reactions', 'note', NULL, NULL, 
'# Chapter 1: Chemical Reactions and Equations

## Core Concepts
A chemical reaction is a process in which one or more substances, the reactants, are converted to one or more different substances, the products.

### Daily Life Observations of Chemical Changes:
- **Rusting of Iron**: When iron is exposed to moist air for a long period, it acquires a coating of a brown flaky substance called rust.
- **Souring of Milk**: Milk left at room temperature during summers gets soured due to lactic acid fermentation.
- **Digestion of Food**: Complex food molecules are broken down into simpler substances in our digestive system.
- **Respiration**: Oxygen is used to break down glucose into carbon dioxide, water, and energy.

### Activity 1.1: Magnesium Ribbon Combustion
*Caution: This activity needs the teacher’s assistance. It would be better if students wear eye protection.*
1. Clean a magnesium ribbon about 2 cm long by rubbing it with sandpaper.
2. Hold it with a pair of tongs. Burn it using a spirit lamp or burner and collect the ash so formed in a watch-glass.
3. Burn the magnesium ribbon keeping it as far as possible from your eyes.

**Observation**: You will observe that the magnesium ribbon burns with a dazzling white flame and changes into a white powder. This powder is **magnesium oxide (MgO)**. It is formed due to the reaction between magnesium and oxygen present in the air.

```
2Mg + O2 --> 2MgO
```
', TRUE, 3),

-- Science Chapter 12 Lessons
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380006', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', '12.1 Electric Current & Potential', 'video', 'https://d23dyxeqlo5ps.cloudfront.net/big_buck_bunny.m3u8', 1010, NULL, TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380007', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', '12.2 Ohm''s Law & Circuit Elements', 'video', 'https://d23dyxeqlo5ps.cloudfront.net/big_buck_bunny.m3u8', 1695, NULL, FALSE, 2),

-- Social Science Lessons
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380008', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', '1.1 First World War & Satyagraha', 'video', 'https://d23dyxeqlo5ps.cloudfront.net/big_buck_bunny.m3u8', 1120, NULL, TRUE, 1);


-- 4. INSERT QUIZZES
INSERT INTO quizzes (id, chapter_id, title, passing_percentage) VALUES
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380221', 'Science Chapter 1 Assessment', 60);


-- 5. INSERT QUIZ QUESTIONS
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
-- MCQ 1
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd381111', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', 'What is the color of the powder formed when magnesium ribbon burns in oxygen?', 'multiple_choice', 
'["A. Black", "B. White", "C. Grey", "D. Yellow"]', 1, NULL, 1),

-- MCQ 2
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd382222', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', 'Which of the following is a displacement reaction?', 'multiple_choice', 
'["A. CaCO3 --> CaO + CO2", "B. 2H2 + O2 --> 2H2O", "C. Fe + CuSO4 --> FeSO4 + Cu", "D. NaOH + HCl --> NaCl + H2O"]', 2, NULL, 1),

-- MCQ 3
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383333', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', 'During respiration, which gas is released as a product of glucose breakdown?', 'multiple_choice', 
'["A. Oxygen", "B. Carbon Dioxide", "C. Nitrogen", "D. Hydrogen"]', 1, NULL, 1),

-- MCQ 4
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd384444', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', 'The reaction in which heat is released along with the formation of products is called:', 'multiple_choice', 
'["A. Endothermic reaction", "B. Exothermic reaction", "C. Combination reaction", "D. Redox reaction"]', 1, NULL, 1);
