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
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Social Science', 'SOC10', 'History, Democratic Politics, Geography & Economics.', 'https://images.unsplash.com/photo-1447069387593-a5de0862481e?w=500&auto=format&fit=crop&q=60'),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'English Language & Literature', 'ENG10', 'Reading Comprehension, Grammar, Creative Writing & Literature — Code 184', 'https://images.unsplash.com/photo-1457369804613-52c61a468e7d?w=500&auto=format&fit=crop&q=60'),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a55', 'Hindi Course B', 'HIN10', 'अपठित बोध, व्यावहारिक व्याकरण, पाठ्यपुस्तक एवं रचनात्मक लेखन — Code 085', 'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?w=500&auto=format&fit=crop&q=60');


-- 2. INSERT CHAPTERS
INSERT INTO chapters (id, subject_id, title, sequence_number, description) VALUES
-- Mathematics Chapters
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380111', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Chapter 1: Real Numbers', 1, 'Explore rational and irrational numbers, Euclid division lemma, and fundamental arithmetic theorems.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380112', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Chapter 2: Polynomials', 2, 'Understand degree of polynomials, geometrical meaning of zeroes, and algebraic relationships between zeroes and coefficients.'),

-- Science Chapters
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380221', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'Chapter 1: Chemical Reactions & Equations', 1, 'Learn about chemical changes, writing balanced chemical equations, and types of chemical reactions.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'Chapter 11: Electricity', 11, 'Electric potential, currents, Ohm''s law, resistance factors, and heating effects of currents.'),

-- Social Science Chapters
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Chapter 1: Nationalism in India', 1, 'Explore the impact of the First World War, Satyagraha, Non-Cooperation, and Civil Disobedience movements.');


-- 3. INSERT LESSONS (Videos and Notes)
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
-- Maths Chapter 1 Lessons
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380001', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380111', '1.1 The Fundamental Theorem of Arithmetic', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 960, NULL, TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380002', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380111', '1.2 Revisiting Irrational Numbers', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 1180, NULL, TRUE, 2),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380009', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380111', 'Revision Notes: Real Numbers', 'note', NULL, NULL, 
'# Chapter 1: Real Numbers

## 1. Introduction & Rationalized Syllabus
In Class X, the syllabus covers the key properties of positive integers:
1. **The Fundamental Theorem of Arithmetic**: Deals with the multiplication of positive integers.
2. **Revisiting Irrational Numbers**: Proving numbers like $\sqrt{2}$, $\sqrt{3}$, $\sqrt{5}$ are irrational.

> [!NOTE]
> **Syllabus Update**: Euclid''s Division Lemma (including Euclid''s Division Algorithm for HCF) has been **removed** from the latest rationalized CBSE Class 10 Mathematics syllabus.

---

## 2. The Fundamental Theorem of Arithmetic
**Theorem 1.1**: Every composite number can be expressed (factorized) as a product of primes, and this factorization is unique, apart from the order in which the prime factors occur.

The prime factorization of a natural number is unique, except for the order of its factors.

### Expressing Numbers in Ascending Order:
Given a composite number $x$, we write $x = p_1^{a_1} \cdot p_2^{a_2} \cdots p_n^{a_n}$ where $p_1 < p_2 < \dots < p_n$ are prime factors.
- **Example**: $32760 = 2^3 \cdot 3^2 \cdot 5 \cdot 7 \cdot 13$

### Important Relationship:
For any two positive integers $a$ and $b$:
$$\text{HCF}(a, b) \times \text{LCM}(a, b) = a \times b$$

> [!WARNING]
> This property **does not hold** for three or more numbers! For three integers $p, q, r$:
> $$\text{HCF}(p, q, r) \times \text{LCM}(p, q, r) \neq p \times q \times r$$

---

## 3. Finding HCF and LCM (Prime Factorization Method)
- **HCF (Highest Common Factor)**: Product of the **smallest power** of each common prime factor in the numbers.
- **LCM (Lowest Common Multiple)**: Product of the **greatest power** of each prime factor involved in the numbers.

### Worked Example:
Find HCF and LCM of $6$ and $20$.
- $6 = 2^1 \times 3^1$
- $20 = 2^2 \times 5^1$
- **HCF** = $2^1 = 2$
- **LCM** = $2^2 \times 3^1 \times 5^1 = 60$
- **Verification**: $\text{HCF}(6, 20) \times \text{LCM}(6, 20) = 2 \times 60 = 120 = 6 \times 20$.

---

## 4. Revisiting Irrational Numbers
A number $s$ is called **irrational** if it cannot be written in the form $\frac{p}{q}$, where $p$ and $q$ are integers and $q \neq 0$.

**Theorem 1.2**: Let $p$ be a prime number. If $p$ divides $a^2$, then $p$ divides $a$, where $a$ is a positive integer.

**Theorem 1.3**: $\sqrt{2}$ is irrational.

### Proof by Contradiction (Overview):
1. Assume $\sqrt{2}$ is rational, so $\sqrt{2} = \frac{a}{b}$ where $a, b$ are coprime integers ($b \neq 0$).
2. Squaring both sides: $2b^2 = a^2$, meaning $2$ divides $a^2 \implies 2$ divides $a$.
3. Write $a = 2c$, so $2b^2 = 4c^2 \implies b^2 = 2c^2$, meaning $2$ divides $b^2 \implies 2$ divides $b$.
4. Thus $a$ and $b$ share a common factor $2$, contradicting that they are coprime.
5. Hence, our assumption is false; $\sqrt{2}$ is irrational.

---

## 5. Operations on Real Numbers
1. The sum or difference of a rational number and an irrational number is **irrational**. (e.g., $5 - \sqrt{3}$)
2. The product and quotient of a non-zero rational and irrational number is **irrational**. (e.g., $3\sqrt{2}$)', TRUE, 3),

-- Science Chapter 1 Lessons
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd381001', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380221', '1.1 Introduction to Chemical Reactions', 'video', '/videos/science_ch1_full.mp4', 850, NULL, TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd381002', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380221', '1.1.2 Balancing Chemical Equations', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 1200, NULL, TRUE, 2),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd381003', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380221', '1.2.1 Combination Reactions', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 900, NULL, FALSE, 3),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd381004', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380221', '1.2.2 Decomposition Reactions', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 1100, NULL, FALSE, 4),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd381005', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380221', '1.2.3 Displacement Reactions', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 850, NULL, FALSE, 5),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd381006', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380221', '1.2.4 Double Displacement Reactions & Precipitation', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 1050, NULL, FALSE, 6),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd381007', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380221', '1.2.5 Oxidation and Reduction (Redox)', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 1300, NULL, FALSE, 7),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd381008', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380221', '1.3 Corrosion & Rancidity', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 750, NULL, FALSE, 8),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd381009', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380221', 'Exothermic vs Endothermic Reactions', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 900, NULL, FALSE, 9),

-- Science Chapter 12 Lessons
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380006', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', '11.1 Electric Current & Circuit', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 1010, NULL, TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380010', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', '11.2 Electric Potential & Potential Difference', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 1200, NULL, TRUE, 2),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380007', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', '11.3 Ohm''s Law & Circuit Elements', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 1695, NULL, FALSE, 3),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380011', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', 'Conventional Current vs. Electron Flow', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 900, NULL, TRUE, 4),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380012', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', 'Ammeter vs. Voltmeter', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 900, NULL, TRUE, 5),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380013', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', 'Ohm''s Law Verification (Activity 11.1)', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 1200, NULL, FALSE, 6),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380014', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', 'Factors Affecting Resistance', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 1100, NULL, FALSE, 7),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380015', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', 'Mixed Resistance Simplification', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 1400, NULL, FALSE, 8),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380016', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', 'The Parallel Resistance Trap', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 800, NULL, FALSE, 9),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380017', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', 'Heating Effect & Fuse Action', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 1200, NULL, FALSE, 10),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380018', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', 'Commercial Energy Billing', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 1500, NULL, FALSE, 11),

-- Social Science Lessons
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380008', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', '1.1 First World War & Satyagraha', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 1120, NULL, TRUE, 1),

-- Maths Chapter 2 Lessons
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380021', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380112', '2.1 Geometrical Meaning of Zeroes', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 1335, NULL, TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380022', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380112', '2.2 Relationship of Coefficients', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 940, NULL, TRUE, 2),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380023', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380112', 'Revision Notes: Polynomials', 'note', NULL, NULL, 
'# Chapter 2: Polynomials

## 1. Introduction & Key Terminology
A polynomial $p(x)$ in $x$ is an algebraic expression where powers of $x$ are non-negative integers.
- **Degree of Polynomial**: The highest power of $x$ in $p(x)$.
- **Linear Polynomial**: A polynomial of degree $1$ (e.g., $2x - 3$, general form $ax + b$).
- **Quadratic Polynomial**: A polynomial of degree $2$ (e.g., $x^2 - 3x - 4$, general form $ax^2 + bx + c$).
- **Cubic Polynomial**: A polynomial of degree $3$ (e.g., $x^3 - 4x$, general form $ax^3 + bx^2 + cx + d$).

A real number $k$ is called a **zero** of a polynomial $p(x)$ if $p(k) = 0$.
- **Linear Polynomial Zero**: For $p(x) = ax + b$, the zero is $k = -\frac{b}{a}$.

---

## 2. Geometrical Meaning of Zeroes
The zeroes of a polynomial $p(x)$ are precisely the **x-coordinates of the points where the graph of $y = p(x)$ intersects the x-axis**.

### Geometrical Shapes:
1. **Linear ($ax + b$)**: Graph is a straight line intersecting the x-axis at exactly one point: $(-\frac{b}{a}, 0)$.
2. **Quadratic ($ax^2 + bx + c$)**: Graph is a U-shaped curve called a **parabola**. It opens **upwards** if $a > 0$ and **downwards** if $a < 0$.
   - **Case 1 (Two Zeroes)**: The parabola intersects the x-axis at two distinct points.
   - **Case 2 (One Zero)**: The parabola touches the x-axis at exactly one point (two coincident points).
   - **Case 3 (No Zero)**: The parabola is completely above or below the x-axis and does not touch it.

> [!NOTE]
> A polynomial of degree $n$ has **at most $n$ zeroes**. Geometrically, the curve intersects the x-axis at at most $n$ points.

---

## 3. Relationship between Zeroes and Coefficients
For a quadratic polynomial $p(x) = ax^2 + bx + c$ with zeroes $\alpha$ and $\beta$:
- **Sum of Zeroes**:
  $$\alpha + \beta = -\frac{b}{a} = -\frac{\text{Coefficient of } x}{\text{Coefficient of } x^2}$$
- **Product of Zeroes**:
  $$\alpha\beta = \frac{c}{a} = \frac{\text{Constant term}}{\text{Coefficient of } x^2}$$

### Constructing a Quadratic Polynomial:
If the sum ($S$) and product ($P$) of zeroes are known, the quadratic polynomial is:
$$x^2 - Sx + P = x^2 - (\alpha + \beta)x + \alpha\beta$$

---

## 4. Cubic Polynomials
For a cubic polynomial $p(x) = ax^3 + bx^2 + cx + d$ with zeroes $\alpha$, $\beta$, and $\gamma$:
- **Sum of Zeroes**: $\alpha + \beta + \gamma = -\frac{b}{a}$
- **Sum of products taken two at a time**: $\alpha\beta + \beta\gamma + \gamma\alpha = \frac{c}{a}$
- **Product of Zeroes**: $\alpha\beta\gamma = -\frac{d}{a}$

---

## 5. Worked Examples
### Example A (Find zeroes and verify):
Find the zeroes of $x^2 + 7x + 10$ and verify the relationship.
- Factorize: $x^2 + 7x + 10 = (x + 2)(x + 5)$
- Zeroes: $x = -2$ and $x = -5$.
- **Sum Verification**: $(-2) + (-5) = -7 = -\frac{7}{1} = -\frac{b}{a}$.
- **Product Verification**: $(-2) \times (-5) = 10 = \frac{10}{1} = \frac{c}{a}$.

### Example B (Construct polynomial):
Find a quadratic polynomial whose sum and product of zeroes are $\frac{1}{4}$ and $-1$ respectively.
- Using $x^2 - Sx + P$:
  $$x^2 - \frac{1}{4}x - 1 = \frac{4x^2 - x - 4}{4}$$
- A fitting polynomial is $4x^2 - x - 4$.', TRUE, 3);


-- 4. INSERT QUIZZES
INSERT INTO quizzes (id, chapter_id, title, passing_percentage) VALUES
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380088', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380111', 'Mathematics Chapter 1 Quiz', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380022', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380112', 'Mathematics Chapter 2 Quiz', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380221', 'Science Chapter 1 Assessment', 60);


-- 5. INSERT QUIZ QUESTIONS
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
-- Mathematics Chapter 1 Quiz Questions
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380811', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380088', 'Sonia takes 18 minutes to drive one round of a sports field, while Ravi takes 12 minutes for the same. If they both start at the same point, at the same time, and go in the same direction, after how many minutes will they meet again at the starting point?', 'multiple_choice', 
'["A. 6 minutes", "B. 36 minutes", "C. 18 minutes", "D. 30 minutes"]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380812', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380088', 'Given that HCF(306, 657) = 9, find the LCM(306, 657).', 'multiple_choice', 
'["A. 22338", "B. 34002", "C. 18342", "D. 22339"]', 0, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380813', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380088', 'Which of the following describes the number 3 + 2√5?', 'multiple_choice', 
'["A. An integer", "B. A rational number", "C. An irrational number", "D. A composite number"]', 2, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380814', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380088', 'For which natural number n does the number 6^n end with the digit zero?', 'multiple_choice', 
'["A. n = 5", "B. n = 10", "C. No natural number n", "D. Any even natural number n"]', 2, NULL, 1),

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
'["A. Endothermic reaction", "B. Exothermic reaction", "C. Combination reaction", "D. Redox reaction"]', 1, NULL, 1),

-- Mathematics Chapter 2 Quiz Questions
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380221', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380022', 'If the graph of a polynomial y = p(x) intersects the x-axis at exactly three distinct points, what is the number of zeroes of p(x)?', 'multiple_choice', 
'["A. 0", "B. 1", "C. 2", "D. 3"]', 3, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380022', 'Find the zeroes of the quadratic polynomial x² - 2x - 8.', 'multiple_choice', 
'["A. 4 and -2", "B. -4 and 2", "C. 4 and 2", "D. -4 and -2"]', 0, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380223', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380022', 'Find a quadratic polynomial each with the given numbers as the sum and product of its zeroes respectively: 1/4, -1.', 'multiple_choice', 
'["A. 4x² - x - 4", "B. 4x² + x - 4", "C. x² - 4x - 4", "D. 4x² - x + 4"]', 0, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380224', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380022', 'If α, β, and γ are the zeroes of the cubic polynomial ax³ + bx² + cx + d, then what is the value of αβ + βγ + γα?', 'multiple_choice', 
'["A. -b/a", "B. c/a", "C. -d/a", "D. d/a"]', 1, NULL, 1);
