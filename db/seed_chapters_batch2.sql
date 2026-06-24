-- CBSE Class 10 Learning Portal Seed Data - Batch 2 (Chapters, Lessons and Quizzes)
-- Generated on 2026-06-23
-- Format: Clean SQL with ON CONFLICT (id) DO NOTHING for safe re-runs.

-- 1. INSERT CHAPTERS
INSERT INTO chapters (id, subject_id, title, sequence_number, description) VALUES
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380113', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Chapter 3: Pair of Linear Equations in Two Variables', 3, 'Understand graphical and algebraic methods to solve pairs of linear equations in two variables.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380114', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Chapter 4: Quadratic Equations', 4, 'Explore standard form of quadratic equations, solution methods (factorization and quadratic formula), and nature of roots.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380223', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'Chapter 2: Acids, Bases and Salts', 2, 'Learn chemical properties of acids and bases, pH scale significance, and preparation and uses of common salts.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380224', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'Chapter 3: Metals and Non-metals', 3, 'Study physical and chemical properties of metals and non-metals, reactivity series, ionic compounds, and metallurgy.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380332', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Chapter 2: Federalism', 2, 'Analyze the theory and practice of federalism in India, local governments, and division of power.')
ON CONFLICT (id) DO NOTHING;

-- 2. INSERT LESSONS
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
-- Mathematics Chapter 3 Lessons
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380031', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380113', '3.1 Graphical Method of Solution', 'video', '', 600, NULL, TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380032', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380113', '3.2 Algebraic Methods: Substitution and Elimination', 'video', '', 720, NULL, FALSE, 2),

-- Mathematics Chapter 4 Lessons
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380041', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380114', '4.1 Solutions by Factorization & Quadratic Formula', 'video', '', 650, NULL, TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380042', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380114', '4.2 Nature of Roots & Discriminant', 'video', '', 800, NULL, FALSE, 2),

-- Science Chapter 2 Lessons
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380231', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380223', '2.1 Understanding Acids and Bases', 'video', '', 580, NULL, TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380232', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380223', '2.2 Importance of pH & Common Salts', 'video', '', 820, NULL, FALSE, 2),

-- Science Chapter 3 Lessons
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380341', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380224', '3.1 Chemical Properties of Metals', 'video', '', 620, NULL, TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380342', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380224', '3.2 Reactivity Series & Ionic Compounds', 'video', '', 780, NULL, FALSE, 2),

-- Social Science Chapter 2 Lessons
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380551', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380332', '2.1 What is Federalism?', 'video', '', 500, NULL, TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380552', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380332', '2.2 Decentralisation in India', 'video', '', 680, NULL, FALSE, 2)
ON CONFLICT (id) DO NOTHING;

-- 3. INSERT QUIZZES
INSERT INTO quizzes (id, chapter_id, title, passing_percentage) VALUES
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380033', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380113', 'Mathematics Chapter 3 Quiz', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380044', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380114', 'Mathematics Chapter 4 Quiz', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380224', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380223', 'Science Chapter 2 Assessment', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380233', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380224', 'Science Chapter 3 Assessment', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380333', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380332', 'Social Science Chapter 2 Quiz', 60)
ON CONFLICT (id) DO NOTHING;

-- 4. INSERT QUIZ QUESTIONS
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
-- Mathematics Chapter 3 Quiz Questions
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380311', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380033', 'If a pair of linear equations is consistent, then the lines representing them will be:', 'multiple_choice',
'["A. Parallel", "B. Always coincident", "C. Intersecting or coincident", "D. Always intersecting"]', 2, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380312', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380033', 'For what value of k will the system of equations 2x - 3y = 5 and 6x - ky = 15 have infinitely many solutions?', 'multiple_choice',
'["A. k = 3", "B. k = 6", "C. k = 9", "D. k = -9"]', 2, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380313', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380033', 'The pair of equations x + 2y + 5 = 0 and -3x - 6y + 1 = 0 has:', 'multiple_choice',
'["A. A unique solution", "B. Exactly two solutions", "C. Infinitely many solutions", "D. No solution"]', 3, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380314', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380033', 'In a graphical representation, if the lines representing a pair of linear equations are parallel, the system of equations is said to be:', 'multiple_choice',
'["A. Consistent", "B. Inconsistent", "C. Dependent", "D. Coincident"]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380315', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380033', 'Solve the following pair of linear equations by substitution method: x + y = 14 and x - y = 4. What are the values of x and y?', 'multiple_choice',
'["A. x = 9, y = 5", "B. x = 5, y = 9", "C. x = 10, y = 4", "D. x = 8, y = 6"]', 0, NULL, 1),

-- Mathematics Chapter 4 Quiz Questions
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380411', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380044', 'Which of the following represents the standard form of a quadratic equation?', 'multiple_choice',
'["A. ax + b = 0, a != 0", "B. ax² + bx + c = 0, a != 0", "C. ax³ + bx² + cx + d = 0, a != 0", "D. ax² + b = 0"]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380412', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380044', 'What is the discriminant of the quadratic equation 2x² - 4x + 3 = 0?', 'multiple_choice',
'["A. 8", "B. -8", "C. 16", "D. -16"]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380413', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380044', 'Under what condition does a quadratic equation ax² + bx + c = 0 have two equal real roots?', 'multiple_choice',
'["A. b² - 4ac > 0", "B. b² - 4ac = 0", "C. b² - 4ac < 0", "D. b² - 4ac >= 0"]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380414', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380044', 'If the roots of the quadratic equation x² - kx + 4 = 0 are equal, what are the possible values of k?', 'multiple_choice',
'["A. 2 or -2", "B. 4 or -4", "C. 8 or -8", "D. 16 or -16"]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380415', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380044', 'Find the roots of the quadratic equation x² - 3x - 10 = 0 by factorization.', 'multiple_choice',
'["A. 5 and -2", "B. -5 and 2", "C. 5 and 2", "D. -5 and -2"]', 0, NULL, 1),

-- Science Chapter 2 Quiz Questions
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380211', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380224', 'What is the chemical formula of bleaching powder?', 'multiple_choice',
'["A. Ca(OH)2", "B. CaOCl2", "C. CaCO3", "D. CaCl2"]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380212', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380224', 'What is the colour of phenolphthalein indicator in acidic and basic solutions respectively?', 'multiple_choice',
'["A. Red in acidic, blue in basic", "B. Colorless in acidic, pink in basic", "C. Pink in acidic, colorless in basic", "D. Yellow in acidic, red in basic"]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380213', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380224', 'Which of the following statements is correct regarding the pH scale?', 'multiple_choice',
'["A. Acidic solutions have pH > 7, basic solutions have pH < 7", "B. Acidic solutions have pH < 7, basic solutions have pH > 7", "C. Neutral solutions have pH = 0", "D. As pH decreases from 7 to 14, H+ ion concentration increases"]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380214', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380224', 'What is the chemical formula of Plaster of Paris?', 'multiple_choice',
'["A. CaSO4 . 2H2O", "B. CaSO4 . 1/2 H2O", "C. CuSO4 . 5H2O", "D. Na2CO3 . 10H2O"]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380215', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380224', 'When a solution of an acid is mixed with a solution of a base in a test tube, the reaction is called a:', 'multiple_choice',
'["A. Displacement reaction", "B. Combination reaction", "C. Neutralization reaction", "D. Decomposition reaction"]', 2, NULL, 1),

-- Science Chapter 3 Quiz Questions
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380233', 'Which of the following is an example of an amphoteric oxide?', 'multiple_choice',
'["A. Sodium oxide (Na2O)", "B. Potassium oxide (K2O)", "C. Aluminium oxide (Al2O3)", "D. Copper oxide (CuO)"]', 2, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380332', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380233', 'Aqua regia is a freshly prepared mixture of concentrated hydrochloric acid and concentrated nitric acid in what ratio?', 'multiple_choice',
'["A. 1:3", "B. 3:1", "C. 1:1", "D. 2:3"]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380333', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380233', 'Which of the following metals is the most malleable?', 'multiple_choice',
'["A. Iron", "B. Copper", "C. Gold", "D. Sodium"]', 2, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380334', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380233', 'Which of the following non-metals is a liquid at room temperature?', 'multiple_choice',
'["A. Carbon", "B. Bromine", "C. Iodine", "D. Oxygen"]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380335', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380233', 'Which metal can be easily cut with a knife?', 'multiple_choice',
'["A. Iron", "B. Sodium", "C. Zinc", "D. Copper"]', 1, NULL, 1),

-- Social Science Chapter 2 Quiz Questions
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380511', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380333', 'Which of the following countries is an example of a "coming together" federation?', 'multiple_choice',
'["A. India", "B. Belgium", "C. Spain", "D. USA"]', 3, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380512', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380333', 'Which of the following subjects is included in the Union List in India?', 'multiple_choice',
'["A. Police", "B. Agriculture", "C. Banking", "D. Education"]', 2, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380513', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380333', 'If there is a conflict between the laws made by the Union Government and the State Government on a subject in the Concurrent List, which law prevails?', 'multiple_choice',
'["A. The law made by the State Government", "B. The law made by the Union Government", "C. Both laws are cancelled", "D. The Supreme Court decides a new law"]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380514', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380333', 'Subjects like computer software that came up after the Constitution was made are classified as:', 'multiple_choice',
'["A. Union subjects", "B. Concurrent subjects", "C. Residuary subjects", "D. State subjects"]', 2, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380515', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380333', 'The shift of Belgium from a unitary to a federal form of government in 1993 was primarily due to:', 'multiple_choice',
'["A. The reduction of powers of the regional governments", "B. Constitutional powers given to the regional governments that were no longer dependent on the central government", "C. The division of the country into two independent nations", "D. Dictatorial control by the king of Belgium"]', 1, NULL, 1)
ON CONFLICT (id) DO NOTHING;
