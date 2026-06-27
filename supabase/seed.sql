

-- --- FROM FILE db/seed.sql ---

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
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380003', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380221', '1.1 Writing Chemical Equations', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 850, NULL, TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380004', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380221', '1.2 Types of Chemical Reactions', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 1470, NULL, FALSE, 2),
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
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380006', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', '12.1 Electric Current & Circuit', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 1010, NULL, TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380010', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', '12.2 Electric Potential & Potential Difference', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 1200, NULL, TRUE, 2),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380007', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', '12.3 Ohm''s Law & Circuit Elements', 'video', 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 1695, NULL, FALSE, 3),
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


-- --- FROM FILE db/seed_chapters_batch2.sql ---

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


-- --- FROM FILE db/seed_batch3_math_science_patched.sql ---

-- CBSE Class 10 Learning Portal Seed Data - Batch 3 (Mathematics Chapters 5-9)
-- Generated on 2026-06-24
-- Format: Clean SQL with ON CONFLICT (id) DO NOTHING for safe re-runs.

-- 1. INSERT CHAPTERS
INSERT INTO chapters (id, subject_id, title, sequence_number, description) VALUES
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380115', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Chapter 5: Arithmetic Progressions', 5, 'Study arithmetic progressions, finding the nth term, and calculating the sum of the first n terms.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380116', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Chapter 6: Triangles', 6, 'Learn about similar figures, the Basic Proportionality Theorem, and criteria for similarity of triangles.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380117', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Chapter 7: Coordinate Geometry', 7, 'Understand the distance formula, section formula, midpoint formula, and their applications in coordinate planes.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380118', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Chapter 8: Introduction to Trigonometry', 8, 'Explore trigonometric ratios, standard values for specific angles, and proving trigonometric identities.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380119', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Chapter 9: Some Applications of Trigonometry', 9, 'Use trigonometric concepts to solve heights and distances problems using angles of elevation and depression.')
ON CONFLICT (id) DO NOTHING;


-- 2. INSERT LESSONS (Revision Notes V2 Standard)
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
-- Chapter 5: Arithmetic Progressions Revision Notes
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380059', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380115', 'Revision Notes: Arithmetic Progressions', 'note', NULL, NULL,
'# Chapter 5: Arithmetic Progressions

## 1. 🎯 Chapter Goal
Learn how to identify an Arithmetic Progression (AP), find its n-th term, and calculate the sum of its first n terms.

## 2. 🪝 Hook
Imagine saving money every day, adding exactly 10 rupees more than the day before. How much will you have in a year? Instead of adding 365 numbers manually, let''s use the magic of APs to find the answer in seconds!

## 3. 📖 Concept 1: What is an Arithmetic Progression?
An **[JARGON: Arithmetic Progression | A sequence of numbers where the difference between consecutive terms is constant | 2, 4, 6, 8... is an AP with a difference of 2]** (a list of numbers where each term is obtained by adding a fixed number to the preceding term) is characterized by its starting point and its step size.

The fixed number added is called the **[JARGON: Common Difference | The fixed number added to each term of an AP to get the next term | In the AP 10, 7, 4..., the common difference is -3]** (the difference between any term and its predecessor, denoted by $d$). Remember, $d$ can be positive, negative, or zero!

An AP can be a **[JARGON: Finite AP | An arithmetic progression that has a limited number of terms and ends with a last term | The AP 5, 10, 15, 20 is a finite AP]** (which has a last term) or an infinite AP (which goes on forever and does not have a last term).
- General Form of an AP: $a, a+d, a+2d, a+3d, \dots$ where $a$ is the first term.

## 4. 📖 Concept 2: The n-th Term of an AP
To find any term in an AP without writing out the whole list, we use the general formula.
- The **[JARGON: General Term | The formula representing any term in an AP based on its position n | The general term of an AP is a_n = a + (n-1)d]** (the formula for the n-th term, denoted by $a_n$) is defined as:
  $$a_n = a + (n-1)d$$
- We use **[JARGON: Subscript notation | Writing a small number below a letter to show its position in a sequence | a_1 means the first term, and a_n means the n-th term]** (the placement of numbers below letters) to denote terms: $a_1$ is the first term, $a_2$ is the second, and $a_n$ is the n-th term.
- The **[JARGON: Term Position | The positive integer representing the place of a term in a sequence | In the sequence 5, 10, 15, the position of 15 is n = 3]** (the position $n$) must always be a positive integer ($1, 2, 3, \dots$).

### Worked Example:
Find the 12th term of the AP: $-3, -1, 1, 3, \dots$
- First term $a = -3$
- Common difference $d = -1 - (-3) = 2$
- Position $n = 12$
- $a_{12} = a + (12-1)d = -3 + 11(2) = -3 + 22 = 19$.

## 5. 📖 Concept 3: Sum of First n Terms of an AP
If we want to find the sum of all terms up to a certain point, we use the sum formula.
- The **[JARGON: Sum of n terms | The total value obtained by adding the first n terms of an AP together | The sum of the first 4 terms of 1, 2, 3, 4... is 10]** (denoted by $S_n$) represents the total value.
- An **[JARGON: Arithmetic Series | The sum of the terms of an arithmetic progression | 2 + 4 + 6 + 8 is an arithmetic series]** (the indicated sum of an AP) can be summed using:
  $$S_n = \frac{n}{2}[2a + (n-1)d]$$
- If we know the **[JARGON: Last Term | The final term of a finite arithmetic progression, often denoted by l | In the AP 3, 5, 7, 9, the last term is 9]** (denoted by $l$ or $a_n$), we can use a simpler formula:
  $$S_n = \frac{n}{2}[a + l]$$

### Worked Example:
Find the sum of the first 15 terms of the AP: $5, 8, 11, \dots$
- $a = 5$, $d = 3$, $n = 15$.
- $S_{15} = \frac{15}{2}[2(5) + (15-1)3] = 7.5[10 + 14(3)] = 7.5[10 + 42] = 7.5(52) = 390$.

## 6. ⚠️ Common Mistakes
- Confusing $n$ (the position of the term) with $a_n$ (the actual value of the term).
- Writing $n$ as a fraction or negative number. Remember, term positions must be positive integers!
- Substituting a negative common difference $d$ without parentheses, which causes subtraction errors instead of multiplication: e.g., writing $2 + 9 - 3$ instead of $2 + 9(-3)$.

## 7. 💡 Memory Tricks
- **n is a Ladder Step**: You can stand on step 1, 2, or 3, but never on step 2.5! So $n$ is always a positive integer.
- **Average times Count**: The sum formula $S_n = n \times \frac{a+l}{2}$ is just the number of terms ($n$) times the average of the first and last terms.

## 8. 📝 Quick Practice
- **Question 1**: Find the 10th term of the AP: $2, 7, 12, \dots$
  - *Answer*: $a = 2$, $d = 5$, $n = 10$. $a_{10} = 2 + (10-1)5 = 2 + 45 = 47$.
- **Question 2**: Find the sum of the first 10 terms of the AP: $6, 3, 0, -3, \dots$
  - *Answer*: $a = 6$, $d = -3$, $n = 10$. $S_{10} = \frac{10}{2}[2(6) + (10-1)(-3)] = 5[12 - 27] = 5(-15) = -75$.

## 9. 🎓 Board Tips
- If the question says "Find three terms in an AP", choose them as $a-d$, $a$, and $a+d$. Their sum will immediately give you $3a$, simplifying your work!
- Always verify your answers. If you get a fractional value for $n$, check your calculations immediately.

## 10. 🔄 One-Minute Revision
- Common difference $d = a_k - a_{k-1}$ is always constant.
- The n-th term is $a_n = a + (n-1)d$.
- The sum of first n terms is $S_n = \frac{n}{2}[2a + (n-1)d] = \frac{n}{2}[a + l]$.
- $n$ must be a positive integer.

## 11. 🎬 Comic Recap
```
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "Priya: I am saving 5 rupees today, │
│         7 tomorrow, 9 the next day. Is this│
│         an AP?"                            │
│ Rahul: "Rahul: Yes! The common difference │
│         d is 2, and the first term a is 5."│
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "Priya: How do I find my savings on │
│         the 30th day?"                     │
│ Rahul: "Rahul: Use the formula:            │
│         a_30 = a + 29d. You get            │
│         5 + 29*2 = 63 rupees!"             │
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "Priya: What is the total sum I     │
│         saved in 30 days?"                 │
│ Rahul: "Rahul: S_30 = 30/2 * (a + a_30).   │
│         That is 15 * (5 + 63) = 1020!"     │
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ a_n = a + (n-1)d                           │
│ S_n = n/2 * [2a + (n-1)d] = n/2 * [a + l]   │
└────────────────────────────────────────────┘
```', TRUE, 3),

-- Chapter 6: Triangles Revision Notes
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380069', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380116', 'Revision Notes: Triangles', 'note', NULL, NULL,
'# Chapter 6: Triangles

## 1. 🎯 Chapter Goal
Master the concepts of similarity, understand and prove the Basic Proportionality Theorem (Thales Theorem), and apply similarity criteria (AA, SSS, SAS) to solve problems.

## 2. 🪝 Hook
Architects make tiny 3D scale models of skyscrapers before building them. The model looks exactly like the real building, but in a smaller size. This is the power of similarity! Let''s explore how scale factors help us measure heights of mountains without climbing them.

## 3. 📖 Concept 1: Similarity of Polygons
Two shapes can look alike without being identical in size.
- We call them **[JARGON: Similar Figures | Geometric figures that have the same shape but not necessarily the same size | Any two circles are always similar]** (figures with equal corresponding angles and proportional corresponding sides).
- The ratio of corresponding sides is called the **[JARGON: Scale Factor | The ratio of the corresponding sides of two similar polygons | If a map scale is 1 cm to 1 km, the scale factor is 1:100000]** (the ratio of corresponding side lengths, also called Representative Fraction).
- In contrast, **[JARGON: Congruent Figures | Figures that have exactly the same shape and the same size | Two identical pages from the same notebook are congruent]** must have identical shapes and identical sizes.
- Two polygons of the same number of sides are similar if: (i) corresponding angles are equal, and (ii) corresponding sides are in the same ratio.

## 4. 📖 Concept 2: Basic Proportionality Theorem (BPT)
A line parallel to one side of a triangle divides the other two sides in the same ratio.
- The **[JARGON: Basic Proportionality Theorem | A theorem stating that a line parallel to one side of a triangle divides the other two sides in the same ratio | In triangle ABC, if DE is parallel to BC, then AD/DB = AE/EC]** (also known as Thales Theorem) states that if $DE \parallel BC$, then $\frac{AD}{DB} = \frac{AE}{EC}$.
- The **[JARGON: Converse of BPT | If a line divides any two sides of a triangle in the same ratio, it must be parallel to the third side | In triangle ABC, if AD/DB = AE/EC, then DE is parallel to BC]** is also true: if $\frac{AD}{DB} = \frac{AE}{EC}$, then $DE \parallel BC$.
- The theorem is named **[JARGON: Thales Theorem | The historical name for the Basic Proportionality Theorem, named after the ancient Greek mathematician Thales | Thales used this theorem to find the height of pyramids]** (named after the famous Greek mathematician Thales).

## 5. 📖 Concept 3: Criteria for Similarity of Triangles
We do not need to check all angles and sides to prove triangles are similar. We can use standard criteria:
- **[JARGON: AA Similarity | A criterion stating that if two angles of one triangle are equal to two angles of another, the triangles are similar | If angle A = angle D and angle B = angle E, then triangle ABC is similar to triangle DEF]** (Angle-Angle): If two angles of one triangle are equal to two angles of another, their third angles are automatically equal, making them similar.
- **[JARGON: SSS Similarity | A criterion stating that if the corresponding sides of two triangles are in the same ratio, the triangles are similar | If AB/DE = BC/EF = AC/DF, the triangles are similar and their corresponding angles are equal]** (Side-Side-Side): If corresponding sides are proportional, their corresponding angles will automatically be equal.
- **[JARGON: SAS Similarity | A criterion stating that if one angle of a triangle equals one angle of another, and the sides containing these angles are proportional, the triangles are similar | If angle A = angle D and AB/DE = AC/DF, then triangle ABC is similar to triangle DEF]** (Side-Angle-Side): If one angle of a triangle equals one angle of another, and the sides containing these angles are in the same ratio, they are similar.

## 6. ⚠️ Common Mistakes
- Writing similarity statements without matching corresponding vertices: writing $\Delta ABC \sim \Delta DEF$ is wrong if vertex $A$ corresponds to $E$.
- Confusing the BPT side ratio with similarity side ratio: in $\Delta ABC$ with $DE \parallel BC$, BPT gives $\frac{AD}{DB} = \frac{AE}{EC}$, but similarity gives $\frac{AD}{AB} = \frac{DE}{BC}$. Don''t mix them up!
- Assuming two triangles are similar just because their corresponding sides are equal. That proves congruence, which is a special case of similarity (scale factor = 1).

## 7. 💡 Memory Tricks
- **AA is Enough**: A triangle has only three angles. If two angles are locked (equal), the third angle must also be locked due to the Angle Sum Property ($180^\circ$).
- **BPT splits, Similarity scales**: BPT divides the segments on the sides ($\frac{\text{top}}{\text{bottom}}$), while similarity compares the small triangle to the whole triangle ($\frac{\text{small side}}{\text{large side}}$).

## 8. 📝 Quick Practice
- **Question 1**: In $\Delta ABC$, $DE \parallel BC$. If $AD = 2\text{ cm}$, $DB = 3\text{ cm}$, and $AE = 4\text{ cm}$, find $EC$.
  - *Answer*: By BPT: $\frac{AD}{DB} = \frac{AE}{EC} \implies \frac{2}{3} = \frac{4}{EC} \implies 2 \cdot EC = 12 \implies EC = 6\text{ cm}$.
- **Question 2**: A vertical pole of length $6\text{ m}$ casts a shadow $4\text{ m}$ long on the ground, and at the same time a tower casts a shadow $28\text{ m}$ long. Find the height of the tower.
  - *Answer*: The triangles are similar by AA similarity (both have a $90^\circ$ angle with the ground and the same angle of elevation of the sun). So, $\frac{\text{Tower Height}}{\text{Pole Height}} = \frac{\text{Tower Shadow}}{\text{Pole Shadow}} \implies \frac{H}{6} = \frac{28}{4} \implies H = 6 \times 7 = 42\text{ m}$.

## 9. 🎓 Board Tips
- Always check the order of letters when writing similarity. If $\Delta ABC \sim \Delta PQR$, then $\frac{AB}{PQ} = \frac{BC}{QR} = \frac{AC}{PR}$.
- When solving geometry proofs, write down the "Given", "To Prove", "Construction", and "Proof" steps clearly. The board examiners award marks for each step!

## 10. 🔄 One-Minute Revision
- Similar figures have the same shape but not necessarily the same size.
- BPT: If $DE \parallel BC$, then $AD/DB = AE/EC$.
- AA: 2 equal angles = similar triangles.
- SSS: 3 proportional sides = similar triangles.
- SAS: 2 proportional sides and 1 equal included angle = similarity.

## 11. 🎬 Comic Recap
```
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "Priya: Look at these two triangles.│
│         All their angles match, but one is │
│         double the size of the other!"     │
│ Rahul: "Rahul: They are similar! Their     │
│         corresponding sides are in a 1:2   │
│         ratio."                            │
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "Priya: If I draw a line parallel to│
│         the base of a triangle, what       │
│         happens to the sides?"             │
│ Rahul: "Rahul: That is Thales Theorem! The │
│         parallel line cuts the two sides in│
│         the exact same ratio."             │
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "Priya: So how do we find a tall    │
│         tree''s height using its shadow?"   │
│ Rahul: "Rahul: Use AA similarity! Tree   │
│         height / stick height = tree shadow│
│         / stick shadow. Simple!"           │
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ BPT: AD/DB = AE/EC when DE || BC           │
│ Similar: Angles equal, sides in ratio.     │
└────────────────────────────────────────────┘
```', TRUE, 3),

-- Chapter 7: Coordinate Geometry Revision Notes
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380079', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380117', 'Revision Notes: Coordinate Geometry', 'note', NULL, NULL,
'# Chapter 7: Coordinate Geometry

## 1. 🎯 Chapter Goal
Master the Cartesian coordinate system, learn the distance and section formulas, and apply them to solve geometric problems on a plane.

## 2. 🪝 Hook
How does your phone''s GPS track your exact location on a map? It uses a grid system just like the Cartesian plane! By calculating the distance between your coordinates and satellite positions, it pinpoints you. Let''s learn the formulas that make digital mapping possible!

## 3. 📖 Concept 1: The Distance Formula
We can find the straight-line distance between any two points on a flat grid using their coordinates.
- The **[JARGON: Distance Formula | The algebraic formula used to find the straight-line distance between two points | The distance between (0,0) and (3,4) is 5]** calculates the distance $d$ between points $P(x_1, y_1)$ and $Q(x_2, y_2)$:
  $$PQ = \sqrt{(x_2 - x_1)^2 + (y_2 - y_1)^2}$$
- The horizontal value of a coordinate is called the **[JARGON: Abscissa | The x-coordinate of a point, representing its horizontal distance from the y-axis | In the point (4, 7), the abscissa is 4]** (the x-coordinate).
- The vertical value of a coordinate is called the **[JARGON: Ordinate | The y-coordinate of a point, representing its vertical distance from the x-axis | In the point (4, 7), the ordinate is 7]** (the y-coordinate).
- The distance of a point $P(x, y)$ from the origin $(0, 0)$ simplifies to $\sqrt{x^2 + y^2}$.

## 4. 📖 Concept 2: Geometric Applications of Distance Formula
We can analyze shapes and lines algebraically by finding the distances between vertices.
- To check if points lie on a single line, we identify **[JARGON: Collinear Points | Three or more points that lie on the same straight line | Points A, B, and C are collinear if AB + BC = AC]** (points that satisfy $AB + BC = AC$).
- If a point is the same distance from two other points, it is **[JARGON: Equidistant | Being at an equal distance from a given point or line | The point (0, 2) is equidistant from (3, 2) and (-3, 2)]** (equal distance from each).
- We can verify if four points form a **[JARGON: Rhombus | A quadrilateral with all four sides equal | Vertices form a rhombus if AB = BC = CD = DA and diagonals AC != BD]** by showing all sides are equal but their diagonals are not equal. If diagonals are also equal, it is a square!

## 5. 📖 Concept 3: Section Formula & Midpoint Formula
We can find the coordinates of a point that cuts a line segment into parts.
- The **[JARGON: Section Formula | A formula that finds the coordinates of a point dividing a line segment in a given ratio | The point dividing (1,1) and (3,3) in a 1:1 ratio is (2,2)]** gives the coordinates of point $P(x, y)$ dividing the segment $AB$ in the ratio $m_1 : m_2$:
  $$x = \frac{m_1x_2 + m_2x_1}{m_1 + m_2}, \quad y = \frac{m_1y_2 + m_2y_1}{m_1 + m_2}$$
- The **[JARGON: Midpoint Formula | A special case of the section formula where a point divides a segment into two equal parts | The midpoint of (2,4) and (6,8) is (4,6)]** divides the segment into a $1:1$ ratio:
  $$x = \frac{x_1 + x_2}{2}, \quad y = \frac{y_1 + y_2}{2}$$
- This formula applies to **[JARGON: Internal Division | When the dividing point lies on the line segment between the two endpoints | Point P divides AB internally if P lies between A and B]** (where the point lies strictly between the segment endpoints).

## 6. ⚠️ Common Mistakes
- Swapping signs inside the distance formula: writing $(x_2 + x_1)^2$ instead of $(x_2 - x_1)^2$.
- Mixing up the ratio terms: remember that $m_1$ on the left multiplies $x_2$ on the right, and $m_2$ multiplies $x_1$. Don''t multiply $m_1$ with $x_1$!
- Forgetting that the coordinates of a point on the x-axis are $(x, 0)$ and on the y-axis are $(0, y)$.

## 7. 💡 Memory Tricks
- **Cross Multiplication**: In the section formula, visualize the ratio crossing over: $m_1$ on the left side reaches over to multiply the coordinates of point $B$ on the right, and vice versa.
- **Midpoint is average**: The midpoint is just the average of the two x-coordinates and the average of the two y-coordinates.

## 8. 📝 Quick Practice
- **Question 1**: Find the distance between the points $A(-1, 5)$ and $B(2, 1)$.
  - *Answer*: $d = \sqrt{(2 - (-1))^2 + (1 - 5)^2} = \sqrt{3^2 + (-4)^2} = \sqrt{9 + 16} = \sqrt{25} = 5$ units.
- **Question 2**: Find the coordinates of the midpoint of the line segment joining $(-3, 4)$ and $(7, -2)$.
  - *Answer*: $x = \frac{-3 + 7}{2} = \frac{4}{2} = 2$. $y = \frac{4 + (-2)}{2} = \frac{2}{2} = 1$. The midpoint is $(2, 1)$.

## 9. 🎓 Board Tips
- If you need to find the ratio in which a point divides a line segment, always assume the ratio to be $k : 1$ instead of $m_1 : m_2$. This reduces the number of variables to one ($k$) and makes the algebra much simpler!
- Always write the formulas clearly before substituting the coordinates. This secures step-marking even if your final arithmetic has an error.

## 10. 🔄 One-Minute Revision
- Distance formula: $d = \sqrt{(x_2-x_1)^2 + (y_2-y_1)^2}$.
- Distance from origin: $d = \sqrt{x^2+y^2}$.
- Section formula: $x = \frac{m_1x_2 + m_2x_1}{m_1+m_2}, y = \frac{m_1y_2 + m_2y_1}{m_1+m_2}$.
- Midpoint: $x = \frac{x_1+x_2}{2}, y = \frac{y_1+y_2}{2}$.

## 11. 🎬 Comic Recap
```
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "Priya: I have two points on a map, │
│         (1, 2) and (4, 6). How far apart   │
│         are they?"                         │
│ Rahul: "Rahul: Use the distance formula!   │
│         d = sqrt((4-1)^2 + (6-2)^2)        │
│         = sqrt(9 + 16) = 5 units."         │
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "Priya: What if we want to meet     │
│         exactly halfway between us?"       │
│ Rahul: "Rahul: That is the midpoint!       │
│         Add the coordinates and divide by  │
│         2. So, ((1+4)/2, (2+6)/2) = (2.5,4)│
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "Priya: And if we divide the path   │
│         in a 2:1 ratio?"                   │
│ Rahul: "Rahul: Use the section formula!    │
│         x = (2*4 + 1*1)/(2+1) = 9/3 = 3.   │
│         y = (2*6 + 1*2)/(2+1) = 14/3!"     │
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ Midpoint = ((x1+x2)/2, (y1+y2)/2)          │
│ Section: x = (m1*x2 + m2*x1)/(m1+m2)       │
└────────────────────────────────────────────┘
```', TRUE, 3),

-- Chapter 8: Introduction to Trigonometry Revision Notes
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380089', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380118', 'Revision Notes: Introduction to Trigonometry', 'note', NULL, NULL,
'# Chapter 8: Introduction to Trigonometry

## 1. 🎯 Chapter Goal
Understand the six trigonometric ratios, memorize their values for standard angles (0, 30, 45, 60, 90 degrees), and master proving identities using algebraic simplification.

## 2. 🪝 Hook
How do engineers build giant bridges across rivers or measure the distance to stars? They can''t run a measuring tape across! They use trigonometry, which links the angles of a right triangle to its side ratios. Let''s learn the core ratios that let us measure the unmeasurable!

## 3. 📖 Concept 1: Trigonometric Ratios
Trigonometry is the study of relationships between the sides and angles of a triangle.
- The **[JARGON: Trigonometric Ratios | Ratios of the sides of a right triangle with respect to its acute angles | sine, cosine, and tangent are trigonometric ratios]** define side proportions for acute angle $A$ in right triangle $ABC$:
  $$\sin A = \frac{\text{Opposite}}{\text{Hypotenuse}}, \quad \cos A = \frac{\text{Adjacent}}{\text{Hypotenuse}}, \quad \tan A = \frac{\text{Opposite}}{\text{Adjacent}}$$
- The longest side, opposite to the right angle, is the **[JARGON: Hypotenuse | The longest side of a right-angled triangle, opposite to the right angle | In a triangle with sides 3, 4, 5, the hypotenuse is 5]** (always denoted by $AC$ if right-angled at $B$).
- The remaining three ratios are **[JARGON: Reciprocal Ratios | Ratios that are multiplicative inverses of each other | cosec A is the reciprocal of sin A, sec A of cos A, and cot A of tan A]** (multiplicative inverses of the primary three ratios):
  $$\operatorname{cosec} A = \frac{1}{\sin A}, \quad \sec A = \frac{1}{\cos A}, \quad \cot A = \frac{1}{\tan A}$$

## 4. 📖 Concept 2: Ratios of Specific Angles
We can calculate exact values for standard acute angles by using geometric proofs.
- These standard angles are called **[JARGON: Specific Angles | Standard angles of 0, 30, 45, 60, and 90 degrees used in basic trigonometry | The value of sin 30 is 1/2, and cos 45 is 1/sqrt(2)]** (often used standard angles).
- Some ratios involve dividing by zero, which results in an **[JARGON: Undefined Ratio | A trigonometric value that requires division by zero | tan 90 is undefined because cos 90 is 0]** (like $\tan 90^\circ$ or $\operatorname{cosec} 0^\circ$).
- The table of **[JARGON: Standard Values | Fixed numerical ratios for standard acute angles | sin 60 is sqrt(3)/2]** is:
  - $\sin: 0^\circ=0, \ 30^\circ=1/2, \ 45^\circ=1/\sqrt{2}, \ 60^\circ=\sqrt{3}/2, \ 90^\circ=1$
  - $\cos: 0^\circ=1, \ 30^\circ=\sqrt{3}/2, \ 45^\circ=1/\sqrt{2}, \ 60^\circ=1/2, \ 90^\circ=0$
  - $\tan: 0^\circ=0, \ 30^\circ=1/\sqrt{3}, \ 45^\circ=1, \ 60^\circ=\sqrt{3}, \ 90^\circ=\text{Undefined}$

## 5. 📖 Concept 3: Trigonometric Identities
An equation involving trigonometric ratios that holds true for all angle values is an identity.
- A **[JARGON: Trigonometric Identity | An equation involving trigonometric ratios that is true for all values of the variables | sin^2 A + cos^2 A = 1 is a fundamental identity]** is always true.
- The fundamental relations are called **[JARGON: Pythagorean Identities | Ratios squared and added to equal 1 or another term, derived from Pythagoras Theorem | 1 + tan^2 A = sec^2 A is a Pythagorean identity]** because they are derived from Pythagoras theorem:
  $$\sin^2 A + \cos^2 A = 1$$
  $$1 + \tan^2 A = \sec^2 A \quad (\text{for } 0^\circ \le A < 90^\circ)$$
  $$1 + \cot^2 A = \operatorname{cosec}^2 A \quad (\text{for } 0^\circ < A \le 90^\circ)$$
- Another basic relation is the **[JARGON: Quotient Identity | Ratios expressed as the quotient of other ratios | tan A = sin A / cos A is a quotient identity]**: $\tan A = \frac{\sin A}{\cos A}$.

## 6. ⚠️ Common Mistakes
- Writing $\sin^2 A$ as $\sin A^2$. Remember, $\sin^2 A = (\sin A)^2$, whereas $\sin A^2$ is the sine of the squared angle!
- Incorrectly identifying the opposite and adjacent sides: the opposite side is always directly opposite the chosen acute angle. If you change from angle $A$ to angle $C$, the opposite and adjacent sides swap!
- Forgetting that $\sin A$ and $\cos A$ can never exceed $1$ (since the hypotenuse is the longest side, the ratio is always $\le 1$).

## 7. 💡 Memory Tricks
- **SOH CAH TOA**:
  - **S**ine = **O**pposite / **H**ypotenuse
  - **C**osine = **A**djacent / **H**ypotenuse
  - **T**angent = **O**pposite / **A**djacent
- **Hand Trick**: Number your fingers from thumb ($0^\circ$) to pinky ($90^\circ$). The value of sine for any finger is $\frac{\sqrt{\text{fingers below}}}{2}$.

## 8. 📝 Quick Practice
- **Question 1**: If $\sin A = 3/5$ in a right triangle, find $\cos A$ and $\tan A$.
  - *Answer*: Since $\sin A = \text{Opposite}/\text{Hypotenuse} = 3/5$, by Pythagoras theorem, the adjacent side is $\sqrt{5^2 - 3^2} = 4$. Therefore, $\cos A = 4/5$ and $\tan A = 3/4$.
- **Question 2**: Evaluate $\sin^2 30^\circ + \cos^2 30^\circ$.
  - *Answer*: Without even checking the table, the identity $\sin^2 A + \cos^2 A = 1$ tells us the sum is 1. (Check: $(1/2)^2 + (\sqrt{3}/2)^2 = 1/4 + 3/4 = 1$).

## 9. 🎓 Board Tips
- When proving identities, write everything in terms of sine and cosine (e.g. rewrite $\tan \theta = \sin \theta/\cos \theta$ and $\sec \theta = 1/\cos \theta$). This simplifies the algebra tremendously!
- Always state which identities you are using in parentheses on the right side of your proof steps.

## 10. 🔄 One-Minute Revision
- $\sin = \text{Opp/Hyp}$, $\cos = \text{Adj/Hyp}$, $\tan = \text{Opp/Adj}$.
- Reciprocals: $\operatorname{cosec} = 1/\sin$, $\sec = 1/\cos$, $\cot = 1/\tan$.
- Identities: $\sin^2 A + \cos^2 A = 1$, $1 + \tan^2 A = \sec^2 A$, $1 + \cot^2 A = \operatorname{cosec}^2 A$.

## 11. 🎬 Comic Recap
```
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "Priya: What is the difference      │
│         between sine and cosine?"          │
│ Rahul: "Rahul: Sine is Opposite/Hypotenuse,│
│         Cosine is Adjacent/Hypotenuse.     │
│         SOH-CAH-TOA!"                      │
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "Priya: I can never remember the    │
│         value of tan 60. Help!"            │
│ Rahul: "Rahul: tan 60 = sin 60 / cos 60    │
│         = (sqrt(3)/2) / (1/2)              │
│         = sqrt(3)!"                        │
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "Priya: What is the magic identity  │
│         that connects sine and cosine?"    │
│ Rahul: "Rahul: sin^2 A + cos^2 A = 1.      │
│         It comes straight from the         │
│         Pythagorean Theorem!"              │
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ sin^2 A + cos^2 A = 1                      │
│ tan A = sin A / cos A                      │
└────────────────────────────────────────────┘
```', TRUE, 3),

-- Chapter 9: Some Applications of Trigonometry Revision Notes
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380119', 'Revision Notes: Some Applications of Trigonometry', 'note', NULL, NULL,
'# Chapter 9: Some Applications of Trigonometry

## 1. 🎯 Chapter Goal
Master the concepts of line of sight, angle of elevation, and angle of depression, and use trigonometric ratios to calculate actual heights and distances in real-world scenarios.

## 2. 🪝 Hook
How do aviators determine the altitude of their planes, or how do ship captains know how far they are from a lighthouse? They don''t jump down to measure! They measure the angle from the horizontal and use basic trigonometry. Let''s find out how!

## 3. 📖 Concept 1: Key Definitions (Line of Sight, Elevation, Depression)
To solve real-world distance problems, we must understand how an observer looks at an object.
- The imaginary line from the eye to the object is called the **[JARGON: Line of Sight | The straight line drawn from the observer''s eye to the object being viewed | When you look at the top of a tree, the imaginary line from your eyes to the treetop is the line of sight]** (the path of vision).
- Looking up at an object above eye level forms the **[JARGON: Angle of Elevation | The angle between the line of sight and the horizontal line when the object is above horizontal level | Looking up at a flying kite forms an angle of elevation]** (the angle between horizontal and line of sight).
- Looking down at an object below eye level forms the **[JARGON: Angle of Depression | The angle between the line of sight and the horizontal line when the object is below horizontal level | Looking down from a bridge at a boat forms an angle of depression]** (measured from the horizontal line down to the line of sight).

## 4. 📖 Concept 2: Solving Single-Triangle Problems
For scenarios involving a single observer and one height, we model the situation with a single right triangle.
- We set up a **[JARGON: Right Triangle Model | Using a right-angled triangle to represent a real-world vertical object and its horizontal distance | A building represents the vertical side, its shadow represents the base]** (a right-angled triangle where the vertical object is perpendicular to the ground).
- The slope of the line of sight is the **[JARGON: Angle of Inclination | The angle at which a line or plane is inclined to the horizontal | A ladder leaning against a wall has an angle of inclination]** (angle of the hypotenuse).
- The height of the tower or wall is the **[JARGON: Vertical Height | The perpendicular height of an object from the ground level | A pole standing vertically has a height of 5 meters]** (the side opposite to the ground angle).
- We use $\tan \theta = \frac{\text{Height}}{\text{Distance}}$ to solve for the missing side.

## 5. 📖 Concept 3: Solving Double-Triangle Problems
Many problems involve tracking an object from two different points or comparing two different heights, which creates two right triangles.
- We must solve **[JARGON: Simultaneous Trigonometric Equations | A set of two trigonometric equations solved together to find unknown heights or distances | Solving tan 30 = h/x and tan 60 = h/(x-10) to find h]** by expressing one variable in terms of another.
- An observer may view two different points, creating a **[JARGON: Combined Elevation and Depression | A scenario involving both looking up at a top and looking down at a base from a single vantage point | Looking from a balcony at the top and foot of a tower across the street]** scenario.
- Sometimes the observer moves, and we track the **[JARGON: Distance between two points of observation | The horizontal distance travelled or separation between two vantage points | Observing a balloon from point A, then walking 20 meters closer to point B]** (the segment between the two vertices on the ground).

## 6. ⚠️ Common Mistakes
- Drawing the angle of depression inside the triangle incorrectly: the angle of depression is measured from the horizontal line at the top, not the vertical wall!
- Forgetting that the angle of depression equals the angle of elevation from the object to the observer (alternate interior angles are equal).
- Forgetting to include the height of the observer: if an observer is $1.5\text{ m}$ tall, the total height of a building is the calculated triangle height $h$ plus $1.5\text{ m}$.

## 7. 💡 Memory Tricks
- **Depression equals Elevation**: Always draw a horizontal line at the top, mark the angle of depression, and then immediately copy it as the angle of elevation at the bottom using alternate interior angles ($Z$-shape).
- **Tangent is King**: In $90\%$ of applications of trigonometry problems, you will use the tangent ratio ($\tan \theta = \text{Opposite}/\text{Adjacent}$).

## 8. 📝 Quick Practice
- **Question 1**: A vertical pole stands on the ground. From a point on the ground $15\text{ m}$ away from the foot of the pole, the angle of elevation of the top is $60^\circ$. Find the height of the pole.
  - *Answer*: Let height be $h$. In the right triangle, $\tan 60^\circ = h/15 \implies \sqrt{3} = h/15 \implies h = 15\sqrt{3}\text{ m}$.
- **Question 2**: A ladder leaning against a wall makes an angle of $60^\circ$ with the ground. If the foot of the ladder is $2.5\text{ m}$ away from the wall, find the length of the ladder.
  - *Answer*: Let the length of the ladder (hypotenuse) be $L$. We know adjacent side is $2.5\text{ m}$. So, $\cos 60^\circ = 2.5 / L \implies 1/2 = 2.5/L \implies L = 5\text{ m}$.

## 9. 🎓 Board Tips
- Always draw a neat diagram and label all vertices. Write a brief statement explaining what each side represents (e.g., "Let $AB$ represent the tower and $BC$ represent its shadow").
- Do not convert square roots to decimals (e.g. $15\sqrt{3}$ to $25.98$) unless the question explicitly asks you to substitute $\sqrt{3} = 1.732$.

## 10. 🔄 One-Minute Revision
- Line of sight: eye to object.
- Elevation: looking up from horizontal.
- Depression: looking down from horizontal.
- By alternate interior angles, angle of depression = angle of elevation.
- Use sine, cosine, and tangent ratios in right triangles to solve.

## 11. 🎬 Comic Recap
```
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "Priya: How can I find the height of│
│         a lighthouse from my boat?"        │
│ Rahul: "Rahul: Measure the angle of        │
│         elevation to the top! If you know  │
│         your distance, use tangent."       │
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "Priya: What if I look down at the  │
│         boat from the lighthouse top?"     │
│ Rahul: "Rahul: That is the angle of        │
│         depression, measured from the      │
│         horizontal. It equals the elevation│
│         from boat to top!"                 │
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "Priya: And if a balloon is moving, │
│         and I measure twice?"              │
│ Rahul: "Rahul: You get two right triangles │
│         sharing the same height. Solve two │
│         equations using tangent!"          │
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ Elevation = Depression                     │
│ tan theta = Height / Distance              │
└────────────────────────────────────────────┘
```', TRUE, 3)
ON CONFLICT (id) DO UPDATE SET note_content = EXCLUDED.note_content;


-- 3. INSERT QUIZZES
INSERT INTO quizzes (id, chapter_id, title, passing_percentage) VALUES
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380055', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380115', 'Mathematics Chapter 5 Quiz', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380066', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380116', 'Mathematics Chapter 6 Quiz', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380077', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380117', 'Mathematics Chapter 7 Quiz', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380088', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380118', 'Mathematics Chapter 8 Quiz', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380119', 'Mathematics Chapter 9 Quiz', 60)
ON CONFLICT (id) DO NOTHING;


-- 4. INSERT QUIZ QUESTIONS
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
-- Mathematics Chapter 5 Quiz Questions
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380511', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380055', 'What is the common difference of the AP: 3, 1, -1, -3, ...?', 'multiple_choice', '["A. 2", "B. -2", "C. 3", "D. -1"]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380512', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380055', 'If the first term of an AP is -5 and the common difference is 2, what is the 6th term?', 'multiple_choice', '["A. 5", "B. 7", "C. -3", "D. 3"]', 0, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380513', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380055', 'Which term of the AP: 21, 18, 15, ... is 0?', 'multiple_choice', '["A. 7th", "B. 8th", "C. 9th", "D. 10th"]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380514', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380055', 'What is the sum of the first 10 multiples of 6?', 'multiple_choice', '["A. 330", "B. 300", "C. 420", "D. 360"]', 0, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380515', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380055', 'If the sum of first n terms of an AP is S_n = 3n^2 + 5n, what is its first term?', 'multiple_choice', '["A. 3", "B. 5", "C. 8", "D. 11"]', 2, NULL, 1),

-- Mathematics Chapter 6 Quiz Questions
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380611', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380066', 'All congruent figures are similar, but similar figures:', 'multiple_choice', '["A. Are always congruent", "B. Need not be congruent", "C. Are never congruent", "D. Have different shapes"]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380612', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380066', 'In \Delta ABC, DE || BC intersects AB at D and AC at E. If AD = 3 cm, DB = 4 cm, and AC = 14 cm, find AE.', 'multiple_choice', '["A. 6 cm", "B. 8 cm", "C. 5 cm", "D. 7 cm"]', 0, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380613', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380066', 'If in two triangles ABC and DEF, AB/DE = BC/FD, then they will be similar when:', 'multiple_choice', '["A. Angle B = Angle E", "B. Angle A = Angle D", "C. Angle B = Angle D", "D. Angle A = Angle F"]', 2, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380614', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380066', 'If \Delta ABC \sim \Delta PQR, with BC/QR = 1/3, then what is the ratio of AB/PQ?', 'multiple_choice', '["A. 1/9", "B. 1/3", "C. 3", "D. 9"]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380615', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380066', 'In \Delta ABC, if D and E are points on AB and AC such that AD = 2 cm, DB = 3 cm, AE = 3 cm, and EC = 4.5 cm, then:', 'multiple_choice', '["A. DE is parallel to BC", "B. DE is perpendicular to BC", "C. DE is not parallel to BC", "D. DE is equal to BC"]', 0, NULL, 1),

-- Mathematics Chapter 7 Quiz Questions
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380711', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380077', 'The distance of the point P(-6, 8) from the origin is:', 'multiple_choice', '["A. 8 units", "B. 2 sqrt(7) units", "C. 10 units", "D. 6 units"]', 2, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380712', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380077', 'The midpoint of the line segment joining the points A(-2, 8) and B(-6, -4) is:', 'multiple_choice', '["A. (-4, 2)", "B. (4, -2)", "C. (-2, 4)", "D. (-4, 6)"]', 0, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380713', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380077', 'If the distance between the points (x, -1) and (3, 2) is 5, then the value of x is:', 'multiple_choice', '["A. -7 or 1", "B. 7 or -1", "C. 7 or 1", "D. -7 or -1"]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380714', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380077', 'The coordinates of the point which divides the line segment joining A(1, 3) and B(2, 7) internally in the ratio 3:4 are:', 'multiple_choice', '["A. (10/7, 33/7)", "B. (9/7, 24/7)", "C. (11/7, 30/7)", "D. (10/7, 25/7)"]', 0, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380715', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380077', 'The point which lies on the perpendicular bisector of the line segment joining the points A(-2, -5) and B(2, 5) is:', 'multiple_choice', '["A. (0, 0)", "B. (0, 2)", "C. (2, 0)", "D. (-2, 0)"]', 0, NULL, 1),

-- Mathematics Chapter 8 Quiz Questions
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380811', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380088', 'If \cos A = 4/5, then the value of \tan A is:', 'multiple_choice', '["A. 3/5", "B. 3/4", "C. 4/3", "D. 5/3"]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380812', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380088', 'The value of (1 - \tan^2 45^\circ)/(1 + \tan^2 45^\circ) is:', 'multiple_choice', '["A. tan 90", "B. 1", "C. sin 45", "D. 0"]', 3, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380813', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380088', 'If \sin A + \sin^2 A = 1, then the value of the expression (\cos^2 A + \cos^4 A) is:', 'multiple_choice', '["A. 1", "B. 1/2", "C. 2", "D. 3"]', 0, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380814', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380088', 'The value of (\sin 30^\circ + \cos 30^\circ) - (\sin 60^\circ + \cos 60^\circ) is:', 'multiple_choice', '["A. -1", "B. 0", "C. 1", "D. 2"]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380815', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380088', 'If 9 \sec^2 A - 9 \tan^2 A is evaluated, it equals:', 'multiple_choice', '["A. 1", "B. 9", "C. 8", "D. 0"]', 1, NULL, 1),

-- Mathematics Chapter 9 Quiz Questions
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380911', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', 'If the length of the shadow of a tower is equal to its height, then the angle of elevation of the sun is:', 'multiple_choice', '["A. 30 degrees", "B. 45 degrees", "C. 60 degrees", "D. 90 degrees"]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380912', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', 'A pole 6 m high casts a shadow 2\sqrt{3} m long on the ground, then the sun''s elevation is:', 'multiple_choice', '["A. 60 degrees", "B. 45 degrees", "C. 30 degrees", "D. 90 degrees"]', 0, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380913', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', 'If the angle of elevation of a cloud from a point h meters above a lake is \alpha and the angle of depression of its reflection in the lake is \beta, then the height of the cloud is:', 'multiple_choice', '["A. h(tan beta - tan alpha)/(tan beta + tan alpha)", "B. h(tan beta + tan alpha)/(tan beta - tan alpha)", "C. h(tan alpha + tan beta)/(tan alpha - tan beta)", "D. h"]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380914', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', 'An observer 1.5 m tall is 20.5 m away from a tower 22 m high. The angle of elevation of the top of the tower from their eye is:', 'multiple_choice', '["A. 30 degrees", "B. 45 degrees", "C. 60 degrees", "D. 0 degrees"]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380915', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', 'The angle of depression of a car parked on the road from the top of a 150 m high tower is 30^\circ. The distance of the car from the tower is:', 'multiple_choice', '["A. 50 sqrt(3) m", "B. 150 sqrt(3) m", "C. 150/sqrt(3) m", "D. 75 m"]', 1, NULL, 1)
ON CONFLICT (id) DO NOTHING;
-- CBSE Class 10 Learning Portal Seed Data - Batch 3 Mathematics Part 2
-- Generated on 2026-06-24
-- Format: Clean SQL with ON CONFLICT (id) DO NOTHING for safe re-runs.

-- 1. INSERT CHAPTERS
INSERT INTO chapters (id, subject_id, title, sequence_number, description) VALUES
('24ecc156-6eb1-5c70-b037-8178dcf7d67b', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Chapter 10: Circles', 10, 'Study tangents to a circle, properties of tangents, and theorems on tangent length from external points.'),
('b320dba8-c80a-5877-b1e4-636af314d2d0', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Chapter 11: Areas Related to Circles', 11, 'Calculate the area and perimeter of a circle, areas of sectors (minor and major), and segments of a circle.'),
('d79d640e-96cf-545a-b6c8-93a5e3c4409e', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Chapter 12: Surface Areas and Volumes', 12, 'Find the surface areas and volumes of combined solid shapes like cubes, cylinders, cones, spheres, and hemispheres.'),
('1c5f32ec-ebc1-5179-92d1-f1deaf3c87bc', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Chapter 13: Statistics', 13, 'Learn to find the Mean, Mode, and Median of grouped data using standard formulas.'),
('1c63fb5b-e508-513f-a52e-84708f7f7e4a', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Chapter 14: Probability', 14, 'Understand classical probability, outcomes, elementary and complementary events, sure and impossible events.')
ON CONFLICT (id) DO NOTHING;

-- 2. INSERT LESSONS
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('c3f70494-273f-5924-8b52-9ef6ce559bdf', '24ecc156-6eb1-5c70-b037-8178dcf7d67b', 'Revision Notes: Circles', 'note', NULL, NULL, '# Chapter 10: Circles

## 1. 🎯 Chapter Goal
Learn what a tangent is, why it is perpendicular to the radius at the point of contact, and how lengths of tangents from an external point are equal.

## 2. 🪝 Hook
Imagine a bicycle wheel rolling on the ground. The tire touches the flat road at exactly one point. That road is a tangent! Let''s explore how lines touch circles in the real world.

## 3. 📖 Concept 1: Tangents and Secants
A line that touches a circle at exactly one point is a **[JARGON: Tangent | A straight line that touches a circle at only one point | A flat road touching a rolling bicycle wheel is a tangent]** (a touching line). The point where it touches is the **[JARGON: Point of Contact | The single point where a tangent touches a circle | The exact spot where the bicycle tire touches the ground is the point of contact]** (the contact point). A line that cuts a circle at two points is a **[JARGON: Secant | A line that intersects a circle at two distinct points | A line cutting through a circle like a slice of bread is a secant]** (a cutting line).
- Example: A rolling wheel touches the road at one point of contact. This represents a tangent.

## 4. 📖 Concept 2: Perpendicular Radius (Theorem 10.1)
The **[JARGON: Normal | The line containing the radius through the point of contact of a tangent | The perpendicular line drawn from the center of a wheel to the ground]** (normal to the tangent) is the radius. The tangent at any point of a circle is perpendicular to the radius through the point of contact.
- Theorem: If $P$ is the point of contact and $O$ is the centre, then the radius $OP$ is at $90^\circ$ to the tangent line.
- Example: In a bicycle wheel, the spoke that touches the ground is at a $90^\circ$ angle to the road.

## 5. 📖 Concept 3: Tangents from an External Point (Theorem 10.2)
From a point outside the circle, we can draw exactly two tangents. The lengths of these tangents are equal.
- Theorem: If $P$ is a point outside the circle, and $PQ$ and $PR$ are tangents touching the circle at $Q$ and $R$, then $PQ = PR$.
- Proof Outline: Join $OP$, $OQ$, and $OR$. Since $\angle OQP = \angle ORP = 90^\circ$, right triangles $\Delta OQP$ and $\Delta ORP$ are congruent by RHS rule (since $OQ = OR$ as radii and $OP$ is common). This gives $PQ = PR$ by CPCT.
- Example: The two strings of a pulley pulling water from a well act as two equal tangents to the pulley circle.

## 6. ⚠️ Common Mistakes
- Drawing more than two tangents from an external point. You can only draw exactly two!
- Thinking a tangent can pass through the inside of a circle. If it goes inside, it becomes a secant!
- Forgetting that the angle between the radius and the tangent is $90^\circ$.

## 7. 💡 Memory Tricks
- **Tan-Gentle**: A tangent gently touches the circle at only one point, it never cuts through!
- **T-Shape perpendicular**: The radius and the tangent meet at the point of contact to form a perfect "T" ($90^\circ$).

## 8. 📝 Quick Practice
- **Question 1**: A tangent $PQ$ at a point $P$ of a circle of radius $5\text{ cm}$ meets a line through the centre $O$ at a point $Q$ so that $OQ = 12\text{ cm}$. Find the length of $PQ$.
  - *Answer*: By Pythagoras theorem, $OP^2 + PQ^2 = OQ^2 \implies 5^2 + PQ^2 = 12^2 \implies 25 + PQ^2 = 144 \implies PQ^2 = 119 \implies PQ = \sqrt{119}\text{ cm}$.
- **Question 2**: How many parallel tangents can a circle have at most?
  - *Answer*: A circle can have at most 2 parallel tangents (at the opposite ends of a diameter).

## 9. 🎓 Board Tips
- The proof of Theorem 10.2 ($PQ = PR$) is very popular in exams. Use RHS congruence ($\\triangle OQP \\cong \\triangle ORP$) to prove it.
- Always draw a clear diagram showing the center $O$ and right angles at the points of contact.

## 10. 🔄 One-Minute Revision
- A tangent touches at one point; a secant cuts at two points.
- Only 2 tangents can be drawn from an external point.
- Tangent is perpendicular to the radius at the point of contact.
- Tangent lengths from an external point are equal.
- The center of the circle lies on the angle bisector of the two external tangents.

## 11. 🎬 Comic Recap
```
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "I tried to draw three tangents from│
│         a single point outside a circle,   │
│         but it keeps crossing the circle!" │
│ Rahul: "That is because it is impossible!  │
│         You can only draw exactly two      │
│         tangents from any external point." │
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "Oh! And they are always equal in   │
│         length, right?"                    │
│ Rahul: "Yes! They are twin lines. And they │
│         always meet the radius at a perfect│
│         90-degree angle."                  │
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "So the radius acts like a normal to│
│         the tangent. Got it!"              │
│ Rahul: "Exactly! OP is perpendicular to the│
│         tangent at point of contact P."    │
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ Tangent touches at 1 point.                │
│ Radius is perpendicular to tangent.        │
│ External tangents are equal: PQ = PR.      │
└────────────────────────────────────────────┘
```', TRUE, 3),
('8124287a-f33b-5250-b967-52ea9ea24f7c', 'b320dba8-c80a-5877-b1e4-636af314d2d0', 'Revision Notes: Areas Related to Circles', 'note', NULL, NULL, '# Chapter 11: Areas Related to Circles

## 1. 🎯 Chapter Goal
Understand how to find the area of a circle''s sector and segment using the sector angle $\theta$.

## 2. 🪝 Hook
Think of a delicious round pizza. When you cut a slice from the center, that slice is a sector! If you cut a straight piece near the edge, that piece is a segment. Let''s learn how to measure their sizes!

## 3. 📖 Concept 1: Sector of a Circle
A **[JARGON: Sector | The part of a circle enclosed by two radii and an arc | A slice of pizza cut from the center is a sector]** (a pie slice) is the region between two radii and their arc.
- Formula for Area: The area of a sector of angle $\theta$ is:
  $$\text{Area} = \frac{\theta}{360} \times \pi r^2$$
- Formula for Arc Length: The length of the corresponding **[JARGON: Arc | A portion of the circumference of a circle | The crust of a single slice of pizza is an arc]** (curved edge) is:
  $$\text{Length} = \frac{\theta}{360} \times 2\pi r$$
- Example: If a pizza has a radius of $14\text{ cm}$ and is cut into $8$ equal slices, the angle of each sector is $45^\circ$. The area of one slice is $\frac{45}{360} \times \pi \times 14^2 \approx 77\text{ cm}^2$.

## 4. 📖 Concept 2: Segment of a Circle
A **[JARGON: Segment | The region enclosed between a chord and an arc | A flat slice cut off the edge of a circular cookie is a segment]** (a chord cut-off) is the area between a chord and its arc.
- Formula for Area: We find it by subtracting the area of the triangle formed by the chord and radii from the sector area:
  $$\text{Area of Segment} = \text{Area of Sector} - \text{Area of Triangle}$$
  $$\text{Area} = \left(\frac{\theta}{360} \times \pi r^2\right) - \frac{1}{2} r^2 \sin\theta$$
- Example: A chord of a circle of radius $10\text{ cm}$ subtends a right angle at the centre. The area of the minor segment is $\text{Area of Sector} - \text{Area of Triangle} = \frac{90}{360} \times 3.14 \times 10^2 - \frac{1}{2} \times 10 \times 10 = 78.5 - 50 = 28.5\text{ cm}^2$.

## 5. 📖 Concept 3: Major and Minor Regions
When we split a circle, the smaller slice is the minor region, and the larger leftover part is the major region.
- Formula for Major Sector:
  $$\text{Area of Major Sector} = \pi r^2 - \text{Area of Minor Sector}$$
- Formula for Major Segment:
  $$\text{Area of Major Segment} = \pi r^2 - \text{Area of Minor Segment}$$
- Example: If the minor sector area is $50\text{ cm}^2$ in a circle of total area $314\text{ cm}^2$, the major sector area is $314 - 50 = 264\text{ cm}^2$.

## 6. ⚠️ Common Mistakes
- Using the wrong angle for the major sector. Remember, the major sector angle is $360^\circ - \theta$.
- Mixing up the formulas for arc length (uses $2\pi r$) and sector area (uses $\pi r^2$).
- Forgetting to subtract the triangle area when finding the segment area.

## 7. 💡 Memory Tricks
- **Sector is a Slice**: Sector sounds like "section" or "slice" (like a pizza slice).
- **Segment is a Slice off the Side**: Segment sounds like "severed" part (cut by a chord).

## 8. 📝 Quick Practice
- **Question 1**: Find the area of a sector of a circle with radius $6\text{ cm}$ if the angle of the sector is $60^\circ$. (Use $\pi = \frac{22}{7}$)
  - *Answer*: $\text{Area} = \frac{60}{360} \times \pi \times 6^2 = \frac{1}{6} \times \frac{22}{7} \times 36 = \frac{132}{7}\text{ cm}^2 \approx 18.86\text{ cm}^2$.
- **Question 2**: Find the area of a quadrant of a circle whose circumference is $22\text{ cm}$.
  - *Answer*: Circumference $2\pi r = 22 \implies 2 \times \frac{22}{7} \times r = 22 \implies r = \frac{7}{2} = 3.5\text{ cm}$. A quadrant has $\theta = 90^\circ$. $\text{Area} = \frac{90}{360} \times \pi r^2 = \frac{1}{4} \times \frac{22}{7} \times \frac{49}{4} = \frac{77}{8}\text{ cm}^2 = 9.625\text{ cm}^2$.

## 9. 🎓 Board Tips
- When $\theta = 90^\circ$, the triangle area in the segment formula is simply $\frac{1}{2} r^2$. When $\theta = 120^\circ$, it is $\frac{\sqrt{3}}{4} r^2$ or you can calculate it using trigonometry as $r^2 \sin 60^\circ \cos 60^\circ$.
- Always write units ($\text{cm}^2$, $\text{m}^2$) in your final answer.

## 10. 🔄 One-Minute Revision
- Sector is bounded by 2 radii and an arc.
- Segment is bounded by a chord and an arc.
- Sector Area = $\frac{\theta}{360} \times \pi r^2$.
- Arc Length = $\frac{\theta}{360} \times 2\pi r$.
- Segment Area = Sector Area - Triangle Area.

## 11. 🎬 Comic Recap
```
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "I love pizza! But how do I         │
│         calculate the area of just one     │
│         slice?"                            │
│ Rahul: "That slice is a sector! Measure its│
│         angle at the center and multiply   │
│         the total area by that fraction of │
│         360."                              │
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "Ah! And what if I only eat the     │
│         crust?"                            │
│ Rahul: "The crust is the arc length! Use   │
│         the same fraction, but multiply it │
│         by the circumference."             │
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "Got it! So sector is the pie, and  │
│         segment is the crust slice!"       │
│ Rahul: "Almost! Segment is the crust plus  │
│         the edge slice cut by a chord, not │
│         going to the center."              │
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ Sector area = (theta/360) * pi * r^2.      │
│ Arc length = (theta/360) * 2 * pi * r.     │
│ Segment = Sector - Triangle.               │
└────────────────────────────────────────────┘
```', FALSE, 3),
('eb86338f-f216-5f74-8d94-8d497608280d', 'd79d640e-96cf-545a-b6c8-93a5e3c4409e', 'Revision Notes: Surface Areas and Volumes', 'note', NULL, NULL, '# Chapter 12: Surface Areas and Volumes

## 1. 🎯 Chapter Goal
Learn how to calculate the total surface area and volume when multiple 3D solid shapes are joined together.

## 2. 🪝 Hook
Have you seen an ice cream cone with a scoop of ice cream on top? That''s a cone combined with a hemisphere! To paint it or find how much ice cream it holds, we need the math of combined solids. Let''s learn how!

## 3. 📖 Concept 1: Surface Area of Combined Solids
A **[JARGON: Combination of Solids | A 3D object formed by joining two or more simple shapes like cylinders, cones, or spheres | A capsule is a cylinder with two hemispheres at its ends]** (joined shapes) is made by merging shapes.
- Total Surface Area: When joining two solids, the interface area where they touch disappears inside the solid. The **[JARGON: Surface Area | The total area of all the outer faces of a 3D object | The amount of paint needed to paint the outside of a box is its surface area]** (outer boundary area) is the sum of the visible surface areas:
  $$\text{Total Surface Area} = \text{CSA of Solid 1} + \text{CSA of Solid 2}$$
- Example: A toy made by joining a cone to a hemisphere has:
  $$\text{Total Surface Area} = \text{CSA of Cone} (\pi r l) + \text{CSA of Hemisphere} (2\pi r^2)$$

## 4. 📖 Concept 2: Volume of Combined Solids
Unlike surface area, the **[JARGON: Volume | The amount of 3D space occupied by an object | The amount of water that a water tank can hold is its volume]** (internal capacity) does not change or disappear when solids are joined.
- Total Volume: The total volume is simply the sum of the volumes of individual solids:
  $$\text{Total Volume} = \text{Volume of Solid 1} + \text{Volume of Solid 2}$$
- Example: The volume of air in a shed made of a cuboid surmounted by a half cylinder is:
  $$\text{Total Volume} = \text{Volume of Cuboid} + \frac{1}{2} \text{Volume of Cylinder}$$

## 5. 📖 Concept 3: Conversion of Solids
When one solid is melted and recast into another shape, its volume remains constant.
- Theorem: If a solid sphere of radius $R$ is melted to make small solid spheres of radius $r$, then:
  $$\text{Volume of original sphere} = n \times \text{Volume of one small sphere}$$
- Example: If a metallic sphere of radius $4.2\text{ cm}$ is melted and recast into a cylinder of radius $6\text{ cm}$, then:
  $$\text{Volume of Sphere} = \text{Volume of Cylinder} \implies \frac{4}{3} \pi (4.2)^3 = \pi (6)^2 h \implies h = 2.74\text{ cm}$$

## 6. ⚠️ Common Mistakes
- Adding the base areas of shapes when they are joined. (e.g., when a hemisphere is placed on a cylinder, the touching circular faces are hidden inside, so don''t include them in the total surface area!).
- Confusing the radius with the diameter. Always divide the diameter by 2 first.
- Mixing up formulas: using the CSA of a cone ($\pi r l$) instead of volume ($\frac{1}{3} \pi r^2 h$).

## 7. 💡 Memory Tricks
- **Volume just Adds**: Volume is like water. If you put two cups of water together, they add up. No space is lost!
- **Surface Area Hides**: Surface area is like skin. When two people hug (shapes touch), some skin is hidden inside and doesn''t face the outside!

## 8. 📝 Quick Practice
- **Question 1**: Two cubes each of volume $64\text{ cm}^3$ are joined end to end. Find the surface area of the resulting cuboid.
  - *Answer*: Volume of cube $a^3 = 64 \implies a = 4\text{ cm}$. When joined, the new cuboid has length $l = 8\text{ cm}$, width $b = 4\text{ cm}$, height $h = 4\text{ cm}$. Surface Area $= 2(lb + bh + hl) = 2(32 + 16 + 32) = 2(80) = 160\text{ cm}^2$.
- **Question 2**: A toy is in the shape of a cone of radius $3.5\text{ cm}$ mounted on a hemisphere of same radius. If the total height of the toy is $15.5\text{ cm}$, find the height of the cone.
  - *Answer*: The radius of the hemisphere is $3.5\text{ cm}$, which is also its depth. The height of the cone is total height minus hemisphere radius: $h = 15.5 - 3.5 = 12\text{ cm}$.

## 9. 🎓 Board Tips
- Make a list of basic formulas: Cylinder ($\text{CSA} = 2\pi rh$, $\text{Vol} = \pi r^2h$), Cone ($\text{CSA} = \pi rl$, $\text{Vol} = \frac{1}{3}\pi r^2h$, where $l = \sqrt{r^2 + h^2}$), Sphere ($\text{SA} = 4\pi r^2$, $\text{Vol} = \frac{4}{3}\pi r^3$), Hemisphere ($\text{CSA} = 2\pi r^2$, $\text{TSA} = 3\pi r^2$, $\text{Vol} = \frac{2}{3}\pi r^3$).
- When solving conversion questions, write the equation first and cancel out common factors like $\pi$ before doing calculations.

## 10. 🔄 One-Minute Revision
- Surface Area of combined solid = Sum of CSAs of visible parts.
- Volume of combined solid = Sum of volumes of constituent solids.
- Melting and recasting: Volume remains constant.
- Cone slant height: $l = \sqrt{r^2 + h^2}$.
- Cylinder TSA $= 2\pi r(r + h)$; Cone TSA $= \pi r(r + l)$.

## 11. 🎬 Comic Recap
```
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "If I glue a hemisphere to the top  │
│         of a cylinder, do I just add their │
│         total surface areas?"              │
│ Rahul: "No! The flat circle where they     │
│         touch is now hidden inside. You    │
│         only add their curved surface      │
│         areas!"                            │
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "Aha! What about the volume?"       │
│ Rahul: "Volumes are easy! Just add the     │
│         volume of the cylinder and the     │
│         volume of the hemisphere directly. │
│         Nothing hides!"                    │
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "Perfect! Volume is simple addition,│
│         surface area requires detective    │
│         work."                             │
│ Rahul: "Yes, and always remember to check  │
│         if the shapes share the same       │
│         radius."                           │
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ Surface Area: Visible parts only!          │
│ Volume of combined: Just add them up.      │
│ Slant height: l^2 = r^2 + h^2.             │
└────────────────────────────────────────────┘
```', FALSE, 3),
('dda11755-24b4-56f4-b84d-81af108c573f', '1c5f32ec-ebc1-5179-92d1-f1deaf3c87bc', 'Revision Notes: Statistics', 'note', NULL, NULL, '# Chapter 13: Statistics

## 1. 🎯 Chapter Goal
Learn how to calculate the Mean, Mode, and Median for a grouped frequency table.

## 2. 🪝 Hook
How do teachers calculate the average marks of a large class quickly? Or how does a shopkeeper know which shoe size sells the most? They use statistics! Let''s master the tools of data.

## 3. 📖 Concept 1: Mean of Grouped Data
The Mean (average) represents the central value of a data set.
- We calculate the Mean of **[JARGON: Grouped Data | Data that has been organized into intervals or groups rather than individual values | Marks grouped into intervals like 0-10, 10-20, 20-30 are grouped data]** (class intervals) using the **[JARGON: Class Mark | The midpoint of a class interval, calculated as (Upper Limit + Lower Limit) / 2 | The class mark for the interval 10 to 20 is 15]** (midpoint $x_i$).
- Methods for finding Mean:
  1. Direct Method:
     $$\bar{x} = \frac{\sum f_i x_i}{\sum f_i}$$
  2. Assumed Mean Method:
     $$\bar{x} = a + \frac{\sum f_i d_i}{\sum f_i}$$
     where $d_i = x_i - a$ and $a$ is the assumed mean.
  3. Step-Deviation Method:
     $$\bar{x} = a + \left(\frac{\sum f_i u_i}{\sum f_i}\right) \times h$$
     where $u_i = \frac{x_i - a}{h}$ and $h$ is the class size.

## 4. 📖 Concept 2: Mode of Grouped Data
The Mode is the value that occurs most frequently. In grouped data, we first locate the modal class (the class interval with the highest frequency).
- Formula:
  $$\text{Mode} = l + \left(\frac{f_1 - f_0}{2f_1 - f_0 - f_2}\right) \times h$$
  where $l$ is the lower limit of the modal class, $f_1$ is the frequency of the modal class, $f_0$ is the frequency of the preceding class, $f_2$ is the frequency of the succeeding class, and $h$ is the class size.
- Example: If the class with highest frequency is $3 - 5$ with $f_1=8, f_0=7, f_2=2, h=2$, then:
  $$\text{Mode} = 3 + \left(\frac{8 - 7}{2(8) - 7 - 2}\right) \times 2 = 3 + \frac{2}{7} \approx 3.29$$

## 5. 📖 Concept 3: Median of Grouped Data
The Median is the middle-most value of the data. We first locate the median class by building the **[JARGON: Cumulative Frequency | The running total of frequencies up to a certain point | If 5 students got below 10 marks and 7 got between 10-20, the cumulative frequency below 20 is 12]** (running total $cf$) and finding where $\frac{n}{2}$ lies.
- Formula:
  $$\text{Median} = l + \left(\frac{\frac{n}{2} - cf}{f}\right) \times h$$
  where $l$ is the lower limit of the median class, $n$ is total frequency, $cf$ is cumulative frequency of the preceding class, $f$ is frequency of the median class, and $h$ is class size.
- **Empirical Relationship**:
  $$3 \times \text{Median} = \text{Mode} + 2 \times \text{Mean}$$

## 6. ⚠️ Common Mistakes
- Forgetting to convert discontinuous class intervals (like 1-5, 6-10) to continuous ones (0.5-5.5, 5.5-10.5) before finding the median or mode.
- Using the cumulative frequency ($cf$) of the median class instead of the *preceding* class.
- Simple arithmetic mistakes when dividing large numbers. Double check your addition!

## 7. 💡 Memory Tricks
- **Mode is Most**: Mode sounds like "Most". It uses the highest frequency.
- **Median is Middle**: Median sounds like "Medium" or "Middle" of the road.
- **Empirical relation mnemonic**: "3 Medals = 1 Mother + 2 Mentors" ($3\text{ Median} = 1\text{ Mode} + 2\text{ Mean}$).

## 8. 📝 Quick Practice
- **Question 1**: Find the class mark of the interval $15 - 25$.
  - *Answer*: $\text{Class Mark} = \frac{15 + 25}{2} = \frac{40}{2} = 20$.
- **Question 2**: If Mean $= 20$ and Median $= 22$, find the Mode using the empirical formula.
  - *Answer*: $3\text{ Median} = \text{Mode} + 2\text{ Mean} \implies 3(22) = \text{Mode} + 2(20) \implies 66 = \text{Mode} + 40 \implies \text{Mode} = 26$.

## 9. 🎓 Board Tips
- Assumed Mean Method and Step Deviation Method are highly recommended for large numbers to simplify calculations.
- Always state what each variable ($l$, $f_1$, $cf$, etc.) stands for when writing down the formula.

## 10. 🔄 One-Minute Revision
- Mean is the average. Direct method: $\bar{x} = \frac{\sum f_i x_i}{\sum f_i}$.
- Class Mark $= \frac{\text{Upper Limit} + \text{Lower Limit}}{2}$.
- Mode is the value with highest frequency. Use the Mode formula.
- Median is the middle value. Bounded by median class where cumulative frequency reaches $\frac{n}{2}$.
- Empirical Relationship: $3\text{ Median} = \text{Mode} + 2\text{ Mean}$.

## 11. 🎬 Comic Recap
```
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "I have a table of marks. How do I  │
│         find the median? Can I just look at│
│         the middle row?"                   │
│ Rahul: "No! First find the cumulative      │
│         frequency to see where the middle  │
│         student (n/2) lies. That gives you │
│         the median class!"                 │
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "And what about the mode?"          │
│ Rahul: "That is easier! Just find the class│
│         with the highest frequency, which  │
│         is the modal class, and use the    │
│         mode formula."                     │
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "Awesome! And if I have two of them,│
│         I can find the third using the     │
│         formula."                          │
│ Rahul: "Yes! 3 Median = Mode + 2 Mean. It  │
│         saves so much calculation time!"   │
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ Mean: Sum(f*x)/Sum(f).                     │
│ Mode: Highest frequency class formula.     │
│ Median: Middle class formula using cf.     │
│ 3 Median = Mode + 2 Mean.                  │
└────────────────────────────────────────────┘
```', FALSE, 3),
('40a31e11-fbad-5337-9447-2dcc470ae0f9', '1c63fb5b-e508-513f-a52e-84708f7f7e4a', 'Revision Notes: Probability', 'note', NULL, NULL, '# Chapter 14: Probability

## 1. 🎯 Chapter Goal
Learn how to calculate the likelihood of an event happening, from coins and dice to playing cards.

## 2. 🪝 Hook
When you toss a coin, will it land on heads or tails? It''s a 50-50 chance! But how do card players or game designers predict outcomes? They use probability. Let''s learn the rules of chance!

## 3. 📖 Concept 1: Classical Probability
Probability measures the chance of an event happening.
- The **[JARGON: Theoretical Probability | The ratio of the number of favorable outcomes to the total number of possible outcomes | The probability of rolling a 4 on a six-sided die is 1/6]** (classical probability) of an event $E$ assumes all outcomes are equally likely.
- Formula:
  $$P(E) = \frac{\text{Number of outcomes favourable to } E}{\text{Total number of possible outcomes}}$$
- Range: The probability of any event is always a number between 0 and 1:
  $$0 \le P(E) \le 1$$
- Example: Tossing a coin has 2 possible outcomes (Heads, Tails). Probability of getting Heads is $P(H) = \frac{1}{2}$.

## 4. 📖 Concept 2: Sure and Impossible Events
Depending on the likelihood, we have special types of events.
- An event that can never happen has a probability of 0. We call this an **[JARGON: Impossible Event | An event that can never happen, having a probability of 0 | Rolling a 7 on a standard six-sided die is an impossible event]** (impossible outcome).
- An event that is guaranteed to happen has a probability of 1. We call this a **[JARGON: Sure Event | An event that will definitely happen, having a probability of 1 | Getting a number less than 7 when rolling a standard die is a sure event]** (certain outcome).
- An event having only one outcome is an **[JARGON: Elementary Event | An event that has only a single outcome from the experiment | Getting a heads when tossing a single coin is an elementary event]** (single outcome). The sum of the probabilities of all elementary events is 1.

## 5. 📖 Concept 3: Complementary Events
Every event has an opposite event.
- For any event $E$, the event ''not $E$'' is denoted by $\bar{E}$. These are **[JARGON: Complementary Events | Two events where one is the exact opposite of the other, and their probabilities sum to 1 | Winning a game and losing a game are complementary events]** (opposite pairs).
- Equation:
  $$P(E) + P(\bar{E}) = 1$$
- Example: If the probability of raining today is $P(R) = 0.05$, the probability of not raining is $P(\bar{R}) = 1 - 0.05 = 0.95$.

## 6. ⚠️ Common Mistakes
- Writing a probability greater than 1 or a negative number. Probability can *never* be outside $[0, 1]$!
- Forgetting the total number of cards in a deck ($52$) or how many face cards there are ($12$ total: 4 Jacks, 4 Queens, 4 Kings).
- Confusing ''or'' with ''and'' in card questions. ''Red or King'' includes all red cards plus black kings!

## 7. 💡 Memory Tricks
- **Sure is 1, Impossible is None (0)**: $100\%$ chance means $1.0$, $0\%$ chance means $0$.
- **Complementary is Complete**: Opposite events complete each other, adding up to $1$ (like pieces of a puzzle).

## 8. 📝 Quick Practice
- **Question 1**: If $P(E) = 0.05$, what is the probability of ''not $E$''?
  - *Answer*: $P(\bar{E}) = 1 - P(E) = 1 - 0.05 = 0.95$.
- **Question 2**: A card is drawn from a well-shuffled deck of 52 cards. Find the probability of getting a red face card.
  - *Answer*: A deck has 26 red cards. The face cards are Jack, Queen, King. There are 3 face cards per suit. There are 2 red suits (Hearts and Diamonds), so there are $3 \times 2 = 6$ red face cards. Probability $= \frac{6}{52} = \frac{3}{26}$.

## 9. 🎓 Board Tips
- Memorize the structure of playing cards: 52 cards total, 4 suits (Spades, Clubs are black; Hearts, Diamonds are red), 13 cards per suit, 12 face cards total.
- When two dice are thrown, there are $6 \times 6 = 36$ possible outcomes. Write down the sample space to avoid mistakes.

## 10. 🔄 One-Minute Revision
- Probability $P(E) = \frac{\text{Favourable Outcomes}}{\text{Total Outcomes}}$.
- Always: $0 \le P(E) \le 1$.
- Sure Event $= 1$; Impossible Event $= 0$.
- Complementary: $P(E) + P(\text{not } E) = 1$.
- Two dice thrown: 36 total outcomes.

## 11. 🎬 Comic Recap
```
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "If I throw a die, what is the      │
│         probability of getting a 7?"       │
│ Rahul: "That is 0! A standard die only has │
│         numbers 1 to 6. It is an impossible│
│         event."                            │
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "Ah! And what about getting a number│
│         less than 7?"                      │
│ Rahul: "That is 1! It is a sure event,     │
│         because all numbers on the die are │
│         less than 7."                      │
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "I see! So probability is just a    │
│         scale from 0 to 1, showing how sure│
│         we are."                           │
│ Rahul: "Exactly! And the opposite events   │
│         always sum up to 1."               │
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ Probability: 0 <= P(E) <= 1.               │
│ Sure Event = 1, Impossible Event = 0.      │
│ P(E) + P(not E) = 1.                       │
└────────────────────────────────────────────┘
```', FALSE, 3)
ON CONFLICT (id) DO UPDATE SET note_content = EXCLUDED.note_content;

-- 3. INSERT QUIZZES
INSERT INTO quizzes (id, chapter_id, title, passing_percentage) VALUES
('f74988e3-1c7d-5089-8d52-b514a63fa1c6', '24ecc156-6eb1-5c70-b037-8178dcf7d67b', 'Mathematics Chapter 10 Quiz', 60),
('7989b2ed-649c-5658-a2ee-146ae15ede8f', 'b320dba8-c80a-5877-b1e4-636af314d2d0', 'Mathematics Chapter 11 Quiz', 60),
('44590101-d2da-565b-adb0-df1b763cd71f', 'd79d640e-96cf-545a-b6c8-93a5e3c4409e', 'Mathematics Chapter 12 Quiz', 60),
('77c4c570-7043-57ff-b680-79811428a1a5', '1c5f32ec-ebc1-5179-92d1-f1deaf3c87bc', 'Mathematics Chapter 13 Quiz', 60),
('2ee0a7c2-bdba-52ba-8196-f11476484efe', '1c63fb5b-e508-513f-a52e-84708f7f7e4a', 'Mathematics Chapter 14 Quiz', 60)
ON CONFLICT (id) DO NOTHING;

-- 4. INSERT QUIZ QUESTIONS
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f720aa76-b7fb-5cfa-ad23-8fdee55e937a', 'f74988e3-1c7d-5089-8d52-b514a63fa1c6', 'How many tangents can a circle have at most?', 'multiple_choice', '["A. One", "B. Two", "C. Infinitely many", "D. None"]'::jsonb, 2, NULL, 1),
('4599c37a-17a7-5f93-80e0-e46f442535a0', 'f74988e3-1c7d-5089-8d52-b514a63fa1c6', 'The tangent at any point of a circle is perpendicular to the radius through:', 'multiple_choice', '["A. The centre", "B. The point of contact", "C. Any chord", "D. The diameter"]'::jsonb, 1, NULL, 1),
('f58c657c-e7aa-5b91-b021-7bf5cf9c6b0e', 'f74988e3-1c7d-5089-8d52-b514a63fa1c6', 'If the length of a tangent from an external point to a circle of radius 5 cm is 12 cm, what is the distance of the point from the centre?', 'multiple_choice', '["A. 13 cm", "B. 17 cm", "C. 7 cm", "D. 119 cm"]'::jsonb, 0, NULL, 1),
('6932fae1-84a6-5db7-86be-d61c5f350e4e', 'f74988e3-1c7d-5089-8d52-b514a63fa1c6', 'How many parallel tangents can a circle have at the most?', 'multiple_choice', '["A. One", "B. Two", "C. Three", "D. Four"]'::jsonb, 1, NULL, 1),
('d54286b7-2bce-5521-96c3-51c76fdea4b5', 'f74988e3-1c7d-5089-8d52-b514a63fa1c6', 'If two tangents TP and TQ are drawn to a circle with centre O from an external point T so that ∠POQ = 110°, then ∠PTQ is equal to:', 'multiple_choice', '["A. 60\u00b0", "B. 70\u00b0", "C. 80\u00b0", "D. 90\u00b0"]'::jsonb, 1, NULL, 1),
('9b4e9592-847c-5d2f-a885-ed154634dec9', '7989b2ed-649c-5658-a2ee-146ae15ede8f', 'The area of a sector of angle θ (in degrees) of a circle with radius r is given by:', 'multiple_choice', '["A. (\u03b8/360) * 2\u03c0r", "B. (\u03b8/180) * \u03c0r\u00b2", "C. (\u03b8/360) * \u03c0r\u00b2", "D. (\u03b8/720) * 2\u03c0r\u00b2"]'::jsonb, 2, NULL, 1),
('f1e02810-1dfd-5adc-8764-6cecbca461a7', '7989b2ed-649c-5658-a2ee-146ae15ede8f', 'If the circumference of a circle is 22 cm, the area of its quadrant is:', 'multiple_choice', '["A. 9.625 cm\u00b2", "B. 77 cm\u00b2", "C. 38.5 cm\u00b2", "D. 19.25 cm\u00b2"]'::jsonb, 0, NULL, 1),
('45e1153c-7eca-5583-9cd0-760ba7d8d99a', '7989b2ed-649c-5658-a2ee-146ae15ede8f', 'The portion of a circular region enclosed by a chord and the corresponding arc is called:', 'multiple_choice', '["A. A sector", "B. A segment", "C. A quadrant", "D. A tangent"]'::jsonb, 1, NULL, 1),
('540d2080-d072-5914-a441-54ac27b453c1', '7989b2ed-649c-5658-a2ee-146ae15ede8f', 'The length of the minute hand of a clock is 14 cm. The area swept by it in 5 minutes is:', 'multiple_choice', '["A. 154 cm\u00b2", "B. 77 cm\u00b2", "C. 51.33 cm\u00b2", "D. 25.67 cm\u00b2"]'::jsonb, 2, NULL, 1),
('ee21a530-cef8-5db5-8910-de8f4a9a898b', '7989b2ed-649c-5658-a2ee-146ae15ede8f', 'The sum of the areas of minor sector and major sector of a circle of radius r is:', 'multiple_choice', '["A. \u03c0r\u00b2", "B. 2\u03c0r\u00b2", "C. \u03c0r", "D. 2\u03c0r"]'::jsonb, 0, NULL, 1),
('2e224a56-56b2-5996-8ba1-f32bde61308a', '44590101-d2da-565b-adb0-df1b763cd71f', 'Two cubes each of volume 64 cm³ are joined end to end. The surface area of the resulting cuboid is:', 'multiple_choice', '["A. 128 cm\u00b2", "B. 160 cm\u00b2", "C. 80 cm\u00b2", "D. 144 cm\u00b2"]'::jsonb, 1, NULL, 1),
('23d1b433-247d-555c-89ec-dc45c4a36990', '44590101-d2da-565b-adb0-df1b763cd71f', 'When a solid is melted and recast into another shape, what remains constant?', 'multiple_choice', '["A. Curved surface area", "B. Total surface area", "C. Volume", "D. Dimensions"]'::jsonb, 2, NULL, 1),
('d08a6a27-a065-575d-aa05-9cd5dc69ef82', '44590101-d2da-565b-adb0-df1b763cd71f', 'A medicine capsule is in the shape of a cylinder with two hemispheres stuck to each of its ends. The volume of this capsule is equal to:', 'multiple_choice', '["A. Vol of cylinder + Vol of 1 hemisphere", "B. Vol of cylinder + Vol of 2 hemispheres", "C. CSA of cylinder + CSA of 2 hemispheres", "D. Vol of cylinder - Vol of 2 hemispheres"]'::jsonb, 1, NULL, 1),
('1fca1546-8b9d-571e-b776-cd9b052e20f2', '44590101-d2da-565b-adb0-df1b763cd71f', 'The slant height l of a cone having radius r and height h is given by:', 'multiple_choice', '["A. l = \u221a(r\u00b2 + h\u00b2)", "B. l = r\u00b2 + h\u00b2", "C. l = \u221a(r\u00b2 - h\u00b2)", "D. l = r + h"]'::jsonb, 0, NULL, 1),
('db3944c5-6b4f-55b4-a35e-c1ef95e4f680', '44590101-d2da-565b-adb0-df1b763cd71f', 'The ratio of the volumes of a cylinder and a cone having the same radius and height is:', 'multiple_choice', '["A. 1:3", "B. 3:1", "C. 1:1", "D. 2:3"]'::jsonb, 1, NULL, 1),
('04590098-0c7c-53fe-acac-4be5e9f20513', '77c4c570-7043-57ff-b680-79811428a1a5', 'The class mark of the class interval 10 - 25 is:', 'multiple_choice', '["A. 15", "B. 17.5", "C. 20", "D. 35"]'::jsonb, 1, NULL, 1),
('330e67c0-28fd-5095-af2c-ed4f4cd8e9e2', '77c4c570-7043-57ff-b680-79811428a1a5', 'Which of the following is the empirical relation between the three measures of central tendency?', 'multiple_choice', '["A. 3 Mean = Mode + 2 Median", "B. 3 Median = Mode + 2 Mean", "C. Median = 3 Mode + 2 Mean", "D. Mode = 3 Mean - 2 Median"]'::jsonb, 1, NULL, 1),
('aa7858ef-0dd9-56a7-83a6-e8b97b00343a', '77c4c570-7043-57ff-b680-79811428a1a5', 'The lower limit of the modal class is used in calculating the:', 'multiple_choice', '["A. Mean", "B. Mode and Median", "C. Mean and Mode", "D. Mean and Median"]'::jsonb, 1, NULL, 1),
('dc172887-2281-53fe-9eca-afcfa66f7e5a', '77c4c570-7043-57ff-b680-79811428a1a5', 'For calculating mode and median of grouped data, what condition must be met by class intervals?', 'multiple_choice', '["A. They must be continuous", "B. They must be discontinuous", "C. They must have unequal sizes", "D. They must be sorted descending"]'::jsonb, 0, NULL, 1),
('711bd946-916b-59b6-b1bb-e0f7b7469da2', '77c4c570-7043-57ff-b680-79811428a1a5', 'If the mean of a distribution is 20 and the mode is 26, its median is:', 'multiple_choice', '["A. 21", "B. 22", "C. 23", "D. 24"]'::jsonb, 1, NULL, 1),
('474a5750-1e93-5ed0-b30f-45102f97632b', '2ee0a7c2-bdba-52ba-8196-f11476484efe', 'Which of the following cannot be the probability of an event?', 'multiple_choice', '["A. 2/3", "B. -1.5", "C. 15%", "D. 0.7"]'::jsonb, 1, NULL, 1),
('3f4b339c-4dd2-5d9c-8d90-0854f964a472', '2ee0a7c2-bdba-52ba-8196-f11476484efe', 'The probability of a sure event is:', 'multiple_choice', '["A. 0", "B. 0.5", "C. 1", "D. Any number greater than 1"]'::jsonb, 2, NULL, 1),
('d485afbb-c699-51d6-94fd-8da5dfdc97ca', '2ee0a7c2-bdba-52ba-8196-f11476484efe', 'If P(E) = 0.05, the probability of "not E" (complementary event) is:', 'multiple_choice', '["A. 0.05", "B. 0.95", "C. 0.5", "D. 0.85"]'::jsonb, 1, NULL, 1),
('b48570fa-c79c-5412-8e2a-adcf4a603039', '2ee0a7c2-bdba-52ba-8196-f11476484efe', 'A card is drawn at random from a well-shuffled deck of 52 cards. The probability of getting a queen of diamonds is:', 'multiple_choice', '["A. 1/52", "B. 1/13", "C. 4/52", "D. 1/26"]'::jsonb, 0, NULL, 1),
('5d315584-c2d9-56c1-9e9e-d049f7badce8', '2ee0a7c2-bdba-52ba-8196-f11476484efe', 'The sum of the probabilities of all the elementary events of an experiment is:', 'multiple_choice', '["A. Less than 1", "B. Greater than 1", "C. Equal to 1", "D. Equal to 0"]'::jsonb, 2, NULL, 1)
ON CONFLICT (id) DO NOTHING;

-- CBSE Class 10 Learning Portal Seed Data - Batch 3 Science Part 1
-- Subject ID: a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22
-- Generated using automated generator script

-- =========================================================================
-- 1. INSERT CHAPTERS
-- =========================================================================
INSERT INTO chapters (id, subject_id, title, sequence_number, description) VALUES
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380225', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'Chapter 4: Carbon and its Compounds', 4, 'Study covalent bonding in carbon, its versatile nature, homologous series, properties of carbon compounds, ethanol, ethanoic acid, and soaps.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380226', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'Chapter 5: Life Processes', 5, 'Explore the fundamental life processes including autotrophic and heterotrophic nutrition, aerobic and anaerobic respiration, transportation in humans and plants, and excretion.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380227', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'Chapter 6: Control and Coordination', 6, 'Understand nervous and hormonal coordination in animals (neuron, brain, reflex arc) and plants (phytohormones, tropisms).'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380228', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'Chapter 7: How do Organisms Reproduce?', 7, 'Examine asexual reproduction, sexual reproduction in plants and humans, and the importance of reproductive health and contraceptive methods.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380229', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'Chapter 8: Heredity', 8, 'Learn the principles of inheritance of traits, Mendel''s monohybrid and dihybrid crosses, trait expression, and sex determination in humans.')
ON CONFLICT (id) DO NOTHING;

-- =========================================================================
-- 2. INSERT LESSONS (REVISION NOTES)
-- =========================================================================
-- Revision Notes for Chapter 4: Carbon and its Compounds
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('4fbd75d0-5bfe-4305-9686-4632e5c76136', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380225', 'Revision Notes: Carbon and its Compounds', 'note', NULL, NULL, '# Chapter 4: Carbon and its Compounds

## 1. 🎯 Chapter Goal
Learn about covalent bonding in carbon, the versatile nature of carbon (chains, branches, rings), homologous series, chemical properties, some important carbon compounds (ethanol and ethanoic acid), and soaps/detergents.

## 2. 🪝 Hook
Look at a diamond, a piece of charcoal, the gasoline in a car, and the DNA in your cells. They all share a single key element: Carbon! Why is this one element so important that it has a whole branch of chemistry dedicated to it? Let''s explore the magic of carbon!

## 3. 📖 Concept 1: Covalent Bonding in Carbon
Carbon has atomic number 6 with electronic configuration 2, 4. It has 4 valence electrons. To achieve a stable octet, it cannot easily gain 4 electrons (difficult for 6 protons to hold 10 electrons) or lose 4 electrons (requires huge energy). Thus, it shares electrons with other atoms. A **[JARGON: Covalent Bond | A chemical bond formed by the sharing of electron pairs between two atoms | A molecule of methane ($CH_4$) has four single covalent bonds between carbon and hydrogen.]** is formed.

Carbon shows **[JARGON: Tetravalency | The state of having four valence electrons available for bonding | Carbon is tetravalent, meaning it can form bonds with four other atoms.]** which allows it to bond with four other monovalent atoms. Carbon also has a unique ability called **[JARGON: Catenation | The self-linking ability of carbon atoms to form long chains or rings through covalent bonds | Carbon atoms can link together to form long chains as in hexane.]**, leading to a vast number of compounds.

## 4. 📖 Concept 2: Versatile Nature & Homologous Series
Carbon forms different types of structures. A **[JARGON: Saturated Hydrocarbon | A carbon compound where all carbon-carbon bonds are single bonds | Ethane ($C_2H_6$) is a saturated hydrocarbon.]** contains only single bonds and is relatively unreactive. An **[JARGON: Unsaturated Hydrocarbon | A carbon compound containing at least one double or triple bond between carbon atoms | Ethene ($C_2H_4$) and Ethyne ($C_2H_2$) are unsaturated hydrocarbons.]** contains double or triple bonds and is more reactive.

Carbon compounds are grouped into a **[JARGON: Homologous Series | A series of organic compounds with the same functional group where successive members differ by a -CH2- unit | The alkane series ($CH_4, C_2H_6, C_3H_8$) is a homologous series.]**. Members of a homologous series share similar chemical properties, and their physical properties graduate as molecular mass increases by 14 u per member.

## 5. 📖 Concept 3: Important Compounds & Soaps
Ethanol ($C_2H_5OH$) reacts with sodium to release hydrogen gas and undergoes dehydration with hot conc. $H_2SO_4$ to form ethene. Ethanoic acid ($CH_3COOH$) undergoes **[JARGON: Esterification | A chemical reaction where a carboxylic acid and an alcohol react in the presence of an acid catalyst to produce a sweet-smelling ester and water | Ethanoic acid reacting with ethanol to form ethyl ethanoate.]** to form esters. Esters react with bases in **[JARGON: Saponification | The hydrolysis of an ester with a strong base (like NaOH) to produce an alcohol and a salt of carboxylic acid (soap) | Heating ethyl ethanoate with sodium hydroxide to form sodium ethanoate and ethanol.]** to make soaps.

Soaps are sodium/potassium salts of long-chain fatty acids. In water, they form a **[JARGON: Micelle | A spherical aggregate of soap molecules formed in water, where hydrophobic tails point inward and hydrophilic heads point outward | The structure formed by soap around a grease droplet to trap dirt.]** structure. The hydrophobic tails stick to oil/grease, while hydrophilic heads point outward into water, allowing grease to be washed away.

## 6. ⚠️ Common Mistakes
- Trying to write formulas for unsaturated compounds using saturated formulas (e.g. writing ethene as $C_2H_6$ instead of $C_2H_4$).
- Forgetting that soaps form scum in hard water due to reaction with calcium and magnesium ions. Detergents work in both soft and hard water.

## 7. 💡 Memory Tricks
- **Saturated is Single**: Saturated compounds have **S**ingle bonds.
- **Soap Soap Soap, Scum in Hard Water**: Soap is **S**ad in hard water (scum), Detergent is **D**elightful (works in both).

## 8. 📝 Quick Practice
- **Question 1**: Why does carbon form covalent bonds rather than ionic bonds?
  - *Answer*: Carbon has atomic number 6 (electronic configuration 2,4). Gaining 4 electrons to form $C^{4-}$ is difficult because 6 protons cannot hold 10 electrons. Losing 4 electrons to form $C^{4+}$ requires huge energy to overcome attraction. Thus, it shares electrons.
- **Question 2**: What is the general formula for alkanes, alkenes, and alkynes?
  - *Answer*: Alkanes: $C_nH_{2n+2}$; Alkenes: $C_nH_{2n}$; Alkynes: $C_nH_{2n-2}$.

## 9. 🎓 Board Tips
- Practice drawing electron dot structures for $H_2O$, $CH_4$, $CO_2$, and $N_2$. They are common board questions.
- Remember the exact reaction conditions: ethanol to ethene requires hot concentrated $H_2SO_4$ at 443 K.

## 10. 🔄 One-Minute Revision
- Carbon shares valence electrons to form covalent bonds due to its tetravalency and catenation.
- Saturated hydrocarbons have single bonds, while unsaturated have double or triple bonds.
- Homologous series members differ by a $-CH_2-$ group and 14 u molecular mass.
- Soaps form micelles to trap hydrophobic grease and dirt in water.

## 11. 🎬 Comic Recap
```
┌──────────────────────────────────────────────┐
│ PANEL 1:                                     │
│ Priya: Why does carbon share electrons?      │
│ Rahul: Gaining or losing 4 electrons takes   │
│        too much energy. Sharing is easy!     │
├──────────────────────────────────────────────┤
│ PANEL 2:                                     │
│ Priya: What is catenation?                   │
│ Rahul: Carbon''s unique ability to link with  │
│        other carbon atoms in long chains!    │
├──────────────────────────────────────────────┤
│ PANEL 3:                                     │
│ Priya: How do soaps clean dirty clothes?     │
│ Rahul: They form micelles! Hydrophobic       │
│        tails stick to grease; heads to water. │
├──────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                             │
│ Carbon forms covalent bonds by sharing.      │
│ Saturated = single, Unsaturated = multiple.  │
│ Soaps form micelles in water to clean.       │
└──────────────────────────────────────────────┘
```', TRUE, 3)
ON CONFLICT (id) DO UPDATE SET note_content = EXCLUDED.note_content;

-- Revision Notes for Chapter 5: Life Processes
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('e8379ff1-0f8e-4e7b-89d3-ec54fffd67c1', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380226', 'Revision Notes: Life Processes', 'note', NULL, NULL, '# Chapter 5: Life Processes

## 1. 🎯 Chapter Goal
Understand the basic maintenance functions of living organisms: nutrition, respiration, transportation, and excretion in humans and plants.

## 2. 🪝 Hook
When you sleep, your heart keeps beating, your lungs keep breathing, and your cells keep repairing themselves. All these activities require energy even when you aren''t doing any work. How do our bodies maintain life in this non-stop machine? Let''s explore the four pillars of life!

## 3. 📖 Concept 1: Nutrition (Autotrophic vs Heterotrophic)
Living organisms require nutrients. Autotrophs make food via **[JARGON: Photosynthesis | The process by which green plants make glucose from carbon dioxide and water using sunlight energy trapped by chlorophyll | Green leaves absorbing carbon dioxide and sunlight to produce sugar.]** ($6CO_2 + 12H_2O \rightarrow C_6H_{12}O_6 + 6O_2 + 6H_2O$ in sunlight and chlorophyll).

Heterotrophs depend on others. In humans, food travels via **[JARGON: Peristalsis | The rhythmic contraction and relaxation of muscles in the food pipe that pushes food downward | The movement of food through the esophagus to the stomach.]** through the alimentary canal. Digestion occurs in mouth, stomach, and small intestine. The small intestine absorbs digested food through **[JARGON: Villi | Tiny finger-like projections on the inner wall of the small intestine that increase surface area for food absorption | Structures in the ileum absorbing glucose into the bloodstream.]**, which are richly supplied with blood vessels.

## 4. 📖 Concept 2: Respiration (Aerobic vs Anaerobic)
Respiration breaks down glucose to release energy. In **[JARGON: Aerobic Respiration | The process of breaking down food to release energy in the presence of oxygen, yielding carbon dioxide, water, and ATP | Human cells burning glucose in mitochondria to produce energy.]**, glucose is broken down to pyruvate in cytoplasm, and then to $CO_2$ and water in mitochondria, releasing 38 ATP. In **[JARGON: Anaerobic Respiration | The breakdown of food to release energy in the absence of oxygen, yielding ethanol or lactic acid | Yeast cells converting sugar into ethanol during fermentation.]**, pyruvate is converted to ethanol and $CO_2$ (in yeast) or lactic acid (in muscle cells during oxygen lack, causing cramps), releasing only 2 ATP.

Gaseous exchange in humans occurs in the lungs across **[JARGON: Alveoli | Tiny balloon-like structures in the lungs that provide a large surface area for the exchange of gases | The site where oxygen enters blood and carbon dioxide leaves it.]**.

## 5. 📖 Concept 3: Transportation and Excretion
Humans have a four-chambered heart to perform **[JARGON: Double Circulation | A circulatory system where blood passes through the heart twice during one complete cycle through the body | Human blood flowing from body to heart, then to lungs, then back to heart, and out to the body.]**, separating oxygenated and deoxygenated blood. Lymph is another transport fluid.

[FIGURE: double_circulation]

Plants transport water/minerals via xylem (unidirectional, driven by transpiration) and food via phloem (bidirectional, called **[JARGON: Translocation | The transport of soluble products of photosynthesis (food) through the phloem tissue in plants | Leaves sending sucrose to the roots and growing buds of a plant.]**, utilizing ATP energy).

Excretion filters nitrogenous wastes. In humans, kidneys contain millions of filtration units called **[JARGON: Nephron | The microscopic functional and structural unit of the kidney that filters blood and forms urine | Millions of tubules in the kidneys performing filtration and reabsorption.]**.

## 6. ⚠️ Common Mistakes
- Believing plants respire only at night. Plants respire (take in $O_2$, release $CO_2$) all the time. However, during the day, photosynthesis is dominant, so there is a net release of $O_2$.
- Confusing xylem and phloem roles. Xylem is for water/minerals (upward only). Phloem is for food (both up and down).

## 7. 💡 Memory Tricks
- **Xylem to the Sky (Xy-High)**: Xylem transports water UP.
- **Phloem flows Food**: Phloem transports food everywhere.
- **Atria Accept, Ventricles Vent**: Atria receive blood, ventricles pump blood out.

## 8. 📝 Quick Practice
- **Question 1**: Why is a four-chambered heart necessary in mammals and birds?
  - *Answer*: It keeps oxygenated and deoxygenated blood completely separate, ensuring a highly efficient supply of oxygen to the body. This is necessary to maintain high energy levels to keep a constant body temperature.
- **Question 2**: What are the end products of anaerobic respiration in yeast and human muscle cells?
  - *Answer*: In yeast: Ethanol, $CO_2$, and 2 ATP. In muscle cells: Lactic acid and 2 ATP.

## 9. 🎓 Board Tips
- The diagrams of the human heart, human digestive system, and nephron are highly important for 3-5 marks. Practice drawing them neatly.
- Know the function of gastric juice: HCl (creates acidic pH, kills germs), pepsin (digests proteins), and mucus (protects stomach lining).

## 10. 🔄 One-Minute Revision
- Autotrophs perform photosynthesis; heterotrophs digest organic matter.
- Aerobic respiration produces 38 ATP in mitochondria; anaerobic respiration yields 2 ATP.
- Double circulation prevents mixing of oxygenated and deoxygenated blood in mammals.
- Xylem moves water via transpirational pull; phloem translocation uses ATP.
- Nephrons in kidneys filter blood, reabsorb nutrients, and form urine.

## 11. 🎬 Comic Recap
```
┌──────────────────────────────────────────────┐
│ PANEL 1:                                     │
│ Priya: What is the main difference between   │
│        aerobic and anaerobic respiration?    │
│ Rahul: Aerobic uses oxygen to make 38 ATP;   │
│        anaerobic needs no oxygen, makes 2.   │
├──────────────────────────────────────────────┤
│ PANEL 2:                                     │
│ Priya: Why does our heart have 4 chambers?   │
│ Rahul: To prevent oxygen-rich and oxygen-    │
│        poor blood from mixing. Super fast!   │
├──────────────────────────────────────────────┤
│ PANEL 3:                                     │
│ Priya: How do plants transport water?        │
│ Rahul: Through xylem vessels, driven by      │
│        suction from transpiration!           │
├──────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                             │
│ Photosynthesis needs light and chlorophyll.  │
│ Kidneys filter wastes using nephrons.        │
│ Phloem moves food, xylem moves water.        │
└──────────────────────────────────────────────┘
```', TRUE, 3)
ON CONFLICT (id) DO UPDATE SET note_content = EXCLUDED.note_content;

-- Revision Notes for Chapter 6: Control and Coordination
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('81c8fe7d-3b50-40cd-badb-b32d172cd704', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380227', 'Revision Notes: Control and Coordination', 'note', NULL, NULL, '# Chapter 6: Control and Coordination

## 1. 🎯 Chapter Goal
Understand how animals control and coordinate activities using the nervous system (neurons, reflex arc, brain) and endocrine system (hormones), and how plants respond to stimuli using phytohormones and tropisms.

## 2. 🪝 Hook
You touch a hot pan. Before you even think "Ouch, this is hot!", your hand has already pulled back in a fraction of a second. How did your body make this decision without your brain thinking about it first? Let''s unlock the secrets of electrical signals and chemical messengers!

## 3. 📖 Concept 1: The Nervous System & Reflex Arc
The nervous system uses electrical impulses. A neuron is the structural unit. Electrical signals travel from dendrites, through cell body and axon, to nerve endings. At the nerve ending, the signal crosses a **[JARGON: Synapse | The microscopic gap between two neurons where electrical signals are converted into chemical signals to cross | The junction where neurotransmitters carry a message from axon to dendrite.]** using chemicals called neurotransmitters.

[FIGURE: neuron]

For emergency responses, a **[JARGON: Reflex Arc | The neural pathway that controls a reflex action, allowing rapid response by involving the spinal cord directly | Pulling your hand back instantly from a hot plate before feeling the pain.]** is used. The signal bypasses the conscious brain. It goes from receptors to a **[JARGON: Sensory Neuron | A nerve cell that carries information from sensory receptors to the central nervous system | The neuron that carries the heat signal from skin receptors to the spinal cord.]**, to the spinal cord, and then directly to motor neurons to move the muscle.

## 4. 📖 Concept 2: The Human Brain
The brain is the main coordinating center. It has three parts:
- Forebrain: Includes the **[JARGON: Cerebrum | The largest part of the brain, responsible for thinking, memory, sensory perception, and voluntary actions | Solving a difficult math problem or remembering a friend''s phone number.]**, which is the main thinking part.
- Midbrain: Coordinates reflex movements of head/neck.
- Hindbrain: Contains the **[JARGON: Cerebellum | Part of the hindbrain that coordinates voluntary muscle movements and maintains posture and balance | Riding a bicycle or walking in a straight line without falling.]** (controls posture and balance) and the **[JARGON: Medulla Oblongata | Part of the hindbrain that controls involuntary actions such as breathing, heartbeat, and blood pressure | Your heart beating and lungs breathing automatically while you sleep.]** (controls involuntary functions like salivation, blood pressure, and vomiting).

## 5. 📖 Concept 3: Plant Hormones & Animal Hormones
Plants coordinate using phytohormones. Shoots show **[JARGON: Phototropism | The growth movement of a plant part in response to light, where shoots bend towards the light source | A potted plant placed near a window bending towards the sunlight.]** where cells grow longer on the shaded side under the influence of auxin. Other plant hormones include gibberellins (stem growth), cytokinins (cell division), and abscisic acid (inhibits growth, wilts leaves).

Animals coordinate using chemical messengers released by any **[JARGON: Endocrine Gland | Ductless glands that secrete hormones directly into the bloodstream to regulate body functions | The thyroid gland releasing thyroxine to control metabolism.]**. Examples include adrenaline (fight/flight), thyroxine (needs iodine, regulates metabolism), insulin (regulates blood sugar), and growth hormone.

## 6. ⚠️ Common Mistakes
- Confusing Cerebrum (voluntary thoughts, memory) with Cerebellum (motor coordination, physical balance).
- Forgetting that reflex action is processed in the spinal cord, not the brain, although the brain receives the sensory information later.

## 7. 💡 Memory Tricks
- **Cere-BALANCE**: Cere**bell**um maintains balance (like a swinging bell).
- **Abscisic Acid (ABA) is Abscission**: It inhibits growth and causes wilting (Abs-Inhibit).

## 8. 📝 Quick Practice
- **Question 1**: Why is iodine-rich salt recommended in our diet?
  - *Answer*: Iodine is essential for the thyroid gland to make thyroxine. Thyroxine regulates fat, protein, and carbohydrate metabolism. Lack of iodine causes goitre, which leads to a swollen neck.
- **Question 2**: How does a shoot bend towards light?
  - *Answer*: When light falls on one side of a shoot, auxin diffuses to the shaded side. The high concentration of auxin on the shaded side stimulates cells there to grow longer, causing the shoot to bend towards the light.

## 9. 🎓 Board Tips
- The neuron diagram is a standard 2-3 mark question. Practice drawing it neatly with dendrites, axon, and myelin sheath.
- Understand that reflex actions are fast and automatic, while walking or writing are voluntary actions controlled by the cerebrum.

## 10. 🔄 One-Minute Revision
- Neurons conduct electrical signals; synapse uses chemical neurotransmitters.
- Reflex arcs pass through the spinal cord for immediate emergency actions.
- Brain has forebrain (cerebrum), midbrain, and hindbrain (cerebellum, medulla, pons).
- Phytohormones like auxin, gibberellin, cytokinin promote growth; abscisic acid inhibits it.
- Animal hormones are secreted directly into blood by endocrine glands.

## 11. 🎬 Comic Recap
```
┌──────────────────────────────────────────────┐
│ PANEL 1:                                     │
│ Priya: Why did my hand pull back from the    │
│        hot cup before I even felt it?        │
│ Rahul: That is a reflex action! The spinal   │
│        cord decided it to save time.         │
├──────────────────────────────────────────────┤
│ PANEL 2:                                     │
│ Priya: How do plants bend towards light?     │
│ Rahul: Auxin hormone diffuses to the dark    │
│        side, making those cells grow longer! │
├──────────────────────────────────────────────┤
│ PANEL 3:                                     │
│ Priya: What does adrenaline do to us?        │
│ Rahul: It is the emergency hormone. It       │
│        speeds up heartbeat for action!       │
├──────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                             │
│ Synapse converts electrical to chemical.     │
│ Brain parts: Cerebrum (thought),             │
│ Cerebellum (balance), Medulla (invol).       │
└──────────────────────────────────────────────┘
```', TRUE, 3)
ON CONFLICT (id) DO UPDATE SET note_content = EXCLUDED.note_content;

-- Revision Notes for Chapter 7: How do Organisms Reproduce?
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('12bb97ce-95c0-4bde-9e34-5a3a5986f255', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380228', 'Revision Notes: How do Organisms Reproduce?', 'note', NULL, NULL, '# Chapter 7: How do Organisms Reproduce?

## 1. 🎯 Chapter Goal
Understand asexual reproduction methods in single-celled and simple multi-cellular organisms, sexual reproduction in plants (flowers, pollination, fertilization), and human reproduction (male/female systems, menstrual cycle, reproductive health).

## 2. 🪝 Hook
Every living organism dies eventually. Yet, life on Earth has continued for millions of years. How? Because organisms can make copies of themselves! Let''s explore how a single cell splits to create new life, and how complex organisms pass on their legacy!

## 3. 📖 Concept 1: Asexual Reproduction
Asexual reproduction involves a single parent. Methods include:
- Fission: Binary fission in Amoeba, or multiple fission in Plasmodium.
- **[JARGON: Binary Fission | A type of asexual reproduction where a single parent cell divides into two equal halves to form two new individuals | Amoeba splitting into two daughter amoebae.]** occurs in any plane in Amoeba.
- **[JARGON: Regeneration | The ability of an organism to regrow lost body parts or develop a whole new individual from a cut part | A Planaria cut into three pieces growing into three separate flatworms.]** occurs in Planaria/Hydra where cut parts regrow into individuals.
- Budding (Hydra/Yeast).
- **[JARGON: Vegetative Propagation | An asexual method of plant reproduction where new plants grow from vegetative parts like roots, stems, or leaves | A Bryophyllum leaf falling on soil and sprouting new plantlets from its margins.]** (Bryophyllum leaves, stem cutting in rose).
- Spore formation (Rhizopus).

## 4. 📖 Concept 2: Sexual Reproduction in Flowering Plants
Flowers contain reproductive organs. Stamen is male (anther, filament); Carpel/Pistil is female (stigma, style, ovary).

**[JARGON: Pollination | The transfer of pollen grains from the anther of a stamen to the stigma of a carpel | A honeybee carrying pollen from one hibiscus flower to another.]** transfers pollen to stigma. A pollen tube grows through the style to the ovary. Flowering plants show **[JARGON: Double Fertilization | A complex fertilization process in flowering plants where one male gamete fuses with the egg cell and another fuses with two polar nuclei | The fusion events in a flowering plant embryo sac leading to zygote and endosperm formation.]** inside the **[JARGON: Ovule | The structure inside the plant ovary that contains the female egg cell and develops into a seed after fertilization | The small green structures inside a pea pod that become peas.]** (one sperm fuses with egg, the other fuses with polar nuclei). Zygote becomes embryo, ovule becomes seed, ovary becomes fruit.

## 5. 📖 Concept 3: Human Reproduction & Reproductive Health
Males have testes (produce sperm and testosterone). Females have ovaries (produce eggs, estrogen, progesterone). Fertilization happens in the fallopian tube. The embryo implants in the uterus, getting nutrients through the **[JARGON: Placenta | A disk-like tissue embedded in the uterine wall that connects the embryo to the mother for nutrition and gas exchange | The structure providing oxygen and glucose from mother''s blood to the developing fetus.]**.

If the egg is not fertilized, **[JARGON: Menstruation | The monthly shedding of the uterine lining and unfertilized egg, accompanied by bleeding, in human females | The 3-5 day menstrual flow occurring roughly every 28 days.]** occurs. Contraception methods include barriers (condoms), chemicals (pills), IUCDs (copper-T), and surgery: **[JARGON: Vasectomy | A surgical method of contraception in males where the vas deferens is blocked or cut to prevent sperm release | A permanent birth control procedure performed on men.]** (male) or tubectomy (female).

## 6. ⚠️ Common Mistakes
- Confusing Regeneration with normal reproduction. Planaria do not cut themselves on purpose to reproduce; it is an accidental repair mechanism.
- Writing that fertilization occurs in the uterus. In humans, fertilization happens in the fallopian tube (oviduct); the uterus is only for implantation and development.

## 7. 💡 Memory Tricks
- **Stamen has MEN**: Stamens are male parts.
- **Carpel has a CAR**: You drive a car with a **style** (Stigma, Style, Ovary are female parts).
- **VAsectomy = VAs deferens**: Surgical cut of vas deferens (males).
- **TUbectomy = Fallopian TUbe**: Surgical cut of fallopian tube (females).

## 8. 📝 Quick Practice
- **Question 1**: What is the function of the prostate gland and seminal vesicles in males?
  - *Answer*: They secrete fluids that provide nutrition to sperm and make their transport easier through the vas deferens.
- **Question 2**: What happens if the egg is not fertilized in a human female?
  - *Answer*: The thick lining of the uterus breaks down and is shed along with blood and mucus through the vagina. This monthly cycle is menstruation, lasting 2 to 8 days.

## 9. 🎓 Board Tips
- The diagram showing the growth of the pollen tube on the stigma is highly important. Practice drawing it accurately.
- Differentiate between binary fission in Amoeba (any plane) and Leishmania (fixed longitudinal plane due to flagellum).

## 10. 🔄 One-Minute Revision
- Asexual reproduction involves one parent and yields identical clones.
- Sexual reproduction involves two parents, creating variations.
- Flowers contain male stamens and female carpels; double fertilization produces seed and endosperm.
- Human fertilization occurs in the fallopian tube; placenta links fetus to maternal blood.
- Contraceptives prevent unwanted pregnancies and protect against STDs.

## 11. 🎬 Comic Recap
```
┌──────────────────────────────────────────────┐
│ PANEL 1:                                     │
│ Priya: Is regeneration a method of normal    │
│        reproduction?                         │
│ Rahul: No, Planaria only regenerate when cut │
│        by accident. They do not wait for it! │
├──────────────────────────────────────────────┤
│ PANEL 2:                                     │
│ Priya: What is double fertilization?         │
│ Rahul: One male gamete fuses with the egg;   │
│        the other fuses with polar nuclei.    │
├──────────────────────────────────────────────┤
│ PANEL 3:                                     │
│ Priya: What are surgical contraceptive methods │
│        for males and females?                │
│ Rahul: Vasectomy for males (blocks vas def); │
│        tubectomy for females (blocks tubes). │
├──────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                             │
│ Flowers have male stamens and female carpels. │
│ Fertilization happens in the fallopian tube. │
│ STDs can be bacterial or viral.              │
└──────────────────────────────────────────────┘
```', TRUE, 3)
ON CONFLICT (id) DO UPDATE SET note_content = EXCLUDED.note_content;

-- Revision Notes for Chapter 8: Heredity
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('43e330d5-5f72-45fd-b1e3-a1d7f20dc77b', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380229', 'Revision Notes: Heredity', 'note', NULL, NULL, '# Chapter 8: Heredity

## 1. 🎯 Chapter Goal
Understand how traits are inherited, Mendel''s experiments on pea plants (monohybrid and dihybrid crosses), how traits get expressed, and sex determination in humans.

## 2. 🪝 Hook
Why do you have your mother''s eyes or your father''s smile? How did these physical features travel across generations to construct you? Let''s decode the secret manual of life: DNA, genes, and the rules of inheritance!

## 3. 📖 Concept 1: Mendel''s Monohybrid Cross
Heredity is the transmission of traits. Gregor Mendel used pea plants (*Pisum sativum*). In a **[JARGON: Monohybrid Cross | A cross between two organisms that differ in only one pair of contrasting characters | Crossing a pure tall pea plant with a pure short pea plant.]**, tall (TT) and short (tt) plants were crossed. The F1 generation was all tall because tall is a **[JARGON: Dominant Trait | An inherited trait that is expressed in an organism even when only one copy of its gene is present | Tallness (T) is dominant over dwarfness (t) in pea plants.]**.

The short trait is a **[JARGON: Recessive Trait | A trait that is expressed only when two copies of its gene are present in the organism | Dwarfness (t) being expressed only in ''tt'' plants, not in ''Tt''.]**. In F2 (crossed F1 Tt x Tt), the phenotypic ratio was 3:1 (Tall:Short) and the genotypic ratio was 1:2:1 (TT:Tt:tt).

## 4. 📖 Concept 2: Mendel''s Dihybrid Cross
Mendel also studied crosses with two contrasting characters. In a **[JARGON: Dihybrid Cross | A cross between two organisms that differ in two pairs of contrasting characters | Crossing a plant having round yellow seeds with one having wrinkled green seeds.]**, round yellow seed plants (RRYY) were crossed with wrinkled green seed plants (rryy). The F1 offspring were all round yellow (RrYy).

In F2, seeds showed a phenotypic ratio of 9:3:3:1 (Round Yellow : Round Green : Wrinkled Yellow : Wrinkled Green). This led to the **[JARGON: Law of Independent Assortment | Mendel''s law stating that alleles of two or more different genes sort into gametes independently of one another | Seed shape inheritance does not affect seed color inheritance.]**. The genetic composition is the **[JARGON: Genotype | The genetic constitution of an organism, representing its complete set of genes | The letters TT, Tt, or tt representing the tallness genes of a plant.]**, showing that genes are inherited independently.

## 5. 📖 Concept 3: Trait Expression and Sex Determination
DNA has sections called genes. A **[JARGON: Gene | A section of DNA on a chromosome that contains instructions for making a specific protein to express a trait | The section of DNA that codes for the height enzyme in pea plants.]** codes for a protein or enzyme that determines the trait. The physical look is the **[JARGON: Phenotype | The observable physical characteristics or traits of an organism | A pea plant appearing physically tall or short.]**.

Humans have 23 pairs of chromosomes. One pair are **[JARGON: Sex Chromosome | A chromosome involved in determining the sex of an organism | The X and Y chromosomes in humans.]**. Females have XX and males have XY. All eggs carry an X. Sperms carry either X or Y. The sperm determines the sex: an X-carrying sperm fertilizes the egg to give a girl (XX), and a Y-carrying sperm gives a boy (XY).

## 6. ⚠️ Common Mistakes
- Stating that the mother determines the sex of the child. Since females only produce eggs with X chromosomes, the father''s sperm (which can carry X or Y) determines the sex of the baby.
- Confusing Phenotype (physical appearance, e.g. 3:1 Tall:Short) with Genotype (genetic makeup, e.g. 1:2:1 TT:Tt:tt) in Mendel''s monohybrid cross.

## 7. 💡 Memory Tricks
- **Y is for Boy**: The presence of the **Y** chromosome makes the child a boy (XY).
- **Dominant Dominates**: A dominant trait is like a loud person speaking over a quiet recessive trait (which needs another quiet friend to be heard).

## 8. 📝 Quick Practice
- **Question 1**: A tall pea plant (TT) is crossed with a short pea plant (tt). What will be the genotype and phenotype of the F1 generation?
  - *Answer*: Genotype: Tt (heterozygous). Phenotype: Tall, because Tallness (T) is dominant over shortness (t).
- **Question 2**: How does variation in a species promote survival?
  - *Answer*: Variations provide adaptability to environmental changes. For example, if a bacteria population faces a heatwave, heat-resistant variants will survive, saving the species from extinction.

## 9. 🎓 Board Tips
- Dihybrid crosses are very common for 5 marks. Practice drawing the 16-square Punnett square and counting the 9:3:3:1 ratio carefully.
- Learn to draw the sex determination flowchart (XX x XY) showing 50% male and 50% female offspring.

## 10. 🔄 One-Minute Revision
- Heredity is the transmission of characteristics from parents to offspring.
- Mendel''s monohybrid cross gives a 3:1 phenotypic and 1:2:1 genotypic ratio.
- Mendel''s dihybrid cross shows that traits are inherited independently (9:3:3:1 ratio).
- Genes contain instructions to build proteins that control physical traits.
- In humans, sex is determined genetically by the X or Y chromosome in the father''s sperm.

## 11. 🎬 Comic Recap
```
┌──────────────────────────────────────────────┐
│ PANEL 1:                                     │
│ Priya: Why did Mendel get only tall plants   │
│        in the F1 generation of his cross?    │
│ Rahul: Because Tallness (T) is dominant and  │
│        dwarfness (t) is recessive!           │
├──────────────────────────────────────────────┤
│ PANEL 2:                                     │
│ Priya: What is the F2 phenotypic ratio of a  │
│        dihybrid cross?                       │
│ Rahul: It is 9:3:3:1! Seed shape and color   │
│        are inherited independently.          │
├──────────────────────────────────────────────┤
│ PANEL 3:                                     │
│ Priya: Who determines the sex of the child?  │
│ Rahul: The father! Sperms carry either X or  │
│        Y, while eggs only carry X.           │
├──────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                             │
│ Monohybrid F2 ratio: 3:1 (phenotypic).       │
│ Genes on DNA code for proteins.              │
│ XX is female, XY is male.                    │
└──────────────────────────────────────────────┘
```', TRUE, 3)
ON CONFLICT (id) DO UPDATE SET note_content = EXCLUDED.note_content;

-- =========================================================================
-- 3. INSERT QUIZZES
-- =========================================================================
INSERT INTO quizzes (id, chapter_id, title, passing_percentage) VALUES
('55c86387-db5e-47b7-8d92-8a1b846d760f', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380225', 'Carbon and its Compounds Assessment', 60),
('274eaed4-ab07-4c2f-8bee-753cd15c0800', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380226', 'Life Processes Assessment', 60),
('27754dde-2e5c-4db4-852f-57b05475d565', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380227', 'Control and Coordination Assessment', 60),
('3d4954a5-596d-44ff-97c7-115a3865ce46', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380228', 'How do Organisms Reproduce? Assessment', 60),
('e6a4048a-e777-4d50-9218-106e9c61b1fd', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380229', 'Heredity Assessment', 60)
ON CONFLICT (id) DO NOTHING;

-- =========================================================================
-- 4. INSERT QUIZ QUESTIONS
-- =========================================================================
-- Quiz Questions for Chapter 4: Carbon and its Compounds
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('a26b592e-741a-4f97-9943-ed66d64955bb', '55c86387-db5e-47b7-8d92-8a1b846d760f', 'What is the atomic number of carbon and its electronic configuration?', 'multiple_choice', '["A. 6; (2, 4)", "B. 8; (2, 6)", "C. 4; (2, 2)", "D. 12; (2, 8, 2)"]', 0, NULL, 1),
('9c7aa55c-11b8-492c-b24a-2a133f4c745b', '55c86387-db5e-47b7-8d92-8a1b846d760f', 'Which of the following properties of carbon allows it to form a huge number of compounds by self-linking?', 'multiple_choice', '["A. High electronegativity", "B. Catenation", "C. Allotropy", "D. High density"]', 1, NULL, 1),
('6fc08301-65c3-4cae-aedd-576ac8e6eb68', '55c86387-db5e-47b7-8d92-8a1b846d760f', 'What is the functional group present in ethanoic acid?', 'multiple_choice', '["A. Aldehyde group (-CHO)", "B. Ketone group (-CO-)", "C. Carboxylic acid group (-COOH)", "D. Alcohol group (-OH)"]', 2, NULL, 1),
('8767e3c9-347c-48d5-b81f-5aa8cfb264d2', '55c86387-db5e-47b7-8d92-8a1b846d760f', 'When ethanol is heated with concentrated sulphuric acid at 443 K, it undergoes dehydration to produce which compound?', 'multiple_choice', '["A. Ethane", "B. Ethene", "C. Ethyne", "D. Diethyl ether"]', 1, NULL, 1),
('8cd0b555-964b-4777-bc07-b77b1a70b498', '55c86387-db5e-47b7-8d92-8a1b846d760f', 'Why do soaps form scum instead of lather in hard water?', 'multiple_choice', '["A. Soap reacts with calcium and magnesium salts present in hard water", "B. Soap reacts with sodium chloride in hard water", "C. Soap is insoluble in cold water", "D. Hard water contains acidic substances that destroy soap"]', 0, NULL, 1)
ON CONFLICT (id) DO NOTHING;

-- Quiz Questions for Chapter 5: Life Processes
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('3ee1636c-e76e-4e78-998d-3d93630581c7', '274eaed4-ab07-4c2f-8bee-753cd15c0800', 'Which of the following is the correct equation representing photosynthesis?', 'multiple_choice', '["A. 6CO2 + 6H2O + Sunlight -> C6H12O6 + 6O2", "B. 6CO2 + 12H2O + Sunlight -> C6H12O6 + 6O2 + 6H2O", "C. C6H12O6 + 6O2 -> 6CO2 + 6H2O + Energy", "D. 6CO2 + 6H2O -> C6H12O6 + 6CO2"]', 1, NULL, 1),
('9318d6a9-34d7-4d95-859c-f897a0d81803', '274eaed4-ab07-4c2f-8bee-753cd15c0800', 'What happens to pyruvate in the cytoplasm of yeast cells during anaerobic respiration?', 'multiple_choice', '["A. It is converted into lactic acid and water", "B. It is converted into ethanol and carbon dioxide", "C. It is converted into carbon dioxide and water with 38 ATP", "D. It is converted into glucose and oxygen"]', 1, NULL, 1),
('e8d0e280-cdf6-427c-8632-720035a390fd', '274eaed4-ab07-4c2f-8bee-753cd15c0800', 'In the human circulatory system, which chamber of the heart receives oxygenated blood from the lungs via the pulmonary veins?', 'multiple_choice', '["A. Right atrium", "B. Right ventricle", "C. Left atrium", "D. Left ventricle"]', 2, NULL, 1),
('a2bb1e70-e45f-483a-a423-afb2062e50f1', '274eaed4-ab07-4c2f-8bee-753cd15c0800', 'Translocation of food in plants takes place through which tissue, and is it an active process?', 'multiple_choice', '["A. Xylem, which is a passive process", "B. Phloem, which is an active process utilizing ATP", "C. Stomata, which is driven by transpiration", "D. Xylem, which is an active process"]', 1, NULL, 1),
('8f9a7785-055e-48bd-80c5-4f055a4bf736', '274eaed4-ab07-4c2f-8bee-753cd15c0800', 'The filtering units of human kidneys are called:', 'multiple_choice', '["A. Neurons", "B. Nephrons", "C. Alveoli", "D. Ureters"]', 1, NULL, 1)
ON CONFLICT (id) DO NOTHING;

-- Quiz Questions for Chapter 6: Control and Coordination
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('e1e39fec-f66b-4945-b010-a690b6b5c691', '27754dde-2e5c-4db4-852f-57b05475d565', 'In a neuron, where is the electrical impulse converted into a chemical signal to cross the gap to the next neuron?', 'multiple_choice', '["A. Dendrite", "B. Cell body", "C. Axon", "D. Synapse"]', 3, NULL, 1),
('951bca7f-1cb9-4ede-8f3b-003ea5f21b7b', '27754dde-2e5c-4db4-852f-57b05475d565', 'Which part of the human brain is responsible for coordinating voluntary actions like maintaining posture and balance while riding a bicycle?', 'multiple_choice', '["A. Cerebrum", "B. Cerebellum", "C. Medulla", "D. Hypothalamus"]', 1, NULL, 1),
('7167b5f6-0c53-407f-99c4-0c91cfb49f26', '27754dde-2e5c-4db4-852f-57b05475d565', 'Which plant hormone inhibits growth and is responsible for the wilting of leaves?', 'multiple_choice', '["A. Auxin", "B. Gibberellin", "C. Cytokinin", "D. Abscisic acid"]', 3, NULL, 1),
('16d20c07-0c6e-4233-a517-26e22914e3c2', '27754dde-2e5c-4db4-852f-57b05475d565', 'Which hormone is released by the thyroid gland to regulate carbohydrate, protein, and fat metabolism, and which mineral is essential for its synthesis?', 'multiple_choice', '["A. Insulin, Zinc", "B. Adrenaline, Iron", "C. Thyroxine, Iodine", "D. Growth hormone, Calcium"]', 2, NULL, 1),
('60a8df4c-2d8f-489e-9cb9-4e118a6fbed6', '27754dde-2e5c-4db4-852f-57b05475d565', 'A reflex arc is a pathway where impulses travel from receptors to:', 'multiple_choice', '["A. The brain, which then sends signals directly to the muscles", "B. The spinal cord, which directly sends a response to the effector muscle", "C. The endocrine glands, which release hormones", "D. The sensory nerves only, without any motor response"]', 1, NULL, 1)
ON CONFLICT (id) DO NOTHING;

-- Quiz Questions for Chapter 7: How do Organisms Reproduce?
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('cb5702c2-18e3-45b1-aadb-0d82e359d949', '3d4954a5-596d-44ff-97c7-115a3865ce46', 'Planaria has an amazing ability to grow a complete individual from any cut body part. What is this asexual reproduction method called?', 'multiple_choice', '["A. Binary fission", "B. Budding", "C. Regeneration", "D. Spore formation"]', 2, NULL, 1),
('9d3b5654-3864-401e-86a2-67eac4ba8947', '3d4954a5-596d-44ff-97c7-115a3865ce46', 'What are the male and female reproductive parts of a flower respectively?', 'multiple_choice', '["A. Petals and Sepals", "B. Stamen and Carpel/Pistil", "C. Pollen and Stigma", "D. Filament and Style"]', 1, NULL, 1),
('4e3ec6a5-aab3-480d-b038-edf3563a88d2', '3d4954a5-596d-44ff-97c7-115a3865ce46', 'Double fertilization in flowering plants refers to:', 'multiple_choice', '["A. Fusion of two pollen grains with two egg cells", "B. Fusion of one male gamete with the egg cell, and another male gamete with the two polar nuclei", "C. Fertilization of two different flowers on the same plant", "D. Fusion of sperm and egg twice to form twins"]', 1, NULL, 1),
('9a5d46e9-90ac-428d-bdb5-8a96bed1de2b', '3d4954a5-596d-44ff-97c7-115a3865ce46', 'Where does fertilization of the egg by a sperm take place in the human female reproductive tract?', 'multiple_choice', '["A. Ovary", "B. Uterus", "C. Fallopian tube (Oviduct)", "D. Vagina"]', 2, NULL, 1),
('8359a86a-8723-4c2b-aabe-776fc35ff363', '3d4954a5-596d-44ff-97c7-115a3865ce46', 'Which of the following is a surgical method of contraception performed in females to block the fallopian tubes?', 'multiple_choice', '["A. Vasectomy", "B. Tubectomy", "C. Oral pills", "D. Copper-T"]', 1, NULL, 1)
ON CONFLICT (id) DO NOTHING;

-- Quiz Questions for Chapter 8: Heredity
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('e05d408e-1f85-4f98-9586-4839e8b9f7e8', 'e6a4048a-e777-4d50-9218-106e9c61b1fd', 'Gregor Mendel crossed pure tall (TT) and pure short (tt) pea plants. What was the phenotypic ratio of tall to short plants in the F2 generation?', 'multiple_choice', '["A. 1:2:1", "B. 3:1", "C. 9:3:3:1", "D. 1:1"]', 1, NULL, 1),
('f1665bbb-f06a-4a3e-a3b6-dce39421423a', 'e6a4048a-e777-4d50-9218-106e9c61b1fd', 'In Mendel''s dihybrid cross between round yellow seeds (RRYY) and wrinkled green seeds (rryy), what is the phenotypic ratio obtained in the F2 generation?', 'multiple_choice', '["A. 3:1", "B. 1:2:1", "C. 9:3:3:1", "D. 9:1:1:5"]', 2, NULL, 1),
('17d2d9cb-0185-4fd0-bee1-af5d091cc47b', 'e6a4048a-e777-4d50-9218-106e9c61b1fd', 'Why are human males said to be responsible for the sex of the child?', 'multiple_choice', '["A. Males have two X chromosomes", "B. All sperms carry only Y chromosomes", "C. Males produce two types of sperms, some carrying X and some carrying Y chromosomes", "D. Mother passes the Y chromosome to the male child"]', 2, NULL, 1),
('64a2f219-13aa-4ca4-9670-7bdf8fccb057', 'e6a4048a-e777-4d50-9218-106e9c61b1fd', 'A segment of DNA on a chromosome that provides instructions for making a specific protein to express a trait is called:', 'multiple_choice', '["A. Gene", "B. Allele", "C. Chromatid", "D. Zygote"]', 0, NULL, 1),
('b8f78808-0f17-4b3c-b811-d3e7bd8799f5', 'e6a4048a-e777-4d50-9218-106e9c61b1fd', 'What does the term "Phenotype" refer to?', 'multiple_choice', '["A. The chemical structure of DNA", "B. The number of chromosomes in a cell", "C. The genetic makeup of an organism", "D. The observable physical characteristics of an organism"]', 3, NULL, 1)
ON CONFLICT (id) DO NOTHING;
-- CBSE Class 10 Learning Portal Seed Data - Batch 3 Science Part 2
-- Generated on 2026-06-24
-- Format: Clean SQL with ON CONFLICT (id) DO NOTHING for safe re-runs.

-- 1. INSERT CHAPTERS
INSERT INTO chapters (id, subject_id, title, sequence_number, description) VALUES
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd383009', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'Chapter 9: Light — Reflection and Refraction', 9, 'Study the reflection of light by spherical mirrors, refraction of light, and their applications including lens and mirror formulas.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd383010', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'Chapter 10: The Human Eye and the Colourful World', 10, 'Understand the anatomy of the human eye, defects of vision and their correction, refraction through a prism, dispersion, and scattering of light.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd383012', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'Chapter 12: Magnetic Effects of Electric Current', 11, 'Explore magnetic fields, field lines, field due to current-carrying conductors, electromagnetism, force on conductors, and domestic safety circuits.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd383013', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'Chapter 13: Our Environment', 13, 'Learn about ecosystems, trophic levels, energy flow, food chains and webs, ozone depletion, and waste management.')
ON CONFLICT (id) DO NOTHING;

-- 2. INSERT LESSONS (Revision Notes)
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd383009', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd383009', 'Revision Notes: Light — Reflection and Refraction', 'note', NULL, NULL, '# Chapter 9: Light — Reflection and Refraction

## 1. 🎯 Chapter Goal
Learn how spherical mirrors and lenses reflect and refract light. Master the mirror and lens formulas to solve numerical problems.

## 2. 🪝 Hook
Look at your reflection in a shiny metal spoon. On one side you look right side up, but on the other you are upside down! Why does a simple spoon flip your image? Let''s discover how curved surfaces bend light to trick our eyes!

## 3. 📖 Concept 1: Reflection of Light and Spherical Mirrors
Reflection is when light bounces off a polished surface. A **[JARGON: Concave Mirror | A spherical mirror with a reflecting surface curved inwards, which converges parallel light rays | A makeup mirror or the inside of a spoon]** (a mirror that curves inwards) converges light. A **[JARGON: Convex Mirror | A spherical mirror with a reflecting surface curved outwards, which diverges parallel light rays | A side-view car mirror or the back of a spoon]** (a mirror that curves outwards) diverges light.

Key terms:
- **Pole** (P): The centre of the reflecting surface of a spherical mirror.
- **Principal Focus** (F): The point where parallel light rays meet (or appear to meet) after reflection.
- **[JARGON: Focal Length | The distance between the pole and the principal focus of a spherical mirror or lens | The distance where parallel sunlight converges to a sharp spot]** (the distance from the pole to the focus point).
- The radius of curvature ($R$) is twice the focal length ($f$): $R = 2f$.

### Mirror Formula and Magnification:
$$\frac{1}{v} + \frac{1}{u} = \frac{1}{f}$$
- $u$ = object distance (always negative).
- $v$ = image distance (+ for virtual, - for real).
- $f$ = focal length (- for concave, + for convex).

Magnification ($m$):
$$m = -\frac{v}{u} = \frac{h''}{h}$$
Where $h''$ is image height and $h$ is object height. If $m$ is negative, the image is real and inverted. If $m$ is positive, it is virtual and erect.

## 4. 📖 Concept 2: Refraction and Refractive Index
When light travels from one medium to another, it bends. This bending is called **[JARGON: Refraction | The bending of light as it passes from one transparent medium to another of different optical density | A pencil looking bent when placed in a glass of water]** (light bending at a boundary).

Laws of Refraction (Snell''s Law):
The ratio of the sine of the angle of incidence ($\sin i$) to the sine of the angle of refraction ($\sin r$) is a constant for a given pair of media.
$$\frac{\sin i}{\sin r} = \text{constant}$$

The **[JARGON: Refractive Index | The ratio of the speed of light in a vacuum to the speed of light in a given medium | Water has a refractive index of 1.33, meaning light travels faster in air than water]** (speed ratio of light) determines how much light bends.
$$n_m = \frac{c}{v}$$
Where $c$ is the speed of light in air ($3 \times 10^8\text{ m/s}$) and $v$ is the speed of light in the medium.

## 5. 📖 Concept 3: Lenses and Power
A lens is a transparent medium bound by curved surfaces. A **[JARGON: Convex Lens | A lens that is thicker in the middle than at the edges, which converges light rays | A magnifying glass used to read tiny text]** (a converging lens) converges light. A **[JARGON: Concave Lens | A lens that is thinner in the middle than at the edges, which diverges light rays | Spectacles used to correct near-sightedness]** (a diverging lens) diverges light.

### Lens Formula and Magnification:
$$\frac{1}{v} - \frac{1}{u} = \frac{1}{f}$$
- $f$ is positive for convex lens, negative for concave lens.
- Magnification ($m$):
$$m = \frac{v}{u} = \frac{h''}{h}$$

### **[JARGON: Power of a Lens | The measure of a lens''s ability to converge or diverge light rays, equal to the reciprocal of its focal length in meters | A lens with a focal length of 0.5 meters has a power of +2 Dioptres]** (the bending power of a lens):
$$P = \frac{1}{f\text{ (in meters)}}$$
Its unit is Dioptre (D). A convex lens has positive power, and a concave lens has negative power.

## 6. ⚠️ Common Mistakes
- **Formula Signs**: Confusing the mirror formula (uses $+$ sign) with the lens formula (uses $-$ sign).
- **Magnification Signs**: Forgetting that mirror magnification has a negative sign ($m = -v/u$) while lens magnification has a positive sign ($m = v/u$).
- **Power Units**: Calculating lens power using focal length in centimeters. Always convert focal length to meters first!

## 7. 💡 Memory Tricks
- **Con-cave is a cave**: Concave mirrors curve inwards like a dark cave.
- **Converging or Diverging**: Lenses behave opposite to mirrors. A concave mirror converges, but a concave lens diverges!
- **Positive is Helpful**: A convex lens magnifying glass is positive ($+f$).

## 8. 📝 Quick Practice
- **Question 1**: A convex mirror has a radius of curvature of 30 cm. Find its focal length.
  - *Answer*: Since $R = 2f \implies f = R/2 = 30/2 = +15$ cm. (Positive because it is a convex mirror).
- **Question 2**: A thin lens has a focal length of -50 cm. What is its power and type?
  - *Answer*: Convert focal length to meters: $f = -0.5$ m. Power $P = 1/f = 1/(-0.5) = -2.0$ D. Since the focal length and power are negative, it is a concave lens.

## 9. 🎓 Board Tips
- Always draw arrows on ray diagrams. A diagram without direction arrows will lose points!
- Write the given values with correct signs ($+$ or $-$) using Cartesian sign convention before starting any calculation.

## 10. 🔄 One-Minute Revision
- Concave mirrors converge light; convex mirrors diverge light.
- Mirror formula: $1/v + 1/u = 1/f$. Lens formula: $1/v - 1/u = 1/f$.
- Refractive index $n = c/v$ shows how much light slows down in a medium.
- Convex lenses converge light; concave lenses diverge light.
- Power of lens: $P = 1/f$ in meters, measured in Dioptres (D).

## 11. 🎬 Comic Recap
```
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "Priya: Why does my reflection in the│
│         back of the spoon look so tiny and │
│         erect?"                            │
│ Rahul: "Rahul: That is a convex mirror! It │
│         always forms virtual, erect, and   │
│         diminished images."                │
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "Priya: And what about the inside of│
│         the spoon?"                        │
│ Rahul: "Rahul: That is a concave mirror. If│
│         you hold it close, your face will  │
│         look huge and upright!"            │
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "Priya: What is the main difference │
│         between mirror and lens formulas?" │
│ Rahul: "Rahul: Mirror uses plus: 1/v + 1/u │
│         = 1/f. Lens uses minus: 1/v - 1/u  │
│         = 1/f. Just swap the sign!"        │
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ Mirrors bounce light, lenses pass light.   │
│ R = 2f. Power is 1/f (in meters).          │
└────────────────────────────────────────────┘
```', TRUE, 3),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd383010', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd383010', 'Revision Notes: The Human Eye and the Colourful World', 'note', NULL, NULL, '# Chapter 10: The Human Eye and the Colourful World

## 1. 🎯 Chapter Goal
Understand how the human eye focuses light, how spectacles correct vision defects, and why optical phenomena like rainbows and blue skies occur.

## 2. 🪝 Hook
Close your eyes. You can smell, taste, or touch objects, but you cannot see their colors. The human eye is our most precious sense organ. How does this tiny organic camera capture the colors of a sunset? Let''s discover how our eyes work and how light paints our world!

## 3. 📖 Concept 1: The Human Eye and Accommodation
The human eye forms real, inverted images on a light-sensitive screen called the **[JARGON: Retina | The light-sensitive layer at the back of the eyeball containing photoreceptors | The retina acts like the film in a camera to capture images]** (the back screen of the eye). Light enters through the **[JARGON: Cornea | The outer transparent bulge at the front of the eye that refracts incoming light | A clear protective shield on the front of the eyeball]** (the front transparent dome).

The eye lens adjusts its shape to focus on objects at different distances. This ability is called the **[JARGON: Power of Accommodation | The ability of the eye lens to adjust its focal length using ciliary muscles | Relaxing ciliary muscles to focus clearly on a distant tree]** (focus adjustment power).
- **Near Point**: The minimum distance to see clearly without strain. For a normal eye, it is 25 cm.
- **Far Point**: The maximum distance the eye can see clearly. For a normal eye, it is infinity.

## 4. 📖 Concept 2: Defects of Vision and Correction
Sometimes the eye loses its power of accommodation. The three main defects are:
- **[JARGON: Myopia | A vision defect where a person can see nearby objects clearly but cannot see distant objects distinctly | A student who cannot read the blackboard from the last row]** (near-sightedness). It happens due to an elongated eyeball or excessive lens curvature. The image forms in front of the retina. We correct it using a concave lens.
- **[JARGON: Hypermetropia | A vision defect where a person can see distant objects clearly but cannot see nearby objects distinctly | An adult holding a newspaper far away to read it clearly]** (far-sightedness). It happens because the eyeball is too small or the focal length is too long. The image forms behind the retina. We correct it using a convex lens.
- **[JARGON: Presbyopia | An old-age vision defect where the eye struggles to focus on nearby objects due to stiffening of the lens | Grandparents wearing bifocal spectacles to read and look around]** (aging eye defect). It happens due to weakening ciliary muscles. We correct it using a convex lens or bifocal lenses (upper concave, lower convex).

## 5. 📖 Concept 3: Prisms, Dispersion, and Atmospheric Effects
A prism bends light. The angle between the incident ray and the emergent ray is the **[JARGON: Angle of Deviation | The angle between the direction of the incident ray and the emergent ray in a prism | Bending rays in a prism to separate colors]** (bending angle).

When white light passes through a prism, it splits into seven colors (VIBGYOR). This is called **[JARGON: Dispersion | The splitting of white light into its component colors when passing through a prism | A prism splitting sunlight into a seven-color band]** (splitting of light). Isaac Newton recombined these colors into white light using a second inverted prism. Rainbows are formed by refraction, dispersion, and internal reflection in water droplets.

[FIGURE: prism_dispersion]

### Light Scattering:
The **[JARGON: Tyndall Effect | The scattering of light by small suspended particles in its path, making the beam visible | A beam of sunlight visible in a smoky room]** (path-revealing light scattering) makes a light beam visible.
- **Blue Sky**: Fine air molecules scatter short wavelengths (blue light) more than long ones (red light).
- **Red Sunset**: At sunrise and sunset, light travels through more air. Most blue light is scattered away, leaving only red light to reach our eyes.

## 6. ⚠️ Common Mistakes
- **Lens Correction Confusion**: Correcting myopia with a convex lens or hypermetropia with a concave lens. Remember: Myopia = Concave, Hypermetropia = Convex.
- **Rainbow Physics**: Writing that a rainbow is caused only by dispersion. You must mention refraction, dispersion, and internal reflection!
- **Near Point Values**: Writing the near point without units or with the wrong unit (e.g., 25 meters instead of 25 cm).

## 7. 💡 Memory Tricks
- **My-opia is Close**: "My" means mine, which is close. Myopia is near-sightedness.
- **VIBGYOR order**: Violet is at the bottom (bends the most, high deviation), Red is at the top (bends the least, low deviation).
- **Green is Earth, Red is Live**: For wiring, but for eye: **C**oncave for **C**lose-sighted (Myopia).

## 8. 📝 Quick Practice
- **Question 1**: A person has a myopic eye with a far point of 80 cm. What type and power of lens should they use?
  - *Answer*: Since they have myopia, they must use a concave lens. To focus objects from infinity to 80 cm, the focal length is $f = -80$ cm = $-0.8$ m. Power $P = 1/f = 1/(-0.8) = -1.25$ D.
- **Question 2**: Why do planets not twinkle?
  - *Answer*: Planets are much closer to Earth than stars. They act as extended sources of light made of many point sources. The fluctuations from different points cancel each other out, so the total brightness stays steady.

## 9. 🎓 Board Tips
- Be ready to draw neat diagrams showing Myopia and Hypermetropia, and their corrections.
- Explain the role of the ciliary muscles clearly when discussing accommodation.

## 10. 🔄 One-Minute Revision
- Retina is the screen; cornea is the outer window; ciliary muscles change lens thickness.
- Myopia = near-sighted (corrected by concave); Hypermetropia = far-sighted (corrected by convex).
- Prism splits white light into VIBGYOR (dispersion).
- Atmospheric refraction causes star twinkling and shifts sunrise/sunset by 2 minutes.
- Scattering causes the blue sky (fine particles) and red sunset (thick air path).

## 11. 🎬 Comic Recap
```
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "Priya: Why can''t I read the board  │
│         clearly from the last bench?"      │
│ Rahul: "Rahul: You have myopia! Your lens  │
│         focuses the image in front of the  │
│         retina."                           │
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "Priya: How do we fix that?"        │
│ Rahul: "Rahul: Use a concave lens. It      │
│         diverges the light rays just enough│
│         to hit the retina."                │
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "Priya: Why does a rainbow only form│
│         when the sun is behind us?"        │
│ Rahul: "Rahul: Raindrops act like tiny     │
│         prisms. They refract, disperse, and│
│         internally reflect light to you."  │
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ Myopia = Concave. Hypermetropia = Convex.  │
│ Fine particles scatter blue; red reaches   │
│ through thick air.                         │
└────────────────────────────────────────────┘
```', TRUE, 3),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd383012', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd383012', 'Revision Notes: Magnetic Effects of Electric Current', 'note', NULL, NULL, '# Chapter 12: Magnetic Effects of Electric Current

## 1. 🎯 Chapter Goal
Understand how electric current produces magnetic fields, learn how to find force directions using rules, and master domestic safety circuit components.

## 2. 🪝 Hook
Bring a compass near a simple wire. Now, connect the wire to a battery. The compass needle swings! How can electricity generate an invisible magnetic force? Let''s explore how electric currents build magnetic fields and power our world!

## 3. 📖 Concept 1: Magnetic Fields and Field Lines
A **[JARGON: Magnetic Field | The region around a magnet or current-carrying wire where its magnetic force can be detected | A compass needle deflecting when placed near a bar magnet]** (the space of magnetic force) surrounds every magnet. We represent this field using **[JARGON: Magnetic Field Lines | Imaginary closed curves that show the path a free north pole would take in a magnetic field | Iron filings forming curved lines around a bar magnet]** (lines showing force paths).

### Properties of Magnetic Field Lines:
- They emerge from the North pole and enter the South pole outside the magnet.
- Inside the magnet, they travel from South to North, forming closed loops.
- They are crowded where the field is strong (near the poles).
- They never intersect. If they did, a compass needle would point in two directions, which is impossible.

[FIGURE: bar_magnet_field]

## 4. 📖 Concept 2: Magnetic Field due to Current-Carrying Conductors
Electric current in a wire produces a magnetic field.
- **Straight Wire**: The field lines form concentric circles. Use the **Right-Hand Thumb Rule**: Point your thumb in the direction of the current; your wrapped fingers show the field direction.
- **Circular Loop**: The field lines are circular near the wire but become straight parallel lines at the centre.
- **[JARGON: Solenoid | A long coil of many circular turns of insulated copper wire wrapped closely in the shape of a cylinder | A current-carrying coil used to create a uniform magnetic field inside it]** (a cylindrical wire coil): It behaves like a bar magnet. The field inside is uniform (parallel straight lines).
- **[JARGON: Electromagnet | A temporary magnet made by placing a soft iron core inside a current-carrying solenoid | A temporary magnet that can be turned on or off to lift heavy metal scrap]** (a temporary magnet): A soft iron core inside a solenoid becomes a strong magnet when current flows.

## 5. 📖 Concept 3: Force on Conductor and Domestic Circuits
A current-carrying conductor in a magnetic field experiences a force. The force is maximum when the current is perpendicular to the field.

### **[JARGON: Fleming''s Left-Hand Rule | A rule to find the direction of force on a current-carrying wire in a magnetic field using three fingers of the left hand | Stretching your thumb, forefinger, and middle finger perpendicular to find force direction]** (the finger rule for force):
Stretch the thumb, forefinger, and middle finger of your left hand perpendicular to each other:
- **F**orefinger = Magnetic **F**ield ($B$).
- **M**iddle finger = **M**ovement of charge / Current ($I$).
- **T**humb = **T**hrust / Force / Motion ($F$).

### Domestic Electric Circuits:
Power enters our homes through three wires:
1. **Live Wire** (Red insulation, 220V): Carries current.
2. **Neutral Wire** (Black insulation, 0V): Completes the circuit.
3. **Earth Wire** (Green insulation): Connected to a metal plate deep in the ground. It provides a safe low-resistance path for leaking current, preventing shocks from appliances with metallic bodies.

Safety Devices:
- **[JARGON: Short Circuit | An event where the live wire and neutral wire touch directly, causing current to rise dangerously | A spark in a socket when wire insulation is damaged]** (accidental wire contact).
- **[JARGON: Overloading | Connecting too many high-power appliances to a single socket or circuit, drawing excessive current | Plugging a heater, toaster, and geyser into one extension block]** (drawing too much current).
- **Electric Fuse**: A thin safety wire with a low melting point. It melts and breaks the circuit when current exceeds the safety limit due to overloading or short-circuiting.

## 6. ⚠️ Common Mistakes
- **Confusing Hand Rules**: Using Fleming''s Left-Hand Rule for straight wire fields (should use Right-Hand Thumb Rule) or vice versa.
- **Crossing Field Lines**: Drawing diagrams where magnetic field lines intersect. This is scientifically incorrect!
- **Electron Force Direction**: Forgetting that electrons are negative, so their current direction is opposite to their motion. If an electron moves North, the current points South!

## 7. 💡 Memory Tricks
- **Left Hand is FBI**: **F**orefinger is **B** (Field), **M**iddle finger is **I** (Current), **T**humb is **F**orce.
- **Green is Earth**: Green grass grows on Earth (Earth wire has green cover).
- **Thumb rules the wire, Left hand rules the force**: Right hand is for wire circles, Left hand is for straight line motion in a field.

## 8. 📝 Quick Practice
- **Question 1**: An electron beam moves horizontally from east to west in a magnetic field pointing downwards. What is the direction of the force?
  - *Answer*: Since electrons move East to West, the current direction is West to East. Field points downwards. Using Fleming''s Left-Hand Rule, the force points towards the North.
- **Question 2**: What is the potential difference between the live and neutral wires in India, and what is the frequency?
  - *Answer*: Potential difference is 220 V, and the frequency is 50 Hz.

## 9. 🎓 Board Tips
- Remember that the field inside a solenoid consists of parallel straight lines. This shows the field is uniform.
- Explain the difference between short-circuiting (wires touching) and overloading (drawing too much power) clearly in exam answers.

## 10. 🔄 One-Minute Revision
- Magnetic field lines emerge from North, enter South, form closed loops, and never cross.
- Right-Hand Thumb Rule finds the field direction around a current-carrying wire.
- Solenoid creates a uniform field. Soft iron core inside makes an electromagnet.
- Force direction is given by Fleming''s Left-Hand Rule (FBI).
- Live = Red (220V), Neutral = Black (0V), Earth = Green. Fuse melts to protect the circuit.

## 11. 🎬 Comic Recap
```
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "Priya: Why did the iron filings    │
│         form circles around the straight   │
│         wire?"                             │
│ Rahul: "Rahul: That is the magnetic field! │
│         Use your right hand to point along │
│         current, your fingers curl in circles."│
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "Priya: What about the solenoid?"   │
│ Rahul: "Rahul: It is a coiled wire. Inside,│
│         the lines are parallel and straight.│
│         It acts just like a bar magnet!"   │
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "Priya: Why does the green wire     │
│         protect me from electric shocks?"  │
│ Rahul: "Rahul: That is the Earth wire! It  │
│         takes any leaking current straight │
│         into the ground instead of you."   │
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ Field lines never cross.                   │
│ Left Hand is for Force (FBI).              │
│ Fuse melts during overloading.             │
└────────────────────────────────────────────┘
```', TRUE, 3),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd383013', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd383013', 'Revision Notes: Our Environment', 'note', NULL, NULL, '# Chapter 13: Our Environment

## 1. 🎯 Chapter Goal
Understand how living and non-living parts interact in an ecosystem, track how energy flows through food chains, and learn about ozone depletion and waste management.

## 2. 🪝 Hook
Throw a plastic bottle on the ground. It stays there for hundreds of years. Throw a banana peel, and it disappears in a few weeks. Why does nature welcome the banana peel back, but reject the plastic? Let''s discover how nature recycles its elements and how human activities disrupt this delicate balance!

## 3. 📖 Concept 1: Ecosystem and its Components
An **[JARGON: Ecosystem | A self-sustaining system of living organisms interacting with each other and their physical environment | A forest, pond, garden, or aquarium]** (a self-sustaining natural system) has two main parts:
- **[JARGON: Biotic Components | The living organisms in an ecosystem, including plants, animals, and decomposers | Birds, insects, trees, and bacteria in a garden]** (the living parts).
- **[JARGON: Abiotic Components | The non-living physical and chemical factors in an ecosystem | Sunlight, temperature, water, soil, and wind]** (the non-living parts).

### Feeding Categories:
1. **Producers**: Green plants that make food using solar energy (photosynthesis).
2. **Consumers**: Organisms that eat other organisms (herbivores, carnivores, omnivores, parasites).
3. **Decomposers**: Bacteria and fungi that break down dead remains and organic waste into simple inorganic nutrients, replenishing the soil.

## 4. 📖 Concept 2: Food Chains, Webs, and Energy Flow
Organisms feed on one another, forming a food chain.
Each step in the chain is a **[JARGON: Trophic Level | A step or feeding level in a food chain where energy transfer occurs | Plants at the first level, herbivores at the second level]** (a feeding stage).

### Energy Flow Rules:
- **Unidirectional**: Energy flows in one direction (Sun $\rightarrow$ Producers $\rightarrow$ Consumers). It cannot flow backwards.
- **1% Rule**: Plants capture only 1% of solar energy falling on their leaves and turn it into food.
- **[JARGON: Ten Percent Law | The rule that only 10% of energy is transferred to the next trophic level, while 90% is lost as heat or used for life processes | A deer gets 100 Joules of energy from eating grass containing 1000 Joules]** (the energy transfer limit): Only 10% of food energy reaches the next consumer level. The other 90% is lost as heat or used for digestion, growth, and movement. Because of this high energy loss, food chains rarely exceed 4 steps.

[FIGURE: trophic_levels]

### Biological Magnification:
Pesticides and heavy metals are non-biodegradable. When they enter a food chain, they accumulate. This is **[JARGON: Biological Magnification | The progressive accumulation of non-biodegradable chemicals at higher trophic levels in a food chain | Pesticides reaching their highest concentration in top predators like eagles or humans]** (toxic chemical buildup). The concentration of these chemicals is highest in top consumers (like humans).

## 5. 📖 Concept 3: Ozone Layer and Waste Management
Human activities create environmental problems:
- **Ozone Layer Depletion**: The **[JARGON: Ozone Layer | A protective layer of O3 gas in the stratosphere that absorbs harmful ultraviolet (UV) radiation from the sun | The atmospheric shield that protects skin from UV burns and cancer]** (the atmospheric shield) protects Earth. Oxygen ($O_2$) is split by UV light to form Ozone ($O_3$). Chlorofluorocarbons (CFCs), used in refrigerators, destroy ozone. In 1987, the UNEP signed an agreement to freeze CFC production.
- **Waste Management**:
  - **[JARGON: Biodegradable Waste | Waste materials that can be broken down into harmless substances by microorganisms over time | Paper, fruit peels, wood, and cotton]** (natural degradable waste).
  - **[JARGON: Non-biodegradable Waste | Waste materials that cannot be broken down by microorganisms and persist in the environment | Plastics, glass, nylon, and metal cans]** (non-degradable waste).

## 6. ⚠️ Common Mistakes
- **Energy Flow Direction**: Drawing arrows in a food chain pointing backwards. Arrows must point in the direction of energy flow (e.g., Grass $\rightarrow$ Deer $\rightarrow$ Lion).
- **First Trophic Level**: Confusing herbivores with the first trophic level. Producers (plants) are always at the first trophic level; herbivores are primary consumers but sit at the second trophic level.
- **Ground-Level Ozone**: Thinking ozone is good everywhere. It is a protective shield in the stratosphere, but a deadly poison at ground level!

## 7. 💡 Memory Tricks
- **90% Tax**: Nature takes a 90% tax at every step in the food chain. You only keep 10% of the energy!
- **Magnification = Multiplication**: The poison multiplies as it moves up the chain.
- **Ozone is O3, Oxygen is O2**: Three oxygen atoms make a shield.

## 8. 📝 Quick Practice
- **Question 1**: If 20,000 Joules of energy is present at the producer level, how much energy will reach the tertiary consumer?
  - *Answer*: Apply the Ten Percent Law at each step:
    - Producer ($T_1$): 20,000 J
    - Herbivore ($T_2$): 2,000 J
    - Carnivore ($T_3$): 200 J
    - Tertiary Consumer ($T_4$): 20 J.
    - Thus, 20 Joules of energy reaches the tertiary consumer.
- **Question 2**: Why are decomposers essential for an ecosystem?
  - *Answer*: Without decomposers, dead plants and animals would pile up, and the soil would run out of nutrients. Decomposers recycle minerals back into the soil.

## 9. 🎓 Board Tips
- Remember to mention the United Nations Environment Programme (UNEP) and the year 1987 when writing about the ozone layer agreement.
- Draw simple, clear arrows for food chains and webs.

## 10. 🔄 One-Minute Revision
- Ecosystem = Biotic (living) + Abiotic (non-living) components.
- Decomposers recycle nutrients.
- Energy flow is unidirectional. Only 10% is transferred to the next level.
- Non-biodegradable chemicals magnify up the food chain.
- Ozone ($O_3$) shield is depleted by CFCs. UNEP froze CFC production in 1987.
- Biodegradable breaks down; non-biodegradable persists.

## 11. 🎬 Comic Recap
```
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "Priya: Why do we have only 3 or 4  │
│         steps in most food chains?"        │
│ Rahul: "Rahul: Because of the 10% law! Each│
│         step loses 90% of the energy. By the│
│         4th step, almost nothing is left."  │
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "Priya: Why are humans so affected  │
│         by pesticide pollution?"           │
│ Rahul: "Rahul: That is biological          │
│         magnification. Since we eat at the │
│         top of the chain, we get the most  │
│         concentrated toxins!"              │
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "Priya: How did we stop the ozone   │
│         hole from getting bigger?"         │
│ Rahul: "Rahul: The UNEP froze CFC production│
│         in 1987. Now the ozone layer is    │
│         slowly healing!"                   │
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ Flow of energy is one-way.                 │
│ 10% energy transfer at each level.         │
│ Plastics do not decompose.                 │
└────────────────────────────────────────────┘
```', TRUE, 3)
ON CONFLICT (id) DO UPDATE SET note_content = EXCLUDED.note_content;

-- 3. INSERT QUIZZES
INSERT INTO quizzes (id, chapter_id, title, passing_percentage) VALUES
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd383009', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd383009', 'Science Chapter 9 Quiz', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd383010', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd383010', 'Science Chapter 10 Quiz', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd383012', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd383012', 'Science Chapter 12 Quiz', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd383013', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd383013', 'Science Chapter 13 Quiz', 60)
ON CONFLICT (id) DO NOTHING;

-- 4. INSERT QUIZ QUESTIONS
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383091', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383009', 'A concave mirror forms a real, inverted, and same-sized image of an object. Where is the object placed?', 'multiple_choice', '["A. At the focus (F)", "B. Between F and C", "C. At the centre of curvature (C)", "D. Beyond C"]', 2, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383092', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383009', 'The refractive index of medium A is 1.5, and medium B is 2.0. In which medium does light travel faster?', 'multiple_choice', '["A. Medium A", "B. Medium B", "C. Light travels at the same speed in both", "D. Light cannot travel in either medium"]', 0, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383093', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383009', 'A convex lens has a focal length of 20 cm. What is its power?', 'multiple_choice', '["A. +5.0 Dioptres", "B. -5.0 Dioptres", "C. +0.05 Dioptres", "D. -2.0 Dioptres"]', 0, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383094', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383009', 'According to the Cartesian sign convention, which of the following is true for the object distance (u) of an object placed in front of a mirror?', 'multiple_choice', '["A. It is always positive", "B. It is always negative", "C. It can be positive or negative depending on the mirror", "D. It is zero"]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383095', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383009', 'The magnification produced by a rear-view mirror fitted in vehicles is:', 'multiple_choice', '["A. Less than 1", "B. More than 1", "C. Equal to 1", "D. Can be more or less than 1 depending on object distance"]', 0, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383101', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383010', 'What is the function of the pupil in the human eye?', 'multiple_choice', '["A. It acts as a light-sensitive screen", "B. It controls the focal length of the eye lens", "C. It regulates and controls the amount of light entering the eye", "D. It sends electrical signals to the brain"]', 2, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383102', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383010', 'A person cannot see distant objects clearly, but can see nearby objects distinctly. Which defect of vision is this, and how can it be corrected?', 'multiple_choice', '["A. Hypermetropia, corrected by a convex lens", "B. Myopia, corrected by a concave lens", "C. Presbyopia, corrected by a bifocal lens", "D. Astigmatism, corrected by a cylindrical lens"]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383103', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383010', 'Which color of white light deviates the most when passing through a glass prism?', 'multiple_choice', '["A. Red", "B. Yellow", "C. Green", "D. Violet"]', 3, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383104', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383010', 'The twinkling of stars is due to which optical phenomenon?', 'multiple_choice', '["A. Dispersion of light by water droplets", "B. Scattering of light by dust particles", "C. Atmospheric refraction of star light", "D. Total internal reflection of light"]', 2, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383105', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383010', 'Why does the sky look blue on a clear day?', 'multiple_choice', '["A. Red light is absorbed by the atmosphere", "B. Fine particles in the air scatter blue light more than other colors", "C. Blue light has a longer wavelength than red light", "D. Water vapour in the air reflects the blue ocean"]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383121', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383012', 'Which of the following rules is used to find the direction of the magnetic field around a straight current-carrying wire?', 'multiple_choice', '["A. Fleming''s Left-Hand Rule", "B. Fleming''s Right-Hand Rule", "C. Right-Hand Thumb Rule", "D. Snell''s Law"]', 2, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383122', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383012', 'What is the nature of the magnetic field inside a current-carrying solenoid?', 'multiple_choice', '["A. It is zero at all points", "B. It decreases as we move towards its ends", "C. It increases as we move towards its ends", "D. It is uniform and same at all points"]', 3, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383123', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383012', 'According to Fleming''s Left-Hand Rule, if the forefinger points in the direction of the magnetic field and the middle finger in the direction of current, what does the thumb point to?', 'multiple_choice', '["A. Direction of voltage", "B. Direction of force or motion", "C. Direction of resistance", "D. Direction of electric charge"]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383124', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383012', 'What is the function of the earth wire in domestic circuits?', 'multiple_choice', '["A. To supply 220 V current to heavy appliances", "B. To act as a negative wire returning current", "C. To provide a low-resistance path to leak current safely into the ground", "D. To melt and break the circuit during a short circuit"]', 2, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383125', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383012', 'An electric short-circuit occurs when:', 'multiple_choice', '["A. Too many appliances are connected to a single socket", "B. The live wire and neutral wire come into direct contact", "C. The supply voltage suddenly drops to zero", "D. The earth wire is disconnected from the appliance"]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383131', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383013', 'Which group of organisms is at the first trophic level in a food chain?', 'multiple_choice', '["A. Herbivores", "B. Producers", "C. Carnivores", "D. Decomposers"]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383132', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383013', 'According to the Ten Percent Law, if producers capture 10,000 Joules of solar energy as chemical energy, how much energy is available to primary consumers?', 'multiple_choice', '["A. 10,000 Joules", "B. 1,000 Joules", "C. 100 Joules", "D. 10 Joules"]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383133', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383013', 'The process by which harmful non-biodegradable chemicals increase in concentration at each higher trophic level is called:', 'multiple_choice', '["A. Eutrophication", "B. Biological Magnification", "C. Energy Conservation", "D. Decomposition"]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383134', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383013', 'Which chemicals are primarily responsible for the depletion of the ozone layer?', 'multiple_choice', '["A. Carbon dioxide and methane", "B. Chlorofluorocarbons (CFCs)", "C. Nitrogen oxides and sulfur dioxide", "D. Carbon monoxide"]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383135', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383013', 'Which of the following is a biodegradable waste?', 'multiple_choice', '["A. Plastic milk bottles", "B. Glass test tubes", "C. Aluminum soda cans", "D. Fruit and vegetable peels"]', 3, NULL, 1)
ON CONFLICT (id) DO NOTHING;


-- --- FROM FILE db/seed_batch4_social_science.sql ---

-- SQL Seed File for Chapter 3: The Rise of Nationalism in Europe
-- Subject ID: a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33
-- Chapter ID: c0eebc99-9c0b-4ef8-bb6d-6bb9bd389030

INSERT INTO chapters (id, subject_id, title, sequence_number, description) VALUES
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd389030', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Chapter 3: The Rise of Nationalism in Europe', 3, 'Explore how nationalism transformed Europe from dynastic empires into nation-states through political revolutions, cultural romanticism, and crucial unifications.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd389030', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389030', 'Revision Notes: The Rise of Nationalism in Europe', 'note', NULL, NULL,
'# Chapter 3: The Rise of Nationalism in Europe

## 1. 🎯 Chapter Goal
Understand how the concept of a nation-state emerged in Europe, tracing the impact of the French Revolution, the clash between liberalism and conservatism, and the key unifications of Germany and Italy.

## 2. 🪝 Hook
Imagine a world where you do not belong to a country, but rather to a king who owns you and your town as personal property. Before the nineteenth century, Europe had no nation-states—only complex, multi-ethnic dynastic empires where people speaking different languages lived under one crown. Let''s discover how a wave of revolutions changed this map forever!

## 3. 📖 Concept 1: The French Revolution and the Rise of the Nation-State
During the nineteenth century, nationalism emerged as a force that swept across Europe, replacing dynastic empires with nation-states. The first clear expression of nationalism came with the French Revolution in 1789. The revolutionaries introduced key measures to create a collective identity, such as the ideas of *la patrie* (the fatherland) and *le citoyen* (the citizen), a new tricolour flag, and the creation of the National Assembly. Later, Napoleon Bonaparte introduced the Civil Code of 1804 (Napoleonic Code), which simplified administration, abolished the feudal system, freed peasants from serfdom, and established equality before the law. However, French rule faced hostility in conquered regions due to forced conscription and heavy taxation.
- [JARGON: Utopian Vision | A vision of a society that is so ideal that it is unlikely to actually exist | Frédéric Sorrieu''s 1848 prints depicted a utopian vision of a world made up of democratic and social republics.]
- [JARGON: Plebiscite | A direct vote by which all the people of a region are asked to accept or reject a proposal | Ernst Renan argued that a nation''s existence is a daily plebiscite.]

## 4. 📖 Concept 2: Ideology Clash — Liberalism vs. Conservatism
In the 1800s, Europe witnessed a political struggle between two major ideologies: Liberalism and Conservatism. Liberalism stood for individual freedom, equality before the law, and representative government. In the economic sphere, it demanded the freedom of markets. This led to the creation of the [JARGON: Zollverein | A customs union formed in 1834 to reduce internal trade barriers and unify markets | The Zollverein was created under Prussia''s initiative and abolished internal tariff barriers across German states.]. On the other hand, the defeat of Napoleon in 1815 ushered in a wave of [JARGON: Conservatism | A political philosophy that stressed the importance of tradition, established institutions, and customs | European powers after 1815 were driven by conservatism to restore the Bourbon monarchy.]. The representatives of Britain, Russia, Prussia, and Austria met at the Congress of Vienna in 1815, hosted by Austrian Chancellor Duke Metternich, to undo Napoleonic changes and restore the old conservative order. This suppression drove liberal-nationalists underground, leading to the rise of secret societies led by figures like the Italian revolutionary Giuseppe Mazzini.

## 5. 📖 Concept 3: Unifications and Allegories of the Nation
The late nineteenth century saw the realization of nationalist dreams through the unification of fragmented states into unified nations.
- **German Unification**: Led by Chief Minister Otto von Bismarck (the architect) and the Prussian army, Germany was unified after three wars with Austria, Denmark, and France. Kaiser William I was proclaimed German Emperor at Versailles in January 1871.
- **Italian Unification**: Giuseppe Mazzini set the ground, Count Camillo de Cavour engineered diplomatic alliances, and Giuseppe Garibaldi led the "Red Shirts" volunteers to conquer the south. In 1861, Victor Emmanuel II was crowned King of unified Italy.
- **Strange Case of Britain**: A long-drawn-out process centered around English dominance. The Act of Union (1707) united England and Scotland to form Great Britain, and Ireland was forcibly incorporated in 1801.
- **Visualizing the Nation**: Artists personified nations as female figures. In France, the national allegory was Marianne, and in Germany, it was Germania.
- [JARGON: Allegory | An abstract idea represented through a person, symbol, or story | Germania became the female allegory representing the German nation, wearing a crown of oak leaves.]

## 6. ⚠️ Common Mistakes
- **Confusing German and Italian Unification Leaders**: Students often swap the roles of Otto von Bismarck (Germany) and Camillo de Cavour or Giuseppe Garibaldi (Italy). Remember: Bismarck is Prussian (Germany) and Cavour/Garibaldi are Italian.
- **Assuming Britain''s Unification was a Sudden Revolution**: Unlike France, Great Britain''s nation-state formation was a gradual, long-drawn-out legislative and political process, not a sudden revolution.
- **Misunderstanding the Reaction to Napoleon**: Students often write that Napoleon was universally hated. In reality, he was initially welcomed as a "harbinger of liberty" before high taxes and conscription turned the public against him.

## 7. 💡 Memory Tricks
- **Bismarck binds Germany, Cavour connects Italy**: Bismarck used "blood and iron" (wars) to weld Germany together, while Cavour used smooth diplomacy and French alliances to connect Italy.
- **Zollverein = Zero Tariffs**: The Zollverein was a customs union that reduced tariffs and simplified currencies (from thirty-plus to two).
- **Mazzini''s Young Secret**: Mazzini founded **Young** Italy and **Young** Europe as underground secret societies.

## 8. 📝 Quick Practice
- **Question 1**: Explain the significance of the *Treaty of Constantinople* of 1832.
  - *Answer*: The Treaty of Constantinople of 1832 recognized Greece as an independent nation, ending centuries of Ottoman rule and mobilizing nationalist sentiment among the European elite.
- **Question 2**: What was the main objective of the Treaty of Vienna of 1815?
  - *Answer*: The main objective was to undo most of the changes that had come about in Europe during the Napoleonic wars and to restore the overthrown monarchies, establishing a new conservative order.

## 9. 🎓 Board Tips
- **Unification Questions**: When writing about German or Italian unification, structure your answer chronologically (Role of leaders, key wars/diplomacy, final proclamation). Use bullet points for each stage to score full marks.
- **Jargon Usage**: Using terms like *plebiscite*, *suffrage*, and *allegory* in your Board answers immediately elevates the quality of your answers in the examiner''s eyes.
- **Source-based Questions**: Practice interpreting the significance of symbols (like Germania''s oak crown or broken chains) since visual analysis questions are frequently asked.

## 10. 🔄 One-Minute Revision
- The French Revolution of 1789 introduced the concept of collective national identity.
- Napoleon''s Civil Code of 1804 unified administration but lacked political freedom.
- The Treaty of Vienna (1815) established a conservative order to curb liberal nationalism.
- Germany was unified in 1871 under Prussian leadership, spearheaded by Otto von Bismarck.
- Italy was unified in 1861 under King Victor Emmanuel II, aided by Cavour and Garibaldi.

## 11. 🎬 Comic Recap
```
┌────────────────────────────────────────────────────────┐
│ PANEL 1: The Revolution Catalyst                       │
│ Priya: "Rahul, how did this whole nationalism wave     │
│         begin in Europe?"                              │
│ Rahul: "It all kicked off with the French Revolution   │
│         in 1789! They introduced the idea of a shared  │
│         fatherland (la patrie) to unite the citizens." │
├────────────────────────────────────────────────────────┤
│ PANEL 2: Napoleon''s Double-Edged Sword                 │
│ Priya: "And what about Napoleon? Was he a hero?"       │
│ Rahul: "Admin-wise, yes! His 1804 Code gave equality   │
│         and property rights. But his military rule,    │
│         taxes, and forced conscription made him many   │
│         enemies."                                      │
├────────────────────────────────────────────────────────┤
│ PANEL 3: The Conservative Reset                        │
│ Priya: "So what happened after Napoleon''s defeat in    │
│         1815?"                                         │
│ Rahul: "The Congress of Vienna restored the old        │
│         monarchies. But they couldn''t stop secret      │
│         societies like Mazzini''s Young Italy!"         │
├────────────────────────────────────────────────────────┤
│ PANEL 4: Unification Champions                         │
│ Priya: "How did Germany and Italy finally become unified│
│         countries?"                                    │
│ Rahul: "Bismarck unified Germany using the Prussian    │
│         army, while Cavour''s diplomacy and Garibaldi''s │
│         Red Shirts united Italy!"                      │
└────────────────────────────────────────────────────────┘
```', TRUE, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quizzes (id, chapter_id, title, passing_percentage) VALUES
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd389030', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389030', 'Chapter 3 Quiz: The Rise of Nationalism in Europe', 60)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389031', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389030', 'What was the primary objective of the Zollverein customs union formed in 1834 at the initiative of Prussia?', 'multiple_choice', '["A. To support the restoration of traditional monarchies", "B. To abolish tariff barriers and reduce currencies", "C. To establish universal adult suffrage across German states", "D. To organize secret societies in Central Europe"]'::jsonb, 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389032', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389030', 'Who hosted the Congress of Vienna in 1815 where representatives of the European powers drew up a settlement for Europe?', 'multiple_choice', '["A. Giuseppe Mazzini", "B. Otto von Bismarck", "C. Duke Metternich", "D. Louis Philippe"]'::jsonb, 2, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389033', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389030', 'Which treaty recognized Greece as an independent nation in 1832?', 'multiple_choice', '["A. Treaty of Vienna", "B. Treaty of Versailles", "C. Treaty of Paris", "D. Treaty of Constantinople"]'::jsonb, 3, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389034', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389030', 'Who was the chief minister of Prussia who acted as the main architect of the German unification process?', 'multiple_choice', '["A. Count Camillo de Cavour", "B. Giuseppe Garibaldi", "C. Otto von Bismarck", "D. Kaiser William I"]'::jsonb, 2, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389035', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389030', 'In visual representations of the German nation, what does the crown of oak leaves worn by Germania represent?', 'multiple_choice', '["A. Heroism", "B. Readiness to fight", "C. Willingness to make peace", "D. Beginning of a new era"]'::jsonb, 0, NULL, 1)
ON CONFLICT (id) DO NOTHING;
-- SQL seed data for Chapter 4: The Making of a Global World
-- Generated on 2026-06-24
-- Format: Clean SQL with ON CONFLICT (id) DO NOTHING for safe execution.

-- 1. INSERT CHAPTER
INSERT INTO chapters (id, subject_id, title, sequence_number, description) VALUES
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd389040', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Chapter 4: The Making of a Global World', 4, 'Explore the history of globalization, analyzing how trade, migration, technology, and colonialism interconnected human societies from the pre-modern era through the twentieth century.')
ON CONFLICT (id) DO NOTHING;

-- 2. INSERT LESSON (Revision Notes Note)
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd389040', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389040', 'Revision Notes: The Making of a Global World', 'note', NULL, NULL,
'# Chapter 4: The Making of a Global World

## 1. 🎯 Chapter Goal
Understand how the modern globalized economy emerged through historical trade routes, labor migration, technological advances, and colonial policies, tracing the evolution from the pre-modern world to the post-war era.

## 2. 🪝 Hook
Did you know that the tomato in your curry and the potato in your samosa were completely unknown in India until 500 years ago? They travelled thousands of miles across oceans after Christopher Columbus accidentally landed in the Americas! Let''s explore how food, trade, disease, and migration stitched the world together.

## 3. 📖 Concept 1: The Pre-modern World and Global Interconnectedness
Before the modern era, human societies were linked by vibrant trade, migration, and cultural exchange:
- **Trade and Cultural Pathways**: The **[JARGON: Silk Routes | Historic overland and maritime networks that connected Asia with Europe and North Africa, facilitating the exchange of goods, ideas, and cultures | The ancient pathways through which Chinese silk, Indian spices, and Roman gold were traded across continents.]** linked distant parts of the world. Chinese pottery and Indian spices flowed west, while gold and silver flowed from Europe to Asia.
- **Food Travels**: Noodles from China became spaghetti in Italy. Columbus''s discovery of the Americas introduced potatoes, soya, groundnuts, maize, tomatoes, and chillies to Asia and Europe. In Ireland, the poor became so dependent on potatoes that when disease destroyed the crop in the 1840s (the Irish Potato Famine), nearly 1,000,000 people died of starvation.
- **Conquest by Disease**: In the 16th century, Spanish and Portuguese conquests of the Americas succeeded not because of weapons, but due to biological warfare. They carried germs of smallpox to which the isolated Native Americans had no immunity. This decimated entire populations and paved the way for colonization.
- **Center of Trade Shift**: Until the 18th century, India and China were the world''s richest countries. However, China retreated into isolation, and the rise of the Americas shifted the center of world trade westwards to Europe.

## 4. 📖 Concept 2: The 19th Century (1815-1914) & The World Economy
The 19th century witnessed complex transformations driven by three international economic flows: the flow of trade (e.g., wheat), the flow of labor (migration), and the flow of capital (investments).
- **The Corn Laws & Agricultural Shift**: In Britain, industrial growth led to high food demand. The government restricted food imports using the Corn Laws. Under pressure from urban dwellers, these laws were abolished, allowing cheap imports. Unable to compete, British agriculture collapsed, throwing thousands out of work, resulting in over 50 million people migrating from Europe to the Americas and Australia.
- **Role of Technology**: Railways, steamships, and the telegraph accelerated trade. The development of refrigerated ships allowed animals to be slaughtered in America/Australia and shipped as frozen meat, making meat affordable to the European poor.
- **Late 19th-Century Colonialism**: Imperial expansion had a dark side, destroying local economies. In Africa, the **[JARGON: Rinderpest | A highly contagious and devastating viral disease affecting cattle, also known as the cattle plague, which swept through Africa in the 1890s | The cattle plague introduced from British Asia into East Africa that wiped out 90% of local livestock, forcing Africans into the wage labor market.]** arrived in the late 1880s via infected cattle from British Asia. It killed 90% of African cattle, destroying local livelihoods and forcing independent pastoralists into wage labor for mines and plantations.
- **The System of Indenture**: Colonial powers used **[JARGON: Indentured Labour | A system of bonded labor under contract where workers are recruited to work in another country for a specified period to pay off their passage | Hundreds of thousands of Indian peasants from Bihar and Uttar Pradesh who were signed to five-year contracts to work on Caribbean sugarcane plantations.]** (often called a ''new system of slavery''). Hundreds of thousands of Indians migrated to the Caribbean (Trinidad, Fiji, Mauritius) under harsh conditions. They created fused cultural forms like ''Hosay'' (Muharram carnival), Rastafarianism, and ''Chutney music''. The system was abolished in 1921.
- **Indian Trade & Multilateral Settlement**: Britain ran a massive trade surplus with India by flooding Indian markets with British textiles while restricting Indian cotton exports with tariffs. Britain used this surplus to balance its trade deficits with other countries, demonstrating how a multilateral settlement system works, and to pay ''Home Charges'' (pensions, remittances, and interest on external debt).

## 5. 📖 Concept 3: The Inter-war Crisis & Rebuilding the World Economy
The early 20th century was marked by the catastrophe of two World Wars and the Great Depression, leading to a complete restructuring of the international economy:
- **First World War (1914-1918)**: The first modern industrial war. It saw the mass deployment of machine guns, tanks, aircraft, and chemical weapons. It decimated Europe''s working-age population and transformed the US from a debtor nation to a global creditor.
- **Fordist Mass Production**: Henry Ford adapted the assembly line method in his Detroit car plant to produce the T-Model Ford. To counter high worker turnover caused by the mechanical pace, Ford doubled the daily wage to $5 in 1914, making it his ''best cost-cutting decision'' by boosting productivity. This sparked a consumer boom in the US, supported by the hire purchase (credit) system.
- **The Great Depression (1929-1935)**: Triggered by agricultural overproduction (which caused prices to crash, leading farmers to produce more and flood the market) and the sudden withdrawal of US loans. In India, exports/imports halved, and jute prices in Bengal crashed by 60%. India became an exporter of gold, helping Britain recover while rural India suffered.
- **Bretton Woods & The Post-war Settlement**: In July 1944, the UN Monetary and Financial Conference met at Bretton Woods, USA, to establish a framework for economic stability and full employment. They created the **[JARGON: Bretton Woods Twins | The two major international financial institutions, namely the International Monetary Fund (IMF) and the World Bank, established at the 1944 Bretton Woods Conference | The IMF and the World Bank cooperating to manage global currency stability and post-war reconstruction loans respectively.]** consisting of the IMF (to manage trade balances) and the World Bank (to finance reconstruction). Currencies were pegged to the US dollar, which was anchored to gold at $35 per ounce.
- **Decolonization and NIEO**: Newly independent nations in Asia and Africa faced poverty and colonial exploitation. To challenge the dominance of former colonial powers in the IMF/World Bank, developing nations formed the Group of 77 (G-77) to demand a New International Economic Order (NIEO) for control over their resources and fairer trade terms.
- **The Rise of Globalisation (1970s onwards)**: High costs of overseas engagements weakened the US dollar, collapsing the fixed exchange rate system for floating exchange rates. Relocation of MNCs to low-wage Asian countries, especially China, transformed the world''s economic geography.

## 6. ⚠️ Common Mistakes
- **Confusing Non-Cooperation with Civil Disobedience**: Note that this chapter does not focus on national movements, but when discussing the Great Depression''s impact, remember it triggered Gandhi''s Civil Disobedience in 1931.
- **Misunderstanding the Multilateral Settlement System**: Students often think Britain had a trade deficit with India. In reality, Britain had a trade *surplus* with India and used it to cover its trade *deficits* with other countries.
- **Confusing the Bretton Woods Twins**: Remember, the IMF deals with external trade surpluses and deficits, whereas the World Bank (IBRD) finances post-war reconstruction and development.

## 7. 💡 Memory Tricks
- **The Three Flows**: **T-L-C** -> **T**rade (goods), **L**abor (migration), **C**apital (money/investments).
- **Ford''s $5 Formula**: Ford doubled wages to $5 to double productivity and mass-produce cars.
- **The Twins**: IMF and World Bank are the twins born in Bretton Woods to rebuild the post-war economy.

## 8. 📝 Quick Practice
- **Question 1**: Why did Europeans use rinderpest as a tool for colonisation in Africa?
  - *Answer*: Rinderpest killed 90% of African cattle, destroying the livestock-based livelihoods of Africans. Since Africans had abundant land and cattle, they had no need to work for wages. Wiping out their cattle forced them into the labor market, allowing Europeans to conquer and control Africa.
- **Question 2**: Explain the multilateral settlement system using the British-India trade relationship.
  - *Answer*: Britain exported high-value manufactured goods to India but imported low-value raw materials, creating a trade surplus with India. Britain used this surplus to pay off its trade deficits with other countries (like the US or China) from which it imported more than it exported.

## 9. 🎓 Board Tips
- Prepare a short note on the impact of the Great Depression on Indian peasants (focus on Bengal jute growers and gold exports). This is a highly repeated 3-mark/5-mark board question.
- Understand the role of biological warfare (smallpox germs) in the colonization of the Americas. Ensure you highlight the lack of immunity among native populations.

## 10. 🔄 One-Minute Revision
- Silk routes facilitated ancient trade and cultural exchange.
- Smallpox germs cleared the path for Spanish conquest of the Americas.
- Abolition of the Corn Laws led to agricultural imports, driving British migration.
- Rinderpest cattle plague decimated African livestock, forcing wage labor.
- Indentured Indian labor was a ''new system of slavery'' to plantations abroad.
- Britain used its trade surplus in India to balance its global trade deficits.
- Henry Ford pioneered the assembly line and mass production.
- Great Depression (1929) was caused by agricultural overproduction and US loan withdrawal.
- Bretton Woods conference (1944) created the IMF and World Bank.
- G-77 demanded the New International Economic Order (NIEO) to challenge Western dominance.
- The collapse of fixed exchange rates in the 1970s paved the way for modern globalisation.

## 11. 🎬 Comic Recap
```
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "Priya: How did a microscopic germ  │
│         conquer the vast Americas?"        │
│ Rahul: "Rahul: It was smallpox! Spanish    │
│         conquerors carried it, and the     │
│         natives had no immunity to it."    │
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "Priya: What on earth is rinderpest │
│         and why did it matter?"            │
│ Rahul: "Rahul: It''s a cattle plague! It    │
│         killed 90% of African cattle and   │
│         forced locals to work for wages."  │
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "Priya: How did Britain balance its │
│         global trade deficits?"            │
│ Rahul: "Rahul: With a trade surplus in     │
│         India, using a multilateral        │
│         settlement system!"                │
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ Smallpox conquered the Americas.           │
│ Rinderpest forced wage labor in Africa.    │
│ Bretton Woods twins: IMF & World Bank.     │
└────────────────────────────────────────────┘
```', FALSE, 1)
ON CONFLICT (id) DO NOTHING;

-- 3. INSERT QUIZ
INSERT INTO quizzes (id, chapter_id, title, passing_percentage) VALUES
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd389040', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389040', 'Social Science Chapter 4 Quiz', 60)
ON CONFLICT (id) DO NOTHING;

-- 4. INSERT QUIZ QUESTIONS (5 MCQs)
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389041', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389040', 'Which of the following diseases proved to be a deadly conqueror of the native American communities in the sixteenth century, paving the way for European colonisation?', 'multiple_choice', '["A. Cholera", "B. Smallpox", "C. Influenza", "D. Bubonic Plague"]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389042', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389040', 'Why did the abolition of the Corn Laws in nineteenth-century Britain lead to a massive migration of agricultural workers?', 'multiple_choice', '["A. The British government offered free lands to anyone who migrated to America.", "B. British agriculture was unable to compete with cheap food imports, throwing thousands out of work.", "C. New technologies like steamships required vast numbers of agricultural labourers to run.", "D. Industrialists paid higher wages to agricultural workers than to factory workers."]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389043', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389040', 'In the 1890s, the cattle plague known as Rinderpest arrived in Africa. How did this disease impact the local population and economy?', 'multiple_choice', '["A. It killed 90% of the cattle, forcing Africans who previously lived off their land and livestock to work for wages.", "B. It prompted African farmers to start importing cattle from Europe, increasing their wealth.", "C. It led to the immediate establishment of democratic governments across Africa.", "D. It had no significant impact because Africans did not depend on livestock for survival."]', 0, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389044', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389040', 'How did Britain balance its trade deficits with other countries during the late nineteenth century?', 'multiple_choice', '["A. By borrowing heavily from the United States and Japan.", "B. By exporting finished cotton textiles to European countries at very high prices.", "C. By using the trade surplus it maintained with India through a multilateral settlement system.", "D. By completely banning the import of food grains and raw materials."]', 2, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389045', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389040', 'Which of the following statements is correct regarding the Bretton Woods twins established in July 1944?', 'multiple_choice', '["A. The IMF was set up to finance post-war reconstruction, while the World Bank managed trade surpluses.", "B. The IMF and the World Bank were set up to preserve economic stability and finance post-war reconstruction.", "C. They were dominated by the Group of 77 (G-77) developing countries to challenge Western powers.", "D. They completely abolished the gold standard and introduced floating exchange rates in 1944."]', 1, NULL, 1)
ON CONFLICT (id) DO NOTHING;
-- CBSE Class 10 Social Science Seed Data - Chapter 5: The Age of Industrialisation
-- Generated for Subject ID: 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33'
-- Base UUIDs:
-- Chapter: c0eebc99-9c0b-4ef8-bb6d-6bb9bd389050
-- Lesson: b0eebc99-9c0b-4ef8-bb6d-6bb9bd389050
-- Quiz: d0eebc99-9c0b-4ef8-bb6d-6bb9bd389050
-- Questions: f0eebc99-9c0b-4ef8-bb6d-6bb9bd389051 to f0eebc99-9c0b-4ef8-bb6d-6bb9bd389055

-- 1. INSERT CHAPTER
INSERT INTO chapters (id, subject_id, title, sequence_number, description) VALUES
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd389050', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Chapter 5: The Age of Industrialisation', 5, 'Explore the history of industrialisation, focusing on the transition from proto-industrial systems to factories in Britain and the impact of colonial trade and technology on weavers in India.')
ON CONFLICT (id) DO NOTHING;

-- 2. INSERT LESSON (Revision Notes)
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd389050', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389050', 'Revision Notes: The Age of Industrialisation', 'note', NULL, NULL,
'# Chapter 5: The Age of Industrialisation

## 1. 🎯 Chapter Goal
Understand how the industrial world was created, comparing factory growth in Britain with colonial industrialization patterns in India.

## 2. 🪝 Hook
In 1900, a popular music cover announced the ''Dawn of the Century'', showcasing a winged goddess of progress flying past railways, cameras, and factories. But was this industrial dream a blessing for everyone, or did it bring new struggles for workers and artisans? Let''s travel back to find out!

## 3. 📖 Concept 1: Before the Industrial Revolution
Many associate industrialisation only with factories, but large-scale production for international markets existed long before.
- **[JARGON: Proto-industrialisation | The phase of industrial development prior to the setup of modern factories, characterized by decentralized home-based production for international markets | Merchants buying raw wool, distributing it to rural spinners, and selling the finished cloth globally]**
- **[JARGON: Guilds | Associations of producers that trained craftspeople, controlled production, regulated prices, and restricted new competitors from entering the trade | The powerful weavers'' or bakers'' guilds in seventeenth-century European cities that held state-sanctioned monopolies]**
- **The Countryside Connection**: Because urban guilds controlled towns, new merchants turned to the countryside. Rural peasants eagerly accepted advances because their open lands were disappearing and small plots could not support their families.
- **Production Network**: A merchant clothier purchased wool from a wool stapler (who sorted wool by fibre), sent it to spinners, weavers, fullers (who pleated cloth), and dyers, finishing the cloth in London before export.

## 4. 📖 Concept 2: Pace of Industrial Change & Victorian Hand Labour
- **Key Sectors**: Cotton led the first phase of British industrialisation (up to the 1840s), followed by iron and steel as railway construction boomed.
- **Slow Mechanisation**: Technological change was slow. New machines (like the steam engine patented by James Watt in 1781) were expensive, frequently broke down, and were costly to repair. By 1800, only 321 steam engines were in use across England.
- **Why Hand Labour Prevailed**: In Victorian Britain, there was an abundance of cheap human labour. Since wages were low, industrialists had no incentive to invest heavily in machines.
- **Seasonal Demand**: Gasworks, breweries, bookbinders, and shipyards had seasonal workloads, preferring flexible hand labour.
- **Refinement and Class**: Handmade goods symbolised refinement, customization, and status for the British aristocracy, while machine goods were made for export to colonies.
- **Hostility to Technology**: The introduction of the **[JARGON: Spinning Jenny | A multi-spindle spinning frame invented by James Hargreaves in 1764 that allowed a single worker to spin multiple threads simultaneously | A machine operated by a single hand wheel that set in motion numerous spindles, which was attacked by traditional hand spinners]** led to intense conflicts as women spinners feared losing their jobs.

## 5. 📖 Concept 3: Industrialisation in the Colonies (India)
- **Pre-Colonial Glory**: Before machine industries, fine Indian silk and cotton dominated international trade, running through traditional ports like Surat (Gujarat) and Hoogly (Bengal).
- **Colonial Decline**: By the 1750s, this network decayed as the British East India Company secured monopolies. Surat and Hoogly declined, while Bombay and Calcutta grew under European control.
- **Gomasthas and Advances**: To control weavers and eliminate local brokers, the Company appointed a **[JARGON: Gomastha | A paid supervisor appointed by the East India Company to supervise weavers, collect textile supplies, and examine cloth quality | British-appointed agents who marched into Indian villages with armed sepoys to inspect looms and punish weavers for delays]**. Weavers were given advance loans for raw materials, which legally bound them to the Company.
- **Manchester Invasion**: By the 1850s, cheap, machine-made cotton imports from Manchester flooded India, collapsing the local weaving market. During the American Civil War (1860s), British mills diverted Indian raw cotton, causing severe local shortages and soaring prices.
- **Early Indian Entrepreneurs**: In Bengal, Dwarkanath Tagore set up joint-stock companies in the 1830s. In Bombay, Jamsetjee Nusserwanjee Tata and Parsi traders accumulated capital from China trade and cotton exports to build industrial empires, leading to the setup of the first cotton mill in Bombay (1854) and the Tata Iron and Steel Works in Jamshedpur (1912).
- **The WWI Boom**: During the First World War, British mills shifted to producing war materials. Indian mills stepped in to supply the home market and army goods (jute bags, uniforms, tents), causing a massive industrial boom.
- **Survival of Handlooms**: In the 20th century, handloom weaving expanded due to small technological innovations like the **[JARGON: Fly Shuttle | A mechanical weaving device moved by ropes and pulleys that placed horizontal weft threads into vertical warp threads | A device fitted to handlooms after 1910 that allowed weavers to operate larger looms faster and compete with mills]**, and because the demand for intricate, specialized borders (like Banarasi and Baluchari saris) could not be replicated by machines.

## 6. ⚠️ Common Mistakes
- **Confusing Proto-Industrialisation with Factories**: Proto-industrial production occurred in rural households, not in centralized factories.
- **Believing Steam Engines Were Instantly Popular**: Steam engines were adopted very slowly due to high capital costs and maintenance issues.
- **Assuming Indian Handlooms Died Entirely**: While hand spinning was destroyed, handloom weavers survived and grew by using fly shuttles and weaving complex, premium designs.

## 7. 💡 Memory Tricks
- **Proto = Pre**: Proto-industrial is the ''pre-factory'' phase.
- **Gomastha = Go-between/Guard**: Paid guards who watched over weavers and punished them.
- **Fly Shuttle = Flying Weft**: The device that flies across the warp threads to speed up weaving.

## 8. 📝 Quick Practice
- **Question 1**: Why did traditional weavers clash with the newly appointed Gomasthas?
  - *Answer*: Unlike traditional supply merchants who lived in the village and helped during crises, Gomasthas were outsiders with no social links. They acted arrogantly, marched with sepoys, and physically punished weavers for delays in supply.
- **Question 2**: How did the First World War create a turning point for Indian industries?
  - *Answer*: British factories were fully engaged in war production for the British army, which dramatically reduced imports of Manchester goods. This gave Indian mills a vast home market to supply, and they were also contracted to produce war goods like uniforms, tents, and leather boots.

## 9. 🎓 Board Tips
- Memorize the reasons why Victorian industrialists preferred hand labor over machines (abundant labor, seasonal demand, premium customization).
- Be prepared to discuss the dual impact of Manchester imports (loss of export market and shrinkage of local market).

## 10. 🔄 One-Minute Revision
- Proto-industrialisation was a decentralized, merchant-controlled, countryside-based system of production.
- Cotton and metals were the main British industries, but machine adoption was slow due to costs.
- Victorian employers preferred hand labour due to cheap labour supply and seasonal demand variations.
- In India, traditional ports of Surat/Hoogly declined, giving way to colonial-dominated Bombay/Calcutta.
- The East India Company coerced weavers via advance loans and Gomasthas, but handlooms survived in the 20th century using fly shuttles and specialized weaving.

## 11. 🎬 Comic Recap
```
┌──────────────────────────────────────────────────────────┐
│ PANEL 1: Before the Factories                            │
│ Priya: "Priya: Did industrialisation start with the big   │
│         chimneys and steam engines?"                     │
│ Rahul: "Rahul: No! Long before factories, town merchants │
│         ran ''proto-industrialisation'' in the rural       │
│         countryside, using home weavers."                │
├──────────────────────────────────────────────────────────┤
│ PANEL 2: The Victorian Preference                        │
│ Priya: "Priya: Why did Victorian Britain take so long    │
│         to adopt steam engines?"                         │
│ Rahul: "Rahul: Because they had a huge supply of cheap   │
│         labour, and handcrafts symbolised upper-class    │
│         refinement."                                     │
├──────────────────────────────────────────────────────────┤
│ PANEL 3: The Colonial Grip                               │
│ Priya: "Priya: How did the British control Indian        │
│         weavers?"                                        │
│ Rahul: "Rahul: They gave loans as advances and sent      │
│         Gomasthas to supervise. This trapped weavers     │
│         and forced them to sell only to the Company."    │
├──────────────────────────────────────────────────────────┤
│ PANEL 4: Survival & War Boom                             │
│ Priya: "Priya: Did the Indian weavers survive the cheap  │
│         Manchester imports?"                             │
│ Rahul: "Rahul: Yes, they used fly shuttles to work       │
│         faster, and the First World War created a huge   │
│         boom for Indian factories!"                      │
└──────────────────────────────────────────────────────────┘
```', FALSE, 3)
ON CONFLICT (id) DO NOTHING;

-- 3. INSERT QUIZ
INSERT INTO quizzes (id, chapter_id, title, passing_percentage) VALUES
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd389050', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389050', 'Chapter 5 Quiz: The Age of Industrialisation', 60)
ON CONFLICT (id) DO NOTHING;

-- 4. INSERT QUIZ QUESTIONS
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389051', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389050', 'What does the term "proto-industrialisation" refer to?', 'multiple_choice',
'["A. The phase of industrialisation characterized by the setup of large-scale steam-powered factories", "B. The early phase of industrialisation before the establishment of factories, marked by decentralized production in the countryside", "C. The decline of traditional handloom industries in the colonies due to foreign imports", "D. The period after the First World War when large-scale industries dominated the Indian economy"]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389052', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389050', 'In the seventeenth and eighteenth centuries, merchants from European towns turned to the countryside to produce goods because:', 'multiple_choice',
'["A. Land was cheaper in the countryside compared to towns", "B. Power-driven machinery could only be installed in rural areas", "C. Urban crafts and trade guilds were powerful in towns and restricted new entry into trade", "D. Peasants in the countryside refused to migrate to towns for work"]', 2, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389053', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389050', 'Who was a "gomastha" in the context of the East India Company''s control over Indian weavers?', 'multiple_choice',
'["A. An Indian merchant who financed the cotton trade between Bombay and Europe", "B. A European industrialist who established joint-stock companies in Bengal", "C. A paid servant appointed by the Company to supervise weavers, collect supplies, and examine cloth quality", "D. A traditional village elder who mediated disputes between weavers and European shippers"]', 2, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389054', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389050', 'Why did many industrialists in Victorian Britain prefer hand labour over steam-powered machines?', 'multiple_choice',
'["A. There was a shortage of human labour in the cities, making machines too expensive to run", "B. The government banned the use of steam engines in textile factories", "C. There was an abundance of cheap human labour and many industries had seasonal demands for work", "D. Handmade goods were cheaper to produce in mass quantities than machine-made goods"]', 2, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389055', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389050', 'In the twentieth century, how did the adoption of the fly shuttle benefit Indian handloom weavers?', 'multiple_choice',
'["A. It enabled them to spin fine cotton thread that competed with Manchester imports", "B. It allowed them to weave intricate designs on silk saris that mills could not copy", "C. It increased productivity per worker, speeded up production, and reduced labor demand on large looms", "D. It eliminated the need for raw cotton by allowing weavers to use synthetic fibers"]', 2, NULL, 1)
ON CONFLICT (id) DO NOTHING;
-- CBSE Class 10 Learning Portal Seed Data
-- Subject: Social Science
-- Chapter 6: Print Culture and the Modern World
-- Generated on 2026-06-24

-- 1. Insert Chapter
INSERT INTO chapters (id, subject_id, title, sequence_number, description) VALUES
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd389060', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Chapter 6: Print Culture and the Modern World', 6, 'This chapter traces the history of print technology from its origins in woodblock printing in East Asia to its mechanical expansion in Europe through Gutenberg''s press, detailing how print culture catalyzed religious reform, political revolutions, and social empowerment across Europe and colonial India.')
ON CONFLICT (id) DO NOTHING;

-- 2. Insert Lesson (Revision Notes)
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd389060', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389060', 'Revision Notes: Print Culture and the Modern World', 'note', NULL, NULL,
'# Chapter 6: Print Culture and the Modern World

## 1. 🎯 Chapter Goal
Understand the historical journey of print technology from its hand-printing origins in East Asia to its mechanization in Europe and eventual arrival in India, highlighting how the spread of the printed word transformed everyday life, sparked public debates, and fostered nationalist movements.

## 2. 🪝 Hook
Imagine a world where copying a single book takes months of painstaking handwriting and costs as much as a small house. In this chapter, you will discover how a simple wooden block in China and a converted wine press in Germany broke these barriers, giving birth to newspapers, novels, and the modern world of ideas!

## 3. 📖 Concept 1: The First Printed Books and Spread to Europe
The earliest print technology was developed in China, Japan, and Korea as a system of hand printing.
- **China**: From AD 594, books were printed by rubbing paper against the inked surface of woodblocks. The traditional Chinese **[JARGON: Accordion Book | A traditional book folded and stitched at the side because both sides of the thin, porous paper could not be printed | Early Chinese textbooks were produced as accordion books]** arose because only one side of the paper could hold ink. The imperial state was the major producer of print, publishing civil service exam textbooks. By the 17th century, print diversified to merchants, women writers, and leisure reading. In the late 19th century, Western mechanical presses were imported, making Shanghai the hub of print.
- **Japan**: Buddhist missionaries introduced hand-printing around AD 768-770. The oldest Japanese book is the **[JARGON: Diamond Sutra | The oldest surviving printed book of Japan, printed in AD 868, containing six sheets of text and woodcut illustrations | The Diamond Sutra is a landmark Buddhist scripture in the history of printing]**. An elegant urban culture bloomed in Edo (Tokyo), featuring **[JARGON: Ukiyo | An art form meaning ''pictures of the floating world'', depicting ordinary human experiences and urban scenes through woodblock prints | Kitagawa Utamaro was a famous 18th-century artist known for his ukiyo prints]**.
- **Korea**: The Tripitaka Koreana (Buddhist scriptures on 80,000 woodblocks) was engraved in the mid-13th century. The Jikji of Korea is among the oldest existing books printed with movable metal type (late 14th century).
- **Print Comes to Europe**: For centuries, Chinese paper reached Europe via the silk route. In 1295, Marco Polo returned to Italy from China, bringing back the technology of woodblock printing. Soon, woodblock printing spread across Europe to print textiles, playing cards, and religious pictures.

## 4. 📖 Concept 2: Gutenberg''s Press and the Print Revolution
As the demand for books soared, handwritten manuscripts could not keep pace because copying was slow, expensive, and fragile. Scribes could not satisfy the reading public.
- **Gutenberg''s Printing Press**: Around the 1430s in Strasbourg, Germany, Johann Gutenberg developed the first mechanical printing press. He was a goldsmith who adapted the wine press model and created lead moulds for casting metal types. By 1448, the system was perfected. The first book printed was the Bible (180 copies in 3 years). A key component of this was the **[JARGON: Platen | In letterpress printing, a board which is pressed onto the back of the paper to get the impression from the type | Gutenberg''s press used a screw handle to press the platen against the sheet]**.
- **The Print Revolution**: This shift from hand printing to mechanical printing transformed lives, changing people''s relationship to knowledge and authority. A new reading public emerged as book costs fell. Written culture intermingled with oral culture through readings in taverns and public recitations of ballads.
- **Religious Debates and Dissent**: Not everyone welcomed print; authorities feared that unmonitored printing would spread irreligious thoughts. In 1517, Martin Luther wrote the **[JARGON: Ninety Five Theses | A document containing 95 propositions criticizing the practices and rituals of the Roman Catholic Church, posted by Martin Luther on a church door in Wittenberg | The printing and distribution of the Ninety Five Theses sparked the Protestant Reformation]**. Luther praised printing as the "ultimate gift of God". In contrast, a miller named Menocchio in Italy reinterpreted the Bible, was tried by the Roman **[JARGON: Inquisition | A historic Roman Catholic ecclesiastical court established to identify, try, and punish heretics who held beliefs contrary to Church doctrine | Menocchio was executed by the Inquisition after questioning official creation dogmas]**. Fearing dissent, the Church began maintaining the **[JARGON: Index of Prohibited Books | A list of publications banned by the Roman Catholic Church to prevent heretical ideas from corrupting the faithful | The Roman Catholic Church established the Index of Prohibited Books in 1558]** from 1558.

## 5. 📖 Concept 3: The Reading Mania, Print in India, and Censorship
- **The Reading Mania**: In the 18th century, literacy rates in Europe reached 60-80%. Pocket-sized **[JARGON: Chapbook | A cheap, pocket-size book sold by travelling pedlars (chapmen) to ordinary readers in 16th to 18th century Europe | Poor people in England bought penny chapbooks for entertainment]** was sold in England, while the *Bibliothèque Bleue* (cheap books bound in blue paper) was sold in France. Thinkers like Voltaire and Rousseau had their works widely printed, shaping public opinion. Louise-Sebastien Mercier declared, "The printing press is the most powerful engine of progress," warning tyrants to tremble.
- **Print in India**: India had a rich heritage of handwritten manuscripts in Sanskrit, Persian, Arabic, and vernacular languages on palm leaves or handmade paper. But they were expensive, fragile, and hard to read.
- **Coming of Print**: Portuguese missionaries brought the first printing press to Goa in the mid-16th century. In 1780, James Augustus Hickey began publishing the *Bengal Gazette*, a weekly commercial paper independent of government control. Governor-General Warren Hastings persecuted Hickey for publishing gossip about officials.
- **Reform and Censorship**: Print became a vehicle for intense religious and social debates. Rammohun Roy published the *Sambad Kaumudi* (1821) to campaign for social reforms, while orthodox Hindus countered with the *Samachar Chandrika*. In 1871, Jyotiba Phule published **[JARGON: Gulamgiri | An 1871 book written by Jyotiba Phule that critiqued the injustices of the caste system, dedicating it to the American anti-slavery movement | Gulamgiri was a powerful vernacular protest text that linked local caste oppression to global struggles]** (meaning Slavery) to attack caste injustices.
- **Censorship**: Initially, censorship targeted critical English editors. But after the 1857 revolt, the British clamped down on the native press. In 1878, they passed the **[JARGON: Vernacular Press Act | A repressive law passed in 1878 by the British colonial government that gave authorities extensive rights to censor reports and editorials in local-language newspapers | The Vernacular Press Act allowed the government to confiscate printing presses if warning was ignored]** (modeled on the Irish Press Laws). Nationalist editors resisted, with Balgangadhar Tilak writing in *Kesari* to support Punjab revolutionaries, leading to his imprisonment in 1908.

## 6. ⚠️ Common Mistakes
- **Confusing woodblock printing with movable type**: Woodblock printing involves carving a whole page onto a single wooden block (used in early China/Japan), while movable type uses individual metal castings for characters that can be rearranged (perfected by Gutenberg).
- **Misunderstanding the Vernacular Press Act scope**: The Act only targeted local-language (vernacular) newspapers, leaving English-language publications untouched to avoid offending British citizens.
- **Assuming print instantly killed manuscripts**: Handwritten manuscripts and scribes coexisted with printing presses for a long time; early printed books even left spaces for handmade illustrations to look like luxury manuscripts.

## 7. 💡 Memory Tricks
- **M-P-I (1295)**: **M**arco **P**olo brought print to **I**taly in **1295**.
- **95 Theses, 1517**: Martin Luther is "Loud" and nailed **95** points in **15-17** (1517).
- **VPA (1878)**: **V**ernacular **P**ress **A**ct = **V**oice **P**oliced **A**ct, passed in **1878** to choke local reports.

## 8. 📝 Quick Practice
- **Question 1**: Why did the Roman Catholic Church impose control over publishers and booksellers from the mid-sixteenth century?
  - *Answer*: The Church feared that easy access to printed books would lead to the spread of rebellious, heretical thoughts that challenged Catholic teachings. This led them to execute heretics like Menocchio and establish the Index of Prohibited Books in 1558.
- **Question 2**: Mention the contribution of Jyotiba Phule to the low-caste protest movement in India.
  - *Answer*: Jyotiba Phule wrote *Gulamgiri* (Slavery) in 1871 to expose the severe injustices of the caste system. His work was printed in the vernacular (Marathi) and read by protest movements across India, linking caste oppression to historical forms of slavery.

## 9. 🎓 Board Tips
- When describing the role of print in the French Revolution, divide your answer into three distinct points: popularizing Enlightenment ideas (Voltaire/Rousseau), creating a culture of debate, and publishing satire/cartoons that ridiculed the monarchy.
- Always name the authors, editors, and newspapers correctly (e.g., Hickey''s *Bengal Gazette*, Rammohun Roy''s *Sambad Kaumudi*, and Tilak''s *Kesari*).

## 10. 🔄 One-Minute Revision
- Print technology originated in East Asia (China, Japan, Korea) using woodblock printing on paper.
- Marco Polo brought woodblock printing from China to Italy in 1295.
- Johann Gutenberg invented the mechanical printing press in Germany in the 1430s; the Bible was his first printed book.
- Martin Luther''s Ninety-Five Theses (1517) sparked the Protestant Reformation.
- Printing reached India in the mid-16th century via Portuguese priests in Goa.
- The Vernacular Press Act of 1878 was passed to censor native newspapers, prompting strong nationalist protests.

## 11. 🎬 Comic Recap
```
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "Priya: I read that the earliest print│
│         started in East Asia. Did they use │
│         huge machines?"                    │
│ Rahul: "Rahul: No, they rubbed paper on     │
│         inked woodblocks! The oldest       │
│         surviving book is the Diamond      │
│         Sutra from Japan in AD 868."       │
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "Priya: Wow. How did it reach Europe│
│         then? Did Gutenberg travel to China?"│
│ Rahul: "Rahul: No, Marco Polo brought the   │
│         knowledge in 1295! Gutenberg later │
│         adapted wine presses and metal     │
│         moulds in the 1430s."              │
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "Priya: I see. And in India, how did │
│         the British handle print?"         │
│ Rahul: "Rahul: Not well! When newspapers got │
│         critical, they passed the          │
│         Vernacular Press Act of 1878 to    │
│         seize presses of local editors."   │
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ China woodblock printing -> Marco Polo     │
│ (1295) -> Gutenberg press (1430s) ->       │
│ Protestant Reformation -> India (1550s Goa)│
│ -> Vernacular Press Act (1878).            │
└────────────────────────────────────────────┘
```', FALSE, 3)
ON CONFLICT (id) DO NOTHING;

-- 3. Insert Quiz
INSERT INTO quizzes (id, chapter_id, title, passing_percentage) VALUES
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd389060', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389060', 'Chapter 6: Print Culture and the Modern World Quiz', 60)
ON CONFLICT (id) DO NOTHING;

-- 4. Insert Quiz Questions
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389061', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389060', 'Which of the following is the oldest printed book of Japan, printed in AD 868?', 'multiple_choice', '["A. Rigveda", "B. Diamond Sutra", "C. Jikji", "D. Diwan of Hafiz"]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389062', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389060', 'Who brought the technology of woodblock printing back to Europe from China in 1295?', 'multiple_choice', '["A. Johann Gutenberg", "B. Marco Polo", "C. Erasmus", "D. Martin Luther"]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389063', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389060', 'In 1517, who wrote the ''Ninety Five Theses'' criticizing many of the practices and rituals of the Roman Catholic Church?', 'multiple_choice', '["A. Menocchio", "B. Erasmus", "C. Martin Luther", "D. Louise-Sebastien Mercier"]', 2, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389064', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389060', 'The Vernacular Press Act of 1878 in British India was modeled on which of the following laws?', 'multiple_choice', '["A. Irish Press Laws", "B. French Censorship Codes", "C. American Press Freedom Act", "D. German Imperial Press Regulations"]', 0, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389065', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389060', 'Who wrote the famous book ''Gulamgiri'' in 1871, focusing on the injustices of the caste system?', 'multiple_choice', '["A. B.R. Ambedkar", "B. E.V. Ramaswamy Naicker", "C. Jyotiba Phule", "D. Rashsundari Debi"]', 2, NULL, 1)
ON CONFLICT (id) DO NOTHING;
-- SQL Seed File for Chapter 7: Power-sharing
-- Subject ID: a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33
-- Chapter ID: c0eebc99-9c0b-4ef8-bb6d-6bb9bd389070

INSERT INTO chapters (id, subject_id, title, sequence_number, description) VALUES
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd389070', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Chapter 7: Power-sharing', 7, 'Analyze how democracies handle demands for power-sharing through the contrasting stories of Belgium and Sri Lanka, and explore different forms of power-sharing.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd389070', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389070', 'Revision Notes: Power-sharing', 'note', NULL, NULL,
'# Chapter 7: Power-sharing

## 1. 🎯 Chapter Goal
Understand how democracies handle the demands for power-sharing, compare the paths taken by Belgium and Sri Lanka, and learn the different forms of power-sharing in a modern government.

## 2. 🪝 Hook
Imagine two children trying to share a single piece of cake. If one child takes the whole cake by force, it leads to a huge fight. But if they cut it in half, they both stay happy. Countries face the exact same problem with power! How do different groups share power without tearing their country apart? Let''s find out!

## 3. 📖 Concept 1: Belgium and Sri Lanka - Ethnic Mix & Contrasting Paths
Democracies deal with community differences in very different ways. We can see this by looking at Belgium and Sri Lanka.
- **The Belgium Situation**: Belgium is a tiny European country. It has a complex **ethnic** (social division based on culture) mix:
  1. 59% of people live in the Flemish region and speak Dutch.
  2. 40% of people live in the Wallonia region and speak French.
  3. 1% of people speak German.
  4. In the capital city, Brussels, 80% speak French and 20% speak Dutch.
- **The Sri Lanka Situation**: Sri Lanka is an island nation with a diverse population of 2 crore people:
  1. 74% are Sinhala speakers (mostly Buddhists).
  2. 18% are Tamil speakers (Hindus or Muslims), divided into Sri Lankan Tamils (13%) and Indian Tamils (5%).
  3. 7% are Christians who speak both languages.
- **The Path of Majoritarianism (Sri Lanka)**: Sri Lanka got independence in 1948. Sinhala leaders sought dominance through their majority. In 1956, they passed an Act to make Sinhala the only official language. They also gave preferential jobs to Sinhalas and protected Buddhism. This **majoritarianism** (rule by majority disregarding minority wishes) alienated the Tamils. It led to a distrust that eventually sparked a brutal **civil war** (intense conflict within a country) ending in 2009.
- **The Path of Accommodation (Belgium)**: Belgian leaders chose a peaceful path. They amended their Constitution 4 times between 1970 and 1993 to give everyone a share:
  1. Equal number of Dutch and French-speaking ministers in the central government.
  2. Many central powers were given to state governments, which are not subordinate to the center.
  3. Brussels got a separate government with equal representation for both groups.
  4. They created a "community government" elected by speakers of each language to handle culture, education, and language.
- [JARGON: Ethnic | A social division based on shared culture and common descent | In Belgium, the population is divided into Flemish-speaking and Walloon-speaking ethnic groups.]
- [JARGON: Majoritarianism | A belief that the majority community should be able to rule a country by disregarding the minority | Sri Lanka adopted majoritarianism in 1956 by making Sinhala the only official language.]
- [JARGON: Civil War | A violent conflict between opposing groups within a country that becomes so intense it looks like a war | The conflict between Sinhalas and Tamils in Sri Lanka turned into a long civil war.]

## 4. 📖 Concept 2: Why Power-sharing is Desirable (Prudential vs Moral)
Why should a democracy share power? There are two main sets of reasons:
- **Prudential Reasons (Calculated Benefits)**: Power-sharing is good because it helps reduce the possibility of conflict between social groups. Since social conflict often leads to violence and political instability, sharing power ensures the stability of the government.
- **Moral Reasons (The Value of the Act)**: Power-sharing is the very spirit of democracy. A democratic rule involves sharing power with those who are affected by its exercise, and who have to live with its effects. People have a right to be consulted on how they are to be governed.
- [JARGON: Prudential | Based on careful calculation of gains and losses rather than purely moral values | Prudential reasons for power-sharing show that it helps reduce social conflict.]

## 5. 📖 Concept 3: Forms of Power-sharing
In modern democracies, power-sharing arrangements take four major forms:
1. **Horizontal Distribution of Power**: Power is shared among different organs of government, such as the legislature, executive, and judiciary. This allows organs at the same level to exercise different powers, ensuring no organ has unlimited power. This is a system of **checks and balances**.
2. **Vertical Division of Power**: Power is shared among governments at different levels. This includes a general government for the entire country (Central or Union Government) and governments at the provincial or regional level (State Governments). This is also called a federal division of power.
3. **Sharing among Social Groups**: Power may be shared among different religious and linguistic groups, such as the "community government" in Belgium or the system of reserved constituencies for weaker sections and women in India.
4. **Sharing among Political Parties, Pressure Groups, and Movements**: In a democracy, citizens must have freedom to choose candidates. Competition among parties ensures power does not remain in one hand and is shared among different parties forming coalition governments.

## 6. ⚠️ Common Mistakes
- **Confusing Horizontal and Vertical**: Horizontal sharing is among organs at the same level (Legislature, Executive, Judiciary). Vertical sharing is among different levels (Union, State, Local).
- **Equating Sharing with Weakness**: Thinking that sharing power weakens a country. As Belgium showed, sharing power actually unites and strengthens a country.
- **Sinhala Population Mix**: Forgetting that Sinhala speakers are 74% and Tamil speakers are 18% in Sri Lanka.

## 7. 💡 Memory Tricks
- **H-V-S-P (Horizontal, Vertical, Social, Parties)**: The four forms of power-sharing.
- **Belgium = Balance**: equal ministers and community government.
- **Sri Lanka = Strife**: majoritarian policies led to civil war.
- **Prudential = Practical, Moral = Meaningful**: Prudential is about avoiding conflict; Moral is about the core spirit of democracy.

## 8. 📝 Quick Practice
- **Question 1**: What was the main difference between the power-sharing models of Belgium and Sri Lanka?
  - *Answer*: Belgium accommodated its linguistic groups by sharing power equally, whereas Sri Lanka imposed Sinhala majority dominance, leading to a civil war.
- **Question 2**: What is the system of "checks and balances" in power-sharing?
  - *Answer*: It is the horizontal division of power where the legislature, executive, and judiciary check each other so that no organ exercises unlimited power.

## 9. 🎓 Board Tips
- **Prudential vs Moral**: This is a very common board exam question. Clearly distinguish between them using the terms "conflict reduction" (prudential) and "spirit of democracy" (moral).
- **Linguistic Percentages**: Remember the exact percentages for Belgium (59% Dutch, 40% French) and Sri Lanka (74% Sinhala, 18% Tamil) as they are frequently asked in MCQs.
- **Horizontal Definition**: Mention "same level" and "checks and balances" when defining horizontal distribution.

## 10. 🔄 One-Minute Revision
- Power-sharing is vital for maintaining peace and stability in a democracy.
- Sri Lanka''s majoritarian Sinhala policies caused alienation and civil war.
- Belgium''s accommodation policies kept the country united by sharing power.
- Prudential reasons focus on better outcomes; moral reasons focus on the intrinsic value of sharing.
- Power can be shared horizontally, vertically, socially, or among political parties.

## 11. 🎬 Comic Recap
┌────────────────────────────────────────────────────────┐
│ PANEL 1: Sharing vs Dividing                           │
│ Priya: "Rahul, doesn''t sharing power just divide and   │
│         weaken the country?"                           │
│ Rahul: "No, Priya! Sharing power actually unites us,   │
│         just like cutting a cake keeps everyone happy!"│
├────────────────────────────────────────────────────────┤
│ PANEL 2: Two Different Paths                           │
│ Priya: "Look at Sri Lanka and Belgium!"                │
│ Rahul: "Yes! Sri Lanka''s majority forced its will and  │
│         caused a civil war. Belgium shared it and is   │
│         peaceful!"                                     │
├────────────────────────────────────────────────────────┤
│ PANEL 3: Prudential vs Moral                           │
│ Priya: "Why is sharing so good for democracies?"       │
│ Rahul: "Prudentially, it avoids social fights. Morally,│
│         it is the very spirit of democracy!"           │
├────────────────────────────────────────────────────────┤
│ PANEL 4: Checks and Balances                           │
│ Priya: "How do we share power in a government?"        │
│ Rahul: "Horizontally between organs to check each      │
│         other, and vertically between levels!"         │
└────────────────────────────────────────────────────────┘', FALSE, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quizzes (id, chapter_id, title, passing_percentage) VALUES
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd389070', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389070', 'Chapter 7 Quiz: Power-sharing', 60)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389071', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389070', 'What is the ethnic composition of Brussels, the capital city of Belgium?', 'multiple_choice', '["A. 80% Dutch-speaking, 20% French-speaking", "B. 80% French-speaking, 20% Dutch-speaking", "C. 59% Dutch-speaking, 40% French-speaking", "D. 99% German-speaking, 1% French-speaking"]'::jsonb, 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389072', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389070', 'Which majoritarian measure was adopted by the democratically elected government of Sri Lanka in 1956?', 'multiple_choice', '["A. It recognised Tamil as the only official language", "B. It recognised Sinhala as the only official language", "C. It created a community government for Tamils", "D. It established a federal system of power sharing"]'::jsonb, 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389073', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389070', 'Which of the following is a key element of the Belgian model of accommodation?', 'multiple_choice', '["A. Dutch-speaking majority people tried to impose their domination on the minority French-speaking community", "B. State governments were made subordinate to the Central Government", "C. The number of Dutch and French-speaking ministers shall be equal in the Central Government", "D. French speakers in Brussels demanded a separate, independent country"]'::jsonb, 2, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389074', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389070', 'What is a "prudential" reason for power-sharing in a democracy?', 'multiple_choice', '["A. It is the very spirit of democracy", "B. It emphasizes that the act of sharing power is valuable in itself", "C. It helps reduce the possibility of conflict between social groups and ensures political stability", "D. It allows the majority community to establish its dominance over others"]'::jsonb, 2, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389075', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389070', 'What is the division of power involving higher and lower levels of government, such as Central, State, and local governments, called?', 'multiple_choice', '["A. Horizontal division of power", "B. Separation of powers", "C. Community government", "D. Vertical division of power"]'::jsonb, 3, NULL, 1)
ON CONFLICT (id) DO NOTHING;
-- SQL Seed File for Chapter 8: Gender, Religion and Caste
-- Subject ID: a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33
-- Chapter ID: c0eebc99-9c0b-4ef8-bb6d-6bb9bd389080

INSERT INTO chapters (id, subject_id, title, sequence_number, description) VALUES
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd389080', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Chapter 8: Gender, Religion and Caste', 8, 'Explore the intersections of gender, religion, and caste with Indian democracy, analyzing how social differences shape political power, representation, and secular values.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd389080', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389080', 'Revision Notes: Gender, Religion and Caste', 'note', NULL, NULL,
'# Chapter 8: Gender, Religion and Caste

## 1. 🎯 Chapter Goal
Understand how social differences like gender, religion, and caste affect politics in India, and learn why expressing these differences can help or harm a democracy.

## 2. 🪝 Hook
Have you ever noticed that most cooks in hotels are men, but at home, women do most of the cooking? Why is that? And why does a person''s religion or caste play such a big role when politicians ask for votes? Let''s discover how these three divisions shape our democracy!

## 3. 📖 Concept 1: Gender and Politics (Feminism & Representation)
Gender division is a hierarchical social division found everywhere. However, it is not based on biology. Instead, it is built on social expectations and stereotypes.
- **Sexual Division of Labour**: Boys and girls are brought up to believe that housework is the main responsibility of women. This leaves men to do all the work outside the home.
- **Feminist Movements**: Radical women''s movements aimed at equality in personal and family life as well. They demanded better status, education, and career opportunities for women.
- **Status of Women**: In our male-dominated, patriarchal society, women still face discrimination. The female literacy rate is only 54% compared to 76% for men. The Equal Remuneration Act, 1976 provides for equal wages, yet women are paid less in almost all fields. The child sex ratio in India is only 919 girls per 1000 boys due to sex-selective abortions.
- **Women''s Representation**: To solve these issues, feminists argued that women must hold power. In India, local bodies (Panchayats and Municipalities) reserve one-third of their seats for women, leading to over 10 lakh elected women representatives. In 2023, the Parliament passed the **Nari Shakti Vandan Adhiniyam** (Women''s Reservation Act, 2023) to reserve 33% of seats for women in the Lok Sabha and State Legislative Assemblies.
- [JARGON: Sexual Division of Labour | A system in which all work inside the home is done by women or organized by them | Traditional households where women cook and clean while men earn income show the sexual division of labour.]
- [JARGON: Patriarchy | A male-dominated social system that values men more and gives them power over women | A patriarchal society often leads to lower literacy rates and fewer high-paying career opportunities for women.]
- [JARGON: Feminist | A person who believes in equal rights and opportunities for women and men | Feminists work to achieve equality in jobs, education, and politics for both men and women.]

## 4. 📖 Concept 2: Religion, Communalism and the Secular State
Unlike gender differences, religious differences are frequently expressed in politics.
- **Religion and Politics**: Gandhiji believed that politics must be guided by ethics drawn from religion (moral values, not sectarian dogma). Human rights groups demand that the state protect minorities. The women''s movement argues that family laws of all religions discriminate against women.
- **Communal Politics**: Communalism begins when religion is seen as the principal basis of social community. It assumes that followers of a religion have the same interests and cannot live as equal citizens with others. Communalism takes forms like:
  1. Everyday beliefs (prejudices and stereotypes of communities).
  2. Quest for dominance (majoritarian rule or a separate state).
  3. Political mobilization using sacred symbols, leaders, and emotional appeals.
  4. Communal violence, riots, and massacres (e.g. Partition).
- **Secular State**: To counter communalism, the makers of India''s Constitution chose the model of a secular state:
  1. There is no official religion for the Indian state, unlike Buddhism in Sri Lanka or Islam in Pakistan.
  2. All individuals have the freedom to profess, practice, and propagate any religion.
  3. The Constitution prohibits discrimination on grounds of religion.
  4. The state can intervene in religion to ensure equality (e.g., banning untouchability).
- [JARGON: Family Laws | Laws that govern family matters like marriage, divorce, adoption, and inheritance | Different religions have different family laws in India, and some of these laws discriminate against women.]
- [JARGON: Communalism | A political philosophy that views religion as the principal basis of social community | Communalism creates division by claiming that one religious community is superior to another.]
- [JARGON: Secular State | A country that treats all religions equally and has no official state religion | India is a secular state where citizens can practice any faith, and the government cannot promote any one religion.]

## 5. 📖 Concept 3: Caste and Politics (Caste inequalities & politicisation)
Caste division is unique to India and is an extreme, ritual-sanctioned form of hereditary occupational division.
- **Caste Inequalities**: Old caste systems excluded and discriminated against outcaste groups (subjecting them to untouchability). Reformers like Jotiba Phule, Gandhiji, B.R. Ambedkar, and Periyar worked to end these inequalities.
- **Modern Changes**: Due to economic development, urbanisation, literacy, and occupational mobility, old caste hierarchies are breaking down. However, caste has not disappeared. Most people still marry within their caste, and caste remains closely linked to economic status (upper castes are over-represented among the rich, while Dalits and Adivasis are worst off).
- **Caste in Politics**:
  1. Parties choose candidates based on the caste composition of the electorate.
  2. Candidates make appeals to caste sentiments to win support.
  3. Universal adult franchise forced leaders to mobilize political support.
- **Limits of Caste in Politics**: Elections are not only about caste. No constituency has a single caste majority. No party gets all votes of a caste (vote banks are not 100% monolithic). Sitting MPs and MLAs often lose, which shows voters'' preferences are not frozen. Economic conditions and government performance are also decisive.
- **Politics in Caste**: Politics also influences caste. Castes get politicized. Each caste tries to become bigger by incorporating sub-castes. Castes enter coalitions with other groups. New groups like "backward" and "forward" caste groups emerge.
- [JARGON: Urbanisation | The shift of population from rural areas to cities | Due to rapid urbanisation, people from different castes now live and work together in cities, breaking old barriers.]
- [JARGON: Occupational Mobility | The ability of a new generation to take up a different job than their ancestors | Occupational mobility allows a farmer''s child to become a doctor, weakening traditional caste barriers.]
- [JARGON: Caste Hierarchy | A ladder-like structure where caste groups are placed from highest to lowest | The old caste hierarchy placed some groups at the top while subjecting outcaste groups to untouchability.]

## 6. ⚠️ Common Mistakes
- **Feminism Stereotype**: Thinking that feminism is only for women. A feminist is any person, man or woman, who believes in equal rights.
- **Official Religion Confusions**: Believing that India has an official state religion. India is secular and does not promote any religion, unlike Pakistan or Sri Lanka.
- **Vote Bank Monolith**: Assuming that caste is the only factor in elections and that a caste acts as a 100% frozen vote bank. In reality, party loyalty, performance, and class also decide votes.

## 7. 💡 Memory Tricks
- **G-R-C (Gender, Religion, Caste)**: Three social differences that shape Indian democracy.
- **Local = 1/3, Lok Sabha = 33%**: Women''s reservation in local bodies is one-third, and the new 2023 Act brings 33% reservation to the Lok Sabha.
- **Secular = No State Religion**: Like Sri Lanka has Buddhism, Pakistan has Islam, but India has NO official state religion.

## 8. 📝 Quick Practice
- **Question 1**: What is the main objective of the Nari Shakti Vandan Adhiniyam passed in 2023?
  - *Answer*: It reserves 33% of seats for women in the Lok Sabha, State Legislative Assemblies, and the Delhi Assembly.
- **Question 2**: State two constitutional provisions that make India a secular state.
  - *Answer*: 1. India has no official religion. 2. The Constitution prohibits discrimination on the grounds of religion.

## 9. 🎓 Board Tips
- **Women''s Reservation Act**: Always mention the Nari Shakti Vandan Adhiniyam of 2023 when writing about women''s representation in Parliament.
- **Both Sides of Caste**: If asked about caste and politics, explain both "Caste in Politics" (candidate choices, appeals) and "Politics in Caste" (castes merging, coalitions).
- **Use Jargon**: Words like sexual division of labour, patriarchy, and secularism help you get full marks.

## 10. 🔄 One-Minute Revision
- Gender division is a social division based on stereotypes, not biology.
- The 2023 Women''s Reservation Act gives 33% reservation to women in Lok Sabha and Assemblies.
- Communalism views religion as the basis of the nation, which threatens democracy.
- India is a secular state with no official religion and equal rights for all faiths.
- Caste system is unique to India, but urbanisation and education are breaking it down.

## 11. 🎬 Comic Recap
```
┌────────────────────────────────────────────────────────┐
│ PANEL 1: Gender Division & Stereotypes                 │
│ Priya: "Rahul, why are house chores mostly done by      │
│         women while men work outside?"                 │
│ Rahul: "That is the Sexual Division of Labour, Priya!  │
│         It is based on social stereotypes, not biology."│
├────────────────────────────────────────────────────────┤
│ PANEL 2: Women in Politics                             │
│ Priya: "Has politics helped women get equal power?"     │
│ Rahul: "Yes! Panchayats reserved 1/3 seats, and the    │
│         2023 Act reserves 33% seats in Lok Sabha now!" │
├────────────────────────────────────────────────────────┤
│ PANEL 3: The Danger of Communalism                     │
│ Priya: "What about religion? Is it bad for politics?"  │
│ Rahul: "Ethics from religion is good, but Communalism  │
│         is bad. It pits one religion against another!" │
├────────────────────────────────────────────────────────┤
│ PANEL 4: Caste''s Two-Way Street                        │
│ Priya: "And how does caste affect our elections?"      │
│ Rahul: "Caste shapes politics through candidate choice,│
│         but politics also makes castes form coalitions!"│
└────────────────────────────────────────────────────────┘
```', FALSE, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quizzes (id, chapter_id, title, passing_percentage) VALUES
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd389080', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389080', 'Chapter 8 Quiz: Gender, Religion and Caste', 60)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389081', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389080', 'Under which system is all work inside the home either done by women of the family or organized by them through domestic helpers?', 'multiple_choice', '["A. Patriarchy", "B. Sexual division of labour", "C. Feminist movement", "D. Caste hierarchy"]'::jsonb, 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389082', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389080', 'Which legislative act passed by the Indian Parliament in 2023 reserves 33% of seats for women in the Lok Sabha and State Legislative Assemblies?', 'multiple_choice', '["A. Nari Shakti Vandan Adhiniyam", "B. Equal Remuneration Act", "C. Panchayati Raj Act", "D. Women Protection Act"]'::jsonb, 0, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389083', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389080', 'What is the principal belief behind communal politics?', 'multiple_choice', '["A. Moral values should guide politics", "B. All religions are equal and should be respected", "C. Religion is the principal basis of social community", "D. State power should never be used to support any religion"]'::jsonb, 2, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389084', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389080', 'Which of the following is a constitutional provision that makes India a secular state?', 'multiple_choice', '["A. The Constitution gives special status to Hinduism", "B. The Constitution permits the state to establish an official religion", "C. The Constitution prohibits the state from intervening in religious matters altogether", "D. The Constitution does not give official status to any religion and prohibits discrimination based on religion"]'::jsonb, 3, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389085', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389080', 'What does the term "Occupational Mobility" refer to in the context of socio-economic changes?', 'multiple_choice', '["A. Shift from one occupation to another, usually when a new generation takes up different work than their ancestors", "B. The movement of workers from rural areas to cities in search of jobs", "C. The enforcement of hereditary occupations by religious rituals", "D. The practice of marrying strictly within one''s own caste or tribe"]'::jsonb, 0, NULL, 1)
ON CONFLICT (id) DO NOTHING;
-- SQL Seed for Chapter 9: Political Parties

-- 1. Insert Chapter
INSERT INTO chapters (id, subject_id, title, sequence_number, description) VALUES
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd389090', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Chapter 9: Political Parties', 9, 'Learn about the functions, necessity, systems, classifications, challenges, and reform measures of political parties in a democracy.')
ON CONFLICT (id) DO NOTHING;

-- 2. Insert Lesson (Revision Notes)
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd389090', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389090', 'Revision Notes: Political Parties', 'note', NULL, NULL,
'# Chapter 9: Political Parties

## 1. 🎯 Chapter Goal
Understand the role, functions, and necessity of political parties in a democracy. Learn about the different party systems, the criteria for national and state party classification, the challenges parties face, and the reforms needed to strengthen them.

## 2. 🪝 Hook
Have you ever seen walls covered with colorful graffiti, posters, and flags during election times, or heard people in your neighborhood arguing about which party is better? Political parties are the most visible symbols of democracy. But what would happen if they vanished overnight? Let''s explore the engine that drives representative democracies around the world!

## 3. 📖 Concept 1: Meaning and Functions of Political Parties
A political party is a group of people who come together to contest elections and hold power in the government. They agree on some policies and programmes for the society to promote the collective good. A party has three key components: the leaders, the active members, and the followers.
A citizen who blindly supports a party exhibits **[JARGON: Partisan | A person who is strongly committed to a party, group, or faction | A partisan voter always supports their party''s candidates and choices, even when they disagree with specific policies.]** (partisanship).

Political parties perform seven crucial functions in a democracy:
1. **Contest Elections**: Parties select candidates to run for political office.
2. **Put Forward Policies**: They group a multitude of opinions into a few basic policy positions for voters to choose from.
3. **Decisive Role in Making Laws**: Laws are debated and passed in the legislature, where members follow the party''s direction.
4. **Form and Run Governments**: Parties recruit, train, and appoint leaders as ministers to run the state machinery.
5. **Play the Role of Opposition**: Losing parties voice different views, criticize government failures, and mobilize opposition.
6. **Shape Public Opinion**: They highlight public issues, launch movements, and influence how citizens perceive problems.
7. **Provide Access to Welfare Schemes**: For ordinary citizens, approaching a local party leader is much easier than approaching a government bureaucrat.

## 4. 📖 Concept 2: Party Systems and Classifications
Democracies around the world adopt different party systems based on their social and historical contexts:
- **One-Party System**: Only one party controls the government (e.g., China). This is not a democratic option because voters have no choice.
- **Two-Party System**: Power generally alternates between two dominant parties (e.g., USA, UK).
- **Multiparty System**: Several parties have a reasonable chance of coming to power, often leading to a **[JARGON: Coalition Government | A government formed by an alliance of two or more political parties when no single party wins a majority | The National Democratic Alliance (NDA) formed a coalition government at the Centre in India.]**.

In India, political parties are registered with the Election Commission and classified into:
- **National Parties**: Present in several states. To qualify, a party must win at least 6% of total votes in Lok Sabha elections (or assembly elections in 4 states) and win at least 4 Lok Sabha seats. As of 2023, there are six recognized national parties (including BJP, INC, AAP, BSP, CPI-M, and NPP).
- **State (Regional) Parties**: Present primarily in one state. To qualify, a party must win at least 6% of total votes in a State Assembly election and win at least 2 seats.

## 5. 📖 Concept 3: Challenges and Reforms of Political Parties
Political parties face four major challenges that hinder their effectiveness:
1. **Lack of Internal Democracy**: Power is concentrated in the hands of a few top leaders. There are no regular internal elections, registers, or meetings.
2. **Dynastic Succession**: Leaders abuse their power to favor family members, preventing ordinary workers from rising to the top.
3. **Money and Muscle Power**: Parties focus heavily on winning, leading them to nominate wealthy candidates or support criminals who can secure votes.
4. **Lack of Meaningful Choice**: Ideological differences have declined, making it hard for voters to choose between distinct options.

To address these challenges, the following efforts and reforms have been introduced in India:
- **Anti-Defection Law**: The Constitution was amended to prevent elected representatives from committing **[JARGON: Defection | Changing party allegiance from the party on which a person got elected to a different party | An elected MLA defecting to another party in exchange for a ministerial post loses their legislative seat under Indian law.]**.
- **Mandatory Disclosures**: The Supreme Court made it mandatory for candidates to file an **[JARGON: Affidavit | A signed document submitted to an officer where a person makes a sworn statement regarding their personal assets and criminal history | A contesting candidate filing an affidavit declaring their property value and pending criminal cases to the Election Commission.]** before contesting.
- **Organizational Elections**: The Election Commission made it mandatory for parties to conduct internal elections and file income tax returns.

## 6. ⚠️ Common Mistakes
- **Confusing State Party and National Party Criteria**: Remember that a National Party needs 6% of votes in Lok Sabha/4 states and 4 Lok Sabha seats, while a State Party needs 6% of votes in a state assembly and 2 assembly seats.
- **Confusing Coalition with Alliance**: An alliance (or front) is formed *before* elections to contest together, whereas a coalition government is formed *after* elections to govern when no single party has a majority.
- **Believing Defection is Still Freely Allowed**: Since the Anti-Defection Law was passed, any MP or MLA who changes parties after winning will lose their seat in the legislature.

## 7. 💡 Memory Tricks
- **L-A-F Components**: **L**eaders, **A**ctive members, **F**ollowers.
- **Four Challenges - I-D-M-C**: **I**nternal democracy lack, **D**ynastic succession, **M**oney/muscle power, **C**hoice lack.
- **Anti-Defection is a Seat Saver**: If you switch sides, your seat is taken away!

## 8. 📝 Quick Practice
- **Question 1**: Name the three components of a political party.
  - *Answer*: The leaders, the active members, and the followers.
- **Question 2**: What is the minimum vote percentage and number of seats required for a party to be recognized as a State Party?
  - *Answer*: At least 6% of the total votes in the Legislative Assembly election of a state, and at least 2 seats.

## 9. 🎓 Board Tips
- Board exams frequently ask about the role of the opposition. Remember that the opposition is just as important as the ruling party—it keeps the government in check, highlights failures, and represents public dissent.
- Be prepared to discuss the challenges of "money and muscle power" with real-world examples, and specify how the affidavit system acts as a reform.

## 10. 🔄 One-Minute Revision
- A political party contests elections, makes laws, forms governments, acts as opposition, and shapes public opinion.
- Without parties, every representative would be independent, making stable national policy-making impossible.
- Party systems are One-Party (non-democratic), Two-Party (stable), and Multiparty (highly representative but can be unstable).
- The Election Commission registers parties and uses vote/seat thresholds to recognize them as State or National.
- Key challenges include lack of internal democracy, dynastic succession, money/muscle power, and declining choices.
- Defection is penalized by seat forfeiture; candidates must declare assets and criminal records via affidavits.

## 11. 🎬 Comic Recap
```
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "Priya: Why do we even need         │
│         political parties? People blame    │
│         them for everything!"              │
│ Rahul: "Rahul: True, but without them, who │
│         would run the country? Every MLA   │
│         would just look after their own    │
│         small constituency!"               │
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "Priya: So how many parties are     │
│         best? China has just one!"         │
│ Rahul: "Rahul: A one-party system isn''t    │
│         democratic! We need at least two   │
│         to have a real choice, like the   │
│         USA or India''s multiparty alliance!"│
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "Priya: And what is defection? Is it│
│         allowed now?"                      │
│ Rahul: "Rahul: It''s changing parties after │
│         winning. The anti-defection law    │
│         stops this by taking away their    │
│         seat if they defect!"              │
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ Political parties are vital for            │
│ representative democracy. They contest     │
│ elections, make laws, and run governments. │
└────────────────────────────────────────────┘
```', FALSE, 1)
ON CONFLICT (id) DO NOTHING;

-- 3. Insert Quiz
INSERT INTO quizzes (id, chapter_id, title, passing_percentage) VALUES
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd389090', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389090', 'Chapter 9 Quiz: Political Parties', 60)
ON CONFLICT (id) DO NOTHING;

-- 4. Insert Quiz Questions
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389091', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389090', 'Which of the following is NOT one of the three main components of a political party?', 'multiple_choice',
'["A. The leaders", "B. The active members", "C. The followers", "D. The government officers"]', 3, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389092', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389090', 'A party system in which only one party is allowed to control and run the government is called a:', 'multiple_choice',
'["A. Unitary system", "B. One-party system", "C. Two-party system", "D. Dictatorial system"]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389093', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389090', 'An electoral alliance or front is formed when:', 'multiple_choice',
'["A. Two parties merge into a single new party", "B. Several parties join hands to contest elections and win power together", "C. The Election Commission merges state parties", "D. A party splits into two factions"]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389094', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389090', 'Which law was passed in India to prevent elected MLAs and MPs from changing their political parties after being elected?', 'multiple_choice',
'["A. Code of Conduct Law", "B. Right to Information Act", "C. Anti-Defection Law", "D. Electoral Reform Act"]', 2, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389095', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389090', 'A signed document submitted to an officer where a person makes a sworn statement about their personal assets and criminal history is called an:', 'multiple_choice',
'["A. Affidavit", "B. Agreement", "C. Allegiance", "D. Appeal"]', 0, NULL, 1)
ON CONFLICT (id) DO NOTHING;
-- Seeding Chapter 10: Outcomes of Democracy

INSERT INTO chapters (id, subject_id, title, sequence_number, description) VALUES
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd389100', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Chapter 10: Outcomes of Democracy', 10, 'Understand how to assess the political, economic, and social outcomes of democracy, focusing on accountability, responsiveness, economic growth, inequality, social accommodation, and individual dignity.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd389100', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389100', 'Revision Notes: Outcomes of Democracy', 'note', NULL, NULL,
'# Chapter 10: Outcomes of Democracy

## 1. 🎯 Chapter Goal
Evaluate democracy objectively by examining its political, economic, and social outcomes. Learn to distinguish between what we can reasonably expect from a democratic government in theory (such as accountability, responsiveness, and legitimacy) and what it actually achieves in practice regarding economic growth, inequality, social accommodation, and individual dignity.

## 2. 🪝 Hook
Imagine you buy a high-tech smart device that promises to make your life perfectly organized. But in practice, it occasionally lags, ignores some inputs, and doesn''t solve all your chores automatically. Would you throw it away and go back to manually doing everything, or would you try to make it work better because it''s still far superior to no device? This is the dilemma of democracy! We praise it in principle but complain about it in practice. Let''s find out why complaining about democracy is actually a sign of its strength, and how we measure its true success!

## 3. 📖 Concept 1: Accountable, Responsive, and Legitimate Government
The most basic expectation from a democracy is that it produces a government that is accountable to its citizens and responsive to their needs and expectations.
- **Accountability and Deliberation**: Critics argue that democracies are inefficient because they take time to make decisions. However, non-democratic rulers can decide quickly because they do not have to worry about public opinion or assembly debates. But fast decisions might be unacceptable to the people, leading to conflict. Democracies follow procedures, which takes time but ensures decisions are acceptable and effective. The cost of time is worth it.
- **[JARGON: Accountability | The obligation of a government to explain its decisions and actions to its citizens, who hold the power to choose their leaders | Regular, free, and fair elections and open public debate are mechanisms that ensure accountability in a democracy.]**
- **Transparency**: A citizen has the right and means to examine the process of decision-making. This is often missing in non-democracies.
- **[JARGON: Transparency | The right and means of citizens to examine the process and criteria of government decision-making | Nannu using the Right to Information (RTI) Act in Delhi to track the status of his duplicate ration card application.]**
- **Legitimacy**: A democratic government may be slow, corrupt, or inefficient, but it is the people''s own government. That is why there is overwhelming support for democracy globally, particularly in South Asia (except Pakistan, where opinions are more divided, though support for elected leaders remains high).
- **[JARGON: Legitimate Government | A government that is legally constituted and authorized by the citizens through their consent and vote | A democratically elected representative government, even if slow or inefficient, is preferred by citizens because it is their own government.]**

## 4. 📖 Concept 2: Economic Growth, Inequality, and Poverty
Can we expect democracy to bring economic development and reduce poverty? The historical record presents a mixed picture.
- **Economic Growth**: A comparison of regimes between 1950 and 2000 reveals that dictatorial regimes have a slightly higher rate of economic growth (4.42% vs 3.95% for democracies). However, when looking only at poor countries, the difference is negligible (4.34% under dictatorship vs 4.28% under democracy). Economic growth depends on population size, global situations, cooperation, and economic priorities.
- **Economic Inequality**: Democracies guarantee political equality (one person, one vote), but they often co-exist with growing economic inequalities. A small number of ultra-rich enjoy a highly disproportionate share of wealth, while those at the bottom struggle to meet basic needs like food, clothing, education, and health.
- **[JARGON: Economic Inequality | The unequal distribution of wealth and income among individuals or groups within a society | In Brazil, the top 20 percent of the population earns 63 percent of the national income, while the bottom 20 percent receives only 2.6 percent.]**
- **Poverty Reduction**: Although the poor form a large proportion of voters, democratically elected governments are often slow to address poverty. In Bangladesh, for example, more than half of the population lives in poverty.

## 5. 📖 Concept 3: Accommodation of Social Diversity, Dignity, and Freedom
Democracy is superior to other systems in promoting social harmony and individual dignity.
- **Social Accommodations**: No society can permanently resolve conflicts, but democracies develop mechanisms to negotiate differences (e.g., Belgium''s successful negotiations vs. Sri Lanka''s failures).
- **Two Conditions for Accommodation**:
  1. *Not just majority rule*: The majority must always work with the minority so that the government represents the general view.
  2. *No rule by majority community*: Rule by majority must not mean rule by a majority community in terms of religion, race, or linguistic group. Every citizen must have a chance of being in the majority at some point.
- **Dignity and Freedom**: Democracy provides a legal and moral foundation for the dignity and freedom of individuals. Long struggles by women and disadvantaged/discriminated castes have forced the recognition of equal respect as a necessary ingredient of a democratic society.
- **Dissatisfaction as a Success Metric**: The fact that citizens complain about democracy is a testimony to its success. It shows that people have developed critical awareness and transformed from passive subjects into active citizens who believe their votes make a difference.

## 6. ⚠️ Common Mistakes
- **Treating Democracy as a Solution to All Problems**: Students often blame the idea of democracy if economic or social goals are not met. Remember: democracy is just a form of government. It only creates conditions; citizens must take advantage of them.
- **Equating Majority Rule to Communal Rule**: Majority rule in a democracy is a fluid political majority that changes with every vote. It is NOT a permanent rule by a dominant religious, racial, or caste group.
- **Ignoring the Economic Context**: Assuming dictatorship is strictly better for economic growth is incorrect. In poor countries, the growth difference between democracies and dictatorships is negligible, while democracy offers dignity and freedom that dictatorships cannot.

## 7. 💡 Memory Tricks
- **"A-R-L" of Democracy**: Remember the three political pillars: **A**ccountable, **R**esponsive, and **L**egitimate.
- **"Subject to Citizen" Shift**: Think of complaining as an exam. Passing one exam (getting rights) makes us want to take the next one (expecting more). Complaining means we are active citizens!
- **Brazil vs. Denmark**: Remember Brazil and South Africa as the "extremes of inequality" (top 20% getting almost everything) and Denmark as the model of fairness (top 20% getting over 9% for the bottom 20%).

## 8. 📝 Quick Practice
- **Question 1**: Why is the delay in decision-making in a democracy not necessarily a sign of inefficiency?
  - *Answer*: Democracies follow norms and procedures to ensure deliberation and negotiation. Although this causes delay, the resulting decisions are more acceptable to the public, more effective in practice, and legitimate. This makes the cost of time worth it.
- **Question 2**: What are the two conditions under which democracies accommodate social diversities?
  - *Answer*: First, the majority must work with the minority to represent the general view, as majority opinion is not permanent. Second, rule by majority must not become rule by a majority community based on birth, religion, or language; every citizen must have a chance to be in the majority.

## 9. 🎓 Board Tips
- **Use Data**: When writing about economic development, cite the statistics: the difference in growth between poor democracies (4.28%) and poor dictatorships (4.34%) is negligible.
- **Emphasize Moral vs. Legal Power**: Explain that while caste or gender discrimination still exists, democracy gives victims a moral and legal foundation to struggle against them, which is absent in dictatorships.
- **Nannu''s Case Study**: Use the story of Nannu''s duplicate ration card and the RTI Act as a real-world example of how transparency empowers citizens to fight administrative apathy and corruption.

## 10. 🔄 One-Minute Revision
- Democracy is a better form of government because it promotes equality, enhances dignity, improves decision-making, resolves conflicts, and allows correction of mistakes.
- A democratic government is accountable (follows procedures), responsive (attentive to citizens), and legitimate (people''s own government).
- Dictatorships have a slightly higher growth rate on average, but the difference is negligible in poor countries.
- Democracies struggle with economic inequality, but stand far superior in accommodating social diversity and securing individual freedom.
- Complaints and dissatisfaction are signs of a healthy democracy as they show citizen awareness and the ability to hold power holders accountable.

## 11. 🎬 Comic Recap
┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│ PANEL 1:                                                                                         │
│ Priya: "Why do we always complain about our democracy, Rahul? Is it really that bad?"             │
│ Rahul: "Actually, Priya, complaints are a sign of its success! It means we are active citizens,  │
│ Rahul: "not passive subjects."                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 2:                                                                                         │
│ Priya: "I see! Dictatorships might decide faster, but democracies are transparent and legitimate │
│ Priya: "because they are our own government."                                                   │
│ Rahul: "Exactly! And by working together, we ensure majority rule doesn''t become rule by just   │
│ Rahul: "one community. We all get a voice."                                                      │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 3:                                                                                         │
│ Priya: "So democracy gives us the rights and tools, but we have to make it work!"                │
│ Rahul: "Spot on! It''s not a magic wand, it''s a set of fair conditions for us to achieve our goals."│
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                                                                                 │
│ Democracy is an accountable, responsive, and legitimate government. It may have economic limits, │
│ but it provides the moral and legal foundations for equality, diversity, and dignity.            │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘', FALSE, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quizzes (id, chapter_id, title, passing_percentage) VALUES
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd389100', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389100', 'Quiz: Outcomes of Democracy', 60)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389101', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389100', 'Which of the following is NOT one of the reasons why democracy is considered a better form of government than dictatorship?', 'multiple_choice', '["A. It promotes equality among citizens", "B. It guarantees immediate and high economic growth", "C. It enhances the dignity of the individual", "D. It allows room to correct mistakes"]', 1, NULL, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389102', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389100', 'According to studies of political and social inequalities in democracies between 1950 and 2000, which of the following is correct?', 'multiple_choice', '["A. Democracies have successfully eliminated all economic inequalities", "B. Economic inequalities exist and are often high in democratic regimes", "C. Dictatorships have completely equal income distribution", "D. Poor democracies have significantly higher economic growth rates than poor dictatorships"]', 1, NULL, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389103', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389100', 'Based on the South Asia survey data cited in the textbook, in which of the following countries is support for democracy the lowest?', 'multiple_choice', '["A. India", "B. Bangladesh", "C. Pakistan", "D. Sri Lanka"]', 2, NULL, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389104', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389100', 'In the textbook case study of Nannu from East Delhi, how was he able to force the government officials to process his duplicate ration card?', 'multiple_choice', '["A. By organizing a violent street protest in his colony", "B. By paying a large bribe to the Food and Supply Officer", "C. By filing an application under the Right to Information (RTI) Act", "D. By joining a political party and running for local elections"]', 2, NULL, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389105', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389100', 'To successfully accommodate social diversities, which conditions must a democratic regime fulfill?', 'multiple_choice', '["A. It must suppress all minority opinions and establish absolute rule by the majority community", "B. The majority must work with the minority, and rule by majority must not become permanent rule by one majority community", "C. It must divide the country into separate independent states based on language or religion", "D. It must ensure that elections are never held to avoid any social conflict or competition"]', 1, NULL, 1)
ON CONFLICT (id) DO NOTHING;
-- Seeding Chapter 11: Resources and Development

INSERT INTO chapters (id, subject_id, title, sequence_number, description) VALUES
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd389110', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Chapter 11: Resources and Development', 11, 'Learn about resource classification, sustainable development, land degradation, soil types, and soil conservation methods in India.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd389110', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389110', 'Revision Notes: Resources and Development', 'note', NULL, NULL,
'# Chapter 11: Resources and Development

## 1. 🎯 Chapter Goal
Learn how to define and classify resources. Understand sustainable development, land use, different soils of India, and soil conservation methods.

## 2. 🪝 Hook
Imagine a day when the petrol pumps run dry. What will happen to our cars, buses, and factories? Our modern life would stop. Let''s learn how we use and save nature''s resources to build a better future!

## 3. 📖 Concept 1: Resources and Sustainable Development
Everything in our environment that helps us satisfy our needs is a resource. A **[JARGON: Resource | Anything in our environment that satisfies human needs, which is accessible, affordable, and acceptable | Forests, water, and minerals are resources.]** must meet three conditions. It must be technologically accessible, economically feasible, and culturally acceptable.

Humans are active components of resources. They interact with nature using technology. They build institutions to speed up economic growth.

### Classification of Resources:
- **By Origin**:
  - **[JARGON: Biotic Resources | Resources obtained from the biosphere that have life | Plants, animals, and human beings are biotic resources.]** are living things.
  - **[JARGON: Abiotic Resources | Resources composed of non-living things | Rocks, metals, and soils are abiotic resources.]** are non-living things.
- **By Exhaustibility**:
  - **[JARGON: Renewable Resources | Resources that can renew or reproduce themselves through physical or chemical processes | Solar energy, wind energy, and forests are renewable.]** can be replaced easily.
  - **[JARGON: Non-Renewable Resources | Resources that take millions of years to form and get exhausted with use | Coal and petroleum are non-renewable resources.]** take millions of years to form.
- **By Ownership**:
  - **Individual**: Owned by private people, like houses and plots.
  - **Community**: Open to all community members, like parks and playgrounds.
  - **National**: Owned by the nation. This includes minerals, forests, and land. It also includes water within 12 nautical miles from the coast.
  - **International**: Regulated by global bodies. Oceanic areas beyond 200 nautical miles from coasts belong to open oceans.
- **By Status of Development**:
  - **[JARGON: Potential Resources | Resources found in a region but not yet utilized | Rajasthan has high potential for solar energy.]** are not yet fully used.
  - **Developed**: Surveyed resources ready for use.
  - **[JARGON: Stock | Materials that can satisfy human needs but lack the technology to be used | Hydrogen in water could be a huge fuel source, but we cannot split it cheaply.]** are materials we cannot use yet.
  - **[JARGON: Reserves | A subset of stock that we can use with existing technology but save for the future | Water in dams is a reserve.]** are saved for future needs.

### Sustainable Development:
Indiscriminate use of resources has led to depletion, global warming, and ozone layer damage. **[JARGON: Sustainable Development | Development that meets current needs without damaging the environment or harming future generations | Saving water by using drip irrigation is sustainable.]** is essential.
- **Rio Earth Summit 1992**: Over 100 leaders met in Brazil to talk about environment protection.
- **[JARGON: Agenda 21 | A global plan signed in 1992 to fight environmental damage, poverty, and disease | Agenda 21 aims for local governments to make their own local environmental plans.]** was adopted here.

## 4. 📖 Concept 2: Land Resources and Utilisation in India
Land is a finite resource. India has three main land features:
- **Plains (43%)**: Used for farming and industry.
- **Mountains (30%)**: Supply water to rivers, help tourism, and protect ecology.
- **Plateaus (27%)**: Store minerals, fossil fuels, and forests.

### Land Use and Net Sown Area:
The total area of India is 3.28 million square kilometers. We only have land use data for 93% of it.
- **[JARGON: Net Sown Area | The physical extent of land on which crops are sown and harvested at least once a year | Punjab has over 80% Net Sown Area, while Arunachal Pradesh has under 10%.]** is the area sown once a year.
- **[JARGON: Gross Cropped Area | The total area sown in a year, counting double-cropped fields twice | A 5-acre field planted twice in a year adds 10 acres to the Gross Cropped Area.]** includes net sown area plus area sown more than once.

### Land Degradation:
Over 95% of our food, shelter, and clothing comes from land. Human activities degrade land.
- **Mining**: Causes deforestation in Jharkhand, Chhattisgarh, and Odisha.
- **Overgrazing**: Main cause of land damage in Gujarat, Rajasthan, and Maharashtra.
- **Over-irrigation**: Leads to waterlogging and salinity in Punjab, Haryana, and western Uttar Pradesh.
- **Mineral Processing**: Grinding limestone for cement creates dust. This dust stops water from soaking into the soil.

## 5. 📖 Concept 3: Soils of India and Soil Conservation
Soil is a living system. It takes millions of years to form a few centimeters of soil.

### Major Soil Types:
1. **Alluvial Soil**: Most widespread soil. Found in northern plains and coastal deltas. Deposited by Indus, Ganga, and Brahmaputra rivers. Rich in potash and lime. Ideal for sugarcane and wheat.
   - **[JARGON: Bangar | Old alluvial soil with higher concentration of kankar nodules and lower fertility | Bangar is found in higher terrace areas above flood plains.]** is old alluvial.
   - **[JARGON: Khadar | New alluvial soil with fine particles and high fertility | Khadar is renewed yearly by floods, making it very fertile.]** is new alluvial.
2. **Black Soil (Regur)**: Found in Deccan Trap (basalt) region. Made of lava flows. Holds moisture well. Ideal for growing cotton. Rich in calcium carbonate, magnesium, and lime. Poor in phosphorus. Develops deep cracks in hot weather.
3. **Red and Yellow Soil**: Formed on crystalline igneous rocks in low rainfall areas. Red due to iron diffusion. Yellow when hydrated.
4. **[JARGON: Laterite Soil | Highly leached, acidic soil formed in tropical climates with heavy seasonal rains | Cashew nuts and tea grow well in laterite soil.]** is formed by intense leaching. Found in southern states. Used for growing tea, coffee, and cashew nuts.
5. **Arid Soil**: Sandy texture, saline nature. Lacks humus and moisture. Kankar layer in bottom restricts water infiltration. Cultivable with proper irrigation.
6. **Forest Soil**: Found in hilly areas. Loamy and silty in valleys. Coarse in upper slopes. Acidic with low humus in snowy regions.

### Soil Erosion and Conservation:
**[JARGON: Soil Erosion | The washing away of the topsoil cover by wind or running water | Heavy rain washing topsoil off a bare field is soil erosion.]** occurs due to human action and natural forces.
- **[JARGON: Gully Erosion | Water cutting deep channels in clayey soils to create bad land | The Chambal ravines are famous examples of gully erosion.]** makes land unfit for farming.
- **[JARGON: Sheet Erosion | When running water washes away a broad layer of topsoil over a large area | Heavy rain washing topsoil down a gentle slope causes sheet erosion.]** washes topsoil off large slopes.
- **Contour Ploughing**: Ploughing along contour lines to slow down water flow.
- **Terrace Farming**: Cutting steps on slopes to stop erosion. Common in Western Himalayas.
- **Strip Cropping**: Growing strips of grass between crops to break wind force.
- **Shelter Belts**: Planting rows of trees to stabilize sand dunes.

## 6. ⚠️ Common Mistakes
- **Confusing Bangar and Khadar**: Remember Bangar is Old and less fertile. Khadar is New and highly fertile.
- **Confusing Net Sown Area with Gross Cropped Area**: Net Sown Area only counts the physical land once. Gross Cropped Area counts land multiple times if crops are planted more than once.
- **Confusing Sheet Erosion with Gully Erosion**: Sheet erosion washes away a flat layer of soil. Gully erosion cuts deep, narrow channels.

## 7. 💡 Memory Tricks
- **Bangar is Old**: Think of "Bhangar" (scrap dealer) who buys old, useless things.
- **Khadar is New**: Think of "Khaad" (fertilizer) which makes new soil extremely fertile.
- **Alluvial has All**: Alluvial soil is fertile enough to grow almost "All" major crops like wheat, rice, and sugarcane.

## 8. 📝 Quick Practice
- **Question 1**: Why is resource planning essential in a country like India?
  - *Answer*: India has enormous diversity in resources. Some states like Jharkhand are rich in minerals but lack infrastructure. Rajasthan has solar energy but lacks water. Resource planning ensures balanced development.
- **Question 2**: Mention two human activities that cause land degradation.
  - *Answer*: Deforestation from mining (in states like Jharkhand) and over-irrigation (in states like Punjab) cause severe land degradation.

## 9. 🎓 Board Tips
- Always define resource using three key phrases: "technologically accessible", "economically feasible", and "culturally acceptable". Examiners look for these.
- When writing about soil conservation, list contour ploughing, terrace farming, strip cropping, and shelter belts as distinct points with short definitions.

## 10. 🔄 One-Minute Revision
- A resource must be accessible, affordable, and acceptable to society.
- Sustainable development means developing without damaging nature or hurting future generations.
- India has 43% plains, 30% mountains, and 27% plateaus.
- Over-irrigation, overgrazing, and mining are major causes of land degradation in India.
- Major soils include Alluvial, Black, Red/Yellow, Laterite, Arid, and Forest soils.

## 11. 🎬 Comic Recap
```
┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│ PANEL 1:                                                                                         │
│ Priya: "Hey Rahul! Did you know resources are not free gifts of nature? We transform them!"      │
│ Rahul: "Yes, like coal is just a rock until we use technology to extract it for energy!"         │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 2:                                                                                         │
│ Priya: "Exactly! And we must do this sustainably, or we will face global ecological crises."     │
│ Rahul: "Right! Agenda 21 was created in the 1992 Rio Earth Summit to fight environmental damage."│
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 3:                                                                                         │
│ Priya: "True. We also need soil conservation. Gully erosion turns Chambal into bad land!"        │
│ Rahul: "But terrace farming and shelter belts help us protect the topsoil. Let''s save our land!"│
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                                                                                │
│ Resources must be accessible, affordable, and acceptable. Protect them with planning!            │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘
```', FALSE, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quizzes (id, chapter_id, title, passing_percentage) VALUES
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd389110', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389110', 'Quiz: Resources and Development', 60)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389111', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389110', 'Which one of the following is the main cause of land degradation in Punjab?', 'multiple_choice', '["A. Intensive cultivation", "B. Deforestation", "C. Over irrigation", "D. Overgrazing"]', 2, NULL, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389112', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389110', 'In which of the following states is terrace cultivation practiced in India?', 'multiple_choice', '["A. Punjab", "B. Haryana", "C. Uttarakhand", "D. Plains of Uttar Pradesh"]', 2, NULL, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389113', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389110', 'In which of the following regions/states is black soil predominantly found?', 'multiple_choice', '["A. Maharashtra", "B. Rajasthan", "C. Uttarakhand", "D. Jharkhand"]', 0, NULL, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389114', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389110', 'What basis of classification divides resources into renewable and non-renewable resources?', 'multiple_choice', '["A. On the basis of origin", "B. On the basis of ownership", "C. On the basis of exhaustibility", "D. On the basis of status of development"]', 2, NULL, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389115', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389110', 'Which book presented Gandhian philosophy on resource conservation in 1974?', 'multiple_choice', '["A. Our Common Future", "B. Small is Beautiful", "C. Limits to Growth", "D. Discovery of India"]', 1, NULL, 1)
ON CONFLICT (id) DO NOTHING;
-- SQL Seed Data for Chapter 12: Forest and Wildlife Resources
-- Subject ID: 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33'
-- Chapter UUID: 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389120'
-- Lesson UUID: 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd389120'
-- Quiz UUID: 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389120'

-- Insert Chapter
INSERT INTO chapters (id, subject_id, title, sequence_number, description)
VALUES (
    'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389120',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33',
    'Chapter 12: Forest and Wildlife Resources',
    12,
    'A study of India''s biological diversity, including its rich flora and fauna, and the community-led and state-sponsored strategies for forest and wildlife conservation.'
)
ON CONFLICT (id) DO NOTHING;

-- Insert Lesson (Revision Notes)
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number)
VALUES (
    'b0eebc99-9c0b-4ef8-bb6d-6bb9bd389120',
    'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389120',
    'Chapter 12: Forest and Wildlife Resources Revision Notes',
    'note',
    NULL,
    NULL,
    '# Chapter 12: Forest and Wildlife Resources

## 🎯 Chapter Goal
Understand the rich biodiversity of India, learn the state and community-led conservation practices (such as the Wildlife Protection Act, Project Tiger, and JFM), and comprehend the classification of forests.

## 🪝 Hook
Did you know that India harbors nearly 8% of the world''s total species, yet many are on the brink of extinction? From tigers to tiny beetles and even plants, our entire life-support system depends on a complex web of ecological networks we often take for granted.

## 📖 Concepts

### Concept 1: Biodiversity and the Ecological System
We share this planet with millions of other living beings, starting from micro-organisms and bacteria, lichens to banyan trees, elephants and blue whales. This entire habitat that we live in has immense biodiversity. We humans along with all living organisms form a complex web of ecological system in which we are only a part and very much dependent on this system for our own existence. For example, the plants, animals and micro-organisms re-create the quality of the air we breathe, the water we drink and the soil that produces our food without which we cannot survive. Forests play a key role in the ecological system as these are also the primary producers on which all other living beings depend.

[JARGON: Biodiversity | The variety of all living organisms, including plants, animals, and microorganisms, and the ecological complexes they form | The dense tropical rain forests of the Western Ghats containing thousands of unique species of flora and fauna.]

### Concept 2: Conservation of Forest and Wildlife in India
Conservation in the background of rapid decline in wildlife population and forestry has become essential. Conservation preserves the ecological diversity and our life support systems – water, air and soil. It also preserves the genetic diversity of plants and animals for better growth of species and breeding.

In the 1960s and 1970s, conservationists demanded a national wildlife protection programme. The Indian Wildlife (Protection) Act was implemented in 1972, with various provisions for protecting habitats. An all-India list of protected species was also published. The thrust of the programme was towards protecting the remaining population of certain endangered species by banning hunting, giving legal protection to their habitats, and restricting trade in wildlife.

Subsequently, central and many state governments established national parks and wildlife sanctuaries. The central government also announced several projects for protecting specific animals, which were gravely threatened, including the tiger, the one-horned rhinoceros, the Kashmir stag or hangul, three types of crocodiles – fresh water crocodile, saltwater crocodile and the Gharial, the Asiatic lion, and others. Most recently, the Indian elephant, black buck (chinkara), the great Indian bustard (godawan) and the snow leopard, etc. have been given full or partial legal protection against hunting and trade throughout India.

#### Project Tiger (1973)
Tiger is one of the key wildlife species in the faunal web. In 1973, the authorities realised that the tiger population had dwindled to 1,827 from an estimated 55,000 at the turn of the century. The major threats to tiger population are numerous, such as poaching for trade, shrinking habitat, depletion of prey base species, growing human population, etc. Since India and Nepal provide habitat to about two-thirds of the surviving tiger population in the world, these two nations became prime targets for poaching and illegal trading.
"Project Tiger", one of the well-publicised wildlife campaigns in the world, was launched in 1973. Corbett National Park in Uttarakhand, Sunderbans National Park in West Bengal, Bandhavgarh National Park in Madhya Pradesh, Sariska Wildlife Sanctuary in Rajasthan, Manas Tiger Reserve in Assam and Periyar Tiger Reserve in Kerala are some of the tiger reserves of India.

In the notifications under Wildlife Act of 1980 and 1986, several hundred butterflies, moths, beetles, and one dragonfly have been added to the list of protected species. In 1991, for the first time plants were also added to the list, starting with six species.

[JARGON: Wildlife Sanctuary | A federally or locally protected area of land set aside to preserve habitats and protect native wildlife species from hunting and exploitation | Sariska Wildlife Sanctuary in Rajasthan, which protects tigers and other native wildlife.]

### Concept 3: Classification of Forests and Community-led Conservation
In India, much of its forest and wildlife resources are either owned or managed by the government through the Forest Department or other government departments. These are classified under the following categories:
1. **Reserved Forests**: More than half of the total forest land has been declared reserved forests. Reserved forests are regarded as the most valuable as far as the conservation of forest and wildlife resources are concerned.
2. **Protected Forests**: Almost one-third of the total forest area is protected forest, as declared by the Forest Department. This forest land is protected from any further depletion.
3. **Unclassed Forests**: These are other forests and wastelands belonging to both government and private individuals and communities.

Reserved and protected forests are also referred to as permanent forest estates maintained for the purpose of producing timber and other forest produce, and for protective reasons. Madhya Pradesh has the largest area under permanent forests, constituting 75 per cent of its total forest area.

#### Community and Conservation
Conservation strategies are not new in our country. We often ignore that in India, forests are also home to some of the traditional communities.
* In **Sariska Tiger Reserve**, Rajasthan, villagers have fought against mining by citing the Wildlife Protection Act.
* The inhabitants of five villages in the **Alwar district** of Rajasthan have declared 1,200 hectares of forest as the **Bhairodev Dakav ''Sonchuri''**, declaring their own set of rules and regulations which do not allow hunting, and are protecting the wildlife against any outside encroachments.
* The famous **Chipko movement** in the Himalayas has successfully resisted deforestation in several areas.
* Farmers and citizen groups like the **Beej Bachao Andolan** in Tehri and **Navdanya** have shown that adequate levels of diversified crop production without the use of synthetic chemicals are possible and economically viable.
* **Joint Forest Management (JFM)** programme furnishes a good example for involving local communities in the management and restoration of degraded forests. The programme has been in formal existence since 1988 when the state of Odisha passed the first resolution for joint forest management.
* **Sacred Groves**: Traditional tribal beliefs have preserved several virgin forests in pristine form called Sacred Groves (the forests of God and Goddesses). The Mundas and the Santhal of Chota Nagpur region worship mahua and kadamba trees, and the tribals of Odisha and Bihar worship the tamarind and mango trees during weddings.

[JARGON: Joint Forest Management (JFM) | A formal partnership between local village communities and the state forest department to protect and restore degraded forests in exchange for sharing forest benefits | The 1988 resolution passed by the state of Odisha, which established local community institutions to safeguard nearby forest areas.]

## ⚠️ Common Mistakes
* **Mistake**: Confusing the launch years of the Indian Wildlife (Protection) Act and Project Tiger.
  * **Correction**: Remember that the Indian Wildlife (Protection) Act was enacted in **1972**, while Project Tiger was launched in **1973**.
* **Mistake**: Thinking that Joint Forest Management (JFM) is entirely run by the government without local community representation or benefit-sharing.
  * **Correction**: JFM requires the active participation of village institutions. In return, members receive non-timber forest produce and a share in the timber harvested by successful protection.

## 💡 Memory Tricks
* **M-P Tiger & Forest**: **M**adhya **P**radeshi **M**ega **P**ercent. Madhya Pradesh holds the largest share of permanent forests (75%).
* **Tiger Reserve Acronym**: **C**an **S**omeone **B**ring **S**weet **M**ango **P**ie? -> **C**orbett, **S**undarbans, **B**andhavgarh, **S**ariska, **M**anas, **P**eriyar.

## 📝 Quick Practice
1. **Explain the three categories of forests in India.**
   * *Solution*: 
     1. **Reserved Forests**: Constitute more than half of the forest area, regarded as the most valuable for conservation.
     2. **Protected Forests**: Constitute about one-third of the forest area, protected from any further depletion.
     3. **Unclassed Forests**: Wastelands and other forests belonging to both government and private individuals/communities.
2. **What is the significance of the year 1988 in forest conservation in India?**
   * *Solution*: The year 1988 marked the formal beginning of the **Joint Forest Management (JFM)** programme, with Odisha passing the first resolution to involve local communities in managing and restoring degraded forests.

## 🎓 Board Tips
* Use clear bullet points and tables when describing the classification of forests (Reserved, Protected, and Unclassed). Highlighting the percentage (e.g., 75% permanent forests in MP) scores high.
* Quote specific examples of community conservation: Chipko Movement, Beej Bachao Andolan, and the Alwar district''s Bhairodev Dakav ''Sonchuri'' to make your answer stand out.

## 🔄 One-Minute Revision
* **Biodiversity Importance**: Humans depend on a complex web of ecosystems where plants and animals recreate air, water, and soil.
* **Wildlife Act (1972)**: Established to protect habitats, ban hunting, and restrict trade.
* **Project Tiger (1973)**: Launched to conserve tigers, leading to reserves like Corbett, Sunderbans, and Periyar.
* **Forest Types**: Reserved (>50%), Protected (1/3), and Unclassed. MP has the largest area of permanent forests (75%).
* **Community Initiatives**: Chipko Movement, Beej Bachao Andolan, Bhairodev Dakav ''Sonchuri'' in Rajasthan, and JFM (Odisha, 1988).

## 🎬 Comic Recap
+-----------------------------------------------------------------------------+
| Priya: Did you know that the Mundas and Santhals worship Mahua and Kadamba  |
|        trees during weddings? Nature worship is so deeply rooted in India!  |
+-----------------------------------------------------------------------------+
| Rahul: That''s amazing! And in Rajasthan, the Bishnois protect blackbucks    |
|        and peacocks. Nobody can harm them. It''s community-led conservation! |
+-----------------------------------------------------------------------------+
| Priya: Yes, and we also have Joint Forest Management (JFM) since 1988 to    |
|        restore degraded forests together with the government. Mutual benefits! |
+-----------------------------------------------------------------------------+
| Rahul: Exactly, trees give shade even to the axeman who destroys them. Let''s|
|        do our part to save them!                                            |
+-----------------------------------------------------------------------------+
',
    FALSE,
    1
)
ON CONFLICT (id) DO NOTHING;

-- Insert Quiz
INSERT INTO quizzes (id, chapter_id, title, passing_percentage)
VALUES (
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389120',
    'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389120',
    'Chapter 12: Forest and Wildlife Resources Quiz',
    60
)
ON CONFLICT (id) DO NOTHING;

-- Insert Quiz Questions
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks)
VALUES 
(
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389121',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389120',
    'In which year was the Indian Wildlife (Protection) Act implemented in India?',
    'multiple_choice',
    '["A. 1968", "B. 1972", "C. 1975", "D. 1980"]'::jsonb,
    1,
    NULL,
    1
),
(
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389122',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389120',
    'Which of the following Indian states has the largest area under permanent forests, constituting 75 percent of its total forest area?',
    'multiple_choice',
    '["A. Jammu and Kashmir", "B. Odisha", "C. Madhya Pradesh", "D. Uttarakhand"]'::jsonb,
    2,
    NULL,
    1
),
(
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389123',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389120',
    'Which of the following conservation strategies does NOT directly involve community participation?',
    'multiple_choice',
    '["A. Joint Forest Management", "B. Beej Bachao Andolan", "C. Chipko Movement", "D. Demarcation of Wildlife Sanctuaries"]'::jsonb,
    3,
    NULL,
    1
),
(
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389124',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389120',
    'The inhabitants of five villages in the Alwar district of Rajasthan have declared 1,200 hectares of forest as which of the following protected zones?',
    'multiple_choice',
    '["A. Bhairodev Dakav ''Sonchuri''", "B. Sariska Tiger Reserve", "C. Corbett National Park", "D. Silent Valley Reserve"]'::jsonb,
    0,
    NULL,
    1
),
(
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389125',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389120',
    'In which year was the first formal resolution for Joint Forest Management (JFM) passed, and by which state?',
    'multiple_choice',
    '["A. 1988, Odisha", "B. 1990, Rajasthan", "C. 1985, Madhya Pradesh", "D. 1992, West Bengal"]'::jsonb,
    0,
    NULL,
    1
)
ON CONFLICT (id) DO NOTHING;
-- SQL Seed File for Chapter 13: Water Resources
-- Subject ID: a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33
-- Chapter ID: c0eebc99-9c0b-4ef8-bb6d-6bb9bd389130

INSERT INTO chapters (id, subject_id, title, sequence_number, description) VALUES
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd389130', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Chapter 13: Water Resources', 13, 'Examine water scarcity, explore the benefits and conflicts surrounding multi-purpose river valley projects, and study traditional and modern rainwater harvesting systems.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd389130', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389130', 'Revision Notes: Water Resources', 'note', NULL, NULL,
'# Chapter 13: Water Resources

## 1. 🎯 Chapter Goal
Understand the distribution and dynamics of water resources, analyze the causes and consequences of water scarcity in India, evaluate the impact of multi-purpose river valley projects, and explore traditional and modern rainwater harvesting techniques as critical tools for water conservation.

## 2. 🪝 Hook
Did you know that three-fourths of the Earth''s surface is covered with water, yet countries and regions across the globe suffer from severe water shortages? By 2025, nearly two billion people are predicted to live in absolute water scarcity. How can a resource that is continuously renewed by the hydrological cycle run out? Let''s explore the paradox of water abundance and scarcity, and discover how ancient wisdom and modern technology are saving our drop of life!

## 3. 📖 Concept 1: Water Scarcity and the Need for Water Conservation and Management
Water is a renewable resource continually renewed and recharged through the hydrological cycle. Yet, many regions face severe scarcity.
- **Quantitative Scarcity**: Caused by a large and growing population, which increases demand and leads to unequal access. Intensive dry-season agriculture is the largest consumer of water. To increase food-grain production, farmers over-exploit water resources by expanding tube-wells in their farms, which rapidly lowers groundwater tables, adversely affecting water availability and food security.
- **Qualitative Scarcity**: Even if water is abundant in an area, it may be heavily polluted by domestic and industrial wastes, chemicals, pesticides, and fertilizers used in agriculture, rendering it hazardous for human consumption.
- **Industrialization & Urbanization**: Post-independent India witnessed rapid industrialization. Large industrial units and MNCs exert pressure on existing freshwater resources. Industries use water as a coolant and consume vast amounts of hydroelectric power. Multiplying urban centers with dense populations and modern lifestyles increase daily water and energy demand, leading housing societies to pump groundwater aggressively, depleting fragile water resources.
- **Key Government Initiatives**:
  - **Jal Jeevan Mission (JJM)**: Focuses on improving rural quality of life. The goal is to provide every rural household with an assured supply of potable piped water at a service level of **55 litres per capita per day** regularly on a long-term basis.
  - **Atal Bhujal Yojana (Atal Jal)**: Aims to bring community-led behavioral changes in 8220 water-stressed Gram Panchayats in seven states (Gujarat, Haryana, Karnataka, Madhya Pradesh, Maharashtra, Rajasthan, Uttar Pradesh), shifting focus from water consumption to conservation and smart water management.
- [JARGON: Hydrological Cycle | The continuous movement of water on, above, and below the surface of the Earth, ensuring water is a renewable resource | Evaporation of water from oceans forming clouds that result in rain, replenishing rivers and groundwater, is part of the hydrological cycle.]
- [JARGON: Water Scarcity | The lack of sufficient available water resources to meet the demands of water usage within a region | Cities like Kolkata and Delhi experiencing shortages despite heavy seasonal rainfall face water scarcity due to over-exploitation and pollution.]

## 4. 📖 Concept 2: Multi-Purpose River Projects and Integrated Water Resources Management
Hydraulic engineering in India has ancient roots:
- **Ancient Hydraulic Structures**:
  - **1st Century B.C.**: Sringaverapura near Allahabad had a sophisticated water-harvesting system channelling the floodwaters of the Ganga.
  - **Chandragupta Maurya**: Built extensive networks of dams, lakes, and irrigation canals.
  - **Historical Reservoirs**: Sophisticated irrigation works were built in Kalinga (Odisha), Nagarjunakonda (Andhra Pradesh), Bennur (Karnataka), and Kolhapur (Maharashtra). In the 11th century, Bhopal Lake, one of the largest artificial lakes of its time, was built. In the 13th-14th century, Allaudin Khalji constructed the Hauz Khas tank in Delhi to supply water to the Siri Fort area.
- **Modern Multi-Purpose Projects**:
  - Integrate multiple uses: irrigation, hydel power production, flood control, water supply (domestic and industrial), recreation, inland navigation, and fish breeding.
  - **Bhakra-Nangal Project**: Located in the Sutluj-Beas basin, used for both irrigation and hydel power.
  - **Hirakud Project**: Located in the Mahanadi basin, integrates water conservation with flood control.
  - Jawaharlal Nehru proudly proclaimed dams as the **''temples of modern India''** as they would integrate rural agricultural development with rapid industrialization and urban growth.
- **Opposition and Drawbacks**:
  - **Ecological Impact**: Damming affects natural flow, leading to poor sediment flow and excessive sedimentation at reservoir bottoms. This creates rockier stream beds and degrades aquatic habitats. Dams also fragment rivers, blocking the migration of aquatic fauna for spawning.
  - **Social Impact**: Reservoirs submerge existing vegetation and soil, causing them to decompose. They lead to large-scale displacement of local communities, who rarely receive benefits or proper compensation.
  - **Failures & Disasters**: Ironical triggering of floods due to sedimentation in reservoirs (e.g., dams failing to control floods during heavy rain). Depriving floodplains of fertile silt causes land degradation. Multipurpose projects have also induced earthquakes, spread water-borne diseases, and caused pollution.
  - **Ecological Shifts**: Irrigation has prompted farmers to shift to water-intensive and commercial crops, causing **salinisation of soil**.
  - **Inter-State Disputes**: Conflicts over water sharing. The **Krishna-Godavari dispute** is due to objections by Karnataka and Andhra Pradesh governments over Maharashtra diverting more water at Koyna for a multipurpose project, reducing downstream flows.
  - **Sardar Sarovar Dam**: Built over the Narmada River in Gujarat, benefiting four states (Maharashtra, Madhya Pradesh, Gujarat, and Rajasthan) by providing water to drought-prone and desert tracts.
  - **Pradhan Mantri Krishi Sinchayee Yojana (PMKSY)**: Focuses on expanding cultivable area under assured irrigation (*har khet ko pani*) and improving water-use efficiency (*per drop more crop*).
- [JARGON: Multi-purpose River Project | A large-scale project involving the construction of a dam on a river to serve multiple integrated purposes simultaneously, such as irrigation, electricity generation, flood control, and navigation | The Bhakra-Nangal Project on the Sutluj-Beas basin, which provides water for irrigation and produces hydroelectricity, is a multi-purpose river project.]
- [JARGON: Salinisation | The process of increasing salt content in soil, often caused by over-irrigation in arid regions | Extensive irrigation in Punjab and Haryana has led to salinisation, making agricultural lands less fertile over time.]

## 5. 📖 Concept 3: Rainwater Harvesting (Traditional and Modern Systems)
As opposition to large dams grew, rainwater harvesting emerged as a viable, eco-friendly, and cost-effective alternative.
- **Traditional Methods**:
  - **Guls / Kuls**: Diversion channels built in the Western Himalayas for agricultural irrigation.
  - **Inundation Channels**: Developed in the floodplains of Bengal to irrigate agricultural fields.
  - **Khadins and Johads**: Rain-fed storage structures built in agricultural fields in Rajasthan (like Jaisalmer) that allow water to stand and moisten the soil.
  - **Tankas**: Underground storage tanks (often as large as rooms) built in Bikaner, Phalodi, and Barmer.
    - Connected to sloping roofs via pipes to collect rainwater.
    - Rainwater is locally called **palar pani**, considered the purest form of natural water.
    - Underground rooms are built adjoining the tankas to beat the summer heat.
    - Note: Tanka usage is declining in western Rajasthan due to the perennial **Indira Gandhi Canal**, though some families maintain them for the superior taste of palar pani.
- **Modern Adaptations**:
  - **Gendathur (Karnataka)**: A remote village in Mysuru where 200 households installed rooftop rainwater harvesting systems. Every household collects about 50,000 litres of water annually, harvesting a net total of 1,00,000 litres (as written in the textbook, due to a printing typo in the original source, though mathematically it equals 10,000,000 litres).
  - **Shillong (Meghalaya)**: Shillong faces acute water shortages despite being 55 km from Cherrapunji and Mawsynram (highest rainfall in the world). Rooftop rainwater harvesting is practiced by almost all households, meeting 15-25% of their water requirements.
  - **Tamil Nadu**: The first state in India to make rooftop rainwater harvesting compulsory for all houses, with legal penalties for defaulters.
  - **Bamboo Drip Irrigation**: A 200-year-old system in Meghalaya where bamboo pipes tap spring and stream water. The system transports water over hundreds of meters, reducing flow to 20-80 drops per minute at the plant site.
- [JARGON: Tanka | A traditional underground rainwater storage system built inside the main house or courtyard in the arid and semi-arid regions of Rajasthan | Homes in Bikaner and Phalodi collect rooftop rainwater through pipes into large tankas to ensure drinking water supply during the hot summer months.]
- [JARGON: Bamboo Drip Irrigation | A 200-year-old traditional system prevalent in Meghalaya of tapping stream and spring water using bamboo pipes to deliver water directly to the plant roots | Mountain streams in Meghalaya are diverted via gravity through a network of bamboo channels, reducing the water flow to 20-80 drops per minute at the plant site.]

## 6. ⚠️ Common Mistakes
- **Scarcity Misconception**: Believing that water scarcity is only found in dry or desert areas. In reality, it can occur in high-rainfall zones (like Shillong or water-polluted cities) due to bad quality, excessive usage, and high population.
- **Incorrect Basin Matching**: Confusing projects and rivers. Remember: Bhakra-Nangal is on the Sutluj-Beas, Hirakud is on the Mahanadi, and Sardar Sarovar is on the Narmada.
- **Dams vs. Reservoirs**: Confusing the physical barrier with the reservoir. Technically, the word ''dam'' refers to the reservoir created by the barrier rather than the concrete structure itself.

## 7. 💡 Memory Tricks
- **M-H-F**: **M**ahanadi -> **H**irakud -> **F**lood control.
- **S-B-B**: **S**utluj-Beas -> **B**hakra-Nangal.
- **Palar Pani = Purest**: Think **P**alar **P**ani -> **P**urest **P**recipitated water in Rajasthan.
- **Guls & Kuls**: Think of the Western Himalayas where you go to get **cool** (kul) in the mountains.

## 8. 📝 Quick Practice
- **Question 1**: Why did Jawaharlal Nehru refer to modern dams as the "temples of modern India"?
  - *Answer*: Because they would integrate the development of the agricultural and village economy with rapid industrialization and the growth of the urban economy.
- **Question 2**: What is unique about Shillong''s water situation relative to its geography?
  - *Answer*: Although it is located just 55 km from Mawsynram and Cherrapunji (which receive the highest rainfall in the world), Shillong faces acute water shortage and relies heavily on rooftop rainwater harvesting.

## 9. 🎓 Board Tips
- **Jal Jeevan Mission**: Memorize the key stat of **55 litres per capita per day** for rural households.
- **Drawbacks of Dams**: Structure your answer into three distinct headings: Ecological impacts (poor sediment flow, fragmented rivers), Social impacts (displacement, lack of benefits), and Failures (causing floods, salinisation).
- **Rainwater Harvesting Terms**: Be clear on regional terms like ''guls/kuls'' (Himalayas), ''khadins/johads'' (Rajasthan), ''tankas'' (Rajasthan), and ''palar pani'' (rainwater).

## 10. 🔄 One-Minute Revision
- **Water Scarcity**: Due to rising population, over-exploitation (especially tube-wells in agriculture), industrialization, and domestic pollution.
- **Multi-Purpose Projects**: Serve multiple goals (power, irrigation, flood control) but face opposition due to ecological degradation, resettlement issues, and triggering floods/earthquakes.
- **Rainwater Harvesting**: A sustainable alternative. Traditional methods include kuls, khadins, and tankas (which store palar pani). Modern implementations are seen in Gendathur, Shillong, and Tamil Nadu (compulsory).
- **Meghalaya''s Bamboo Irrigation**: Prevalent for 200 years to transport spring water via gravity, reducing flow to drops at plant roots.

## 11. 🎬 Comic Recap
```
┌────────────────────────────────────────────────────────┐
│ PANEL 1: The Paradox of Scarcity                       │
│ Priya: "Rahul, if water is renewable and covers 3/4th  │
│         of the Earth, why do we have water scarcity?"  │
│ Rahul: "Because of over-exploitation, unequal access,  │
│         and rising pollution in our rivers and cities!"│
├────────────────────────────────────────────────────────┤
│ PANEL 2: Dams - The Two Sides                          │
│ Priya: "Why did Nehru call dams ''temples of modern    │
│         India'', yet people protest against them?"       │
│ Rahul: "They provide power and irrigation, but they    │
│         fragment rivers, trap sediment, and displace  │
│         millions of local families!"                    │
├────────────────────────────────────────────────────────┤
│ PANEL 3: Palar Pani of Rajasthan                       │
│ Priya: "How did people in arid Rajasthan survive long  │
│         dry summers without pipelines?"                │
│ Rahul: "They built underground ''tankas'' to collect    │
│         rooftop rainwater, storing ''palar pani'' - the │
│         purest form of natural water!"                 │
├────────────────────────────────────────────────────────┤
│ PANEL 4: Modern Adaptations                            │
│ Priya: "Are these old harvesting methods still useful  │
│         in modern India?"                              │
│ Rahul: "Absolutely! Tamil Nadu made it mandatory, and  │
│         Gendathur village meets its needs with it!"    │
└────────────────────────────────────────────────────────┘
```', FALSE, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quizzes (id, chapter_id, title, passing_percentage) VALUES
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd389130', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389130', 'Chapter 13 Quiz: Water Resources', 60)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389131', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389130', 'What is the target water supply service level per capita per day for rural households under the Jal Jeevan Mission (JJM)?', 'multiple_choice', '["A. 45 litres", "B. 55 litres", "C. 65 litres", "D. 75 litres"]'::jsonb, 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389132', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389130', 'Which multi-purpose project built in the Mahanadi basin integrates water conservation with flood control?', 'multiple_choice', '["A. Bhakra-Nangal Project", "B. Hirakud Project", "C. Damodar Valley Project", "D. Sardar Sarovar Project"]'::jsonb, 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389133', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389130', 'Which of the following is an ecological disadvantage of constructing large dams and multi-purpose river valley projects?', 'multiple_choice', '["A. They prevent the migration of aquatic fauna for spawning due to river fragmentation", "B. They cause a decrease in agricultural soil salinisation in all downstream areas", "C. They provide permanent habitats and breeding grounds for endangered river species", "D. They clean the river water by trapping all harmful agricultural pollutants"]'::jsonb, 0, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389134', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389130', 'In which state has rooftop rainwater harvesting been made legally compulsory for all houses across the state?', 'multiple_choice', '["A. Rajasthan", "B. Meghalaya", "C. Karnataka", "D. Tamil Nadu"]'::jsonb, 3, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389135', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389130', 'What is the traditional name given to the rainwater collected and stored in underground tankas in Rajasthan, considered the purest form of natural water?', 'multiple_choice', '["A. Johad pani", "B. Khadin water", "C. Palar pani", "D. Gendathur pani"]'::jsonb, 2, NULL, 1)
ON CONFLICT (id) DO NOTHING;
-- SQL Seed Data for Chapter 14: Agriculture

-- 1. Insert Chapter
INSERT INTO chapters (id, subject_id, title, sequence_number, description) VALUES
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd389140', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Chapter 14: Agriculture', 14, 'Learn about types of farming, cropping patterns, major food and non-food crops, and crucial technological and institutional reforms in Indian agriculture.')
ON CONFLICT (id) DO NOTHING;

-- 2. Insert Revision Notes Lesson
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd389140', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389140', 'Revision Notes: Agriculture', 'note', NULL, NULL,
'# Chapter 14: Agriculture

## 1. 🎯 Chapter Goal
Understand the types of farming practiced in India, the three cropping seasons, the geographical and economic characteristics of major food and non-food crops, and the significance of technical, institutional, and land reform initiatives.

## 2. 🪝 Hook
Did you know that two-thirds of India''s population relies directly or indirectly on agriculture for their livelihood? Every time you enjoy a cup of tea, eat a bowl of rice, or wear cotton clothes, you are connecting with a complex network of farmers, seasonal monsoons, and soil cycles. Let''s dig in and explore how India feeds itself and the world!

## 3. 📖 Concept 1: Types of Farming
Agriculture in India ranges from ancient subsistence methods to highly industrialized commercial operations.
- **[JARGON: Primitive Subsistence Farming | A self-sufficiency farming system where farmers focus on growing enough food to feed themselves and their families on small plots of land using basic traditional tools | Shifting cultivation like Jhumming is a classic example of primitive subsistence farming.]** This is practiced on small patches of land with tools like hoe, dao, and digging sticks. It relies heavily on natural rainfall (monsoon), soil fertility, and environmental suitability.
- **Slash and Burn (Shifting) Cultivation**: Farmers clear land, grow crops, and shift to a new patch when fertility decreases, letting nature replenish the soil.
  - Known as **Jhumming** in North-East India (Assam, Meghalaya, Mizoram, Nagaland).
  - Known as **Milpa** in Mexico/Central America, **Roca** in Brazil, **Ladang** in Indonesia, **Ray** in Vietnam.
  - In India, it is also called **Bewar/Dahiya** (Madhya Pradesh), **Podu/Penda** (Andhra Pradesh), **Pama Dabi/Koman** (Odisha), **Kumari** (Western Ghats), **Kuruwa** (Jharkhand).
- **Intensive Subsistence Farming**: Practiced in areas with high population pressure. It is labour-intensive and uses high doses of biochemical inputs and irrigation to maximize yield from tiny, fragmented land holdings.
- **[JARGON: Commercial Farming | Farming in which crops are grown and livestock are raised for sale in the market, characterized by high inputs of modern technology, chemical fertilizers, and high-yielding seeds | Growing rice as a cash crop in Punjab and Haryana is an example of commercial farming.]** The level of commercialization varies: rice is commercial in Punjab/Haryana but subsistence in Odisha.
- **[JARGON: Plantation Agriculture | A type of commercial farming where a single crop is grown on a large scale over a vast tract of land using capital-intensive inputs and migrant labour | Tea plantations in Assam and coffee plantations in Karnataka are prominent examples.]** Plantations act as an interface between agriculture and industry, requiring a robust transport and communication network.

## 4. 📖 Concept 2: Cropping Patterns and Major Crops
India''s physical diversities and climatic variations result in three distinct cropping seasons:
- **Rabi**: Sown in winter (October–December) and harvested in summer (April–June). Examples: wheat, barley, peas, gram, mustard. Success is aided by winter precipitation from Western Temperate Cyclones.
- **Kharif**: Sown with the onset of monsoon (June–July) and harvested in autumn (September–October). Examples: paddy (rice), maize, jowar, bajra, pulses (tur, urad, moong), cotton, jute.
- **Zaid**: A short summer season (March–June) between Rabi and Kharif. Examples: watermelon, muskmelon, cucumber, vegetables, and fodder crops. Sugarcane takes almost a year to grow.

### Major Crops of India:
- **Rice**: India''s staple food crop; second largest producer globally after China. It is a kharif crop requiring high temperatures (>25°C), high humidity, and annual rainfall >100 cm.
- **Wheat**: Main food crop in north/north-western India. A rabi crop requiring a cool growing season and bright sunshine at ripening, with 50-75 cm rainfall.
- **Millets**: Coarse grains with high nutritional value. Ragi is rich in calcium and iron. Jowar is rain-fed and grown in moist areas.
- **Maize**: Used as both food and fodder. Grows well in old alluvial soil at 21°C–27°C.
- **[JARGON: Leguminous Crops | Crops belonging to the pea family that have nitrogen-fixing bacteria in their root nodules, helping restore soil fertility naturally | Pulses like gram, peas, and moong are leguminous crops that are rotated to keep soil healthy.]** Pulses are the main protein source for vegetarians. Except arhar, all pulses are leguminous.
- **Sugarcane**: Tropical and subtropical crop, needs 21°C–27°C and 75–100 cm rainfall. India is the second-largest producer after Brazil.
- **Tea & Coffee**: Beverage crops. Tea requires deep, well-drained, humus-rich soil and cheap, skilled labour. Coffee Arabica, originally from Yemen, is grown on Nilgiri hills in Karnataka, Kerala, and Tamil Nadu.
- **Rubber & Fibres**: Rubber requires moist/humid climate, >200 cm rainfall, >25°C. Jute is the "Golden Fibre" grown in flood plains of West Bengal. Cotton grows in black soil of Deccan, requiring 210 frost-free days and bright sunshine.

## 5. 📖 Concept 3: Technological and Institutional Reforms
To support a growing population and modernise farming, the government implemented major technical and policy reforms:
- **Institutional Reforms**: Post-Independence priority was given to land consolidation (consolidation of holdings), cooperation, collectivisation, and the abolition of the Zamindari system.
- **Green & White Revolutions**: The Green Revolution (using package technology like HYV seeds and fertilizers) and the White Revolution (Operation Flood) were introduced in the 1960s and 1970s.
- **Land Development Programme (1980s & 1990s)**: Comprehensive program providing crop insurance against natural disasters, establishing Grameen Banks, and cooperative societies for low-interest loans.
- **Financial Schemes**: Kisan Credit Card (KCC) and Personal Accident Insurance Scheme (PAIS) were introduced to protect farmers.
- **Support Policies**: The government broadcasts weather bulletins and announces the Minimum Support Price (MSP) to shield farmers from exploitation by middlemen.
- **[JARGON: Bhoodan-Gramdan | A voluntary land reform movement where landowners donated land (Bhoodan) or entire villages (Gramdan) to landless peasants, initiated by Vinoba Bhave | The Pochampally land donation by Shri Ram Chandra Reddy in 1951 marked the beginning of this Bhoodan movement.]** Also known as the **Blood-less Revolution**, it was started by Vinoba Bhave in Pochampally, Telangana, after poor landless villagers requested land.

## 6. ⚠️ Common Mistakes
- **Confusing Rabi and Kharif Seasons**: Remember, Rabi is winter (October-December sowing; e.g., wheat, mustard) and Kharif is monsoon (June-July sowing; e.g., rice, cotton).
- **Misunderstanding Leguminous Crops**: Students often think all pulses are leguminous. Remember: **Arhar (tur)** is an exception and does NOT fix nitrogen.
- **Frost-free days requirement**: Cotton requires **210 frost-free days**, not just frost-free weather. Don''t write 200 or 150 days.
- **Commercial crop relativity**: Do not write that crops are universally commercial or subsistence. A crop can be commercial in one state (rice in Punjab) and subsistence in another (rice in Odisha).

## 7. 💡 Memory Tricks
- **W-R-C (Wheat-Rabi-Cool)**: Wheat is a **Rabi** crop that likes a **Cool** growing season.
- **R-K-H (Rice-Kharif-Hot/Humid)**: Rice is a **Kharif** crop that loves **Hot** temperatures and high **Humidity**.
- **Vinoba''s Blood-less Victory**: **Vinoba Bhave** led the **Bhoodan-Gramdan** movement without shedding a drop of blood (Blood-less Revolution).
- **Jhumming is Shifting**: "Jhumming" sounds like jumping. The farmers "jump" (shift) from one patch of land to another.

## 8. 📝 Quick Practice
- **Question 1**: Name the three cropping seasons of India and give two examples of crops grown in each.
  - *Answer*:
    1. **Rabi**: Sown winter (Oct-Dec), harvested summer (Apr-Jun). Examples: Wheat, Gram.
    2. **Kharif**: Sown monsoon (Jun-Jul), harvested autumn (Sep-Oct). Examples: Rice, Cotton.
    3. **Zaid**: Short summer season (Mar-Jun). Examples: Watermelon, Cucumber.
- **Question 2**: What is plantation agriculture? Give two examples of plantation crops grown in India.
  - *Answer*: Plantation agriculture is a form of commercial farming where a single crop is grown on a large area using capital-intensive inputs and migrant labour. Examples include tea in Assam and coffee in Karnataka.

## 9. 🎓 Board Tips
- **Geographical Conditions of Rice/Wheat**: This is a very common 5-mark question. Clearly list Temperature, Rainfall, Soil Type, and major producing states in bullet points.
- **Reforms List**: In long-answer questions about agricultural reforms, divide your answer into two distinct sections: **Technical Reforms** (drip irrigation, HYV seeds, weather forecasting) and **Institutional Reforms** (abolition of Zamindari, consolidation of holdings, KCC, MSP).
- **Map Identification**: Practice marking the major wheat and rice producing areas on the political map of India.

## 10. 🔄 One-Minute Revision
- Agriculture is primary; two-thirds of India''s population is engaged.
- Farming types: Primitive Subsistence (shifting/Jhumming), Intensive Subsistence (high pressure, labour-intensive), and Commercial (high inputs, Plantation).
- Seasons: Rabi (winter), Kharif (monsoon), Zaid (summer).
- Staple Crops: Rice (kharif, second globally) and Wheat (rabi).
- Pulses are nitrogen-fixing leguminous crops (except arhar).
- Cotton requires black soil and 210 frost-free days. Jute is the "golden fibre".
- Bhoodan-Gramdan (Vinoba Bhave) is the "Blood-less Revolution".
- Reforms: Land ceiling, KCC, PAIS, and Minimum Support Price (MSP).

## 11. 🎬 Comic Recap
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "Priya: Hey Rahul, why is my cotton │
│         shirt called a product of black    │
│         soil and 210 frost-free days?"     │
│ Rahul: "Rahul: Because cotton grows best in│
│         the dry black soil of Deccan and   │
│         needs a long frost-free period!"   │
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "Priya: Ah! And what about the tea  │
│         we drink? Is it also commercial?"  │
│ Rahul: "Rahul: Yes, it is plantation       │
│         farming! A single crop is grown on │
│         huge estates using lots of labor." │
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "Priya: What is the Blood-less      │
│         Revolution in agriculture?"        │
│ Rahul: "Rahul: That''s Vinoba Bhave''s       │
│         Bhoodan-Gramdan movement where land│
│         was gifted voluntarily to poor!"   │
└────────────────────────────────────────────┘',
FALSE, 1)
ON CONFLICT (id) DO NOTHING;

-- 3. Insert Quiz
INSERT INTO quizzes (id, chapter_id, title, passing_percentage) VALUES
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd389140', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389140', 'Chapter 14 Quiz: Agriculture', 60)
ON CONFLICT (id) DO NOTHING;

-- 4. Insert Quiz Questions
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389141', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389140', 'Which type of agriculture is also known as "slash and burn" cultivation?', 'multiple_choice', '["Shifting Agriculture", "Plantation Agriculture", "Horticulture", "Intensive Agriculture"]'::jsonb, 0, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389142', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389140', 'In which of the following states of India is shifting cultivation known as ''Jhumming''?', 'multiple_choice', '["Madhya Pradesh", "Andhra Pradesh", "Assam and Meghalaya", "Western Ghats"]'::jsonb, 2, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389143', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389140', 'Which of the following is a leguminous crop that helps in restoring soil fertility by fixing nitrogen from the air (except for arhar)?', 'multiple_choice', '["Millets", "Jowar", "Pulses", "Sesamum"]'::jsonb, 2, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389144', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389140', 'The ''Bhoodan-Gramdan'' movement, initiated by Vinoba Bhave, is famously known by which of the following names?', 'multiple_choice', '["Green Revolution", "Operation Flood", "Blood-less Revolution", "Satyagraha Movement"]'::jsonb, 2, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389145', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389140', 'Which of the following geographical conditions is essential for the cultivation of cotton?', 'multiple_choice', '["Cool growing season and bright sunshine at ripening", "High temperature, light rainfall, and 210 frost-free days", "Standing water and temperature above 25°C", "Moist and humid climate with rainfall above 200 cm"]'::jsonb, 1, NULL, 1)
ON CONFLICT (id) DO NOTHING;
-- CBSE Class 10 Learning Portal Seed Data - Chapter 15
-- Subject: Social Science
-- Generated for Chapter 15: Minerals and Energy Resources

-- 1. Insert Chapter
INSERT INTO chapters (id, subject_id, title, sequence_number, description)
VALUES ('c0eebc99-9c0b-4ef8-bb6d-6bb9bd389150', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Chapter 15: Minerals and Energy Resources', 15, 'A comprehensive guide to India''s mineral wealth, their classification, mode of occurrence, environmental impact, and energy resources.')
ON CONFLICT (id) DO NOTHING;

-- 2. Insert Lesson Notes
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number)
VALUES ('b0eebc99-9c0b-4ef8-bb6d-6bb9bd389150', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389150', 'Revision Notes: Minerals and Energy Resources', 'note', NULL, NULL, '# Chapter 15: Minerals and Energy Resources

## 1. 🎯 Chapter Goal
Understand how minerals are classified, where they occur, and how conventional and non-conventional energy resources power our country while learning to conserve them.

## 2. 🪝 Hook
Imagine a day without your toothbrush, a mobile phone, a car, or even salt in your food. What do they have in common? They all come from minerals! Let''s dive in and explore the hidden treasures of the earth.

## 3. 📖 Concept 1: Occurrence and Classification of Minerals
Minerals are naturally occurring, homogenous substances with a definite internal structure. They are usually found in **[JARGON: Ore | An accumulation of any mineral mixed with other elements | Hematite is an iron ore from which metallic iron is extracted]** where their extraction must be commercially viable.

Minerals occur in different geological formations:
1. **Veins and Lodes**: In igneous and metamorphic rocks, minerals are forced upward through cracks, crevices, faults, or joints, cooling and solidifying as they rise.
   - **Veins**: Smaller occurrences.
   - **Lodes**: Larger occurrences.
   - *Examples*: Tin, copper, zinc, lead.
2. **Beds or Layers**: In sedimentary rocks, minerals accumulate in horizontal strata due to deposition, concentration, and compression under heat and pressure.
   - *Examples*: Coal, gypsum, potash, and sodium salt.
3. **Decomposition of Surface Rocks**: Weathering of rocks removes soluble components, leaving a residual mass of weathered material containing ores.
   - *Example*: Bauxite.
4. **[JARGON: Placer Deposits | Alluvial deposits of minerals found in sands of valley floors and bases of hills that are not corroded by water | Gold and platinum are commonly found as placer deposits]**: Minerals found as alluvial deposits in sands of valley floors and bases of hills, which are not corroded by water.
   - *Examples*: Gold, silver, tin, platinum.
5. **Ocean Waters and Beds**: Widely diffused minerals in ocean waters or ocean beds.
   - *Examples*: Common salt, magnesium, bromine (water) and manganese nodules (bed).

## 4. 📖 Concept 2: Metallic, Non-Metallic, and Rock Minerals
Minerals are broadly classified into metallic (ferrous and non-ferrous), non-metallic, and rock minerals.

1. **Metallic Minerals**:
   - **[JARGON: Ferrous Minerals | Metallic minerals that contain iron, providing a strong base for metallurgical industries | Magnetite and hematite are primary ferrous minerals]**:
     - *Iron Ore*: The backbone of industrial development. **Magnetite** is the finest ore (70% iron content) with excellent magnetic qualities. **Hematite** is the most popular industrial ore (50-60% iron content). Major belts: Odisha-Jharkhand, Durg-Bastar-Chandrapur, Ballari-Chitradurga-Chikkamagaluru-Tumakuru, and Maharashtra-Goa.
     - *Manganese*: Used in steel and ferro-manganese alloys (10 kg for 1 tonne of steel), bleaching powder, and paints.
   - **[JARGON: Non-Ferrous Minerals | Metallic minerals that do not contain iron, playing a vital role in metallurgical, engineering, and electrical industries | Copper and bauxite are important non-ferrous minerals]**:
     - *Copper*: Malleable, ductile, and a good conductor. Found in Balaghat (MP), Khetri (Rajasthan), and Singhbhum (Jharkhand).
     - *Bauxite*: Clay-like substance from which alumina and aluminium are obtained. Found in Amarkantak plateau, Maikal hills, and Koraput (Odisha is leading producer).
2. **Non-Metallic Minerals**:
   - **[JARGON: Mica | A non-metallic mineral made of series of plates or leaves that splits easily into thin sheets | Clear or black sheets of mica used in electrical industries due to di-electric strength]**: Excellent di-electric strength, low power loss, and high voltage resistance. Leading producer: Koderma-Gaya-Hazaribagh belt in Jharkhand.
3. **Rock Minerals**:
   - *Limestone*: Associated with calcium/magnesium carbonates. Basic raw material for the cement industry and smelting iron ore.

## 5. 📖 Concept 3: Energy Resources: Conventional and Non-Conventional
Energy is a basic requirement for economic development and is classified into conventional and non-conventional sources.

1. **Conventional Sources (Non-renewable)**:
   - **Coal**: Most abundant fossil fuel in India. Formed by compression of plant material.
     - *Peat*: Low carbon, high moisture, low heating capacity.
     - *Lignite*: Low grade brown coal (Neyveli, Tamil Nadu).
     - *Bituminous*: Subjected to high temperature, most popular in commerce.
     - *Anthracite*: Highest quality hard coal.
     - Found in Gondwana (200+ million years old - Jharia, Raniganj, Bokaro) and Tertiary rock series (55 million years old - North East).
   - **Petroleum**: Nodal industry for synthetic textiles, fertilizers. Found in tertiary anticlines and fault traps. Major fields: Mumbai High, Ankeleshwar (Gujarat), Digboi (Assam).
   - **Natural Gas**: Eco-friendly fuel, distributed via GAIL''s pipelines like the 1,700 km HVJ pipeline.
2. **Non-Conventional Sources (Renewable)**:
   - **Solar Energy**: Photovoltaic cells convert sunlight directly into electricity.
   - **Wind Power**: Nagarcoil (TN) to Madurai, and Jaisalmer (Rajasthan) are key clusters.
   - **Biogas**: Organic decomposition in Gobar Gas plants provides energy and manure.
   - **Tidal Energy**: Electricity from ocean tides (Gulf of Khambhat, Kuchchh, Sunderbans).
   - **Geothermal Energy**: Harnessing Earth''s internal heat (Manikaran in HP, Puga Valley in Ladakh).
   - **Nuclear Energy**: Altering atomic structure of Uranium/Thorium (Jharkhand, Aravallis, Monazite sands in Kerala).

## 6. ⚠️ Common Mistakes
- **Confusing Veins and Lodes**: Remember that veins are smaller cracks and lodes are larger faults/joints.
- **Confusing Magnetite and Hematite**: Magnetite is the finest ore (up to 70% iron) with magnetic qualities, while hematite is the most common industrial ore (50-60% iron).
- **Mixing Coal Ages**: Gondwana coal is over 200 million years old (Damodar valley), whereas Tertiary coal is only 55 million years old (North Eastern states).

## 7. 💡 Memory Tricks
- **M-M-M for Magnetite**: Magnetite = Magnetic properties = Maximum iron content (70%).
- **Lignite is Light/Low**: Lignite is low-grade brown coal (light brown).
- **V-L Size order**: Alphabetical order is V and L. Vein is small (like a vein in your hand), Lode is large (heavy load).

## 8. 📝 Quick Practice
- **Question 1**: Name the mineral that is the basic raw material for the cement industry.
  - *Answer*: Limestone.
- **Question 2**: Which place in India is famous for geothermal energy projects?
  - *Answer*: Manikaran (Himachal Pradesh) or Puga Valley (Ladakh).

## 9. 🎓 Board Tips
- Make sure to practice locating major iron ore belts (Odisha-Jharkhand, Durg-Bastar-Chandrapur, Kudremukh, Marmagao) on the outline map of India. Map questions from this chapter are very common.
- Be prepared to distinguish between conventional and non-conventional energy sources with at least three comparison points.
- Hazards of mining (also called the "killer industry") is a frequent 3-mark theory question. Mention pulmonary diseases, fire hazards, and environmental contamination.

## 10. 🔄 One-Minute Revision
- Minerals are homogenous, naturally occurring substances.
- Iron ore is the backbone of industrial development (Magnetite and Hematite).
- Non-ferrous minerals like copper and bauxite are essential for engineering and electrical sectors.
- Mica is crucial for electronics due to its insulating and di-electric properties.
- Coal forms from compressed vegetation and exists in four stages: Peat, Lignite, Bituminous, and Anthracite.
- Transitioning to non-conventional energy (solar, wind, biogas) is vital for sustainable development.

## 11. 🎬 Comic Recap
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "Rahul, why is mining called a      │
│         ''killer industry''?"                │
│ Rahul: "Because of dust causing lung       │
│         diseases, risk of roof collapse,   │
│         and massive river pollution!"      │
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "Oh! And how are coal and iron ore  │
│         different?"                        │
│ Rahul: "Iron ore is a metallic mineral,    │
│         while coal is an organic fossil    │
│         fuel used for energy."             │
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "So we must conserve them both!"    │
│ Rahul: "Yes! Recycle metals and switch to  │
│         renewable energy like solar!"      │
└────────────────────────────────────────────┘', FALSE, 1)
ON CONFLICT (id) DO NOTHING;

-- 3. Insert Quiz
INSERT INTO quizzes (id, chapter_id, title, passing_percentage)
VALUES ('d0eebc99-9c0b-4ef8-bb6d-6bb9bd389150', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389150', 'Social Science Chapter 15 Quiz', 60)
ON CONFLICT (id) DO NOTHING;

-- 4. Insert Quiz Questions
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389151', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389150', 'Which one of the following minerals is formed by the decomposition of rocks, leaving a residual mass of weathered material?', 'multiple_choice', '["A. Coal", "B. Bauxite", "C. Gold", "D. Zinc"]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389152', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389150', 'Which of the following is the finest quality iron ore with excellent magnetic properties, valuable in the electrical industry?', 'multiple_choice', '["A. Hematite", "B. Magnetite", "C. Limonite", "D. Siderite"]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389153', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389150', 'Koderma in Jharkhand is the leading producer of which one of the following minerals?', 'multiple_choice', '["A. Bauxite", "B. Mica", "C. Iron Ore", "D. Copper"]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389154', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389150', 'Which geological age deposits of coal in India are about 55 million years old and occur in the north-eastern states?', 'multiple_choice', '["A. Gondwana", "B. Tertiary", "C. Jurassic", "D. Carboniferous"]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389155', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389150', 'Which mineral is abundantly contained in the Monazite sands of Kerala?', 'multiple_choice', '["A. Uranium", "B. Thorium", "C. Coal", "D. Petroleum"]', 1, NULL, 1)
ON CONFLICT (id) DO NOTHING;
-- Insert Chapter 16
INSERT INTO chapters (id, subject_id, title, sequence_number, description)
VALUES (
    'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389160',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33',
    'Chapter 16: Manufacturing Industries',
    16,
    'This chapter explores the significance of manufacturing industries in the secondary sector, their classification, location factors, contribution to the national economy, and the measures to control industrial pollution and environmental degradation.'
) ON CONFLICT (id) DO NOTHING;

-- Insert Lesson for Chapter 16
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number)
VALUES (
    'b0eebc99-9c0b-4ef8-bb6d-6bb9bd389160',
    'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389160',
    'Revision Notes: Manufacturing Industries',
    'note',
    NULL,
    NULL,
    '# Revision Notes: Manufacturing Industries

### 🎯 Goal
Understand the vital role of manufacturing in economic development, the classification of industries based on different criteria, factors influencing industrial location, characteristics of major agro-based and mineral-based industries in India, the environmental impact of industrial pollution, and measures to achieve sustainable industrial growth.

---

### 🪝 Hook
Have you ever stopped to wonder how a simple sugarcane stalk from a field transforms into the sweet sugar crystals in your tea, or how raw, reddish rock bauxite becomes the sturdy yet lightweight body of an airplane? This transformation is the magic of **manufacturing**! It is the secondary sector''s engine that drives a country''s economic strength and shapes the modern world we live in.

---

### 📘 Key Concepts

#### Concept 1: Importance and Classification of Industries
Manufacturing is considered the backbone of any economy because it modernizes agriculture, reduces dependence on farm income by creating jobs, boosts exports, and brings in foreign exchange. 
[JARGON: Manufacturing | The process of converting primary raw materials into finished, more valuable products in large quantities. | Paper is manufactured from wood, and sugar from sugarcane.]

To study industries systematically, they are classified based on:
1. **Source of Raw Materials**: 
   - *Agro-based*: Cotton, woollen, jute, silk, sugar, tea, coffee, edible oil.
   - *Mineral-based*: Iron and steel, cement, aluminium, machine tools, petrochemicals.
2. **Main Role**:
   - *Basic/Key Industries*: Supply products as raw materials to other industries.
     [JARGON: Basic Industries | Industries that supply their products as raw materials to other industries to manufacture finished goods. | Iron and steel industry supplies metal for manufacturing machinery and vehicles.]
   - *Consumer Industries*: Produce goods for direct use by consumers (e.g., sugar, paper, fans).
3. **Capital Investment**:
   - *Small Scale Industry*: Maximum investment allowed on assets is currently ₹1 Crore.
4. **Ownership**:
   - *Public*: Owned/operated by government agencies (e.g., BHEL, SAIL).
   - *Private*: Owned/operated by individuals/groups (e.g., TISCO, Bajaj Auto, Dabur).
   - *Joint*: Run jointly by the state and individuals/groups (e.g., Oil India Ltd.).
   - *Cooperative*: Owned/operated by producers or suppliers of raw materials, workers, or both (e.g., sugar industry in Maharashtra, coir industry in Kerala).
5. **Bulk and Weight of Raw Materials and Finished Goods**:
   - *Heavy*: Iron and steel.
   - *Light*: Electrical goods industries.

[JARGON: Agglomeration Economies | The benefits and cost savings that industries gain by clustering together in urban centres to share services and infrastructure. | Many industries established near Mumbai and Kolkata to utilise banking, transport, and insurance facilities.]

#### Concept 2: Major Industries in India
* **Cotton Textiles**: Historically handloom-based, transitioned to powerlooms. Concentrated in Gujarat and Maharashtra due to availability of raw cotton, moist climate, and port facilities. While spinning is centralized, weaving is highly decentralized to preserve traditional skills.
* **Jute Textiles**: India is the largest producer of raw jute. Located along the Hugli River in West Bengal due to proximity to jute areas, cheap water transport, abundant water, and cheap labor.
* **Sugar Industry**: Bulky raw material with sucrose content that reduces in transit. Suited for the cooperative sector as it is seasonal. Currently shifting to Southern/Western states (like Maharashtra) due to higher sucrose content and cooler climate which extends the crushing season.
  [JARGON: Sucrose Content | The natural sugar concentration found in sugarcane, which decreases during prolonged transit and haulage. | Southern and western states in India produce cane with higher sucrose content due to cooler climates.]
* **Iron and Steel Industry**: A heavy basic industry. Raw materials (iron ore, coking coal, limestone) are used in a **4:2:1** ratio along with manganese. Mostly concentrated in the Chhotanagpur plateau due to low-cost iron ore and proximity of raw materials.
* **Aluminium Smelting**: Second most important metallurgical industry. Light, corrosion-resistant, malleable, and a good conductor. Used in aircraft, wires, and utensils.
* **Chemical & Fertilizer Industry**: Fast growing. Inorganic (sulphuric acid, alkalies) and organic (petrochemicals). The fertilizer industry is centered around nitrogenous (urea) and phosphatic (DAP) fertilizers. Potash is completely imported.
* **Cement & Automobile Industry**: Cement is essential for construction; needs limestone, silica, gypsum. Automobiles have grown post-liberalization.
* **IT and Electronics**: Bengaluru is the **electronic capital** of India. Key generator of employment and foreign exchange.

#### Concept 3: Industrial Pollution & Environmental Control
Industries cause four types of pollution:
1. **Air Pollution**: High proportion of SO2 and CO, and particulate matter.
2. **Water Pollution**: Organic and inorganic wastes (dyes, heavy metals like lead/mercury) discharged into rivers.
3. **Thermal Pollution**: Draining hot water from factories/thermal plants into water bodies before cooling.
4. **Noise Pollution**: High decibel noise from generators, drills, and saws causing stress and hearing loss.

[JARGON: Electrostatic Precipitator | A filtration device that removes fine particulate matter like dust and smoke from industrial exhaust gases using an electric charge. | Power plants fit electrostatic precipitators to smoke stacks to reduce air pollution.]

**Effluent Treatment Stages:**
* *Primary*: Mechanical means (screening, grinding, flocculation, sedimentation).
* *Secondary*: Biological processes.
* *Tertiary*: Physical, chemical, and biological processes, including recycling of wastewater.

---

### ⚠️ Common Mistakes
* **Confusing Basic and Consumer Industries**: Remember, basic industries supply raw materials to other factories (e.g., steel for cars), whereas consumer industries produce final goods directly used by people (e.g., paper, toothpaste).
* **Forgetting the Steel Raw Material Ratio**: Do not mix up the numbers. The ratio of Iron Ore : Coking Coal : Limestone is strictly **4 : 2 : 1**.
* **Potash Production in India**: Students often think India produces all fertilizer raw materials. Remember, India has **zero** reserves of commercial potash and imports 100% of it.

---

### 🧠 Memory Tricks
* **Steel Raw Materials Ratio**: **4-2-1** -> Remember it as "**I** **C**an **L**earn" (**I**ron Ore = 4, **C**oking Coal = 2, **L**imestone = 1).
* **Jute Industry Location (Hugli Basin)**: **C-L-A-W-P**
  * **C**heap labor
  * **L**ocation near jute fields
  * **A**bundant water for processing
  * **W**ater transport (inexpensive)
  * **P**ort of Kolkata for export

---

### ✍️ Quick Practice
1. **Q**: Why is the cooperative sector highly suited for the sugar industry?
   * **A**: The sugar industry is seasonal in nature, meaning raw material crushing only happens during specific months. Cooperatives allow farmers to pool their resources, share the seasonal profits/losses, and operate the mills collectively.
2. **Q**: What are basic or key industries? Give one example.
   * **A**: Basic industries are those that supply their products as raw materials to manufacture other goods. For example, the Iron and Steel industry is basic because its steel is used to make machines, construction materials, and automobiles.

---

### 💡 Board Tips
* When answering questions about the location of specific industries (like Jute or Iron & Steel), always structure your answer into distinct categories: Raw Materials, Power, Transport, Labor, and Markets.
* Use diagrams or flow charts (like the 4:2:1 ratio for steel or the 3 phases of water treatment) to get extra marks in long-answer questions.

---

### ⏱️ One-Minute Revision
* **Manufacturing** belongs to the secondary sector and is the backbone of economic strength.
* **Classification** is based on raw materials, role, capital, ownership, and weight.
* **Sugar mills** are shifting to Southern/Western states because of cooler climate and higher sucrose content in sugarcane.
* **Iron and Steel** is a basic heavy industry concentrated in the Chhotanagpur plateau.
* **Effluent treatment** has three phases: Primary (mechanical), Secondary (biological), and Tertiary (chemical/physical recycling).

---

### 💬 Comic Recap
+-----------------------------------------------------------------------------+
|                                 Comic Recap                                 |
+-----------------------------------------------------------------------------+
| Rahul: Hey Priya! Why is Bengaluru called the electronic capital of India?  |
|                                                                             |
| Priya: That''s because it is the main hub for the IT and electronics         |
|        industry! It produces everything from transistors to computers.       |
|                                                                             |
| Rahul: Ah, so it''s a mineral-based light industry. But what about all the   |
|        pollution from these massive factories?                              |
|                                                                             |
| Priya: Good point! We must integrate economic growth with environmental     |
|        care—like treating effluents and using electrostatic precipitators!  |
+-----------------------------------------------------------------------------+
',
    FALSE,
    1
) ON CONFLICT (id) DO NOTHING;

-- Insert Quiz for Chapter 16
INSERT INTO quizzes (id, chapter_id, title, passing_percentage)
VALUES (
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389160',
    'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389160',
    'Chapter 16 Quiz: Manufacturing Industries',
    60
) ON CONFLICT (id) DO NOTHING;

-- Insert Quiz Questions for Chapter 16
-- MCQ 1
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks)
VALUES (
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389161',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389160',
    'Which one of the following industries uses bauxite as a raw material?',
    'multiple_choice',
    '["A. Cement", "B. Aluminium Smelting", "C. Paper", "D. Iron and Steel"]'::jsonb,
    1,
    NULL,
    1
) ON CONFLICT (id) DO NOTHING;

-- MCQ 2
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks)
VALUES (
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389162',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389160',
    'What is the approximate ratio of iron ore, coking coal, and limestone required to manufacture steel?',
    'multiple_choice',
    '["A. 2 : 1 : 4", "B. 4 : 2 : 1", "C. 1 : 2 : 4", "D. 4 : 1 : 2"]'::jsonb,
    1,
    NULL,
    1
) ON CONFLICT (id) DO NOTHING;

-- MCQ 3
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks)
VALUES (
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389163',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389160',
    'Which of the following cities has emerged as the ''electronic capital'' of India?',
    'multiple_choice',
    '["A. Bengaluru", "B. Mumbai", "C. Noida", "D. Chennai"]'::jsonb,
    0,
    NULL,
    1
) ON CONFLICT (id) DO NOTHING;

-- MCQ 4
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks)
VALUES (
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389164',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389160',
    'Why has the sugar industry recently shown a tendency to shift and concentrate in the southern and western states of India, especially Maharashtra?',
    'multiple_choice',
    '["A. Higher sucrose content in cane and cooler climate", "B. Government subsidies and cheap labor", "C. Easy access to ports and proximity to coalfields", "D. Availability of abundant water from the Hugli river"]'::jsonb,
    0,
    NULL,
    1
) ON CONFLICT (id) DO NOTHING;

-- MCQ 5
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks)
VALUES (
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389165',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389160',
    'Which chemical compound is completely imported by India due to a lack of commercial reserves?',
    'multiple_choice',
    '["A. Nitrogen", "B. Phosphate", "C. Potash", "D. Complex Fertilizers"]'::jsonb,
    2,
    NULL,
    1
) ON CONFLICT (id) DO NOTHING;
-- SQL Seed Data for Chapter 17: Lifelines of National Economy
-- Subject ID: 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33' (Social Science)
-- Sequence Number: '17'
-- Generated with ON CONFLICT (id) DO NOTHING for safe re-runs.

-- 1. Insert Chapter
INSERT INTO chapters (id, subject_id, title, sequence_number, description) VALUES
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd389170', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Chapter 17: Lifelines of National Economy', 17, 'This chapter explores how various modes of transport and communication networks connect people, facilitate trade, and drive the growth of the Indian economy.')
ON CONFLICT (id) DO NOTHING;

-- 2. Insert Lesson (Revision Notes)
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd389170', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389170', 'Revision Notes: Lifelines of National Economy', 'note', NULL, NULL,
'# Chapter 17: Lifelines of National Economy

## 1. 🎯 Chapter Goal
Understand how land, water, and air transport systems, coupled with modern communication networks, function as the essential lifelines of the Indian national economy, fostering national integration and local, national, and international trade.

## 2. 🪝 Hook
Think about the last time you bought a fresh apple or ordered a gadget online. How did these items reach you from hundreds of kilometers away in a matter of days? They traveled through a massive, highly integrated system of roads, railways, waterways, pipelines, and airways, guided by digital telecommunications. These infrastructure networks are the quiet, pulsating arteries that keep our nation''s economy alive and growing!

## 3. 📖 Concept 1: Land Transport (Roadways and Railways)
Land transportation in India is dominated by two primary networks: roadways and railways.

### A. Roadways
India has the second largest road network in the world, aggregating to about 62.16 lakh km (2020–21). Roadways preceded railways and continue to hold an edge over them due to:
* **Lower construction costs** compared to railway lines.
* **Topographical adaptability**: Roads can traverse dissected and undulating terrain.
* **Steeper gradients**: Roads can negotiate higher slopes and cross mountainous regions like the Himalayas.
* **Economical viability**: Highly cost-effective for transporting a few people and small quantities of goods over short distances.
* **Door-to-door service**: Lowers loading and unloading expenses.
* **Feeder system**: Roads act as links connecting railway stations, air ports, and sea ports.

#### Classification of Roads in India:
* **Golden Quadrilateral Super Highways**: A major project linking Delhi-Kolkata-Chennai-Mumbai-Delhi by six-lane Super Highways. It includes the North-South corridor (Srinagar to Kanniyakumari) and the East-West corridor (Silchar to Porbandar). Its main objective is to reduce distance and travel time between mega-cities. It is implemented by the **National Highway Authority of India (NHAI)**.
* **National Highways**: Primary road systems linking extreme parts of the country, constructed and maintained by the Central Public Works Department (CPWD).
* **State Highways**: Roads linking state capitals with district headquarters, constructed and maintained by the State Public Works Department (PWD).
* **District Roads**: Connect district headquarters with other places in the district, managed by the Zila Parishad.
* **Other Roads (Rural Roads)**: Link rural areas and villages with towns. They received a massive boost under the **Pradhan Mantri Grameen Sadak Yojana (PMGSY)** to ensure all-weather motorable roads.
* **Border Roads**: Constructed and maintained by the **Border Roads Organisation (BRO)** (established in 1960) in the northern and north-eastern border areas to improve strategic accessibility. This includes the **Atal Tunnel** (9.02 km), the world''s longest highway tunnel, built in the Pir Panjal range of the Himalayas at 3,000 meters above Mean Sea Level.

Roads are also classified based on construction material:
* **[JARGON: Metalled Roads | All-weather roads constructed using cement, concrete, or bitumen of coal | An expressway made of concrete that remains usable during monsoon rains]**
* **Unmetalled Roads**: Roads made of clay or sand that go out of use during the rainy season.

### B. Railways
Railways are the principal mode of transportation for freight and passengers in India. They bind the economic life of the country, accelerate industrial and agricultural development, and have served as a great integrating force for over 150 years.
* **Distribution Factors**: The distribution pattern of Indian railways is heavily influenced by:
  * *Physiographic factors*: Northern plains (level land, high population density, rich agriculture) are highly favorable. Peninsular regions (laid through low hills, gaps, tunnels) are moderately challenging. Mountainous regions (Himalayas) are unfavorable due to high relief, sparse population, and lack of economic opportunities.
  * *Economic factors*: Areas with high agricultural or industrial output draw dense railway lines.
  * *Administrative factors*: Government planning and defense priorities dictate line laying.
* **Konkan Railway**: Built along the west coast, it has facilitated transport in this highly economic region, though it faces geological issues like track sinking and landslides.
* **Gauges**: Indian railways operate on Broad Gauge (1.676 m), Metre Gauge (1.000 m), and Narrow Gauge (0.762 m and 0.610 m).

## 4. 📖 Concept 2: Pipelines and Waterways
Pipelines and waterways provide highly specialized and cost-effective transportation.

### A. Pipelines
Pipelines are a relatively new addition to India''s transport map. They are used to transport water, crude oil, petroleum products, natural gas, and even solids (converted into slurry).
* **Advantages**: Minimal running costs, rules out trans-shipment losses or delays, and allows refineries to be situated far inland (e.g., Mathura, Barauni, Panipat).
* **Major Pipeline Networks**:
  1. From oil fields in upper Assam to Kanpur (UP) via Guwahati, Barauni, and Prayagraj.
  2. From Salaya (Gujarat) to Jalandhar (Punjab) via Viramgam, Mathura, Delhi, and Sonipat.
  3. The **Hazira-Vijaipur-Jagdishpur (HVJ)** gas pipeline (linked Mumbai High and Bassein gas fields with industrial complexes in western and northern India, now expanded to 18,500 km of cross-country lines).

### B. Waterways
Waterways are the cheapest means of transport, ideal for carrying heavy and bulky goods. They are fuel-efficient and environment-friendly. India has 14,500 km of inland navigation. The National Waterways Act, 2016 declared 111 National Waterways (NWs).
* **National Waterway No. 1**: Ganga River between Prayagraj and Haldia (1,620 km).
* **National Waterway No. 2**: Brahmaputra River between Sadiya and Dhubri (891 km).
* **National Waterway No. 3**: West-Coast Canal in Kerala (Kottapuram-Kollam, Udyogamandal, Champakkara canals - 205 km).
* **National Waterway No. 4**: Specified stretches of Godavari and Krishna rivers with Kakinada-Puducherry canals (1,078 km).
* **National Waterway No. 5**: Stretches of Brahmani river, Mahanadi/Brahmani delta, East Coast Canal (588 km).

### C. Major Sea Ports
With a coastline of 11,098.81 km, India has 12 major and 200 non-major ports handling 95% of foreign trade by volume.
* **Deendayal Port (Kandla)**: A tidal port in Gujarat developed to ease pressure on Mumbai port after Partition (when Karachi port went to Pakistan).
* **Mumbai Port**: Biggest port with a spacious natural harbor.
* **Jawaharlal Nehru Port**: Planned as a hub port to decongest Mumbai.
* **Mormugao Port (Goa)**: Premier iron ore exporting port (handles ~50% of exports).
* **New Mangalore Port (Karnataka)**: Exports Kudremukh iron ore concentrates.
* **Cochin Port**: Extreme south-western port located at the entrance of a lagoon.
* **V.O. Chidambaranar Port (Tuticorin, Tamil Nadu)**: Natural harbor serving neighboring countries like Sri Lanka and Maldives.
* **Chennai Port**: One of the oldest artificial ports, ranked second in cargo volume.
* **Vishakhapatnam Port**: Deepest landlocked and well-protected port.
* **Paradwip Port (Odisha)**: Specializes in iron ore exports.
* **Shyama Prasad Mookerjee Port (Kolkata)**: Inland riverine tidal port requiring constant dredging of the Hooghly river.
* **Haldia Port**: Developed as a subsidiary port to relieve pressure on Kolkata.

## 5. 📖 Concept 3: Airways, Communication, and International Trade
This concept covers fast transport, communication networks, and the exchange of goods.

### A. Airways
Air travel is the fastest, most comfortable, and prestigious mode of transport, capable of traversing mountains, deserts, forests, and oceans.
* **Strategic Role**: Crucial in the north-eastern states due to dissected relief, big rivers, dense forests, and frequent floods.
* **Pawanhans Helicopters Ltd**: Provides helicopter services to ONGC offshore operations and remote, inaccessible terrains.
* **UDAN Scheme**: Regional connectivity scheme designed to make flying affordable for the common citizen.

### B. Communication
* **Personal & Mass Communication**: Mass communication includes TV, radio, press, films, and the internet.
* **Postal Network**: Indian postal network is the largest in the world. First-class mail (cards, envelopes) is airlifted, while second-class mail (packets, newspapers) goes by surface. Six mail channels introduced for quick delivery: *Rajdhani, Metro, Green, Business, Bulk Mail, and Periodical*.
* **Telecom**: One of the largest networks in Asia, with 24-hour STD facilities in villages.
* **Digital India**: Umbrella programme to transform India into a knowledge-based society (IT + IT = IT: Indian Talent + Information Technology = India Tomorrow).

### C. International Trade
* **[JARGON: Trade | The exchange of goods, services, or commodities between people, states, or countries | Buying spices from Kerala or importing crude oil from the Middle East]**
* **Barometer of Prosperity**: Advancement of international trade is the economic barometer of a country.
* **[JARGON: Balance of Trade | The difference between the value of a nation''s exports and imports | If India exports goods worth $10 billion and imports goods worth $8 billion, it has a trade surplus of $2 billion]**
* **Favourable Balance of Trade**: Exports > Imports.
* **Unfavourable Balance of Trade**: Imports > Exports.
* **Tourism as a Trade**: Promotes integration, supports local handicrafts, and earns valuable foreign exchange. Supported by schemes like *Swadesh Darshan 2.0, Vibrant Village Programme, and PRASHAD*.

## 6. ⚠️ Common Mistakes
* **Confusing Trade Balances**: Remember, a *favourable* balance means you sell more than you buy (Exports > Imports). *Unfavourable* means you spend more on imports than you earn from exports.
* **Pipeline Limitations**: Don''t assume pipelines only carry liquids. Solids can also travel in pipelines if they are crushed and mixed with liquid to form a *slurry*.
* **Port Attributes**: Students often confuse the oldest artificial port (Chennai) with the deepest landlocked port (Vishakhapatnam) or the riverine port (Kolkata).

## 7. 💡 Memory Tricks
* **GQ Vertices clockwise**: **D**elhi ➡️ **K**olkata ➡️ **C**hennai ➡️ **M**umbai (**D**on''t **K**ill **C**ute **M**onkeys).
* **NW-1 & NW-2 Rivers**: NW-**1** is **G**anga (First holy river). NW-**2** is **B**rahmaputra (Second major river system).
* **Kandla/Deendayal Port**: Think **D**eendayal is the **D**econgestion port built post-Partition to replace Karachi.

## 8. 📝 Quick Practice
* **Question 1**: Why is Kolkata port classified as an inland riverine port and what operational challenge does it face?
  * *Answer*: Kolkata port is situated along the banks of the Hooghly River, inland from the sea. Because it is a tidal port, its main challenge is siltation, requiring constant dredging to remain navigable.
* **Question 2**: Which organisation builds and maintains roads of strategic importance in the border areas of India, and when was it established?
  * *Answer*: The Border Roads Organisation (BRO), established in 1960.

## 9. 🎓 Board Tips
* **Five Merits of Roadways**: If asked why roadways have an edge over railways, list exactly five distinct points (cost, topography, gradients, short distances, feeder link) for full marks.
* **Schemes to Mention**: Underline schemes like *UDAN, PMGSY, and PRASHAD* to grab the examiner''s attention.
* **Flowcharts**: Use a simple block diagram when explaining Favourable vs. Unfavourable Balance of Trade.

## 10. 🔄 One-Minute Revision
* Land, water, and air transport, alongside communication, are the economic lifelines of a country.
* Roadways are easier and cheaper to build than railways and provide door-to-door connectivity.
* Pipelines are efficient for transporting liquids, gases, and slurries without transit delays.
* Waterways are the cheapest and most eco-friendly means of transport for heavy goods.
* Favourable balance of trade occurs when the value of exports exceeds imports.

## 11. 🎬 Comic Recap
```
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "Priya: Rahul, why are transport and│
│         communication called the lifelines │
│         of our national economy?"          │
│ Rahul: "Rahul: Because they act like veins,│
│         connecting producers and consumers,│
│         and accelerating trade and growth!"│
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "Priya: True! And roadways can reach│
│         where railways can''t, like the steep│
│         slopes of the Himalayas!"          │
│ Rahul: "Rahul: Exactly! Plus, pipelines now│
│         move oil and gas directly, avoiding│
│         any transit delays."               │
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "Priya: What about international    │
│         trade? Is tourism really a trade?" │
│ Rahul: "Rahul: Absolutely! It earns foreign│
│         exchange, supports local artisans, │
│         and builds global connections."    │
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ Roadways have preceding advantages.        │
│ Favourable trade: Exports > Imports.       │
│ NHAI manages Super Highways.               │
└────────────────────────────────────────────┘
```', FALSE, 3)
ON CONFLICT (id) DO NOTHING;

-- 3. Insert Quiz
INSERT INTO quizzes (id, chapter_id, title, passing_percentage) VALUES
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd389170', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389170', 'Quiz: Lifelines of National Economy', 60)
ON CONFLICT (id) DO NOTHING;

-- 4. Insert Quiz Questions
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389171', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389170', 'Which of the following authorities is responsible for implementing the Golden Quadrilateral Super Highways project in India?', 'multiple_choice', '["A. Central Public Works Department (CPWD)", "B. State Public Works Department (SPWD)", "C. National Highway Authority of India (NHAI)", "D. Border Roads Organisation (BRO)"]'::jsonb, 2, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389172', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389170', 'Which of the following ports is a tidal port developed soon after Independence to ease the volume of trade on the Mumbai port?', 'multiple_choice', '["A. Mormugao Port", "B. Deendayal Port (Kandla)", "C. New Mangalore Port", "D. V.O. Chidambaranar Port (Tuticorin)"]'::jsonb, 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389173', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389170', 'Which mode of transportation is highly preferred in the north-eastern states of India to overcome difficult terrains, dense forests, and frequent floods?', 'multiple_choice', '["A. Railways", "B. Waterways", "C. Pipelines", "D. Airways"]'::jsonb, 3, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389174', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389170', 'Which of the following represents an unfavourable balance of trade for a country?', 'multiple_choice', '["A. When the value of exports exceeds the value of imports.", "B. When the value of imports exceeds the value of exports.", "C. When the volume of inland trade is greater than international trade.", "D. When the value of exports is exactly equal to the value of imports."]'::jsonb, 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389175', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389170', 'Which cross-country gas pipeline originally linked Mumbai High and Bassein gas fields with fertilizer, power, and industrial complexes in western and northern India?', 'multiple_choice', '["A. Salaya-Jalandhar Pipeline", "B. Assam-Kanpur Pipeline", "C. Hazira-Vijaipur-Jagdishpur (HVJ) Pipeline", "D. Banihal-Baramula Pipeline"]'::jsonb, 2, NULL, 1)
ON CONFLICT (id) DO NOTHING;
-- Insert Chapter
INSERT INTO chapters (id, subject_id, title, sequence_number, description)
VALUES (
    'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389190',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33',
    'Chapter 19: Sectors of the Indian Economy',
    19,
    'Learn how economic activities are classified into primary, secondary, and tertiary sectors, organized versus unorganized work, and public versus private ownership.'
)
ON CONFLICT (id) DO NOTHING;

-- Insert Lesson (Revision Notes)
INSERT INTO lessons (id, chapter_id, title, type, note_content, is_free, sequence_number)
VALUES (
    'b0eebc99-9c0b-4ef8-bb6d-6bb9bd389190',
    'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389190',
    'Revision Notes: Sectors of the Indian Economy',
    'note',
    '# Revision Notes: Sectors of the Indian Economy

## 1. 🎯 Chapter Goal
Understand how different economic activities are grouped into sectors based on their nature, working conditions, and ownership. You will also learn about employment patterns and the role of the government in the Indian economy.

## 2. 🪝 Hook
Imagine waking up and drinking milk. The milk comes from a dairy farm. It was carried in a truck to a factory. The factory packaged it. Finally, a shop owner sold it to you. All these people do different kinds of work, but their jobs are connected. Let''s see how they work together!

## 3. 📖 Concept 1: Primary, Secondary, and Tertiary Sectors
People earn their living through different activities. We group these activities into three sectors based on their nature:
- **Primary Sector**: When we produce a good by directly using natural resources, it belongs to this sector. It forms the base for other products.
  - *Example*: Farming, dairy, fishing, and mining. Since it is mostly agriculture, it is also called the **agriculture and related sector**.
- **Secondary Sector**: This sector covers activities where natural products are changed into manufactured goods.
  - *Example*: Spinning cotton yarn to weave cloth, or turning sugarcane into sugar in a factory. It is also called the **industrial sector**.
- **Tertiary Sector**: These activities do not produce goods by themselves. Instead, they aid and support the production process.
  - *Example*: Transporting goods by trucks, storing items in godowns, banking, and communications. It is also called the **service sector**.

[JARGON: Gross Domestic Product (GDP) | The total value of all final goods and services produced within a country during a particular year. | The government estimates GDP to understand the total size of the Indian economy.]

[JARGON: Intermediate Goods | Goods that are used up entirely in producing final goods and services. | Wheat flour is an intermediate good used by a bakery to make biscuits.]

## 4. 📖 Concept 2: Organised vs Unorganised Sectors
We can also group activities based on how people are employed and their working conditions:
- **Organised Sector**: This sector covers jobs where terms of employment are regular. Workers have assured work. The government registers these enterprises, and they follow rules like the Factories Act and Minimum Wages Act.
  - *Benefits*: Fixed working hours, paid leave, medical benefits, and safe working conditions.
- **Unorganised Sector**: This sector consists of small and scattered units. They are outside government control. Rules exist on paper but are not followed.
  - *Problems*: Low and irregular wages, no paid holidays, and no job security. Workers can be fired without any reason.

[JARGON: Underemployment | A state where people are working but are made to work less than their full potential. | A plumber who only finds work for a few days a week is facing underemployment.]

[JARGON: Disguised Unemployment | A situation where more people are working in an activity than needed, so their marginal productivity is zero. | Five family members working on a small farm that only needs three people is disguised unemployment.]

## 5. 📖 Concept 3: Public vs Private Sectors
We can group economic activities based on who owns the assets and provides the services:
- **Public Sector**: The government owns most of the assets. The government provides all the services. The main goal is public welfare, not profit.
  - *Example*: Indian Railways and Post Offices.
- **Private Sector**: Private individuals or companies own the assets and deliver the services. Their main goal is to earn profits.
  - *Example*: TISCO and Reliance Industries Limited.

The government must support certain private activities by providing cheap electricity or buying food grains at a fair price. The government also must spend on essential services like education, healthcare, and safe drinking water.

## 6. ⚠️ Common Mistakes
- **Mistake**: Counting intermediate goods when calculating GDP.
  - *Correct*: Only count final goods. The value of a final good like biscuits already includes the cost of intermediate goods like flour and sugar.
- **Mistake**: Thinking that the service sector in India grows equally for everyone.
  - *Correct*: Highly skilled IT workers are doing well, but small shopkeepers and casual laborers barely manage to survive.
- **Mistake**: Confusing disguised unemployment with open unemployment.
  - *Correct*: Open unemployment means a person has no job at all. Disguised unemployment means they are working but their labor is divided and redundant.

## 7. 💡 Memory Tricks
- **P-S-T**: Primary is **P**rovided by nature. Secondary is **S**haped in factories. Tertiary is **T**ransported and served.
- **O vs U**: **O**rganised has **O**rder and laws. **U**norganised is **U**nprotected and lawless.
- **Pub vs Pri**: **Pub**lic is for the **Pub**lic (everyone, run by government). **Pri**vate is for **Pri**vate profits.

## 8. 📝 Quick Practice
- **Question 1**: Why are only final goods counted in GDP?
  - *Answer*: Final goods already include the value of intermediate goods. Counting intermediate goods separately would lead to double counting.
- **Question 2**: What is the difference between open and disguised unemployment?
  - *Answer*: In open unemployment, a person is clearly jobless and visible. In disguised unemployment, a person is working but less than their potential, and their presence does not increase production.

## 9. 🎓 Board Tips
- **GVA and GDP**: Understand that GVA is Gross Value Added. It is the value of output minus the cost of intermediate inputs, adjusted for taxes and subsidies.
- **MGNREGA 2005 / Viksit Bharat-G RAM G 2025**: Learn the details. It is also called the "Right to Work" because it guarantees 100 days of manual work to rural households.
- **Sectors Interdependence**: Be ready to explain how primary, secondary, and tertiary sectors depend on each other using examples like cotton, cloth, and transport.

## 10. 🔄 One-Minute Revision
- Economic activities are classified into primary (nature-based), secondary (industrial), and tertiary (services).
- GDP is the sum of the value of all final goods and services produced in these three sectors in a year.
- In India, the tertiary sector contributes the most to GDP, but the primary sector employs the most people.
- The organised sector offers secure jobs with benefits, while the unorganised sector lacks security and fair pay.
- The public sector is run by the government for social welfare, whereas the private sector is run by individuals for profit.

## 11. 🎬 Comic Recap
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "Why are so many farmers still in    │
│         agriculture if they earn so little?"│
│ Rahul: "It is disguised unemployment! They │
│         have no other jobs, so they work   │
│         less than their full potential."   │
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "So if two people leave Laxmi''s      │
│         farm, production won''t drop?"      │
│ Rahul: "Exactly! Their marginal output is   │
│         zero. They should move to services!│
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "And what is Kamal''s shop job?"     │
│ Rahul: "Unorganised sector. Long hours, no │
│         benefits. Unlike Kanta''s office!"  │
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ Primary = Nature base.                     │
│ Secondary = Manufacturing.                 │
│ Tertiary = Services and trade.             │
│ GDP counts only final goods!               │
└────────────────────────────────────────────┘',
    FALSE,
    1
)
ON CONFLICT (id) DO NOTHING;

-- Insert Quiz
INSERT INTO quizzes (id, chapter_id, title, passing_percentage)
VALUES (
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389190',
    'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389190',
    'Chapter 19 Quiz: Sectors of the Indian Economy',
    60
)
ON CONFLICT (id) DO NOTHING;

-- Insert Quiz Questions
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks)
VALUES (
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389191',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389190',
    'Which sector of economic activities includes farming, forestry, dairy, and fishing?',
    'multiple_choice',
    '["A. Primary Sector", "B. Secondary Sector", "C. Tertiary Sector", "D. Private Sector"]'::jsonb,
    0,
    NULL,
    1
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks)
VALUES (
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389192',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389190',
    'Why are only ''final goods and services'' counted when calculating the Gross Domestic Product (GDP)?',
    'multiple_choice',
    '["A. Because intermediate goods have no value", "B. To avoid counting the value of the same inputs multiple times", "C. Because final goods are the only ones taxed by the government", "D. To make the GDP calculation look smaller"]'::jsonb,
    1,
    NULL,
    1
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks)
VALUES (
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389193',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389190',
    'What is the situation called when there are more people working on a farm than are actually needed?',
    'multiple_choice',
    '["A. Open Unemployment", "B. Seasonal Unemployment", "C. Disguised Unemployment", "D. Voluntary Unemployment"]'::jsonb,
    2,
    NULL,
    1
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks)
VALUES (
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389194',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389190',
    'Which of the following is a key feature of the organised sector?',
    'multiple_choice',
    '["A. Jobs are low-paid and not regular", "B. Workers enjoy security of employment and get paid leave", "C. The sector is outside the control of the government", "D. Workers can be asked to leave at any time without reason"]'::jsonb,
    1,
    NULL,
    1
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks)
VALUES (
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389195',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389190',
    'Which sector is guided primarily by the motive of public welfare rather than earning profits?',
    'multiple_choice',
    '["A. Private Sector", "B. Public Sector", "C. Secondary Sector", "D. Unorganised Sector"]'::jsonb,
    1,
    NULL,
    1
)
ON CONFLICT (id) DO NOTHING;
-- SQL Seed Data for Chapter 20: Money and Credit

-- 1. INSERT CHAPTER
INSERT INTO chapters (id, subject_id, title, sequence_number, description)
VALUES (
    'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389200',
    'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33',
    'Chapter 20: Money and Credit',
    20,
    'Understand how money acts as a medium of exchange, the role of banks, and how formal and informal credit systems shape economic development.'
)
ON CONFLICT (id) DO NOTHING;

-- 2. INSERT LESSON (Revision Notes)
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number)
VALUES (
    'b0eebc99-9c0b-4ef8-bb6d-6bb9bd389200',
    'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389200',
    'Revision Notes: Money and Credit',
    'note',
    NULL,
    NULL,
    '# Chapter 20: Money and Credit

## 1. 🎯 Chapter Goal
In this chapter, you will learn how money works as a medium of exchange. You will understand how banks use deposits to give loans. Finally, you will study the difference between formal and informal loans.

## 2. 🪝 Hook
Imagine you want to buy a book. But you only have a bag of apples to trade. You must find someone who has the book and wants apples. What if they want bananas instead? You are stuck! Let us see how money solves this problem.

## 3. 📖 Concept 1: Money as a Medium of Exchange & Modern Forms
Before money existed, people directly exchanged goods. This system is called the barter system. In this system, both parties must agree to sell and buy each other''s goods. We call this a **[JARGON: Double Coincidence of Wants | A situation where two parties agree to sell and buy each other''s commodities | A shoe manufacturer finding a farmer who wants to sell wheat and buy shoes.]** (when two people want what the other has). This requirement makes trading very hard.

Money solves this problem. It acts as an intermediate in the exchange process. Therefore, we call money a **medium of exchange**.

### Modern Forms of Money
We do not use grains or cattle as money anymore. Modern money includes:
1. **Paper Notes and Coins**: The Reserve Bank of India (RBI) issues these notes. They do it on behalf of the central government. No other person or group can issue currency. The law makes the rupee legal tender. No one in India can refuse rupees for payments.
2. **Deposits with Banks**: Workers get their salary at the end of the month. They deposit their extra cash in bank accounts. The bank pays interest on these savings. People can withdraw their money whenever they need it. We call these deposits **[JARGON: Demand Deposits | Deposits in bank accounts that can be withdrawn on demand by the account holder | Salim keeping his extra cash in a savings bank account to withdraw it later.]** (deposits you can take out anytime).
3. **Cheques**: A cheque is a paper instructing the bank to pay a specific amount from the payer''s account to the receiver. This allows us to make payments without cash.

## 4. 📖 Concept 2: Banking Operations & Terms of Credit
Banks keep only a small part of their deposits as cash. In India, banks hold about 15 percent of their deposits as cash. They use this cash to pay depositors who want to withdraw money on any day.

Banks use the rest of the deposits to give loans. There is a huge demand for loans. Banks charge a higher interest rate on loans than what they pay on deposits. The difference between these two rates is the main income of the bank.

### Two Different Credit Situations
1. **Salim (Positive Credit)**: Salim is a shoe manufacturer. He gets a large order for shoes. He borrows money to buy raw materials and hire workers. He completes the order on time. He makes a good profit and repays his loan. Credit plays a positive role here.
2. **Swapna (Negative Credit / Debt Trap)**: Swapna is a small farmer. She borrows money to grow groundnuts. Pests destroy her crop. She cannot repay the loan. Next year she takes another loan. The crop is normal, but she does not make enough money. She has to sell her land to pay the debt. She falls into a **debt trap**.

### Terms of Credit
Every loan has rules that the borrower must follow. These are the terms of credit:
1. **Interest Rate**: The borrower must pay a percentage of the loan amount to the lender.
2. **[JARGON: Collateral | An asset that the borrower owns and uses as a guarantee to a lender until the loan is repaid | Megha submitting her house papers to the bank as security for a home loan.]** (security like land, vehicles, or bank deposits).
3. **Documentation**: The bank checks papers like salary slips or employment records.
4. **Mode of Repayment**: This shows how and when the borrower will pay back the money.

## 5. 📖 Concept 3: Formal vs. Informal Credit & SHGs
We can divide loans into two main groups:
1. **Formal Sector Loans**: These are loans from banks and cooperatives. The Reserve Bank of India (RBI) supervises them. The RBI makes sure banks do not just lend to rich traders. They must also lend to poor farmers and small borrowers. These loans have low interest rates.
2. **Informal Sector Loans**: These are loans from moneylenders, traders, employers, relatives, and friends. No organization supervises them. Lenders can charge very high interest rates. They can also use unfair means to get their money back.

### Who Gets Which Loan?
Rich households get about 83 percent of their loans from formal sources. But poor households get 85 percent of their loans from informal sources. Poor people often lack the collateral and papers needed for bank loans. Therefore, they depend on moneylenders. Cheap and affordable credit is very important for a country''s development.

### Self-Help Groups (SHGs)
To solve the lack of collateral, poor people organize themselves. They form **[JARGON: Self-Help Group (SHG) | A small group of 15-20 rural poor, especially women, who pool their savings to provide low-interest loans to members | A group of women in a Gujarat village saving Rs 25-100 monthly to help members buy sewing machines.]** (small saving groups).
- An SHG has 15 to 20 members, usually women from the same neighborhood.
- They save money regularly (about Rs 25 to Rs 100 or more).
- Members take small loans from the group savings at low interest.
- If the group saves regularly for a year or two, banks give them a loan.
- The bank gives this loan to the group, not to one person. The group is responsible for repayment. This solves the collateral problem.
- Prof. Muhammad Yunus founded the Grameen Bank of Bangladesh in the 1970s. It now helps millions of poor women get cheap credit. He won the Nobel Peace Prize in 2006 for this work.

## 6. ⚠️ Common Mistakes
- **Thinking RBI supervises all lenders**: RBI only supervises formal lenders like banks and cooperatives. It does not supervise moneylenders or traders.
- **Confusing credit impact**: Credit is not always good or bad. It helps Salim but hurts Swapna. The outcome depends on risk and support.
- **Thinking a cheque is cash**: A cheque is a paper document. It tells a bank to transfer money. It is not actual paper cash.

## 7. 💡 Memory Tricks
- **Medium of Exchange**: Think of money as a "bridge". It connects the shoe seller to the wheat seller. It avoids the need for double coincidence of wants.
- **Terms of Credit (M-I-C-D)**:
  - **M**ode of repayment
  - **I**nterest rate
  - **C**ollateral
  - **D**ocumentation

## 8. 📝 Quick Practice
1. **Question**: Why does the barter system need a double coincidence of wants?
   - **Answer**: In a barter system, there is no money. People must find someone who wants their goods and has what they need.
2. **Question**: Why are bank deposits called demand deposits?
   - **Answer**: Account holders can withdraw their money from the bank on demand.

## 9. 🎓 Board Tips
- **Cheque Payments**: Memorize how a cheque works. Examiners often ask you to explain this with an example.
- **Formal vs. Informal Sector**: This is a very common five-mark question. Draw a clear comparison table showing supervision, interest rates, and sources.
- **Role of SHGs**: Explain how SHGs help women become self-reliant and solve the collateral problem.

## 10. 🔄 One-Minute Revision
- **Barter vs. Money**: Money acts as a medium of exchange. It removes the need for double coincidence of wants.
- **Modern Money**: Paper currency, coins, and demand deposits. The RBI issues currency on behalf of the central government.
- **Bank Operations**: Banks keep 15% of deposits as cash. They lend the rest. They make money from the interest rate difference.
- **Credit Outcomes**: Credit can increase earnings or push borrowers into a debt trap.
- **SHGs**: 15-20 poor women pool savings. They get loans without individual collateral to start small businesses.

## 11. 🎬 Comic Recap
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "Rahul, I have apples. I want a pen. │
│         Will you trade your pen for apples?"│
│ Rahul: "No, I want bananas! This is why the│
│         barter system is so hard."         │
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "So money makes it easy because we  │
│         all accept it as a medium?"        │
│ Rahul: "Yes! And the government authorizes │
│         rupees. Nobody can refuse them."   │
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "Why do poor people use informal     │
│         loans if the interest is so high?" │
│ Rahul: "They lack collateral and papers.    │
│         SHGs help them pool savings and    │
│         get bank loans together!"          │
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ RBI supervises formal banks.               │
│ Terms of credit include interest,          │
│ collateral, documents, and repayment.      │
│ SHGs empower poor women.                   │
└────────────────────────────────────────────┘',
    FALSE,
    1
)
ON CONFLICT (id) DO NOTHING;

-- 3. INSERT QUIZ
INSERT INTO quizzes (id, chapter_id, title, passing_percentage)
VALUES (
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389200',
    'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389200',
    'Chapter 20 Quiz: Money and Credit',
    60
)
ON CONFLICT (id) DO NOTHING;

-- 4. INSERT QUIZ QUESTIONS
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks)
VALUES
(
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389201',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389200',
    'Which of the following is an essential feature of the barter system?',
    'multiple_choice',
    '["A. Double coincidence of wants", "B. Use of paper currency", "C. Bank demand deposits", "D. Metallic coins"]',
    0,
    NULL,
    1
),
(
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389202',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389200',
    'In India, which organization issues currency notes on behalf of the central government?',
    'multiple_choice',
    '["A. State Bank of India", "B. Ministry of Finance", "C. Reserve Bank of India", "D. Securities and Exchange Board of India"]',
    2,
    NULL,
    1
),
(
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389203',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389200',
    'Why are deposits in bank accounts called demand deposits?',
    'multiple_choice',
    '["A. Because they earn a very high rate of interest", "B. Because they can be withdrawn on demand", "C. Because the government demands people to make them", "D. Because they cannot be transferred by cheque"]',
    1,
    NULL,
    1
),
(
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389204',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389200',
    'An asset that the borrower owns and uses as a guarantee to a lender until the loan is repaid is called:',
    'multiple_choice',
    '["A. Debt trap", "B. Surplus fund", "C. Demand deposit", "D. Collateral"]',
    3,
    NULL,
    1
),
(
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd389205',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389200',
    'Which of the following is a formal source of credit?',
    'multiple_choice',
    '["A. Village moneylenders", "B. Agricultural traders", "C. Cooperative societies and banks", "D. Employers and relatives"]',
    2,
    NULL,
    1
)
ON CONFLICT (id) DO NOTHING;
-- Seeding Chapter 21: Globalisation and the Indian Economy

INSERT INTO chapters (id, subject_id, title, sequence_number, description) VALUES
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd389210', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Chapter 21: Globalisation and the Indian Economy', 21, 'Understand the integration of markets and production by MNCs, the factors enabling globalisation, and its multi-faceted impacts on the Indian economy.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd389210', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389210', 'Revision Notes: Globalisation and the Indian Economy', 'note', NULL, NULL,
'# Chapter 21: Globalisation and the Indian Economy

## 1. 🎯 Chapter Goal
Understand the concept of globalisation and how Multinational Corporations (MNCs) integrate global production and markets. Analyse the factors enabling globalisation, such as technological advancements and liberalisation policies, and evaluate its multi-faceted impacts on consumers, small producers, and workers in the Indian economy.

## 2. 🪝 Hook
Next time you go shopping, look around the electronics and clothing stores. You see the latest global brands of mobile phones, sneakers, and beverages that were unheard of in India just two decades ago! Back then, the only passenger cars on Indian roads were the Ambassador and the Fiat. How did our markets transform so rapidly from a closed system to an explosion of global choice? Let''s discover the forces of globalisation shaping our daily lives and economy!

## 3. 📖 Concept 1: Production Across Countries & Interlinking by MNCs
Until the middle of the twentieth century, production was largely organized within national borders. What crossed these borders were mainly raw materials, food products, and finished goods. Colonies like India exported raw materials and imported finished products, with trade serving as the primary channel connecting distant regions.

This dynamic changed dramatically with the rise of **[JARGON: Multinational Corporation (MNC) | A company that owns or controls production in more than one nation | Cargill Foods is an American MNC that expanded by purchasing Parakh Foods in India.]**. MNCs set up offices and factories for production in countries where they can secure cheap labour, raw materials, and other resources. This keeps their costs of production low and maximises their profits.

### Spreading of Production Globally
Production is organized in increasingly complex, globally dispersed ways. MNCs fragment their production processes into small stages across different nations to exploit specific local advantages:
- **Research & Design**: Often done in developed countries like the US, where advanced research centres exist.
- **Manufacturing**: Components are made in countries like China due to its low-cost manufacturing capabilities.
- **Assembly & Marketing**: Products are assembled in locations close to major consumer markets, such as Mexico and Eastern Europe.
- **Customer Care**: Handled in countries like India, which provides highly skilled, English-speaking youth and engineers at a fraction of the cost in developed nations.
- *Cost Savings*: Spreading production this way can save MNCs 50% to 60% of total production costs.

### How MNCs Interlink Production
MNCs establish control over production in foreign countries through several key routes:
1. **Joint Ventures / Collaborations**: Partnering with local companies. The local companies benefit from:
   - Additional capital for buying new machinery and expanding production.
   - Access to the MNC''s latest manufacturing technology.
   - *Example*: Ford Motors partnered with Mahindra and Mahindra in India in 1995 to set up a massive plant near Chennai.
2. **Acquisition / Buying Local Companies**: This is the most common route. MNCs with huge financial resources buy established local brands to quickly gain market share and distribution networks.
   - *Example*: Cargill Foods (a giant US MNC) bought Parakh Foods, a reputed Indian edible oil brand with four refineries, becoming the largest edible oil producer in India.
3. **Contract Manufacturing / Placing Orders**: MNCs place orders with small, independent producers in developing countries for goods like garments, footwear, and sports equipment. The MNCs then sell these under their own brand names, dictating the price, quality, delivery, and labour conditions.
   - *Example*: Local women in Ludhiana stitching footballs, or garment exporters in Delhi producing shirts for Western brands.

By leveraging these strategies, MNCs exert a powerful influence on distant production nodes, interlinking widely dispersed economies.
- **[JARGON: Foreign Investment | Investment made by a multinational corporation (MNC) to buy assets such as land, buildings, or machinery in another country | Ford Motors investing Rs 1700 crore in 1995 to set up a plant near Chennai is a foreign investment.]** is the capital deployed by MNCs to purchase assets abroad in the hope of earning profits.

## 4. 📖 Concept 2: Factors Enabling Globalisation
Globalisation is the process of rapid integration or interconnection between countries. While trade has connected nations for centuries, the scale of integration today is unprecedented. This process is driven by three main enabling factors:

### 1. Rapid Advancements in Technology
Technology has acted as a primary catalyst for globalisation:
- **Transportation Technology**: The invention of shipping containers has revolutionized trade. Goods are packed in large containers that are transferred intact between ships, railways, trucks, and planes. This has drastically cut port handling costs, minimized cargo theft, and increased speed. Additionally, falling air transport costs have enabled high-value goods to be transported by air in bulk.
- **Information and Communication Technology (ICT)**: Telecommunications, computers, satellite communication, and the internet allow instantaneous sharing of data.
  - *Example*: A news magazine published for London readers can be designed and edited on computers in Delhi, transmitted via the internet, printed locally, and paid for instantly via e-banking.

### 2. Liberalisation of Foreign Trade and Investment Policy
Trade barriers are restrictions governments impose to regulate foreign trade.
- **[JARGON: Trade Barrier | A restriction set by a government on foreign trade, such as import taxes or import quotas, to regulate imports | A tax on imported Chinese toys is a trade barrier that makes imports more expensive.]** include import taxes and import quotas.
- **Post-Independence Barriers in India**: Following independence, the Indian government put strict barriers on foreign trade and investment to protect infant domestic industries (in 1950s-1960s) from foreign competition. Only essential imports (machinery, petroleum, fertilizers) were allowed.
- **The 1991 Policy Shift**: Around 1991, India initiated far-reaching economic reforms. The government decided that local producers were mature enough to compete globally. It believed competition would force domestic companies to improve the quality of their goods.
- **[JARGON: Liberalisation | The removal of barriers or restrictions set by the government on foreign trade and investment | In 1991, India removed trade barriers to allow foreign companies to set up factories and offices easily.]** allowed businesses to make free decisions regarding exports and imports.

### 3. World Trade Organisation (WTO)
The WTO is an international organisation initiated by developed countries to liberalise international trade. Currently, about 160 countries are members.
- **Role**: WTO establishes rules for global trade and monitors compliance to ensure free trade.
- **Criticism**: In practice, WTO negotiations are often unfair. Developed countries (like the US) have retained massive agricultural subsidies (enabling their farmers to dump cheap farm products globally), while forcing developing nations to remove their trade barriers and farm support.

## 5. 📖 Concept 3: Impact of Globalisation and the Struggle for Fair Globalisation
The impact of globalisation on the Indian economy has not been uniform. It has created winners and losers:

### The Winners (Positive Impacts)
- **Urban Consumers**: The wealthy urban middle and upper classes have gained immensely. They enjoy a wider choice of goods, superior quality, and lower prices (e.g., cell phones, electronics, fast food), leading to a higher standard of living.
- **MNCs and Large Indian Companies**: MNC investments in India have risen, creating new jobs. Large Indian companies (like Tata Motors, Infosys, Ranbaxy, Asian Paints) upgraded their technology, improved standards, and even emerged as MNCs themselves.
- **Service Providers (IT Sector)**: Indian companies offering services like software development, data entry, call centres, accounting, and engineering have seen explosive export growth.

### Government Incentives for Investment
To attract foreign capital, Indian state and central governments use two main strategies:
- **[JARGON: Special Economic Zone (SEZ) | An industrial zone with world-class facilities set up by the government to attract foreign companies, offering tax exemptions for an initial period | The Indian government set up SEZs where companies do not have to pay taxes on production units for the first five years.]** are set up with world-class infrastructure (roads, electricity, water, storage). Companies in SEZs enjoy a tax holiday for the first five years.
- **Labour Law Flexibility**: To reduce labour costs, the government allows companies to bypass labour protection laws. Instead of regular contracts, companies hire workers on a "flexible," temporary basis during peak seasons.

### The Losers (Negative Impacts)
- **Small Manufacturers**: Small-scale industries employing millions (second only to agriculture) have been hit hard by cheap imports and MNC competition.
  - *Example (Ravi''s Story)*: Ravi started a capacitor manufacturing unit in Hosur in 1992. When import barriers on capacitors were removed under WTO rules in 2001, television manufacturers began importing cheaper capacitors from abroad (at half the price). Ravi had to lay off workers and reduce production, while many of his peers closed down completely. Similar crises hit toys, tyres, plastics, dairy, and vegetable oil sectors.
- **Workers and Job Insecurity**: Globalisation has degraded labour rights. Exporters cut costs by hiring temporary workers, denying them benefits (provident fund, health insurance, overtime).
  - *Example (Sushila''s Story)*: Sushila, a garment worker in Delhi, lost her permanent job. She now works as a temporary worker 30 km away, working 14-hour days, 7 days a week, earning half her previous wage with zero job security.

### The Struggle for Fair Globalisation
Since globalisation is a reality, the goal is to make it fair. **Fair Globalisation** ensures that benefits are shared equitably and opportunities are created for all.
- **Role of Government**:
  - Properly enforce labour laws to protect workers'' rights.
  - Support small producers with credit and technology until they are strong enough to compete.
  - Use trade barriers and quotas strategically when necessary.
  - Collaborate with other developing nations at the WTO to challenge the dominance of developed countries.
- **Role of People**: Mass public campaigns, trade unions, and civil society groups have successfully protested unfair WTO policies, proving that citizens have a voice in shaping global trade rules.

## 6. ⚠️ Common Mistakes
- **Confusing Foreign Trade and Foreign Investment**: Foreign trade is the movement of goods and services across national borders (sellers reaching global buyers). Foreign investment is capital spent by MNCs to purchase physical assets (land, machinery) to set up production in another country.
- **Assuming Globalisation Benefits Everyone Equally**: Many students write that globalisation is purely positive. You must explain the unequal impact: it benefits urban consumers and MNCs, but causes job insecurity for workers and drives small local businesses to ruin.
- **Thinking India Liberalised Immediately After Independence**: India actually adopted protectionism in 1947 to shield its young industries. Liberalisation was only adopted in 1991 due to an economic crisis.

## 7. 💡 Memory Tricks
- **"T-I-L-E" Mnemonic**: Remember the drivers of globalisation:
  - **T** - Technology (Containers & IT)
  - **I** - International Organisations (WTO)
  - **L** - Liberalisation (1991 reforms)
  - **E** - Expansion of MNCs
- **Ravi vs. Cargill**: Remember Ravi as the small local producer of "dry capacitors" who got burned by imports, while Cargill is the massive "cargo ship" of wealth that swallowed local Parakh Foods.
- **SEZ = Special Zone**: Think of it as a "VIP Lounge" for foreign companies, offering free electricity, tax holidays, and relaxed rules (flexible labour).

## 8. 📝 Quick Practice
- **Question 1**: Explain how MNCs coordinate production across different countries.
  - *Answer*: MNCs coordinate production in three main ways:
    1. By setting up joint ventures with local companies (e.g., Ford collaborating with Mahindra).
    2. By buying local companies and leveraging their existing marketing networks (e.g., Cargill buying Parakh Foods).
    3. By placing orders with small producers for goods like garments and footwear, then selling them under the MNC''s brand name.
- **Question 2**: What is a trade barrier? Why did the Indian government put trade barriers after Independence, and why were they removed in 1991?
  - *Answer*: A trade barrier is a restriction, such as a tax on imports, used by governments to regulate foreign trade.
    - **Post-Independence**: Barriers were set up to protect domestic industries from foreign competition when they were just starting in the 1950s-1960s.
    - **In 1991**: The government removed barriers because it believed domestic producers were strong enough to compete globally, and competition would drive them to improve quality and efficiency.

## 9. 🎓 Board Tips
- In questions regarding the "impact of globalisation," always present a balanced answer. Discuss both positive impacts (better consumer choice, growth of large Indian MNCs, SEZs) and negative impacts (loss for small capacitor/toy makers, insecure jobs for garment workers).
- Define "Special Economic Zones (SEZs)" and "Liberalisation" exactly. Do not use vague language; use key terms like "world-class facilities," "tax holidays," and "removal of trade barriers."
- Underline or highlight key case studies from the NCERT text in your answers: Cargill buying Parakh Foods, Ford Motors in Chennai, and the stories of Ravi (capacitors) and Sushila (garments).

## 10. 🔄 One-Minute Revision
- Globalisation is the rapid integration of countries through trade and investment, dominated by MNCs.
- MNCs minimize costs by fragmenting and spreading production across countries with local advantages (China for manufacturing, India for customer care).
- Transportation technology (containers) and ICT (internet, e-banking) are primary technological drivers of globalisation.
- India shifted to liberalisation in 1991, removing trade barriers to expose domestic producers to global competition.
- The WTO aims to liberalise trade but is criticized for allowing developed nations to maintain unfair trade barriers.
- Globalisation has created an uneven landscape, benefiting consumers and large companies but displacing small producers and creating job insecurity.

## 11. 🎬 Comic Recap
┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│ PANEL 1:                                                                                         │
│ Priya: "Look at all these brands of shoes and juices, Rahul! The market has completely changed!" │
│ Rahul: "Absolutely! Before 1991, Indian roads only had Fiat and Ambassador cars. It''s a new era!"│
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 2:                                                                                         │
│ Priya: "It''s because of MNCs. They buy local brands, like Cargill bought Parakh Foods, to expand."│
│ Rahul: "And technology helps. Containers cut shipping costs, and internet links Delhi to London!"│
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 3:                                                                                         │
│ Priya: "But what about workers like Sushila or small owners like Ravi? They lost security."      │
│ Rahul: "True! Globalisation must be fair. The government needs to enforce labour laws and protect"│
│ Rahul: "workers'' rights."                                                                        │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                                                                                 │
│ Globalisation is driven by MNCs and enabled by IT, transport, and 1991 liberalisation. We must   │
│ fight for fair rules so everyone shares the benefits!                                            │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘', FALSE, 3)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quizzes (id, chapter_id, title, passing_percentage) VALUES
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd389210', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389210', 'Quiz: Globalisation and the Indian Economy', 60)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389211', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389210', 'Which of the following is the main reason why MNCs set up offices and factories in developing countries like India?', 'multiple_choice', '["A. To support local producers and workers", "B. To escape environmental regulations in developed nations", "C. To obtain cheap labour and other resources to lower production costs", "D. To build goodwill with foreign governments"]', 2, NULL, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389212', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389210', 'When did the Indian government introduce major policy changes to remove barriers to foreign trade and foreign investment (liberalisation)?', 'multiple_choice', '["A. 1947", "B. 1971", "C. 1991", "D. 2001"]', 2, NULL, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389213', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389210', 'What is the primary aim of the World Trade Organisation (WTO)?', 'multiple_choice', '["A. To regulate financial loans to developing countries", "B. To liberalise international trade by removing trade barriers", "C. To govern political disputes between sovereign nations", "D. To promote environmental protection and carbon tax laws"]', 1, NULL, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389214', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389210', 'Special Economic Zones (SEZs) are industrial zones set up by governments in India specifically to:', 'multiple_choice', '["A. Restrict the entry of foreign goods into the country", "B. Provide free housing and transport for unorganised sector workers", "C. Attract foreign companies to invest in India by offering world-class infrastructure and tax exemptions", "D. Promote agriculture and traditional handicrafts in rural areas"]', 2, NULL, 1)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389215', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389210', 'How did the removal of import barriers on capacitors in 2001 affect the small producer Ravi?', 'multiple_choice', '["A. He expanded his business and hired 50 more workers", "B. He collaborated with a large MNC and sold his units at high profits", "C. His main clients shifted to cheaper imports, forcing him to cut production and lay off workers", "D. He successfully exported capacitors to the US and Europe"]', 2, NULL, 1)
ON CONFLICT (id) DO NOTHING;
-- CBSE Class 10 Learning Portal Seed Data for Chapter 22: Consumer Rights
-- Generated on 2026-06-24

-- 1. Insert Chapter
INSERT INTO chapters (id, subject_id, title, sequence_number, description) VALUES
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd389220', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'Chapter 22: Consumer Rights', 22, 'This chapter explores the exploitation of consumers in the marketplace, the evolution and achievements of the consumer movement in India, and the legal framework established under the Consumer Protection Act (COPRA) to protect and empower consumers.')
ON CONFLICT (id) DO NOTHING;

-- 2. Insert Lesson (Revision Notes)
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd389220', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389220', 'Revision Notes: Consumer Rights', 'note', NULL, NULL,
'# Chapter 22: Consumer Rights

## 1. 🎯 Chapter Goal
Learn how consumers are exploited in the marketplace, how the consumer movement arose in India, and the legal remedies, rights, and responsibilities under the Consumer Protection Act (COPRA) to become an informed consumer.

## 2. 🪝 Hook
Imagine buying a bottle of honey, only to find it is mostly sugar syrup, or purchasing an electric iron that gives you a dangerous shock. For years, sellers simply said, "If you do not like it, go elsewhere." But today, you have the legal right to fight back! Let''s discover how consumer struggles changed the rules of the marketplace forever.

## 3. 📖 Concept 1: The Consumer in the Marketplace & Exploitation
We participate in the market both as producers (in agriculture, industry, or services) and as consumers (by purchasing final goods and services). However, individual consumers often find themselves in a weak, scattered position against powerful, organized producers and sellers.

Markets do not work in a fair manner when producers are few and powerful, whereas consumers purchase in small amounts and are scattered. Large companies with huge wealth can manipulate the market by passing false information through the media.

Common forms of exploitation in the marketplace include:
- **Unfair Trade Practices**: Sellers weighing less than they should, adding hidden charges, or selling defective goods.
- **Adulteration**: Mixing low-quality substances with food products.
- **False Claims**: Advertising misleading claims, such as powder milk being better than mother''s milk, or hiding that tobacco causes cancer.

We need rules and regulations in the market to prevent **[JARGON: Consumer Exploitation | Unfair trade practices by sellers that disadvantage, cheat, or harm the buyer in the marketplace | A shopkeeper selling expired medicine or charging more than the Maximum Retail Price (MRP)]** (the manipulation and cheating of buyers by sellers).

## 4. 📖 Concept 2: The Consumer Movement and COPRA
The consumer movement arose out of dissatisfaction with unfair practices and the lack of a legal system to protect buyers.
- **Origin in India**: In India, the consumer movement as a "social force" originated in the 1960s due to rampant food shortages, hoarding, black marketing, and food adulteration. Initially, consumer groups were small and only wrote articles or held exhibitions.
- **Global Growth**: In 1985, the United Nations adopted the UN Guidelines for Consumer Protection. This led to the expansion of **[JARGON: Consumers International | An international umbrella organization that advocates for consumer rights and guides national policy frameworks | Over 200 member groups worldwide collaborate to enforce global standards for consumer safety and fair trade]** (the global federation of consumer groups), which now represents over 200 organisations from more than 100 countries.
- **COPRA**: In 1986, the Indian Government enacted a major law called the **[JARGON: COPRA | The Consumer Protection Act enacted in 1986 (and updated in 2019) to provide a legal framework for consumer rights and redressal in India | A consumer filing a claim for compensation against an e-commerce site for sending a damaged laptop]** (Consumer Protection Act). It was updated in 2019 to cover internet transactions (e-commerce), hold manufacturers responsible for service deficiencies, and introduce mediation cells.

## 5. 📖 Concept 3: Consumer Rights and the Redressal Machinery
COPRA guarantees six core rights to consumers in India:
1. **Right to Safety**: The right to be protected against goods and services hazardous to life and property (e.g., ensuring a pressure cooker safety valve is not defective).
2. **Right to Information**: The right to know details of a product (MRP, manufacture date, expiry date, ingredients). This has been expanded to government services by the **Right to Information (RTI) Act 2005**.
3. **Right to Choose**: The right to choose any brand or service without coercion (e.g., a gas dealer cannot force you to buy their stove).
4. **Right to seek Redressal**: The right to seek compensation or replacement depending on the degree of damage.
5. **Right to Representation**: The right to represent oneself or be represented in consumer forums.
6. **Right to Consumer Education**: The right to acquire knowledge to be a well-informed buyer.

To resolve consumer disputes, COPRA established a three-tier quasi-judicial machinery called the **[JARGON: Consumer Disputes Redressal Commission | A three-tier quasi-judicial system at district, state, and national levels for resolving consumer grievances | A district commission handling a claim of Rs 50 lakh for a defective vehicle]** (consumer courts):
- **District Commission**: Deals with cases involving claims up to Rs 1 crore.
- **State Commission**: Deals with cases between Rs 1 crore and Rs 10 crore.
- **National Commission**: Deals with cases exceeding Rs 10 crore.

### Quality Certification
To assure quality, consumers should look for **[JARGON: Quality Standardization Mark | Certification logos like ISI, Agmark, or Hallmark ensuring product quality and safety | The ISI mark on an LPG cylinder or Agmark on honey to certify purity]** (official logos that guarantee adherence to safety and quality standards):
- **ISI Mark**: For industrial and safety items (e.g., LPG cylinders, cement).
- **Agmark**: For agricultural products (e.g., honey, edible oils, spices).
- **Hallmark**: For gold jewelry.

## 6. ⚠️ Common Mistakes
- **Confusing Councils with Commissions**: Consumer Protection Councils (or forums) are advisory bodies that guide consumers on how to file cases. They do not pass judgments. Consumer Disputes Redressal Commissions are actual courts that hear cases and pass legally binding verdicts.
- **Using 1986 Jurisdictions**: Do not use the old 1986 limits (like up to 20 lakhs for district). Under the COPRA 2019 amendment, the limit is up to Rs 1 crore for District, Rs 1-10 crore for State, and over Rs 10 crore for National.
- **Filing without Receipts**: Many consumers forget to ask for a cash memo (receipt) when buying goods. Without a cash memo, gathering evidence for a consumer court is extremely difficult.

## 7. 💡 Memory Tricks
- **D-S-N Ladder**: **D**istrict (up to 1) -> **S**tate (1 to 10) -> **N**ational (above 10). Think: "Doing Smart Negotiations" to climb the value ladder!
- **AG-mark**: AG stands for Agricultural products (like honey, oil, and ghee).
- **ISI**: Industrial Safety Interest (for appliances, cylinders, and cement).

## 8. 📝 Quick Practice
- **Question 1**: Prakash sent a money-order for his daughter''s wedding, but it did not arrive on time, causing mental distress and financial issues. Which consumer commission should he approach if he claims a compensation of Rs 50,000, and what right is he exercising?
  - *Answer*: Prakash should approach the District Consumer Disputes Redressal Commission since his claim is under Rs 1 crore. He is exercising the Right to seek Redressal and the Right to Representation.
- **Question 2**: A shopkeeper refuses to sell a tube of toothpaste unless you also buy a toothbrush. Which consumer right is being violated here?
  - *Answer*: The Right to Choose is being violated. A consumer has the right to buy only the product they want without being forced to buy bundled items.

## 9. 🎓 Board Tips
- **RTI Act 2005**: If asked about information rights, remember to cite the Right to Information (RTI) Act of October 2005, which empowers citizens to seek information from government departments.
- **Consumers'' Day Dates**: Do not confuse National Consumers'' Day (24th December - marking India''s COPRA enactment) with World Consumer Rights Day (15th March).
- **2019 Amendments**: Highlight that the 2019 amendment specifically brought e-commerce (online transactions) and mediation cells under the legal framework of COPRA.

## 10. 🔄 One-Minute Revision
- Exploitation happens through underweighing, adulteration, charging above MRP, and misleading advertisements.
- The consumer movement in India started in the 1960s as a social force against food hoarding and black marketing.
- COPRA was passed in 1986 and updated in 2019, providing a three-tier system: District (up to Rs 1 cr), State (Rs 1-10 cr), and National (exceeding Rs 10 cr).
- The six key rights are Safety, Information, Choice, Redressal, Representation, and Consumer Education.
- Always check for quality certification marks: ISI for industrial items, Agmark for food products, and Hallmark for jewelry.

## 11. 🎬 Comic Recap
```
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "Priya: I bought this honey bottle, │
│         but it looks like sugar syrup. Can │
│         I return it?"                      │
│ Rahul: "Rahul: Yes! Check the label for    │
│         the Agmark logo. If it is not there│
│         or adulterated, you can claim."    │
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "Priya: The seller said ''No refund''.│
│         What should I do?"                 │
│ Rahul: "Rahul: That is illegal. Under      │
│         COPRA, you have the Right to seek  │
│         Redressal and compensation!"       │
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "Priya: Where do I file a case for  │
│         this small amount of Rs 200?"      │
│ Rahul: "Rahul: Go to the District Consumer │
│         Commission. You don''t even need a  │
│         lawyer to represent you!"          │
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ COPRA (1986/2019) gives you the rights of  │
│ Safety, Info, Choice, and Redressal.       │
│ Look for ISI, Agmark, and Hallmark logos!  │
└────────────────────────────────────────────┘
```', FALSE, 3)
ON CONFLICT (id) DO NOTHING;

-- 3. Insert Quiz
INSERT INTO quizzes (id, chapter_id, title, passing_percentage) VALUES
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd389220', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd389220', 'Chapter 22 Quiz: Consumer Rights', 60)
ON CONFLICT (id) DO NOTHING;

-- 4. Insert Quiz Questions
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389221', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389220', 'Under the Consumer Protection Act (COPRA) 2019, which consumer commission handles claims involving values up to Rs 1 crore?', 'multiple_choice', '["A. State Consumer Disputes Redressal Commission", "B. National Consumer Disputes Redressal Commission", "C. District Consumer Disputes Redressal Commission", "D. Local Consumer Protection Council"]', 2, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389222', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389220', 'In India, National Consumers'' Day is observed every year on which of the following dates?', 'multiple_choice', '["A. 15th March", "B. 24th October", "C. 24th December", "D. 26th January"]', 2, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389223', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389220', 'Which of the following quality certification marks is mandatory for agricultural products like honey, ghee, and edible oil in India?', 'multiple_choice', '["A. ISI Mark", "B. Hallmark", "C. ISO Certification", "D. Agmark"]', 3, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389224', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389220', 'Which consumer right is violated when a gas dealer forces a customer to buy a gas stove from them as a condition for receiving a new gas connection?', 'multiple_choice', '["A. Right to Safety", "B. Right to Choice", "C. Right to Information", "D. Right to Representation"]', 1, NULL, 1),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd389225', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389220', 'What major provision was introduced to the Consumer Protection Act (COPRA) through the 2019 amendment?', 'multiple_choice', '["A. It restricted consumer disputes to local panchayat bodies.", "B. It made e-commerce transactions legally covered and introduced neutral mediation cells at all three tiers.", "C. It abolished the National Consumer Disputes Redressal Commission.", "D. It made engaging a professional lawyer mandatory for filing any complaint."]', 1, NULL, 1)
ON CONFLICT (id) DO NOTHING;


-- --- FROM FILE db/seed_english_batch1.sql ---

-- CBSE Class 10 Learning Portal English Language & Literature (Code 184) Seed Data
-- Generated via Python compiler to ensure data integrity and avoid SQL truncation

-- 1. INSERT SUBJECT
INSERT INTO subjects (id, name, code, description, thumbnail_url) VALUES 
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'English Language & Literature', 'ENG10', 'Reading Comprehension, Grammar, Creative Writing & Literature — Code 184', 'https://images.unsplash.com/photo-1457369804613-52c61a468e7d?w=500&auto=format&fit=crop&q=60') 
ON CONFLICT (id) DO NOTHING;

-- 2. INSERT CHAPTERS
INSERT INTO chapters (id, subject_id, title, sequence_number, description) VALUES 
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e01', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 1: A Letter to God', 1, 'Explore faith in God, humanity, and post office irony in G.L. Fuentes'' story.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e02', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 2: Nelson Mandela: Long Walk to Freedom', 2, 'Mandela''s journey, the struggle against apartheid, and the meaning of true freedom.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e03', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 3: Two Stories about Flying', 3, 'His First Flight by Liam O''Flaherty & The Black Aeroplane by Frederick Forsyth.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e04', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 4: From the Diary of Anne Frank', 4, 'Insight into a young girl''s life during the Nazi occupation through her diary entries.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e05', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 5: Glimpses of India', 5, 'A Baker from Goa, Coorg, and Tea from Assam — rich cultural narratives of India.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e06', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 6: Mijbil the Otter', 6, 'Gavin Maxwell''s journey of traveling and living with his playful pet otter, Mijbil.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e07', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 7: Madam Rides the Bus', 7, 'Valli''s first bus ride, representing her curiosity and induction into the mystery of life and death.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e08', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 8: The Sermon at Benares', 8, 'Gautama Buddha''s first sermon, exploring the inevitability of death and overcoming grief.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e09', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 9: The Proposal', 9, 'Anton Chekhov''s farcical play satirizing wealthy neighbors'' arguments over property and dogs.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e10', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 10: A Triumph of Surgery', 10, 'Tricki''s illness and recovery due to Dr. Herriot''s simple, common-sense treatment.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e11', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 11: The Thief''s Story', 11, 'Hari Singh''s reform through Anil''s trust, highlighting the power of education and kindness.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e12', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 12: The Midnight Visitor', 12, 'Ausable outwits the armed intruder Max through a clever fabrication of a balcony.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e13', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 13: A Question of Trust', 13, 'Horace Danby''s annual robbery turns sideways when he is tricked by another thief.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e14', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 14: Footprints without Feet', 14, 'Griffin, the brilliant but lawless scientist, misuses his invisibility discovery in London.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e15', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 15: The Making of a Scientist', 15, 'Richard Ebright''s journey of scientific inquiry, sparked by his childhood curiosity about butterflies.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e16', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 16: The Necklace', 16, 'Matilda Loisel''s ruined life after she loses a borrowed necklace, highlighting the danger of vanity.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e17', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 17: The Hack Driver', 17, 'A young lawyer''s search for Oliver Lutkins, who tricks him by pretending to be a friendly hack driver.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e18', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 18: Bholi', 18, 'Sulekha''s journey from a neglected simpleton to a confident, educated young woman who rejects a greedy groom.'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e19', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'Chapter 19: The Book That Saved the Earth', 19, 'A 25th-century play showing how a book of nursery rhymes stopped a Martian invasion in 2040.')
ON CONFLICT (id) DO NOTHING;

-- 3. INSERT REVISION NOTES (LESSONS)
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES 
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380f01', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e01', 'Revision Notes: A Letter to God', 'note', NULL, NULL, '# Chapter 1: A Letter to God

## Chapter Goal
The goal of this chapter is to understand the depth of unconditional faith, the irony of human situations, and how kindness from strangers can be misunderstood by a simple mind.

---

## 1. Summary
Lencho was a dedicated farmer whose livelihood depended entirely on his cornfield. He eagerly anticipated a rainstorm, which initially began as promised. However, the rain soon transformed into a devastating hailstorm, destroying his entire crop. 

Left with no hope, Lencho turned to his absolute faith in God. He wrote a letter to God requesting 100 pesos to sow his fields again. The postmaster, moved by Lencho''s innocent faith, decided to help. He collected money from his employees and friends, managing to raise 70 pesos. He signed it ''God'' and sent it. Upon receiving the letter, Lencho counted the money and was angry to find only 70 pesos. Believing that God could not make a mistake, he wrote another letter accusing the post office workers of stealing the remaining 30 pesos and calling them a "bunch of crooks."

---

## 2. Key Themes, Characters, and Plot Points
*   **Unwavering Faith**: Lencho''s faith in God is pure and unquestioning, representing a simple, rural worldview.
*   **Irony of Good Deeds**: The postmaster acts out of charity but is labeled a thief, showing how good intentions can yield unexpected labels.
*   **Characters**:
    *   **Lencho**: Hardworking, deeply religious, but suspicious of city dwellers.
    *   **Postmaster**: Generous, sensitive, and respectful of others'' beliefs.

---

## 3. Literary Devices Explained
*   [JARGON: Irony | A situation where the outcome is opposite to what was expected | Lencho calling the postmaster and staff a bunch of crooks after they selflessly collected money for him]
*   [JARGON: Metaphor | A comparison of two unrelated things by stating one is the other | Lencho comparing the large raindrops to new ten-cent coins and smaller ones to five-cent coins]
*   [JARGON: Personification | Giving human traits to non-human things | The wind blowing wildly like an angry force destroying the crops]

---

## 4. 🎬 Comic Recap
```
┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│ A Letter to God — Faith and Irony                                                                │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 1:                                                                                         │
│ Priya: "Lencho''s faith was so strong! He wrote directly to God asking for help."                 │
│ Rahul: "Yes, and the postmaster was so kind. He raised 70 pesos just to save Lencho''s faith."    │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 2:                                                                                         │
│ Priya: "But then Lencho called the postmaster and his staff a bunch of crooks! That''s so         │
│         unfair!"                                                                                 │
│ Rahul: "Exactly! That is the irony of the story. Lencho trusted God but doubted human            │
│         goodness."                                                                               │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 3:                                                                                         │
│ Priya: "It shows that sometimes blind faith makes us blind to the kindness of real people."      │
│ Rahul: "True. G.L. Fuentes masterfully highlights this conflict between faith and gratitude."    │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                                                                                │
│ Faith can move mountains, but we must also recognize the helpers in front of us.                 │
│ The ultimate irony is that those who helped Lencho were blamed for stealing his money.           │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘
```', TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380f02', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e02', 'Revision Notes: Nelson Mandela', 'note', NULL, NULL, '# Chapter 2: Nelson Mandela: Long Walk to Freedom

## Chapter Goal
The goal of this chapter is to comprehend the struggle against apartheid in South Africa, Mandela''s definition of true courage, and the realization that freedom comes with obligations to family and nation.

---

## 1. Summary
This chapter is an extract from Nelson Mandela''s autobiography. On May 10, 1994, democratic elections were held, and Mandela became South Africa''s first black President, ending three centuries of white minority rule. The inauguration ceremony in Pretoria was attended by politicians from over 140 countries.

Mandela paid tribute to the countless freedom fighters who sacrificed their lives. He reflected on how the decades of oppression produced great men of courage like Oliver Tambo and Walter Sisulu. He argued that courage is not the absence of fear, but the triumph over it. He also discussed the ''twin obligations'' of a man—one to his family, and one to his people and country. He noted that under apartheid, a black man attempting to fulfill his duty was ripped from his home, showing that freedom must be absolute for all citizens.

---

## 2. Key Themes, Characters, and Plot Points
*   **Oppression and Resilience**: Decades of apartheid created the character and strength of black South African leaders.
*   **Courage and Brotherhood**: True bravery is overcoming fear to fight for the common good.
*   **Characters**:
    *   **Nelson Mandela**: A visionary leader who walked the long path from prisoner to president, believing in the basic goodness of humanity.

---

## 3. Literary Devices Explained
*   [JARGON: Apartheid | A political system of racial segregation and discrimination | South Africa''s former government system that denied rights to non-whites]
*   [JARGON: Metaphor | A figure of speech comparing two things without using like or as | Calling the assembly of international dignitaries a rainbow gathering of different nations]
*   [JARGON: Synecdoche | A figure of speech where a part represents the whole | Mandela referring to his people''s hands and hearts working together to rebuild the nation]

---

## 4. 🎬 Comic Recap
```
┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│ Nelson Mandela — True Courage & Freedom                                                          │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 1:                                                                                         │
│ Priya: "Mandela says courage is not the absence of fear, but the triumph over it!"               │
│ Rahul: "Yes! And he speaks of the twin obligations—to our families and to our country."          │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 2:                                                                                         │
│ Priya: "But under apartheid, black South Africans weren''t allowed to fulfill their               │
│         obligations."                                                                            │
│ Rahul: "True. They were punished just for trying to live like human beings. The system was       │
│         brutal."                                                                                 │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 3:                                                                                         │
│ Priya: "Now, South Africa is free. But Mandela warns that the walk to true freedom is still      │
│         long."                                                                                   │
│ Rahul: "Right. To be free is to live in a way that respects and enhances the freedom of          │
│         others."                                                                                 │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                                                                                │
│ Courage is conquering fear, not just being fearless.                                             │
│ We have twin obligations: to our personal family and to our wider national family.               │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘
```', TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380f03', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e03', 'Revision Notes: Two Stories about Flying', 'note', NULL, NULL, '# Chapter 3: Two Stories about Flying

## Chapter Goal
The goal of this chapter is to understand the value of self-confidence and courage in overcoming fear, and the mystery of hope during desperate situations.

---

## 1. Summary
*   **Part I: His First Flight**: A young seagull is terrified of flying, unlike his brothers and sister. His parents threaten to let him starve on the ledge unless he flies. Driven mad by hunger after 24 hours, he watches his mother fly near with a fish. He dives for the food, falls into space, spreads his wings naturally, and conquers his fear.
*   **Part II: The Black Aeroplane**: The narrator is flying his old Dakota aeroplane from France to England. He encounters massive black storm clouds. Refusing to turn back, he flies into the storm. His instruments fail, and he loses radio contact. Suddenly, a mysterious black aeroplane appears, guiding him safely through the clouds. Upon landing, the control tower woman tells him that no other planes were in the sky, leaving him wondering who helped him.

---

## 2. Key Themes, Characters, and Plot Points
*   **Conquering Fear**: The young seagull''s story shows that fear is a mental barrier solved by action.
*   **Mystery and Hope**: The pilot''s story represents how the mind can project solutions (or finding helper figures) during crises.
*   **Characters**:
    *   **Young Seagull**: Timid, hungry, but ultimately a successful flyer.
    *   **Dakota Pilot**: Brave, determined, and deeply grateful.

---

## 3. Literary Devices Explained
*   [JARGON: Simile | A comparison of two things using ''like'' or ''as'' | The storm clouds described as standing like black mountains in front of the aeroplane]
*   [JARGON: Personification | Giving human qualities to non-human things | The sea calling out to the young seagull or the wind playing tricks on the plane]
*   [JARGON: Suspense | The state of excitement or anxiety about what may happen | The pilot''s tense experience when the fuel runs low in the storm]

---

## 4. 🎬 Comic Recap
```
┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│ Two Stories about Flying — Conquering Limits                                                     │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 1:                                                                                         │
│ Priya: "The young seagull was so scared to fly! But hunger pushed him off the ledge."            │
│ Rahul: "Sometimes, fear is just a mental wall. Once he plunged, his wings spread naturally."     │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 2:                                                                                         │
│ Priya: "And what about the pilot in the old Dakota? He survived a massive storm because of a     │
│         mystery helper."                                                                         │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 3:                                                                                         │
│ Rahul: "The black aeroplane was like a guiding light. Was it real or his own inner strength?"    │
│ Priya: "Maybe both! It teaches us that hope helps us find a way out of the darkest storms."      │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                                                                                │
│ Conquering fear requires taking the first plunge, even if you are forced to do so.               │
│ When facing a storm, self-reliance and hope are your ultimate navigation tools.                  │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘
```', TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380f04', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e04', 'Revision Notes: From the Diary of Anne Frank', 'note', NULL, NULL, '# Chapter 4: From the Diary of Anne Frank

## Chapter Goal
The goal of this chapter is to explore the emotional isolation of a young teenager, the power of diary writing as self-expression, and how humor can resolve classroom conflicts.

---

## 1. Summary
Anne Frank, a 13-year-old Jewish girl, felt lonely despite having family and friends because she lacked a true confidante. She decided to write a diary, naming it ''Kitty'', treating it as her closest friend. 

She shared stories of her school life, particularly her math teacher, Mr. Keesing. Annoyed by Anne''s talkative nature, he assigned her extra homework: writing essays on "A Chatterbox." Anne argued that talking is a female trait inherited from her mother. When Mr. Keesing assigned a third essay titled "Quack, Quack, Quack, Said Mistress Chatterbox," Anne wrote a humorous poem about three baby ducklings bitten to death by their father swan for quacking too much. Mr. Keesing took the joke in good spirit, read it to the class, and stopped punishing her.

---

## 2. Key Themes, Characters, and Plot Points
*   **Teenage Solitude**: The need to express oneself honestly is why Anne kept her diary.
*   **Teacher-Student Dynamic**: Mr. Keesing''s transition from strict educator to understanding mentor shows the power of humor.
*   **Characters**:
    *   **Anne Frank**: Witty, creative, talkative, and highly mature for her age.
    *   **Mr. Keesing**: Traditional math teacher who values discipline but appreciates wit.

---

## 3. Literary Devices Explained
*   [JARGON: Personification | Attributing human characteristics to abstract ideas | Anne''s famous quote: Paper has more patience than people]
*   [JARGON: Alliteration | The repetition of consonant sounds at the start of words | Anne writing about her homework being a test of her writing talents]
*   [JARGON: Irony | A contrast between expectations and reality | A teacher assigning a talking student an essay about talking, only to be outwitted by the essay''s contents]

---

## 4. 🎬 Comic Recap
```
┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│ Anne Frank — Writing as a Confidante                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 1:                                                                                         │
│ Priya: "Anne Frank felt she had no true friend, so she treated her diary as one."                │
│ Rahul: "Yes, she named it ''Kitty''. And she argued that ''paper has more patience than             │
│         people''!"                                                                                │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 2:                                                                                         │
│ Priya: "And she was so witty! She outwitted her math teacher, Mr. Keesing, who punished her      │
│         for talking."                                                                            │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 3:                                                                                         │
│ Rahul: "By writing a poem about baby ducklings and a father swan? That was hilarious!"           │
│ Priya: "It was. Mr. Keesing took the joke well and let her talk. Humor solved the conflict!"     │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                                                                                │
│ Writing is a powerful outlet for loneliness and self-expression.                                 │
│ A witty, humorous approach can resolve tension and win over strict authority figures.            │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘
```', TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380f05', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e05', 'Revision Notes: Glimpses of India', 'note', NULL, NULL, '# Chapter 5: Glimpses of India

## Chapter Goal
The goal of this chapter is to discover the rich cultural heritage, unique local traditions, and natural beauty of three different regions in India (Goa, Coorg, and Assam).

---

## 1. Summary
*   **Part I: A Baker from Goa**: A nostalgic look at traditional Goan village life under Portuguese influence. The baker (pader) was an important figure, and children loved the sweet ''bread-bangles''. The sound of his bamboo staff announced his arrival.
*   **Part II: Coorg**: A description of Coorg (Kodagu), a beautiful district in Karnataka known for coffee, spices, and rainforests. The local people are famous for their bravery, hospitality, and distinct Greek/Arabic descent.
*   **Part III: Tea from Assam**: Pranjol and Rajvir travel to Assam, the world''s tea capital. Rajvir shares tea legends (a Chinese emperor boiling leaves and a Buddhist monk growing tea from eyelids) and details the sprawling Dhekiabari tea estate.

---

## 2. Key Themes, Characters, and Plot Points
*   **Cultural Legacy**: The stories highlight how colonial influences (Portuguese in Goa, Greeks/Arabs in Coorg, British in Assam) shaped local practices.
*   **Nature and Hospitality**: The descriptions celebrate India''s natural wealth and traditions of hosting guests.
*   **Characters**:
    *   **Rajvir**: Curious and well-prepared traveler.
    *   **Pranjol**: Practical local student who takes tea gardens for granted.

---

## 3. Literary Devices Explained
*   [JARGON: Imagery | Descriptive language that creates vivid mental pictures | Descriptions of coffee estates with colonial bungalows and sprawling green tea bushes]
*   [JARGON: Nostalgia | A sentimental longing for the past | The Goan elders fondly remembering the Portuguese bread and baking furnaces]
*   [JARGON: Hyperbole | Exaggeration used for emphasis | Rajvir claiming that over eighty crore cups of tea are drunk daily throughout the world]

---

## 4. 🎬 Comic Recap
```
┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│ Glimpses of India — A Diverse Tapestry                                                           │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 1:                                                                                         │
│ Priya: "India has such diverse landscapes—like the Goan baker, the Coorg warriors, and           │
│         Assam''s tea!"                                                                            │
│ Rahul: "Indeed! Goa retains its Portuguese baking traditions, and Coorg has Greek and Arabic     │
│         ancestry."                                                                               │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 2:                                                                                         │
│ Priya: "And Assam produces the most tea in the world! Rajvir shared so many cool legends         │
│         about its origin."                                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 3:                                                                                         │
│ Rahul: "Yes, like the Buddhist monk who cut off his eyelids, and tea plants grew from them!"     │
│ Priya: "These glimpses show that our culture is defined by local heritage and natural            │
│         beauty."                                                                                 │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                                                                                │
│ India''s strength lies in its regional diversity and deep-rooted cultural heritage.               │
│ Every region has unique stories, legends, and professions that define its identity.              │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘
```', TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380f06', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e06', 'Revision Notes: Mijbil the Otter', 'note', NULL, NULL, '# Chapter 6: Mijbil the Otter

## Chapter Goal
The goal of this chapter is to understand the unique bond between humans and wild pets, the responsibilities of domesticating an unusual animal, and the playful nature of otters.

---

## 1. Summary
Gavin Maxwell, living in Camusfearna, West Highlands of Scotland, decided to keep an otter as a pet after his dog died. He traveled to Iraq and was gifted an otter by local Arabs, naming him Mijbil. 

Maxwell spent weeks understanding Mijbil''s playful habits, including his love for running water and rolling in bathtubs. The main conflict occurs when Maxwell has to transport Mijbil to London. The airline required Mijbil to be kept in a box. Mijbil tore the box and injured himself. On the flight, he escaped, causing panic among passengers before being recovered by Maxwell. In London, Mijbil adjusted to city life, inventing games with ping-pong balls and walking on low walls, while Londoners struggled to guess what animal he was.

---

## 2. Key Themes, Characters, and Plot Points
*   **Domesticating Wild Animals**: The story shows that keeping an unusual pet requires high responsibility and specialized care.
*   **Playfulness and Intellect**: Mijbil''s behavior highlights the curiosity and intelligence of otters.
*   **Characters**:
    *   **Gavin Maxwell**: A compassionate and patient writer who respects his pet''s wild instincts.
    *   **Mijbil**: An active, intelligent, and highly affectionate otter.

---

## 3. Literary Devices Explained
*   [JARGON: Onomatopoeia | Words that imitate the sound they describe | The water sloshed and spluttered in the bathtub]
*   [JARGON: Anthropomorphism | Attributing human motives or characteristics to animals | Describing Mijbil''s intense focus on his toys as if he were a professional gamer]
*   [JARGON: Simile | Comparing two things using like or as | Describing the otter''s head as shaped like a small medieval dragon]

---

## 4. 🎬 Comic Recap
```
┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│ Mijbil the Otter — Unconventional Companionship                                                  │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 1:                                                                                         │
│ Priya: "Gavin Maxwell''s travel with Mijbil the otter was total chaos!"                           │
│ Rahul: "Especially on the aeroplane! Mijbil escaping the box and scaring the passengers."        │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 2:                                                                                         │
│ Priya: "But Gavin''s bond with Mijbil was so sweet. Mijbil was incredibly playful, like a         │
│         child."                                                                                  │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 3:                                                                                         │
│ Rahul: "Yes, inventing games with ping-pong balls and walking on low walls in London."           │
│ Priya: "It shows that wild animals have deep emotions and require immense patience to raise."    │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                                                                                │
│ Raising a pet, especially an unconventional one, is a serious, long-term responsibility.         │
│ Animals respond to patience, play, and genuine affection with loyalty and trust.                 │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘
```', TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380f07', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e07', 'Revision Notes: Madam Rides the Bus', 'note', NULL, NULL, '# Chapter 7: Madam Rides the Bus

## Chapter Goal
The goal of this chapter is to trace a child''s independent journey of self-discovery, understand how curiosity leads to mature experiences, and explore the concept of mortality through a child''s eyes.

---

## 1. Summary
Valliammai (Valli) was an 8-year-old girl who loved watching the street from her doorway. Her greatest desire was to travel on the bus that ran between her village and the nearest town. 

She planned her trip carefully, saving 60 paise by resisting candies, toys, and merry-go-rounds. She slipped out of her house during her mother''s afternoon nap. The jolly bus conductor joked and called her ''Madam'' because of her independent behavior. Valli was fascinated by the passing landscape, especially a young cow running ahead of the bus. However, on the return journey, she saw the same cow lying dead by the road, hit by a vehicle. The sight filled her with deep sadness and silence, making her realize the suddenness of death and the transition from life.

---

## 2. Key Themes, Characters, and Plot Points
*   **Loss of Innocence**: The dead cow represents Valli''s first encounter with death, shifting her perspective from childish joy to quiet reflection.
*   **Determination and Planning**: Valli''s self-discipline in saving money shows high maturity.
*   **Characters**:
    *   **Valli**: Observant, independent, self-respecting, and highly organized.
    *   **Conductor**: Friendly, humorous, and supportive of Valli''s adventure.

---

## 3. Literary Devices Explained
*   [JARGON: Irony | The contrast between expectations and reality | The cow that brought Valli laughter on the way to town was the source of her deepest sorrow on the way back]
*   [JARGON: Sarcasm | Humorous remarks used to mock or tease | The conductor referring to an eight-year-old traveler as a respectable ''Madam'']
*   [JARGON: Symbolism | An object or event representing a deeper meaning | The running cow symbolizing vibrant life, and its sudden death representing the fragile nature of human existence]

---

## 4. 🎬 Comic Recap
```
┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│ Madam Rides the Bus — Innocence & Maturity                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 1:                                                                                         │
│ Priya: "Valli was so young, only 8! But she planned and executed her bus trip like a pro."       │
│ Rahul: "Yes, saving 60 paise was a big deal. But her return journey was so sad."                 │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 2:                                                                                         │
│ Priya: "Seeing that beautiful cow dead by the roadside really shook her, didn''t it?"             │
│ Rahul: "It did. It was her first real encounter with the harsh mystery of death."                │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 3:                                                                                         │
│ Priya: "She returned home silent. She went out as a curious child and came back matured."        │
│ Rahul: "That''s the journey of life. Experience teaches us the reality of existence."             │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                                                                                │
│ Independent choices bring us face-to-face with the real world''s beauty and tragedies.            │
│ Maturity begins when we realize how fragile and unpredictable life and death are.                │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘
```', TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380f08', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e08', 'Revision Notes: The Sermon at Benares', 'note', NULL, NULL, '# Chapter 8: The Sermon at Benares

## Chapter Goal
The goal of this chapter is to understand the core Buddhist philosophy on the universality of death, the nature of suffering, and how acceptance brings peace of mind.

---

## 1. Summary
Siddhartha Gautama, born a prince in Northern India, was shielded from the world''s sufferings. At twenty-five, he chanced upon a sick man, an aged man, a funeral procession, and a begging monk. Deeply moved, he renounced his royalty to seek enlightenment. He sat under a peepal tree and achieved wisdom, becoming the Buddha. 

He preached his first sermon at Benares. Kisa Gotami, grieving the death of her only son, went door-to-door asking for medicine to revive him. Buddha instructed her to procure a handful of mustard seeds from a house where no one had lost a loved one. Kisa Gotami went to many houses but could not find a single home untouched by death. She realized that death is common to all, and that her grief was selfish. She understood that holding onto sorrow only increases physical and mental pain, and peace comes from acceptance.

---

## 2. Key Themes, Characters, and Plot Points
*   **Universality of Death**: Grieving cannot change mortality; everyone who is born must die.
*   **Grief and Detachment**: Overcoming pain requires letting go of attachment and lamentation.
*   **Characters**:
    *   **Gautama Buddha**: Compassionate teacher who guides Kisa Gotami to self-realization rather than lecturing her.
    *   **Kisa Gotami**: A loving mother blinded by grief who achieves spiritual peace through a simple exercise.

---

## 3. Literary Devices Explained
*   [JARGON: Parable | A simple story used to illustrate a moral lesson | Buddha using Kisa Gotami''s quest for mustard seeds to teach the reality of death]
*   [JARGON: Analogy | A comparison between two things for explanation | Buddha comparing mortal lives to ripe fruits that are in danger of falling, and earthen vessels made by a potter that eventually break]
*   [JARGON: Metaphor | A figure of speech comparing two things without like/as | Describing the world as afflicted with death and decay]

---

## 4. 🎬 Comic Recap
```
┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│ The Sermon at Benares — Overcoming Grief                                                         │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 1:                                                                                         │
│ Priya: "Kisa Gotami''s grief for her dead son was so painful. She couldn''t accept his death."     │
│ Rahul: "Yes, but the Buddha didn''t just tell her to stop crying. He gave her a task."            │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 2:                                                                                         │
│ Priya: "To find mustard seeds from a house where no one had died! And she found none."           │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 3:                                                                                         │
│ Rahul: "Exactly. She realized that death is common to all. Grieving only increases our own       │
│         pain."                                                                                   │
│ Priya: "Accepting loss is the only way to find peace of mind. It''s a deep lesson."               │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                                                                                │
│ Death is an inevitable, natural law that touches every single household.                         │
│ Selfish grieving or lamentation cannot change reality; peace comes only from acceptance.         │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘
```', TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380f09', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e09', 'Revision Notes: The Proposal', 'note', NULL, NULL, '# Chapter 9: The Proposal

## Chapter Goal
The goal of this chapter is to analyze Anton Chekhov''s satire on marriage, understand how material greed and pride overshadow relationships, and identify farcical character behaviors.

---

## 1. Summary
Lomov, a 35-year-old hypochondriac neighbor, arrives at Chubukov''s house dressed formally to propose marriage to Chubukov''s daughter, Natalya. Chubukov is delighted, assuming Lomov wants a loan, but gladly calls Natalya.

However, Lomov starts by talking about his historical property, "Oxen Meadows." Natalya heatedly claims the land belongs to her family. A massive argument ensues, with Chubukov joining in. Lomov has palpitations and leaves in a huff. When Natalya finds out he came to propose, she demands he return. Lomov comes back, but they immediately start a second argument about the superiority of their hunting dogs (Lomov''s Guess vs. Natalya''s Squeezer). Lomov faints from stress. Fearing he is dead, Chubukov panics. When Lomov revives, Chubukov quickly joins their hands, forces them to kiss, and declares them engaged. They immediately resume arguing.

---

## 2. Key Themes, Characters, and Plot Points
*   **Satire on Upper-Class Marriage**: Marriage is treated as a business deal to join properties, not a romantic union.
*   **Petty Pride**: The characters choose trivial arguments over a life-altering proposal.
*   **Characters**:
    *   **Lomov**: Highly nervous, hypochondriac, and argumentative.
    *   **Natalya**: Shrewd, possessive of property, and desperate to marry.
    *   **Chubukov**: Opportunistic father who only cares about social status and wealth.

---

## 3. Literary Devices Explained
*   [JARGON: Farce | A comedy marked by exaggerated characters and absurd situations | Lomov fainting from palpitations while Natalya screams at him about dogs]
*   [JARGON: Satire | Mocking human vices or foolishness through humor | Chekhov mocking the superficiality of high-society marriages]
*   [JARGON: Irony | The contrast between expectations and reality | Lomov coming to propose a lifetime union but spending his entire visit arguing]

---

## 4. 🎬 Comic Recap
```
┌──────────────────────────────────────────────────────────────────────────────────────────────────┐
│ The Proposal — Satire on High Society                                                            │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 1:                                                                                         │
│ Priya: "Lomov came to propose to Natalya, but they fought over Oxen Meadows and dogs!"           │
│ Rahul: "I know! The proposal was completely forgotten while they screamed at each other."        │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 2:                                                                                         │
│ Priya: "And Chubukov, instead of calming them, joined in the shouting match!"                    │
│ Rahul: "Farcical! Lomov was fainting from palpitations, yet they couldn''t stop arguing."         │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ PANEL 3:                                                                                         │
│ Priya: "Even after getting engaged at the end, they started fighting again!"                     │
│ Rahul: "Chekhov satirizes how upper-class marriages were just about property, not love."         │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                                                                                │
│ Property and petty pride should never take priority over relationships and marriage.             │
│ Anger management and active listening are crucial to avoid turning discussions into farces.      │
└──────────────────────────────────────────────────────────────────────────────────────────────────┘
```', TRUE, 1),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380f90', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e06', 'Writing Skills: Formal Letter Writing Template & Models', 'note', NULL, NULL, '# CBSE Class 10: Formal Letter Writing Guide

## 1. Structure of a Formal Letter (CBSE Format)
A formal letter is evaluated out of **5 marks** in the board examination. Adhering to the correct format is crucial.

1.  **Sender''s Address**: 2-3 lines, left-aligned. (Do not write your real name/address; use ''Examination Hall, City X'').
2.  **Date**: Write in full format, e.g., ''24 June 2026'' or ''June 24, 2026''.
3.  **Receiver''s Address**: Designations (e.g., ''The Editor'') followed by newspaper name and city.
4.  **Subject**: Concise (4-6 words), summarizing the purpose. Underline the subject.
5.  **Salutation**: Formal, e.g., ''Sir'' or ''Dear Sir/Madam''.
6.  **Body of the Letter**: Divided into three distinct paragraphs:
    *   **Paragraph 1 (Introduction)**: State the purpose of the letter.
    *   **Paragraph 2 (Detail)**: Elaborate on the issue, causes, effects, and consequences.
    *   **Paragraph 3 (Conclusion/Suggestion)**: Suggest remedies or raise awareness. (Note: For letters to the editor, do not ask the editor to solve the problem; ask him to publish the concern so authorities take action).
7.  **Complimentary Close**: ''Yours faithfully'' or ''Yours sincerely'' (Note the lowercase ''f'' and ''s''; no apostrophe in Yours).
8.  **Sender''s Name**: Write signature and name (e.g., ''XYZ'' or the name given in the question).

---

## 2. Standard Blank Template
```text
Sender''s Address:
[Examination Hall,
City X, India]

Date: [24 June 2026]

Receiver''s Address:
[The Editor,
The Daily Times,
New Delhi - 110001]

Subject: [Underlined concise summary of concern]

Sir,

Through the columns of your esteemed newspaper, I would like to draw the attention of the concerned authorities and the general public towards the rising issue of [Insert Topic].

[Detail paragraph discussing the reasons, consequences, and current public distress regarding the problem...]

It is hoped that this publication will awaken the authorities from their slumber so they take immediate steps to address the problem.

Yours faithfully,
[XYZ/Given Name]
```', TRUE, 2),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380f91', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e07', 'Writing Skills: Analytical Paragraph Guide & Models', 'note', NULL, NULL, '# CBSE Class 10: Analytical Paragraph Writing Guide

## 1. Structure of an Analytical Paragraph
An analytical paragraph requires you to write a coherent summary based on a given map, chart, graph, table, or outline. It carries **5 marks**.

1.  **Title**: Give a suitable, descriptive title.
2.  **Introduction (1-2 sentences)**: Paraphrase the question prompt. State what the chart/graph represents.
    *   *Useful opening words*: ''The line graph illustrates...'', ''The bar chart depicts...'', ''The table compares...''
3.  **Body Paragraph (Data Comparison)**: Describe the trends, percentages, increases, decreases, and fluctuations. Group similar data together and compare values.
    *   *Useful vocab*: ''A sharp increase'', ''gradually declined'', ''hit a peak of'', ''remained steady'', ''in comparison to''.
4.  **Conclusion (1-2 sentences)**: Provide a summary of the overall trend or findings. Do not list specific figures here.
    *   *Useful opening words*: ''In conclusion, it is clear that...'', ''Overall, the data suggests that...''

---

## 2. Key Formatting Rules
*   **Word Limit**: 100-120 words. Keep it crisp.
*   **Tone**: Completely objective. Do not express personal opinions or suggestions.
*   **Tense**: Use present/past tense consistently based on the years mentioned in the prompt.', TRUE, 2),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380f92', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e08', 'Writing Skills: Story Completion Guide & Models', 'note', NULL, NULL, '# CBSE Class 10: Story Completion Writing Guide

## 1. Elements of a Good Story
Story writing is a creative task evaluated out of **5 marks**. It tests imagination and language control.

1.  **Title**: Catchy and relevant to the plot.
2.  **Setting the Scene**: Start directly from the opening line given in the prompt, establishing an atmosphere (e.g. mysterious, cheerful, exciting).
3.  **Character Development**: Keep it to 1-2 characters to maintain focus in the short word limit.
4.  **Plot & Conflict**: Introduce an obstacle, surprise, or turning point.
5.  **Resolution & Conclusion**: Conclude with a logical resolution. An open or surprising ending is highly effective.
6.  **Moral (Optional)**: State the lesson at the end if appropriate.

---

## 2. Writing Tips
*   **Tense**: Write primarily in the past tense.
*   **Dialogue**: Include 1-2 lines of direct dialogue to bring characters to life.
*   **Word Limit**: 150-200 words.', TRUE, 2)
ON CONFLICT (id) DO NOTHING;

-- 4. INSERT POETRY QUIZZES AND QUESTIONS
-- 5. INSERT GRAMMAR QUIZZES AND QUESTIONS
-- 6. INSERT WRITING QUIZZES AND QUESTIONS
INSERT INTO quizzes (id, chapter_id, title, passing_percentage) VALUES 
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380f00', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e01', 'Poem Quiz: Dust of Snow', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380f01', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e01', 'Poem Quiz: Fire and Ice', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380f02', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e02', 'Poem Quiz: A Tiger in the Zoo', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380f03', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e03', 'Poem Quiz: How to Tell Wild Animals', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380f04', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e03', 'Poem Quiz: The Ball Poem', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380f05', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e04', 'Poem Quiz: Amanda!', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380f06', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e05', 'Poem Quiz: The Trees', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380f07', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e06', 'Poem Quiz: Fog', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380f08', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e07', 'Poem Quiz: The Tale of Custard the Dragon', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380f09', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e08', 'Poem Quiz: For Anne Gregory', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd381f00', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e01', 'Grammar Quiz: Tenses', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd381f01', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e02', 'Grammar Quiz: Modals', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd381f02', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e03', 'Grammar Quiz: Reported Speech', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd381f03', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e04', 'Grammar Quiz: Subject-Verb Concord', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd381f04', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e05', 'Grammar Quiz: Editing/Omission', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd382f00', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e06', 'Writing Skills: Letter Writing Assessment', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd382f01', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e07', 'Writing Skills: Analytical Paragraph Assessment', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd382f02', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380e08', 'Writing Skills: Story Completion Assessment', 60)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) VALUES 
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0000', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f00', 'Read the extract below and answer the question:

The way a crow
Shook down on me
The dust of snow
From a hemlock tree

Who is the poet of the poem ''Dust of Snow''?', 'extract_based', '["Robert Frost", "William Wordsworth", "Leslie Norris", "Robin Klein"]', 0, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Dust of Snow', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0001', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f00', 'Read the extract below and answer the question:

The way a crow
Shook down on me
The dust of snow
From a hemlock tree

What did the crow shake down on the poet?', 'extract_based', '["Dust of leaves", "Dust of snow", "Fruit seeds", "Raindrops"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Dust of Snow', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0002', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f00', 'Read the extract below and answer the question:

The way a crow
Shook down on me
The dust of snow
From a hemlock tree

What tree is mentioned in the extract, and what does it represent?', 'extract_based', '["Oak tree; strength", "Hemlock tree; poison and sorrow", "Banyan tree; longevity", "Pine tree; joy"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Dust of Snow', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0003', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f00', 'Read the extract below and answer the question:

The way a crow
Shook down on me
The dust of snow
From a hemlock tree

What effect did the dust of snow have on the poet''s mood?', 'extract_based', '["It made him angry.", "It changed his mood from depressed to uplifted.", "It made him feel cold.", "It had no effect."]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Dust of Snow', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0004', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f00', 'Read the extract below and answer the question:

The way a crow
Shook down on me
The dust of snow
From a hemlock tree

Which poetic device is used in the phrase ''shook down on me''?', 'extract_based', '["Alliteration", "Imagery", "Onomatopoeia", "Personification"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Dust of Snow', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0000', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f00', 'How does a simple moment in nature change the poet''s perspective on his day? Discuss with reference to the poem ''Dust of Snow''.', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'Dust of Snow', 'A simple natural event—a crow shaking snow off a hemlock tree onto the poet—shatters his depressive, brooding mood. The cold touch of the snow acts as a sudden wake-up call, making him realize that he was wasting his day in regret. Nature''s quiet beauty reminds him of the simple joy of being alive, saving the remainder of his day.', '1. Explain the initial depressed mood of the poet (1 mark)
2. Detail the action of the crow and the snow (1 mark)
3. Describe the change in perspective and saving of the day (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0001', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f00', 'Analyze the symbolic significance of the crow and the hemlock tree in Robert Frost''s poem ''Dust of Snow''.', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'Dust of Snow', 'Traditionally, the crow and the hemlock tree are symbols of ill omen, sorrow, and poison. By choosing these elements to bring joy and a positive change in the poet''s mood, Robert Frost subverts traditional romantic associations. He illustrates that nature, in all its forms, is a source of healing and that joy can emerge from seemingly negative symbols.', '1. Explain typical symbols of crow and hemlock (1 mark)
2. Describe how the poet uses them to bring positive change (1 mark)
3. State the underlying message of nature''s healing powers (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0100', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f01', 'Read the extract below and answer the question:

Some say the world will end in fire,
Some say in ice.
From what I’ve tasted of desire
I hold with those who favor fire.

What does ''fire'' symbolize in the poem?', 'extract_based', '["Uncontrolled anger and heat", "Lust, greed, and desire", "Industrial progress", "Wars"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Fire and Ice', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0101', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f01', 'Read the extract below and answer the question:

Some say the world will end in fire,
Some say in ice.
From what I’ve tasted of desire
I hold with those who favor fire.

What does ''ice'' symbolize in the poem?', 'extract_based', '["Cold weather", "Scientific advancement", "Hatred and indifference", "Pure logic"]', 2, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Fire and Ice', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0102', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f01', 'Read the extract below and answer the question:

Some say the world will end in fire,
Some say in ice.
From what I’ve tasted of desire
I hold with those who favor fire.

According to the poet, what will cause the world''s destruction first?', 'extract_based', '["Desire and fire", "Hatred and ice", "Natural disasters", "Nuclear weapons"]', 0, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Fire and Ice', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0103', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f01', 'Read the extract below and answer the question:

Some say the world will end in fire,
Some say in ice.
From what I’ve tasted of desire
I hold with those who favor fire.

Who does the poet support in the first stanza?', 'extract_based', '["Those who favor ice", "Those who favor fire", "Those who believe the world is immortal", "No one"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Fire and Ice', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0104', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f01', 'Read the extract below and answer the question:

Some say the world will end in fire,
Some say in ice.
From what I’ve tasted of desire
I hold with those who favor fire.

What is the rhyme scheme of this extract?', 'extract_based', '["abab", "abaa", "abcb", "abba"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Fire and Ice', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0100', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f01', 'How does Robert Frost compare human emotions to natural elements in ''Fire and Ice''?', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'Fire and Ice', 'Robert Frost compares intense human emotions to destructive natural forces. He equates ''fire'' with human desire, passion, and greed, noting its rapid, consuming destruction. He equates ''ice'' with hatred, coldness, and indifference, which slowly but completely numbs and destroys relationships and humanity. Both are capable of bringing the world to an end.', '1. Equate fire with passion/greed (1 mark)
2. Equate ice with hatred/indifference (1 mark)
3. Explain how both lead to destruction (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0101', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f01', 'Explain the line ''From what I''ve tasted of desire / I hold with those who favor fire''.', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'Fire and Ice', 'In this line, the poet draws from his personal experiences of human desire, passion, and greed. He understands how these intense emotions can drive individuals to destructive conflicts and wars. Based on this understanding, he initially agrees that passion (fire) is the primary force that will lead to human self-destruction.', '1. Define the poet''s personal experience of desire (1 mark)
2. Link desire to conflict and destruction (1 mark)
3. Explain his support for the fire theory (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0200', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f02', 'Read the extract below and answer the question:

He stalks in his vivid stripes
The few steps of his cage,
On pads of velvet quiet,
In his quiet rage.

Where is the tiger in this extract?', 'extract_based', '["In a forest", "In a circus", "In a cage in a zoo", "On a mountain"]', 2, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'A Tiger in the Zoo', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0201', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f02', 'Read the extract below and answer the question:

He stalks in his vivid stripes
The few steps of his cage,
On pads of velvet quiet,
In his quiet rage.

What does the phrase ''pads of velvet quiet'' refer to?', 'extract_based', '["The tiger''s soft paws", "A carpet in the cage", "Grass in the jungle", "Quiet visitors"]', 0, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'A Tiger in the Zoo', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0202', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f02', 'Read the extract below and answer the question:

He stalks in his vivid stripes
The few steps of his cage,
On pads of velvet quiet,
In his quiet rage.

Why is the tiger in a state of ''quiet rage''?', 'extract_based', '["He is sleeping.", "He is angry about being locked up and losing his freedom.", "He is waiting for food.", "He is scared of visitors."]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'A Tiger in the Zoo', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0203', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f02', 'Read the extract below and answer the question:

He stalks in his vivid stripes
The few steps of his cage,
On pads of velvet quiet,
In his quiet rage.

Which poetic device is used in the phrase ''quiet rage''?', 'extract_based', '["Simile", "Oxymoron", "Onomatopoeia", "Hyperbole"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'A Tiger in the Zoo', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0204', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f02', 'Read the extract below and answer the question:

He stalks in his vivid stripes
The few steps of his cage,
On pads of velvet quiet,
In his quiet rage.

What is the contrast highlighted in the poem?', 'extract_based', '["Between a zoo tiger and a wild tiger", "Between a tiger and a lion", "Between visitors and tigers", "Between day and night"]', 0, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'A Tiger in the Zoo', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0200', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f02', 'Contrast the life of the tiger in the cage with his life in his natural habitat as described in the poem.', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'A Tiger in the Zoo', 'In the cage, the tiger''s movement is restricted to a few steps. His majestic strength is locked behind bars, making him helpless, ignoring visitors, and staring at stars in quiet rage. In contrast, in the wild, he would lurk in shadows, slide through long grass, hunt near water bodies, and terrify villagers with his fangs, displaying his natural majesty and freedom.', '1. Describe caged tiger''s helplessness and quiet rage (1 mark)
2. Describe wild tiger''s freedom and predatory instincts (1 mark)
3. State the contrast between captivity and freedom (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0201', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f02', 'Discuss how the poem ''A Tiger in the Zoo'' acts as a critique of caging wild animals.', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'A Tiger in the Zoo', 'The poem critiques the confinement of wild animals for human entertainment. By contrasting the tiger''s vibrant, powerful natural state with his numbed, helpless, and angry existence in a concrete cell, the poet argues that keeping wild animals in zoos is a form of cruelty that strips them of their dignity, instincts, and fundamental right to freedom.', '1. Identify the theme of animal rights and freedom (1 mark)
2. Compare natural instincts vs. caged confinement (1 mark)
3. Conclude on the cruelty of zoos (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0300', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f03', 'Read the extract below and answer the question:

If ever you should go by chance
To jungles in the east;
And if there should to you advance
A large and tawny beast,
If he roars at you as you’re dyin’
You’ll know it is the Asian Lion.

Where is the reader suggested to go in this extract?', 'extract_based', '["Jungles in the west", "Jungles in the east", "A local zoo", "A desert"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'How to Tell Wild Animals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0301', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f03', 'Read the extract below and answer the question:

If ever you should go by chance
To jungles in the east;
And if there should to you advance
A large and tawny beast,
If he roars at you as you’re dyin’
You’ll know it is the Asian Lion.

What does the word ''tawny'' mean?', 'extract_based', '["Bright green", "Yellowish-brown", "Deep black", "Polka-dotted"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'How to Tell Wild Animals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0302', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f03', 'Read the extract below and answer the question:

If ever you should go by chance
To jungles in the east;
And if there should to you advance
A large and tawny beast,
If he roars at you as you’re dyin’
You’ll know it is the Asian Lion.

How can you identify the Asian Lion according to the poet?', 'extract_based', '["By its quiet walk", "By its spots", "By its terrifying roar while you are dying", "By its friendly behavior"]', 2, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'How to Tell Wild Animals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0303', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f03', 'Read the extract below and answer the question:

If ever you should go by chance
To jungles in the east;
And if there should to you advance
A large and tawny beast,
If he roars at you as you’re dyin’
You’ll know it is the Asian Lion.

What tone does the poet adopt in this poem?', 'extract_based', '["Serious and scientific", "Humorous and sarcastic", "Sad and mournful", "Aggressive"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'How to Tell Wild Animals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0304', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f03', 'Read the extract below and answer the question:

If ever you should go by chance
To jungles in the east;
And if there should to you advance
A large and tawny beast,
If he roars at you as you’re dyin’
You’ll know it is the Asian Lion.

What spelling alteration does the poet make in ''dyin'''' and why?', 'extract_based', '["A typo; error", "Poetic license; to maintain rhyme and rhythm", "Modern slang", "German translation"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'How to Tell Wild Animals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0300', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f03', 'How does Carolyn Wells create humor in ''How to Tell Wild Animals'' through life-threatening situations?', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'How to Tell Wild Animals', 'Carolyn Wells uses dark humor by describing dangerous meetings with wild beasts as simple identification tests. She suggests identifying an Asian Lion by its roar as you are ''dying'', a Bengal Tiger by the fact that he eats you, and a leopard by his leaping on you repeatedly. The contrast between extreme danger and casual advice creates a highly lighthearted, humorous effect.', '1. Explain the concept of using danger for humor (1 mark)
2. Give examples from the text (lion roaring while dying/tiger eating) (1 mark)
3. Define the humorous effect of the contrast (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0301', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f03', 'What is ''poetic license''? Give examples of how it is used in the poem.', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'How to Tell Wild Animals', 'Poetic license is the freedom of a poet to violate conventional grammar, spelling, or pronunciation rules to fit a rhyme or meter. In this poem, Wells misspells ''dying'' as ''dyin'''' to rhyme with ''lion'', and uses ''lep'' and ''lep again'' instead of ''leap'' to maintain a quick, bouncing rhythm, enhancing the humor of the verses.', '1. Define poetic license (1 mark)
2. Identify ''dyin'' rhyming with ''lion'' (1 mark)
3. Identify ''lep'' for leap (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0400', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f04', 'Read the extract below and answer the question:

I saw it go
Merrily bouncing, down the street, and then
Merrily bouncing on the water — An ultimate shaking grief fixes the boy

What did the poet see bouncing down the street?', 'extract_based', '["A puppy", "A ball", "A child", "A coin"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Ball Poem', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0401', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f04', 'Read the extract below and answer the question:

I saw it go
Merrily bouncing, down the street, and then
Merrily bouncing on the water — An ultimate shaking grief fixes the boy

Where did the ball eventually go?', 'extract_based', '["Into a house", "Into the sewer", "Into the water (harbor)", "Into a park"]', 2, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Ball Poem', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0402', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f04', 'Read the extract below and answer the question:

I saw it go
Merrily bouncing, down the street, and then
Merrily bouncing on the water — An ultimate shaking grief fixes the boy

How did the loss of the ball affect the boy?', 'extract_based', '["He was happy and went to buy a new one.", "He was fixed with a shaking grief, standing rigid and staring.", "He did not care.", "He cried loudly for his mother."]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Ball Poem', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0403', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f04', 'Read the extract below and answer the question:

I saw it go
Merrily bouncing, down the street, and then
Merrily bouncing on the water — An ultimate shaking grief fixes the boy

Why does the poet choose not to comfort the boy with money or another ball?', 'extract_based', '["He is greedy.", "He wants the boy to learn the responsibility of loss and grow up.", "He has no money.", "He dislikes the boy."]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Ball Poem', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0404', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f04', 'Read the extract below and answer the question:

I saw it go
Merrily bouncing, down the street, and then
Merrily bouncing on the water — An ultimate shaking grief fixes the boy

What does the ball symbolize in the poem?', 'extract_based', '["A toy only", "The boy''s innocent childhood days", "Money", "Sporting spirit"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Ball Poem', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0400', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f04', 'What does the poet mean by ''the epistemology of loss'' in ''The Ball Poem''?', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'The Ball Poem', 'The ''epistemology of loss'' refers to the study or understanding of what it means to lose something valuable. The poet wants the boy to stand up, learn how to cope with the pain of loss, and understand that material possessions are transient. It is a fundamental lesson in emotional maturity, teaching that loss is a natural part of human life.', '1. Define epistemology of loss as understanding loss (1 mark)
2. Explain that possessions are temporary (1 mark)
3. Highlight the lesson of standing up and growing up (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0401', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f04', 'Why does the poet say ''Money is external'' in the context of the boy''s lost ball?', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'The Ball Poem', 'The poet says ''Money is external'' because money can buy a new, physical ball, but it cannot buy back the memories, associations, and attachment the boy had with his original ball. The emotions connected to the lost childhood toys cannot be replaced by wealth, highlighting the limitations of material possessions in healing internal grief.', '1. Explain that money can buy replacements but not memories (1 mark)
2. Detail the emotional connection of the boy to the ball (1 mark)
3. Show the contrast between material wealth and emotional values (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0500', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f05', 'Read the extract below and answer the question:

Don’t bite your nails, Amanda!
Don’t hunch your shoulders, Amanda!
Stop that slouching and sit up straight, Amanda!

Who is likely speaking to Amanda in this extract?', 'extract_based', '["Her teacher", "Her friend", "Her parent (mother)", "Her brother"]', 2, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Amanda!', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0501', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f05', 'Read the extract below and answer the question:

Don’t bite your nails, Amanda!
Don’t hunch your shoulders, Amanda!
Stop that slouching and sit up straight, Amanda!

What is the speaker''s main concern in the extract?', 'extract_based', '["Amanda''s education", "Amanda''s posture, habits, and behavior", "Amanda''s health", "Amanda''s clothes"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Amanda!', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0502', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f05', 'Read the extract below and answer the question:

Don’t bite your nails, Amanda!
Don’t hunch your shoulders, Amanda!
Stop that slouching and sit up straight, Amanda!

How does Amanda respond internally to these instructions?', 'extract_based', '["She apologizes.", "She escapes into a fantasy world where she is a mermaid or orphan.", "She argues back.", "She starts crying."]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Amanda!', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0503', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f05', 'Read the extract below and answer the question:

Don’t bite your nails, Amanda!
Don’t hunch your shoulders, Amanda!
Stop that slouching and sit up straight, Amanda!

What does ''slouching'' mean?', 'extract_based', '["Walking quickly", "Sitting or standing lazily with shoulders drooped", "Screaming", "Dancing"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Amanda!', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0504', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f05', 'Read the extract below and answer the question:

Don’t bite your nails, Amanda!
Don’t hunch your shoulders, Amanda!
Stop that slouching and sit up straight, Amanda!

What is the contrast in the poem''s structure?', 'extract_based', '["Between parent''s nagging and Amanda''s silent daydreaming", "Between school and home", "Between rich and poor", "Between reality and science fiction"]', 0, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Amanda!', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0500', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f05', 'Discuss the contrast between the mother''s instructions and Amanda''s inner thoughts in the poem.', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'Amanda!', 'The poem alternates between the mother''s strict, nagging instructions (demanding Amanda sit straight, clean her room, do homework) and Amanda''s silent, italicized daydreams. In her fantasy, Amanda escapes control, imagining herself as a solitary mermaid in a calm sea, a free orphan walking on streets, or Rapunzel in a quiet tower, illustrating a deep desire for freedom from adult constant supervision.', '1. Detail the mother''s nagging demands (1 mark)
2. Explain Amanda''s fantasies of absolute freedom (1 mark)
3. Contrast parental control with a child''s need for personal space (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0501', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f05', 'Why does Amanda wish to be an orphan in one of her daydreams?', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'Amanda!', 'Amanda wishes to be an orphan not because she dislikes her parents, but because she is suffocated by constant nagging. She envisions an orphan as having the absolute freedom to roam the streets barefoot and make quiet patterns in the soft dust without any voice telling her what to do, showing that to her, parental control feels worse than orphanhood.', '1. Connect the orphan daydream to the feeling of suffocation (1 mark)
2. Describe the imagery of freedom (barefoot, making dust patterns) (1 mark)
3. Highlight the extent of her desire to escape nagging (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0600', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f06', 'Read the extract below and answer the question:

The trees inside are moving out into the forest,
the forest that was empty all these days
where no bird could sit
no insect hide

Where are the trees at the start of the poem?', 'extract_based', '["In a public park", "In the wild forest", "Inside the poet''s house", "On a farm"]', 2, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Trees', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0601', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f06', 'Read the extract below and answer the question:

The trees inside are moving out into the forest,
the forest that was empty all these days
where no bird could sit
no insect hide

Why was the forest empty according to the extract?', 'extract_based', '["Due to forest fires", "Because trees were brought indoors for decoration, leaving the forest bare", "Due to a lack of rain", "Because animals ran away"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Trees', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0602', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f06', 'Read the extract below and answer the question:

The trees inside are moving out into the forest,
the forest that was empty all these days
where no bird could sit
no insect hide

What activities could not happen in the empty forest?', 'extract_based', '["Woodcutting", "Birds sitting, insects hiding, and sun burying feet in shadow", "Hunting", "Camping"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Trees', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0603', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f06', 'Read the extract below and answer the question:

The trees inside are moving out into the forest,
the forest that was empty all these days
where no bird could sit
no insect hide

What are the trees doing throughout the night?', 'extract_based', '["Sleeping quietly", "Struggling and working to free their roots, leaves, and branches to move out", "Growing flowers", "Singing"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Trees', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0604', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f06', 'Read the extract below and answer the question:

The trees inside are moving out into the forest,
the forest that was empty all these days
where no bird could sit
no insect hide

Who is the poet of ''The Trees''?', 'extract_based', '["Adrienne Rich", "Robert Frost", "Robin Klein", "Leslie Norris"]', 0, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Trees', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0600', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f06', 'How does the poem ''The Trees'' serve as an allegory for women''s liberation?', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'The Trees', 'In this poem, the trees inside the house represent women confined to domestic spaces. The forest represents society and the outside world. Just as the trees break through glass and floors to reclaim their natural forest home, women are breaking traditional barriers, moving out of domestic boundaries to occupy their rightful, active spaces in the public sphere, restoring social balance.', '1. Explain trees inside as women in domestic spaces (1 mark)
2. Explain the movement of trees to the forest as women gaining liberation (1 mark)
3. Discuss the themes of breaking barriers and reclaiming freedom (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0601', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f06', 'Analyze the imagery of nature breaking free from human custody in the poem.', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'The Trees', 'Adrienne Rich uses powerful dynamic imagery to show nature reclaiming its space. The roots work all night to disengage from veranda floors, leaves strain toward glass, and stiff twigs exert force. The poet compares the emerging branches to newly discharged patients blinking in surprise, showing nature''s fierce resilience in breaking free from human control.', '1. Detail the actions of roots, leaves, and twigs (1 mark)
2. Explain the comparison to newly discharged patients (1 mark)
3. Conclude on the theme of nature''s unstoppable resilience (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0700', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f07', 'Read the extract below and answer the question:

The fog comes
on little cat feet.
It sits looking
over harbor and city

How does the fog arrive according to the poet?', 'extract_based', '["With a loud thunder", "On little cat feet (silently and stealthily)", "With heavy winds", "Suddenly in the afternoon"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Fog', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0701', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f07', 'Read the extract below and answer the question:

The fog comes
on little cat feet.
It sits looking
over harbor and city

What does the fog look over?', 'extract_based', '["A dense forest", "The harbor and the city", "Only residential areas", "A schoolyard"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Fog', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0702', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f07', 'Read the extract below and answer the question:

The fog comes
on little cat feet.
It sits looking
over harbor and city

In what posture does the fog sit?', 'extract_based', '["Lying flat on the ground", "On silent haunches like a cat", "Floating high in clouds", "Disappearing rapidly"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Fog', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0703', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f07', 'Read the extract below and answer the question:

The fog comes
on little cat feet.
It sits looking
over harbor and city

What does the fog do after sitting for some time?', 'extract_based', '["It rains heavily.", "It moves on silently.", "It turns into snow.", "It stays forever."]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Fog', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0704', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f07', 'Read the extract below and answer the question:

The fog comes
on little cat feet.
It sits looking
over harbor and city

Who is the poet of ''Fog''?', 'extract_based', '["Carl Sandburg", "Robert Frost", "Ogden Nash", "Carolyn Wells"]', 0, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'Fog', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0700', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f07', 'Compare the characteristics of the fog to those of a cat as depicted in the poem.', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'Fog', 'Carl Sandburg creates an extended metaphor comparing the fog to a cat. Both arrive silently and stealthily (''on little cat feet''), without warning. Both sit quietly in one place, looking over their surroundings (''looking over harbor and city'') in a detached, peaceful manner on their haunches. Finally, both move on quietly without leaving a trace, highlighting their silent, elusive nature.', '1. Detail silent arrival of cat and fog (1 mark)
2. Compare sitting posture and observation of harbor/city (1 mark)
3. Explain the silent departure of both (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0701', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f07', 'How does Carl Sandburg capture a complex natural phenomenon in just six lines in ''Fog''?', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'Fog', 'Sandburg captures the essence of fog through simplicity and imagery. Instead of detailed explanations, he uses a single, powerful metaphor of a cat. This comparison evokes the silent arrival, the static hover over the harbor, and the quiet disappearance of the fog. By avoiding complex adjectives, he creates a memorable, atmospheric poem in a brief format.', '1. Discuss the brief, six-line structure (1 mark)
2. Highlight the effectiveness of the cat metaphor (1 mark)
3. Explain how it creates an atmospheric, vivid picture (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0800', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f08', 'Read the extract below and answer the question:

Belinda lived in a little white house,
With a little black kitten and a little grey mouse,
And a little yellow dog and a little red wagon,
And a realio, trulio, little pet dragon.

What are the names of Belinda''s kitten and mouse?', 'extract_based', '["Ink and Blink", "Mustard and Custard", "Jack and Jill", "Blackie and Grey"]', 0, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Tale of Custard the Dragon', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0801', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f08', 'Read the extract below and answer the question:

Belinda lived in a little white house,
With a little black kitten and a little grey mouse,
And a little yellow dog and a little red wagon,
And a realio, trulio, little pet dragon.

What did Custard the dragon constantly cry for?', 'extract_based', '["More food", "A nice safe cage", "Gold coins", "A fight with a pirate"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Tale of Custard the Dragon', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0802', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f08', 'Read the extract below and answer the question:

Belinda lived in a little white house,
With a little black kitten and a little grey mouse,
And a little yellow dog and a little red wagon,
And a realio, trulio, little pet dragon.

How did the other pets treat Custard before the pirate''s arrival?', 'extract_based', '["They feared him.", "They mocked and teased him, calling him cowardly.", "They ignored him.", "They respected him as their leader."]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Tale of Custard the Dragon', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0803', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f08', 'Read the extract below and answer the question:

Belinda lived in a little white house,
With a little black kitten and a little grey mouse,
And a little yellow dog and a little red wagon,
And a realio, trulio, little pet dragon.

What did Custard do when the pirate broke into the house?', 'extract_based', '["He ran away and hid.", "He stood brave, snorted, clashed his tail, and swallowed the pirate whole.", "He started crying.", "He helped the pirate rob Belinda."]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Tale of Custard the Dragon', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0804', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f08', 'Read the extract below and answer the question:

Belinda lived in a little white house,
With a little black kitten and a little grey mouse,
And a little yellow dog and a little red wagon,
And a realio, trulio, little pet dragon.

Who is the poet of this humorous ballad?', 'extract_based', '["Ogden Nash", "Robert Frost", "Robin Klein", "Walt Whitman"]', 0, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'The Tale of Custard the Dragon', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0800', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f08', 'How does Ogden Nash use irony to contrast the initial boasts of the pets with their behavior during the crisis?', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'The Tale of Custard the Dragon', 'Nash uses irony to expose the empty bravery of Belinda''s pets. Belinda, Ink, Blink, and Mustard boast of their extreme courage (brave as bears, chasing lions down stairs). They mock Custard for crying for a safe cage. However, when the armed pirate breaks in, Belinda cries for help, Mustard flees barking, Ink hides in the basement, and Blink runs to his hole. The supposedly cowardly Custard is the only one who fights and swallows the pirate.', '1. Detail the initial boastful bravery of Belinda, Ink, Blink, Mustard (1 mark)
2. Describe their cowardly flight during the pirate''s entry (1 mark)
3. Highlight Custard''s heroic act as the ironical twist (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0801', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f08', 'Analyze the poem ''The Tale of Custard the Dragon'' as a parody of a traditional ballad.', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'The Tale of Custard the Dragon', 'A traditional ballad tells a serious story of heroism and adventure. Nash parodies this form by using a lighthearted, singsong rhyme scheme (aabb), choosing ridiculous names (Ink, Blink, Mustard, Custard), and using absurd descriptions ( Custard''s chimney-nose and dagger-toes). By making the hero a dragon who wants a cozy cage, he subverts typical heroic archetypes for comic effect.', '1. Define a ballad and how Nash parodies it (1 mark)
2. Detail the comedic elements, names, and rhymes (1 mark)
3. Explain the subversion of heroic archetypes (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0900', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f09', 'Read the extract below and answer the question:

Never shall a young man,
Thrown into despair
By those great honey-coloured
Ramparts at your ear,
Love you for yourself alone
And not your yellow hair.

What color is Anne Gregory''s hair in the poem?', 'extract_based', '["Brown", "Honey-coloured (yellow/golden)", "Jet black", "Red"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'For Anne Gregory', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0901', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f09', 'Read the extract below and answer the question:

Never shall a young man,
Thrown into despair
By those great honey-coloured
Ramparts at your ear,
Love you for yourself alone
And not your yellow hair.

What does the speaker mean by ''ramparts at your ear''?', 'extract_based', '["A fort near her house", "Her thick, beautiful hair falling around her ears like protective walls", "A type of jewelry", "A loud sound"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'For Anne Gregory', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0902', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f09', 'Read the extract below and answer the question:

Never shall a young man,
Thrown into despair
By those great honey-coloured
Ramparts at your ear,
Love you for yourself alone
And not your yellow hair.

According to the speaker, what do young men love Anne Gregory for?', 'extract_based', '["Her intelligence", "Her yellow hair (physical beauty)", "Her kind nature", "Her wealth"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'For Anne Gregory', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0903', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f09', 'Read the extract below and answer the question:

Never shall a young man,
Thrown into despair
By those great honey-coloured
Ramparts at your ear,
Love you for yourself alone
And not your yellow hair.

How does Anne Gregory suggest she can change her hair to test lovers?', 'extract_based', '["By cutting it short", "By dyeing it brown, black, or carrot color", "By hiding it under a scarf", "By styling it differently"]', 1, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'For Anne Gregory', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380f0904', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f09', 'Read the extract below and answer the question:

Never shall a young man,
Thrown into despair
By those great honey-coloured
Ramparts at your ear,
Love you for yourself alone
And not your yellow hair.

Who, according to the religious man, is the only one capable of loving Anne for herself alone?', 'extract_based', '["Her parents", "The speaker", "God", "No one"]', 2, NULL, 1, 'Correct option selected', 'medium', '184', 'original', 'For Anne Gregory', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0900', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f09', 'Discuss the central theme of physical beauty versus inner worth in the poem ''For Anne Gregory''.', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'For Anne Gregory', 'The poem explores the conflict between external physical appearance and internal spiritual worth. The speaker asserts that young men are easily captivated by Anne''s beautiful honey-coloured hair and cannot look past her physical features to love her inner self. Anne tries to resist this by suggesting she can dye her hair, but the speaker concludes that only God is capable of loving a human being for their soul alone.', '1. Explain the young men''s obsession with physical beauty (yellow hair) (1 mark)
2. Detail Anne''s desire to be loved for her character/mind (1 mark)
3. State the conclusion that only God loves unconditionally (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd380a0901', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380f09', 'Explain the metaphor of ''ramparts at your ear'' and how it relates to human relationships.', 'short_answer_3mark', NULL, NULL, NULL, 3, NULL, 'hard', '184', 'original', 'For Anne Gregory', 'The ''ramparts'' metaphor compares Anne''s beautiful hair falling around her ears to the high protective walls of a fort. Just as ramparts prevent an intruder from entering a fortress, Anne''s striking physical beauty acts as a barrier that prevents men from looking deeper to appreciate her inner personality. They are trapped by her outer looks, highlighting the superficial nature of human attraction.', '1. Identify and explain the metaphor ''ramparts at your ear'' (1 mark)
2. Connect the barrier image to human relationships (1 mark)
3. Show how physical beauty obscures inner qualities (1 mark)'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0000', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f00', 'Choose the correct tense: Every morning, my father _______ the newspaper with his tea.', 'multiple_choice', '["read", "reads", "is reading", "has read"]', 1, NULL, 1, 'Simple present is used for habitual actions.', 'medium', '184', 'original', 'Tenses', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0001', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f00', 'Choose the correct tense: Look! The birds _______ south for the winter.', 'multiple_choice', '["fly", "are flying", "have flown", "flied"]', 1, NULL, 1, 'Present continuous is used for actions happening at the moment of speaking.', 'medium', '184', 'original', 'Tenses', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0002', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f00', 'Choose the correct tense: By the time the doctor arrived, the patient _______.', 'multiple_choice', '["died", "has died", "had died", "is dying"]', 2, NULL, 1, 'Past perfect is used for the earlier of two completed past actions.', 'medium', '184', 'original', 'Tenses', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0003', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f00', 'Choose the correct tense: I _______ English for five years now.', 'multiple_choice', '["study", "am studying", "have been studying", "studied"]', 2, NULL, 1, 'Present perfect continuous is used for actions starting in the past and continuing now.', 'medium', '184', 'original', 'Tenses', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0004', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f00', 'Choose the correct tense: We _______ to the zoo last Sunday.', 'multiple_choice', '["go", "went", "have gone", "were going"]', 1, NULL, 1, 'Simple past is used for actions completed at a specific past time.', 'medium', '184', 'original', 'Tenses', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0005', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f00', 'Choose the correct tense: Tomorrow at this time, we _______ our exams.', 'multiple_choice', '["write", "will be writing", "have written", "wrote"]', 1, NULL, 1, 'Future continuous is used for actions in progress at a specific future time.', 'medium', '184', 'original', 'Tenses', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0006', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f00', 'Choose the correct tense: She _______ her homework before going to play.', 'multiple_choice', '["finished", "finishes", "had finished", "is finishing"]', 2, NULL, 1, 'Past perfect indicates completion before another past event (going to play).', 'medium', '184', 'original', 'Tenses', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0007', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f00', 'Choose the correct tense: The sun _______ in the east.', 'multiple_choice', '["rise", "rises", "is rising", "rose"]', 1, NULL, 1, 'Simple present is used for universal truths.', 'medium', '184', 'original', 'Tenses', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0008', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f00', 'Choose the correct tense: They _______ in this house since 2015.', 'multiple_choice', '["live", "are living", "have lived", "lived"]', 2, NULL, 1, 'Present perfect is used for states starting in the past and continuing up to the present.', 'medium', '184', 'original', 'Tenses', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0009', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f00', 'Choose the correct tense: If it _______ tomorrow, we will cancel the picnic.', 'multiple_choice', '["rains", "will rain", "rained", "is raining"]', 0, NULL, 1, 'In conditional clauses, simple present is used for future conditions.', 'medium', '184', 'original', 'Tenses', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0100', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f01', 'Fill in the blank: You _______ respect your elders and teachers.', 'multiple_choice', '["should", "must", "ought to", "can"]', 2, NULL, 1, '''Ought to'' represents a moral obligation or duty.', 'medium', '184', 'original', 'Modals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0101', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f01', 'Fill in the blank: _______ you please open the door for me?', 'multiple_choice', '["May", "Could", "Should", "Must"]', 1, NULL, 1, '''Could'' is used for polite requests.', 'medium', '184', 'original', 'Modals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0102', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f01', 'Fill in the blank: It is cloudy; it _______ rain tonight.', 'multiple_choice', '["may", "must", "should", "would"]', 0, NULL, 1, '''May'' expresses a strong possibility based on evidence.', 'medium', '184', 'original', 'Modals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0103', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f01', 'Fill in the blank: Drivers _______ stop when the traffic light turns red.', 'multiple_choice', '["should", "can", "must", "may"]', 2, NULL, 1, '''Must'' indicates a legal requirement or rule.', 'medium', '184', 'original', 'Modals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0104', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f01', 'Fill in the blank: I _______ run ten miles when I was younger.', 'multiple_choice', '["can", "could", "should", "might"]', 1, NULL, 1, '''Could'' represents a general ability in the past.', 'medium', '184', 'original', 'Modals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0105', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f01', 'Fill in the blank: She _______ practice daily if she wants to win the competition.', 'multiple_choice', '["should", "must", "ought", "might"]', 0, NULL, 1, '''Should'' indicates a strong recommendation or advice.', 'medium', '184', 'original', 'Modals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0106', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f01', 'Fill in the blank: You _______ not enter this room; it is restricted.', 'multiple_choice', '["must", "should", "could", "would"]', 0, NULL, 1, '''Must not'' indicates a strict prohibition.', 'medium', '184', 'original', 'Modals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0107', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f01', 'Fill in the blank: _______ I borrow your pen, please?', 'multiple_choice', '["Should", "May", "Must", "Would"]', 1, NULL, 1, '''May'' is the formal modal for seeking permission.', 'medium', '184', 'original', 'Modals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0108', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f01', 'Fill in the blank: If you study hard, you _______ pass the board exams.', 'multiple_choice', '["will", "should", "might", "would"]', 0, NULL, 1, '''Will'' indicates a high certainty of future outcome.', 'medium', '184', 'original', 'Modals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0109', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f01', 'Fill in the blank: We _______ protect our environment for future generations.', 'multiple_choice', '["might", "must", "could", "can"]', 1, NULL, 1, '''Must'' represents an absolute necessity or strong obligation.', 'medium', '184', 'original', 'Modals', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0200', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f02', 'Direct: Rahul said, ''I am reading a book.'' Choose the correct indirect speech.', 'multiple_choice', '["Rahul said that he was reading a book.", "Rahul said that I was reading a book.", "Rahul says he is reading a book.", "Rahul said he had read a book."]', 0, NULL, 1, 'Present continuous changes to past continuous, and pronouns shift.', 'medium', '184', 'original', 'Reported Speech', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0201', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f02', 'Direct: She said to me, ''Where are you going?'' Choose the correct indirect speech.', 'multiple_choice', '["She asked me where I was going.", "She asked me where was I going.", "She told me where I am going.", "She asked me if I was going."]', 0, NULL, 1, 'In questions, reporting verb changes to ''asked'', and question order becomes statement order.', 'medium', '184', 'original', 'Reported Speech', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0202', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f02', 'Direct: The teacher said, ''The Earth revolves around the Sun.'' Choose the correct indirect speech.', 'multiple_choice', '["The teacher said that the Earth revolved around the Sun.", "The teacher said that the Earth revolves around the Sun.", "The teacher says the Earth is revolving.", "The teacher told that the Earth revolves."]', 1, NULL, 1, 'Tense of universal truths does not change in reported speech.', 'medium', '184', 'original', 'Reported Speech', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0203', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f02', 'Direct: He said, ''I have finished my work.'' Choose the correct indirect speech.', 'multiple_choice', '["He said that he has finished his work.", "He said that he had finished his work.", "He told that he finished his work.", "He says he had finished."]', 1, NULL, 1, 'Present perfect changes to past perfect.', 'medium', '184', 'original', 'Reported Speech', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0204', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f02', 'Direct: She said, ''I will call you tomorrow.'' Choose the correct indirect speech.', 'multiple_choice', '["She said that she will call me the next day.", "She said that she would call me the next day.", "She told she calls me tomorrow.", "She said that she would call you tomorrow."]', 1, NULL, 1, '''Will'' changes to ''would'', ''tomorrow'' changes to ''the next day''.', 'medium', '184', 'original', 'Reported Speech', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0205', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f02', 'Direct: Mother said to Anil, ''Go to your room immediately.'' Choose the correct indirect speech.', 'multiple_choice', '["Mother ordered Anil to go to his room immediately.", "Mother said to Anil that go to your room.", "Mother asked Anil to went to his room.", "Mother told Anil he goes to his room."]', 0, NULL, 1, 'Imperative sentences use ''ordered/told + to-infinitive''.', 'medium', '184', 'original', 'Reported Speech', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0206', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f02', 'Direct: He asked, ''Are you coming with us?'' Choose the correct indirect speech.', 'multiple_choice', '["He asked if I was coming with them.", "He asked that whether I am coming with them.", "He asked me if I am coming.", "He says if I am coming."]', 0, NULL, 1, 'Yes/No questions use ''if'' or ''whether'' as connectors.', 'medium', '184', 'original', 'Reported Speech', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0207', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f02', 'Direct: The doctor said, ''Take this medicine twice a day.'' Choose the correct indirect speech.', 'multiple_choice', '["The doctor advised to take that medicine twice a day.", "The doctor advised me to take this medicine twice a day.", "The doctor tells to take medicine.", "The doctor ordered to took medicine."]', 0, NULL, 1, 'Doctor''s instructions are reported using ''advised'' + to-infinitive.', 'medium', '184', 'original', 'Reported Speech', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0208', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f02', 'Direct: They said, ''We won the match!'' Choose the correct indirect speech.', 'multiple_choice', '["They exclaimed with joy that they had won the match.", "They said that they won the match.", "They exclaimed they win the match.", "They told with joy they won."]', 0, NULL, 1, 'Exclamatory sentences use ''exclaimed with joy/sorrow'' + that clause in past perfect.', 'medium', '184', 'original', 'Reported Speech', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0209', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f02', 'Direct: She said, ''I can speak three languages.'' Choose the correct indirect speech.', 'multiple_choice', '["She said that she could speak three languages.", "She said that she can speak three languages.", "She says she could speak.", "She told that she can speak."]', 0, NULL, 1, '''Can'' changes to ''could'' in reported speech.', 'medium', '184', 'original', 'Reported Speech', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0300', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f03', 'Choose the correct verb: The quality of these mangoes _______ not good.', 'multiple_choice', '["is", "are", "were", "be"]', 0, NULL, 1, 'The subject is the singular noun ''quality'', not ''mangoes''.', 'medium', '184', 'original', 'Subject-Verb Concord', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0301', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f03', 'Choose the correct verb: Bread and butter _______ our daily breakfast.', 'multiple_choice', '["is", "are", "were", "have been"]', 0, NULL, 1, 'When two singular nouns represent a single collective idea, they take a singular verb.', 'medium', '184', 'original', 'Subject-Verb Concord', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0302', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f03', 'Choose the correct verb: Either you or he _______ to clean the room.', 'multiple_choice', '["has", "have", "are", "were"]', 0, NULL, 1, 'In ''either... or'' structures, the verb agrees with the closer subject (''he'' is singular).', 'medium', '184', 'original', 'Subject-Verb Concord', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0303', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f03', 'Choose the correct verb: Neither of the two candidates _______ selected.', 'multiple_choice', '["was", "were", "are", "have been"]', 0, NULL, 1, '''Neither'' is a singular pronoun and takes a singular verb.', 'medium', '184', 'original', 'Subject-Verb Concord', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0304', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f03', 'Choose the correct verb: A pair of scissors _______ lying on the table.', 'multiple_choice', '["is", "are", "were", "have been"]', 0, NULL, 1, '''A pair of'' makes the collective noun singular, requiring ''is''.', 'medium', '184', 'original', 'Subject-Verb Concord', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0305', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f03', 'Choose the correct verb: The team _______ practicing hard for the finals.', 'multiple_choice', '["is", "are", "have", "were"]', 0, NULL, 1, 'A collective noun like ''team'' takes a singular verb when acting as a single unit.', 'medium', '184', 'original', 'Subject-Verb Concord', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0306', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f03', 'Choose the correct verb: Physics _______ my favorite subject in school.', 'multiple_choice', '["is", "are", "were", "be"]', 0, NULL, 1, 'Names of subjects ending in -s (like Physics, Mathematics) are singular.', 'medium', '184', 'original', 'Subject-Verb Concord', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0307', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f03', 'Choose the correct verb: Many a student _______ made this common mistake.', 'multiple_choice', '["has", "have", "are", "were"]', 0, NULL, 1, '''Many a'' is followed by a singular noun and a singular verb.', 'medium', '184', 'original', 'Subject-Verb Concord', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0308', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f03', 'Choose the correct verb: The Prime Minister, along with his ministers, _______ arrived.', 'multiple_choice', '["has", "have", "are", "were"]', 0, NULL, 1, 'With ''along with'', the verb agrees with the first subject (''Prime Minister'' is singular).', 'medium', '184', 'original', 'Subject-Verb Concord', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0309', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f03', 'Choose the correct verb: Ten kilometers _______ a long distance to walk.', 'multiple_choice', '["is", "are", "were", "have been"]', 0, NULL, 1, 'A specific quantity of distance or time is treated as a singular unit.', 'medium', '184', 'original', 'Subject-Verb Concord', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0400', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f04', 'Sentence: ''He is tallest boy in the class.'' Identify the error and select the correct replacement.', 'multiple_choice', '["He is taller boy...", "He is the tallest boy...", "He is a tallest boy...", "No error"]', 1, NULL, 1, 'Superlatives (''tallest'') must be preceded by the definite article ''the''.', 'medium', '184', 'original', 'Editing/Omission', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0401', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f04', 'Sentence: ''I prefer tea than coffee.'' Identify the error and select the correct replacement.', 'multiple_choice', '["I prefer tea for coffee.", "I prefer tea to coffee.", "I prefer tea over coffee.", "No error"]', 1, NULL, 1, 'The verb ''prefer'' is followed by the preposition ''to'' when making comparisons.', 'medium', '184', 'original', 'Editing/Omission', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0402', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f04', 'Sentence: ''Each of the girls have brought her book.'' Identify the error and select the correct replacement.', 'multiple_choice', '["Each of the girls has brought her book.", "Each of the girls have brought their book.", "Each of the girls having brought...", "No error"]', 0, NULL, 1, '''Each'' is a singular subject and must agree with the singular verb ''has''.', 'medium', '184', 'original', 'Editing/Omission', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0403', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f04', 'Sentence: ''She has been working here since two hours.'' Identify the error and select the correct replacement.', 'multiple_choice', '["...working here for two hours.", "...working here from two hours.", "...worked here since two hours.", "No error"]', 0, NULL, 1, '''For'' is used for a duration/period of time (two hours), whereas ''since'' is for a point in time.', 'medium', '184', 'original', 'Editing/Omission', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0404', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f04', 'Sentence: ''Although he worked hard, but he failed.'' Identify the error and select the correct replacement.', 'multiple_choice', '["Although he worked hard, he failed.", "Although he worked hard, yet he failed.", "No error", "Although he worked hard, and he failed."]', 0, NULL, 1, 'Do not use ''but'' in sentences starting with ''although'' (it creates a double conjunction error).', 'medium', '184', 'original', 'Editing/Omission', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0405', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f04', 'Sentence: ''One of my friend is a doctor.'' Identify the error and select the correct replacement.', 'multiple_choice', '["One of my friends are a doctor.", "One of my friends is a doctor.", "One of my friend are a doctor.", "No error"]', 1, NULL, 1, '''One of'' must be followed by a plural noun (''friends'') and a singular verb (''is'').', 'medium', '184', 'original', 'Editing/Omission', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0406', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f04', 'Sentence: ''The news of the accident are shocking.'' Identify the error and select the correct replacement.', 'multiple_choice', '["The news of the accident is shocking.", "The news of the accident were shocking.", "No error", "The news of the accident been shocking."]', 0, NULL, 1, 'The noun ''news'' is singular in usage and takes a singular verb (''is'').', 'medium', '184', 'original', 'Editing/Omission', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0407', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f04', 'Sentence: ''She doesn''t know nothing about the matter.'' Identify the error and select the correct replacement.', 'multiple_choice', '["She doesn''t know anything about the matter.", "She knows anything about the matter.", "No error", "She doesn''t know something about the matter."]', 0, NULL, 1, 'Avoid double negatives (''doesn''t'' + ''nothing''). Use ''doesn''t know anything''.', 'medium', '184', 'original', 'Editing/Omission', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0408', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f04', 'Sentence: ''The bird spread it''s wings and flew.'' Identify the error and select the correct replacement.', 'multiple_choice', '["...spread its wings...", "...spread its'' wings...", "...spread it wings...", "No error"]', 0, NULL, 1, '''Its'' is the possessive pronoun; ''it''s'' is the contraction of ''it is''.', 'medium', '184', 'original', 'Editing/Omission', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd381f0409', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd381f04', 'Sentence: ''He is looking forward to meet you.'' Identify the error and select the correct replacement.', 'multiple_choice', '["He is looking forward to meeting you.", "He is looking forward for meeting you.", "No error", "He is looking forward to met you."]', 0, NULL, 1, 'The phrase ''looking forward to'' takes a gerund (''meeting'') as its object.', 'medium', '184', 'original', 'Editing/Omission', NULL, NULL),
('f0eebc99-9c0b-4ef8-bb6d-b9bd382f0000', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd382f00', 'You are Karan/Kiran, residing at 12, Mall Road, Shimla. Write a letter to the Editor of a national daily expressing your concern about the increasing traffic congestion in hill stations during the summer holiday season, leading to pollution and local inconvenience.', 'letter_writing', NULL, NULL, NULL, 5, NULL, 'hard', '184', 'original', 'Writing Skills: Letter Writing Assessment', '12, Mall Road
Shimla

24 June 2026

The Editor
The Daily Chronicle
New Delhi

Subject: Rising traffic congestion and pollution in hill stations

Sir

Through the columns of your widely circulated newspaper, I wish to voice my deep concern regarding the alarming increase in traffic congestion and environmental degradation in Shimla during the peak summer holidays.

Every summer, a massive influx of tourists visits our town to escape the heat of the plains. While tourism is economically beneficial, the uncontrolled entry of thousands of private vehicles has paralyzed our roads. Local residents face severe daily delays, and the narrow mountain streets are permanently choked. The exhaust fumes have created a thick layer of smog, destroying the clean mountain air. Furthermore, tourist littering is choking our drainage systems, ruining the scenic beauty.

To resolve this, local authorities must restrict the entry of outside private vehicles, set up satellite parking lots at the borders, and run electric tourist shuttles. I hope this letter prompts the administration to take immediate steps to preserve our fragile ecosystem.

Yours faithfully
Kiran', 'Format - 1 Mark: Includes Sender''s address, Date, Receiver''s address, Subject, Salutation, Complimentary close, and Name.
Content - 2 Marks: Highlights the tourist influx, mentions congestion and smog, details local inconvenience, and suggests satellite parking and electric shuttles.
Expression - 2 Marks: Evaluates grammatical accuracy, appropriate vocabulary (fragile ecosystem, choked streets), and coherent paragraph transitions.'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd382f0100', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd382f01', 'Write an analytical paragraph in 100-120 words analyzing the preference of high school students for various learning methods. The data shows: Online Classes (35% in 2024, 20% in 2026), Offline Classes (50% in 2024, 65% in 2026), Hybrid Model (15% in 2024, 15% in 2026). Give the paragraph a suitable title.', 'paragraph_writing', NULL, NULL, NULL, 5, NULL, 'hard', '184', 'original', 'Writing Skills: Analytical Paragraph Assessment', 'Student Preferences for Learning Methods (2024-2026)

The comparative data illustrates the shifting preferences of high school students regarding learning methods between the years 2024 and 2026. The three modes analyzed are online classes, offline classes, and the hybrid model.

In 2024, offline classes were the most popular choice, chosen by exactly half of the student population (50%). Online classes followed at 35%, while the hybrid model was the least popular at 15%. By 2026, a significant shift occurred. The preference for physical offline classes surged by 15% to reach a peak of 65%. In contrast, the popularity of online learning dropped sharply to 20%. The hybrid model remained completely stable at 15% in both years.

Overall, the data suggests a clear trend: students increasingly prefer traditional physical classrooms for their learning, while support for purely virtual learning continues to decline.', 'Title & Introduction - 1 Mark: Suitable title provided; paraphrases the prompt outlining the three learning modes and years.
Data Comparison - 2 Marks: Highlights the rise in offline classes (50% to 65%), the drop in online classes (35% to 20%), and the stable hybrid rate (15%).
Conclusion & Expression - 2 Marks: Clear concluding statement indicating the general trend; checks grammatical correctness, spelling, and coherence.'),
('f0eebc99-9c0b-4ef8-bb6d-b9bd382f0200', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd382f02', 'Complete the story in 150-200 words starting with the line: ''As I opened the door, a cold breeze rushed in, blowing away the papers on my desk...''', 'story_completion', NULL, NULL, NULL, 5, NULL, 'hard', '184', 'original', 'Writing Skills: Story Completion Assessment', 'The Mysterious Caller

As I opened the door, a cold breeze rushed in, blowing away the papers on my desk. The street outside was pitch dark, illuminated only by a single flickering lamppost. I looked around, but there was no one in sight. 

Just as I was about to close the door, my eyes fell on a small, sealed envelope lying on the welcome mat. It was addressed to me in elegant, golden cursive handwriting. My heart raced with curiosity as I picked it up and walked back inside, securing the door behind me. I tore open the envelope. Inside was a single ticket to London and a note that read: "Your train leaves in exactly one hour. The truth is waiting for you."

Suddenly, my phone buzzed. An unknown number texted me a photo of the golden pocket watch my grandfather had lost thirty years ago. I realized that my quiet, academic life was about to change. Without thinking twice, I grabbed my coat and rushed into the night, heading toward the railway station. The adventure had officially begun.', 'Opening & Plot - 2 Marks: Integrates the opening line smoothly; creates suspense with a mysterious letter and a phone photo of a lost watch.
Coherence & Vocabulary - 2 Marks: Maintains a logical flow, strong adjectives (flickering lamppost, elegant cursive), and past tense consistency.
Title & Resolution - 1 Mark: Includes a suitable title; ends with a compelling cliffhanger resolution.')
ON CONFLICT (id) DO NOTHING;


-- --- FROM FILE db/seed_notes_batch1.sql ---

-- CBSE Class 10 Learning Portal Revision Notes - Batch 1
-- Generated on 2026-06-23
-- Format: Clean SQL with ON CONFLICT (id) DO NOTHING for safe re-runs.

INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380122', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', 'Revision Notes: Electricity', 'note', NULL, NULL,
'# Chapter 11: Electricity

## Chapter Goal
The goal of this chapter is to understand how electric current flows in a circuit, how potential difference drives this flow, what factors control or resist it (Ohm''s Law and Resistivity), how resistors work in different combinations (series and parallel), and how electric current is used to generate heat and power in everyday appliances.

---

## Key Concepts

### 1. Electric Current and Electric Circuit
*   **Electric Current ($I$)**: It is the rate of flow of electric charge through a cross-section of a conductor. In simple words, it is the amount of charge flowing per second.
    $$I = \frac{Q}{t}$$
    Where:
    *   $I$ = Electric Current (in Amperes, $\text{A}$)
    *   $Q$ = Net Charge (in Coulombs, $\text{C}$)
    *   $t$ = Time (in seconds, $\text{s}$)
*   **Unit of Current**: The SI unit of current is **Ampere (A)**. One Ampere is defined as the flow of one Coulomb of charge per second: $1\text{ A} = 1\text{ C/s}$.
*   **Measuring Current**: Current is measured using an **Ammeter**, which must always be connected in **series** in a circuit. It has very low resistance.
*   **Direction of Current**: By convention, the direction of electric current is taken as the direction of flow of positive charges, which is **opposite** to the direction of the flow of electrons (negative charges).

### 2. Electric Potential and Potential Difference
*   **Potential Difference ($V$)**: The electric potential difference between two points in an electric circuit carrying some current is the work done to move a unit charge from one point to the other.
    $$V = \frac{W}{Q}$$
    Where:
    *   $V$ = Potential Difference (in Volts, $\text{V}$)
    *   $W$ = Work Done (in Joules, $\text{J}$)
    *   $Q$ = Charge (in Coulombs, $\text{C}$)
*   **Unit of Potential Difference**: The SI unit is **Volt (V)**. One Volt is the potential difference between two points when 1 Joule of work is done to move a charge of 1 Coulomb: $1\text{ V} = 1\text{ J/C}$.
*   **Measuring Voltage**: It is measured using a **Voltmeter**, which is always connected in **parallel** across the points where potential difference is to be measured. It has very high resistance.

> [!NOTE]
> A cell or a battery is the source of potential difference in a circuit. Chemical reactions inside the cell maintain this potential difference, forcing charges to move.

### 3. Ohm''s Law and Resistance
*   **Ohm''s Law**: In 1827, Georg Simon Ohm stated that the potential difference ($V$) across the ends of a given metallic wire in an electric circuit is directly proportional to the current ($I$) flowing through it, provided its temperature remains constant.
    $$V \propto I \implies V = IR$$
*   **Resistance ($R$)**: It is the property of a conductor to resist the flow of charges through it. Its SI unit is **Ohm ($\Omega$)**.
    $$R = \frac{V}{I}$$
*   **One Ohm ($1\ \Omega$)**: If the potential difference across a conductor is $1\text{ V}$ and the current is $1\text{ A}$, the resistance is $1\ \Omega$: $1\ \Omega = 1\text{ V}/1\text{ A}$.
*   **Current and Resistance**: Current is inversely proportional to resistance ($I = V/R$). If resistance is doubled, current is halved. A component used to regulate current without changing the voltage is called a **variable resistance** or **rheostat**.

### 4. Factors on which the Resistance of a Conductor Depends
The resistance ($R$) of a uniform metallic conductor depends on:
1.  **Length ($l$)**: Resistance is directly proportional to length ($R \propto l$). Doubling the length doubles the resistance.
2.  **Area of Cross-section ($A$)**: Resistance is inversely proportional to cross-sectional area ($R \propto 1/A$). A thick wire has less resistance than a thin wire.
3.  **Nature of Material**: Different materials offer different resistances.
4.  **Temperature**: Resistance of metals increases with temperature.

Combining these factors:
$$R = \rho \frac{l}{A}$$
Where **$\rho$ (rho)** is the **electrical resistivity** of the material.
*   **SI Unit of Resistivity**: **Ohm-meter ($\Omega\text{ m}$)**.
*   Resistivity is a characteristic property of the material. Metals and alloys have low resistivity ($10^{-8}\ \Omega\text{ m}$ to $10^{-6}\ \Omega\text{ m}$), making them good conductors. Insulators like rubber and glass have high resistivity ($10^{12}\ \Omega\text{ m}$ to $10^{17}\ \Omega\text{ m}$).

> [!IMPORTANT]
> Alloys have higher resistivity than their constituent metals. They do not oxidise (burn) easily at high temperatures. Therefore, they are commonly used in heating elements of appliances like electric irons and toasters.

### 5. Combination of Resistors
*   **Resistors in Series**: When resistors are joined end-to-end:
    *   The **current ($I$) remains the same** through all resistors.
    *   The total potential difference ($V$) is the sum of individual potential differences: $V = V_1 + V_2 + V_3$.
    *   The equivalent resistance ($R_s$) is the sum of individual resistances:
        $$R_s = R_1 + R_2 + R_3$$
*   **Resistors in Parallel**: When resistors are connected across the same two points:
    *   The **potential difference ($V$) remains the same** across all resistors.
    *   The total current ($I$) is the sum of separate currents through each branch: $I = I_1 + I_2 + I_3$.
    *   The reciprocal of equivalent resistance ($R_p$) is the sum of reciprocals of individual resistances:
        $$\frac{1}{R_p} = \frac{1}{R_1} + \frac{1}{R_2} + \frac{1}{R_3}$$

> [!WARNING]
> In a series circuit, if one component fails, the circuit breaks and none of the components work. In a parallel circuit, each appliance has its own switch and gets the same voltage, which is why domestic wiring is always in parallel.

### 6. Heating Effect of Electric Current and Power
*   **Heating Effect**: When current flows through a purely resistive conductor, the electrical energy is entirely converted into heat energy.
*   **Joule''s Law of Heating**: The heat ($H$) produced in a resistor is:
    1.  Directly proportional to the square of current ($I^2$) for a given resistance.
    2.  Directly proportional to resistance ($R$) for a given current.
    3.  Directly proportional to the time ($t$) for which current flows.
    $$H = I^2 R t$$
*   **Applications of Heating Effect**:
    *   **Electric Bulb**: Uses a **tungsten** filament to produce light. Tungsten has a very high melting point ($3380^\circ\text{C}$), so it does not melt even when white-hot. Bulbs are filled with inactive nitrogen/argon to prolong filament life.
    *   **Electric Fuse**: A safety device placed in **series** with appliances. It has a low melting point. If current exceeds a safe limit, the fuse wire heats up, melts, and breaks the circuit, protecting appliances.
*   **Electric Power ($P$)**: The rate at which electrical energy is consumed in a circuit.
    $$P = VI = I^2R = \frac{V^2}{R}$$
    *   **Unit**: **Watt (W)**. $1\text{ W} = 1\text{ V} \times 1\text{ A}$.
    *   **Commercial Unit of Energy**: **Kilowatt-hour ($\text{kW h}$)**, also called a ''unit''.
        $$1\text{ kW h} = 1000\text{ W} \times 3600\text{ s} = 3.6 \times 10^6\text{ Joules (J)}$$

---

## Important Formulas

| Physical Quantity | Symbol | Formula | SI Unit |
| :--- | :--- | :--- | :--- |
| Electric Current | $I$ | $I = Q/t$ | Ampere ($\text{A}$) |
| Potential Difference | $V$ | $V = W/Q$ | Volt ($\text{V}$) |
| Ohm''s Law | $V$ | $V = IR$ | Volt ($\text{V}$) |
| Resistance | $R$ | $R = \rho (l/A)$ | Ohm ($\Omega$) |
| Series Resistance | $R_s$ | $R_s = R_1 + R_2 + R_3$ | Ohm ($\Omega$) |
| Parallel Resistance | $R_p$ | $1/R_p = 1/R_1 + 1/R_2 + 1/R_3$ | Ohm ($\Omega$) |
| Joule Heat | $H$ | $H = I^2 R t = V I t$ | Joule ($\text{J}$) |
| Electric Power | $P$ | $P = VI = I^2 R = V^2/R$ | Watt ($\text{W}$) |
| Electrical Energy | $E$ | $E = P \times t$ | Joule ($\text{J}$) or $\text{kW h}$ |

---

## Common Exam Mistakes

*   **Ammeter vs. Voltmeter Connections**: Students often reverse their connections. Remember: **Ammeter** is always in **series** (low resistance); **Voltmeter** is always in **parallel** (high resistance).
*   **Confusing Resistance and Resistivity**: Resistance changes when a wire is stretched or cut (since length and area change). However, **resistivity remains constant** because it depends only on the material type and temperature.
*   **Time Unit Errors**: In heating formulas ($H = I^2 R t$), time must always be in **seconds**. If the question gives time in minutes or hours, convert it first!
*   **Domestic Circuit Layout**: Students often write that domestic circuits are connected in series. They must be in **parallel** so that each appliance gets $220\text{ V}$ and can operate independently.

---

## Quick Revision Summary

*   Electric current is the flow of charge: $I = Q/t$ (measured in Amperes).
*   Potential difference is work done per unit charge: $V = W/Q$ (measured in Volts).
*   Ohm''s law states $V = IR$ at constant temperature.
*   Resistance depends on length, thickness, and material: $R = \rho l/A$. Resistivity ($\rho$) is constant for a material.
*   Series connection increases total resistance ($R_s = \sum R$). Parallel connection decreases it ($1/R_p = \sum 1/R$).
*   Joule''s heating formula is $H = I^2 R t$. Used in iron, heater, fuse, and bulbs (tungsten).
*   Electric power is rate of energy consumption: $P = VI = I^2R$.
*   Commercial energy unit is $1\text{ kW h} = 3.6 \times 10^6\text{ J}$.
', TRUE, 3),

('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380080', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', 'Revision Notes: Nationalism in India', 'note', NULL, NULL,
'# Chapter 1: Nationalism in India

## Chapter Goal
The goal of this chapter is to understand how the spirit of nationalism grew in India through the anti-colonial struggle. Students will learn about the impact of the First World War, the concept of Satyagraha, major movements led by Mahatma Gandhi (Non-Cooperation and Civil Disobedience), and the cultural symbols that helped create a sense of collective belonging among Indians.

---

## Key Concepts

### 1. First World War and its Impact
The First World War (1914–1918) created a new economic and political situation in India under British rule:
*   **Defense Expenditure**: British government increased defense spending, leading to war loans and higher taxes (customs duties were raised and income tax was introduced).
*   **Price Rise**: Prices of everyday goods doubled between 1913 and 1918, causing extreme hardship for common people.
*   **Forced Recruitment**: Villages were forced to supply young men as soldiers for the British army, leading to widespread anger.
*   **Famines and Epidemics**: In 1918-19 and 1920-21, crops failed in many parts of India, resulting in acute food shortages. This was followed by an influenza epidemic. About 12 to 13 million people died (Census of 1921).

### 2. The Idea of Satyagraha
*   Mahatma Gandhi returned to India from South Africa in **January 1915**, where he had successfully fought racist laws using a new method of mass struggle called **Satyagraha**.
*   **Satyagraha Philosophy**: It emphasized the power of truth and the need to search for truth. It suggested that if the cause is true and the struggle is against injustice, physical force is not needed. A satyagrahi can win through non-violence by appealing to the conscience of the oppressor.
*   **Early Local Satyagrahas in India**:
    1.  **1917 (Champaran, Bihar)**: To inspire peasants to struggle against the oppressive indigo plantation system.
    2.  **1918 (Kheda, Gujarat)**: To support peasants who could not pay revenue due to crop failure and plague. They demanded revenue collection relaxation.
    3.  **1918 (Ahmedabad, Gujarat)**: To support cotton mill workers striking for better wages.

### 3. Rowlatt Act and Jallianwala Bagh (1919)
*   **Rowlatt Act (1919)**: Hurriedly passed by the Imperial Legislative Council. It gave the government enormous power to repress political activity and allowed the detention of political prisoners without trial for up to two years.
*   **Rowlatt Satyagraha**: Gandhiji launched non-violent civil disobedience starting with a *hartal* (strike) on **6 April 1919**.
*   **Jallianwala Bagh Massacre (13 April 1919)**: A large crowd gathered in the enclosed ground of Jallianwala Bagh in Amritsar. Some protested the Rowlatt Act; others attended the Baisakhi fair. General Dyer blocked the exit gates and opened fire on the peaceful crowd, killing hundreds. He stated his goal was to "produce a moral effect" and fill satyagrahis with terror and awe.
*   Following widespread violence in response, Gandhiji called off the Rowlatt Satyagraha movement.

### 4. Non-Cooperation Movement (1921–1922)
*   **The Idea**: In his book *Hind Swaraj* (1909), Gandhiji wrote that British rule survived in India because of the cooperation of Indians. If Indians refused to cooperate, British rule would collapse and Swaraj would arrive.
*   **Khilafat Issue**: To bring Hindus and Muslims together, Gandhiji supported the Khilafat movement. The movement was started by brothers **Muhammad Ali and Shaukat Ali** to protect the spiritual head of the Islamic world (the Khalifa/Ottoman Emperor) from harsh treaty conditions after WWI.
*   **Adoption**: Adopted at the **Nagpur Congress session in December 1920**. The Non-Cooperation-Khilafat Movement began in January 1921.
*   **Phases and Strands**:
    *   **In Towns**: Middle-class students left government schools, lawyers gave up practice, and foreign goods were boycotted. Foreign cloth imports halved.
    *   **In Countryside**: Peasants in Awadh, led by **Baba Ramchandra**, rebelled against high rents of landlords. In Gudem Hills of Andhra Pradesh, tribals led by **Alluri Sitarama Raju** launched militant guerrilla warfare against forest laws.
    *   **In Plantations**: Assam plantation workers defied the Inland Emigration Act of 1859, which prevented them from leaving tea gardens without permission, and tried to head home.
*   **Withdrawal**: In **February 1922**, a peaceful crowd at **Chauri Chaura** (Gorakhpur) clashed with police and burned down a police station, killing 22 policemen. Hearing this, Gandhiji immediately withdrew the Non-Cooperation Movement because it was turning violent.

### 5. Towards Civil Disobedience (1930–1934)
*   **Swaraj Party**: Formed by **C. R. Das and Motilal Nehru** within the Congress to participate in council elections and oppose British policies from within.
*   **Simon Commission (1928)**: A British statutory commission led by Sir John Simon. It had **no Indian members**. It was greeted with protests and the slogan "Go back Simon". Lala Lajpat Rai was assaulted during a protest and later died.
*   **Purna Swaraj (December 1929)**: Under Jawaharlal Nehru''s presidency, the Lahore Congress session formalized the demand for ''Purna Swaraj'' (Complete Independence). **26 January 1930** was declared Independence Day.
*   **Salt March (Dandi March)**: Salt was chosen as a symbol of unity because it was consumed by rich and poor alike.
    *   On 31 January 1930, Gandhiji sent 11 demands to Viceroy Irwin, including the abolition of the salt tax.
    *   When Irwin refused, Gandhiji started the march on **12 March 1930** with **78 trusted volunteers**.
    *   They walked **240 miles** from Sabarmati Ashram to the coastal town of Dandi (Gujarat) in **24 days** (10 miles a day).
    *   On **6 April 1930**, Gandhiji reached Dandi, manufactured salt by boiling seawater, and broke the salt law. This launched the Civil Disobedience Movement.
*   **Gandhi-Irwin Pact (5 March 1931)**: Gandhiji called off the movement and agreed to attend the Second Round Table Conference in London. In return, the government agreed to release political prisoners.
*   **Failure and Relaunch**: The London conference failed. Gandhiji returned to find leaders like Jawaharlal Nehru and Abdul Ghaffar Khan in jail, and the Congress declared illegal. He relaunched the movement, but it lost momentum by 1934.
*   **Poona Pact (September 1932)**: Dr. B. R. Ambedkar, who organized Dalits into the **Depressed Classes Association (1930)**, clashed with Gandhiji at the Round Table Conference by demanding separate electorates. Gandhiji went on a fast unto death, arguing separate electorates would divide Hindu society. Ambedkar agreed to general electorates with reserved seats for Depressed Classes, signing the Poona Pact.

### 6. The Sense of Collective Belonging
Nationalism grew through shared struggles and cultural processes:
*   **Bharat Mata**: The visual image of the nation was first created by **Bankim Chandra Chattopadhyay** in the 1870s, who also wrote ''Vande Mataram'' (later included in his novel *Anandamath*). It was beautifully painted by **Abanindranath Tagore** in 1905 as a calm, ascetic, and spiritual mother figure.
*   **Folklore**: Nationalists collected folk songs and legends to preserve traditional culture. In Madras, **Natesa Sastri** published a massive four-volume collection of Tamil folktales, *The Folklore of Southern India*.
*   **National Flag**:
    *   *Swadeshi Flag (Bengal)*: Tricolour (red, green, yellow) with 8 lotuses (representing 8 provinces) and a crescent moon.
    *   *Swaraj Flag (1921)*: Designed by Gandhiji. Tricolour (red, green, white) with a spinning wheel in the center representing self-help.
*   **Reinterpretation of History**: Indians wrote about ancient times when art, science, mathematics, and trade flourished, to counter the British view of Indians as backward.

---

## Important Dates

| Year / Date | Event | Significance |
| :--- | :--- | :--- |
| **January 1915** | Gandhi Returns to India | Returns from South Africa with the technique of Satyagraha. |
| **1917** | Champaran Satyagraha | First local Satyagraha in Bihar against the indigo system. |
| **1918** | Kheda & Ahmedabad Satyagrahas | Peasants'' struggle in Kheda; mill workers'' strike in Ahmedabad. |
| **March 1919** | Khilafat Committee Formed | Formed in Bombay to defend the Khalifa''s temporal power. |
| **6 April 1919** | Rowlatt Satyagraha Launch | Nationwide hartal launched against the Rowlatt Act. |
| **13 April 1919** | Jallianwala Bagh Massacre | British General Dyer fires on peaceful gatherers in Amritsar. |
| **December 1920** | Nagpur Congress Session | Non-Cooperation program is formally adopted by the Congress. |
| **January 1921** | Non-Cooperation Started | Non-Cooperation-Khilafat movement begins. |
| **February 1922** | Chauri Chaura Incident | Violent clash leads to withdrawal of Non-Cooperation. |
| **1928** | Simon Commission Arrives | Boycotted by Indian parties with ''Go Back Simon'' slogan. |
| **December 1929** | Lahore Congress Session | Demand for ''Purna Swaraj'' (Complete Independence) is adopted. |
| **26 January 1930** | Independence Day Pledge | First celebrated as Independence Day under Lahore resolution. |
| **12 Mar - 6 Apr 1930** | Salt March (Dandi March) | Gandhi walks 240 miles to break salt law, starting Civil Disobedience. |
| **5 March 1931** | Gandhi-Irwin Pact | Civil Disobedience called off; Gandhi agrees to London conference. |
| **September 1932** | Poona Pact Signed | Reserved seats for Dalits (Depressed Classes) in general electorate. |
| **1934** | Movement Lost Momentum | Civil Disobedience Movement completely loses steam. |

---

## Common Exam Mistakes

*   **Non-Cooperation vs. Civil Disobedience**: Students often mix them up. Remember: **Non-Cooperation** (1921) was about refusing to cooperate with the government (boycotting schools, courts, goods). **Civil Disobedience** (1930) went a step further, where people actively broke colonial laws (like making salt, refusing to pay tax).
*   **Who formed the Swaraj Party?**: Students often think it was Jawaharlal Nehru. It was actually formed by **Motilal Nehru** (his father) and **C. R. Das**. Jawaharlal Nehru wanted more radical mass struggle and did not support returning to council politics.
*   **The Colors of the Flags**: Do not confuse the two tricolour flags. The Bengal Swadeshi flag had **red, green, and yellow**. Gandhiji''s 1921 Swaraj flag had **red, green, and white** with a spinning wheel.
*   **Poona Pact Parties**: Students often write that it was signed between British and Ambedkar. It was actually signed between **Ambedkar** (on behalf of Depressed Classes) and **Congress/Mahatma Gandhi** (representing general Hindus).

---

## Quick Revision Summary

*   WWI created extreme economic distress in India, setting the stage for national movements.
*   Gandhian Satyagraha is based on truth and non-violence. Early successes were Champaran, Kheda, and Ahmedabad.
*   Rowlatt Act (detention without trial) led to Satyagraha and the tragic Jallianwala Bagh Massacre on 13 April 1919.
*   The Non-Cooperation-Khilafat movement united Hindus and Muslims (1921-22). It was stopped after the Chauri Chaura violence in 1922.
*   Simon Commission (1928) had no Indian members, uniting all political parties in opposition.
*   Lahore Congress (1929) demanded Purna Swaraj. Independence Day was set as 26 January 1930.
*   Dandi Salt March (12 March to 6 April 1930) started the Civil Disobedience Movement.
*   Gandhi-Irwin Pact led to Gandhi attending the 2nd Round Table Conference, but negotiations failed.
*   Poona Pact (Sept 1932) resolved separate electorate disputes by granting reserved seats to Depressed Classes.
*   Nationalism spread through cultural identity: the image of Bharat Mata, folklore revival (like Natesa Sastri''s work), tricolour flags, and pride in ancient Indian history.
', TRUE, 2)
ON CONFLICT (id) DO NOTHING;


-- --- FROM FILE db/seed_notes_v2.sql ---

-- CBSE Class 10 Learning Portal Revision Notes - V2 (Standardized)
-- Generated on 2026-06-23
-- Format: Clean SQL with ON CONFLICT (id) DO UPDATE to overwrite notes.

-- 1. Real Numbers Revision Notes
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380009', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380111', 'Revision Notes: Real Numbers', 'note', NULL, NULL,
'# Chapter 1: Real Numbers

## 1. 🎯 Chapter Goal
Learn how to find HCF and LCM using prime factors. Also learn why some numbers are irrational.

## 2. 🪝 Hook
Look at the numbers around you. You use them to count and measure. But did you know that some numbers are impossible to write down as simple fractions? Let''s discover their secrets!

## 3. 📖 Concept 1: Prime Factorization
We can split numbers into two main groups. A **[JARGON: Prime Number | A number greater than 1 that you can only divide by 1 and itself | 2, 3, 5, and 7 are prime numbers]** (a number greater than 1 that only has two factors: 1 and itself) has no other factors. A **[JARGON: Composite Number | A number that you can divide by numbers other than 1 and itself | 4, 6, 8, 9, and 10 are composite numbers]** (a number that you can make by multiplying two smaller whole numbers) has other factors.

We can break down any composite number. We write it as a product of prime numbers. We call this **[JARGON: Prime Factorization | Breaking down a composite number into a product of prime numbers | The prime factorization of 12 is 2 x 2 x 3]** (finding which prime numbers multiply together to make the original number).

The **[JARGON: Fundamental Theorem of Arithmetic | Every composite number can be written as a product of prime numbers in only one way, except for the order | 30 is always 2 x 3 x 5]** (every composite number is made of unique prime building blocks) states that this prime factorization is unique. The order of factors does not matter.
- Example: $32760 = 2^3 \times 3^2 \times 5 \times 7 \times 13$.

## 4. 📖 Concept 2: HCF and LCM
We use prime factors to find HCF and LCM.
- **[JARGON: HCF | The largest common number that divides two or more numbers | The HCF of 6 and 20 is 2]** (Highest Common Factor, which is the biggest shared factor) is the product of the smallest power of each common prime factor.
- **[JARGON: LCM | The smallest common multiple that two or more numbers share | The LCM of 6 and 20 is 60]** (Lowest Common Multiple, which is the smallest shared multiple) is the product of the greatest power of each prime factor.

### Worked Example:
Find HCF and LCM of 6 and 20.
- $6 = 2^1 \times 3^1$
- $20 = 2^2 \times 5^1$
- HCF = $2^1 = 2$
- LCM = $2^2 \times 3^1 \times 5^1 = 60$

### Important Formula:
For any two positive integers $a$ and $b$:
$$\text{HCF}(a, b) \times \text{LCM}(a, b) = a \times b$$
- Example check: $\text{HCF}(6, 20) \times \text{LCM}(6, 20) = 2 \times 60 = 120$. Also, $6 \times 20 = 120$. The values match!

## 5. 📖 Concept 3: Irrational Numbers
An **[JARGON: Irrational Number | A number that you cannot write as a simple fraction | Pi and the square root of 2 are irrational numbers]** (a number that cannot be written as a fraction) cannot be written as a fraction $\frac{p}{q}$ with coprime integers. **[JARGON: Coprime Numbers | Two numbers that only share 1 as a common factor | 8 and 15 are coprime because their only common factor is 1]** (numbers that do not share any common factor other than 1) share no common factor other than 1.

We use a **[JARGON: Proof by Contradiction | A way to prove a statement by showing that assuming it is false leads to an impossible result | We prove the square root of 2 is irrational by assuming it is rational and finding a mistake]** (proving something true by showing that the opposite is impossible) to prove numbers are irrational.

### Theorem:
Let $p$ be a prime number. If $p$ divides $a^2$, then $p$ divides $a$.

### Proof Steps for $\sqrt{2}$:
1. Assume $\sqrt{2}$ is rational, so $\sqrt{2} = \frac{a}{b}$ where $a$ and $b$ are coprime.
2. Square both sides: $2b^2 = a^2$. This means 2 divides $a^2$. So, 2 divides $a$.
3. Write $a = 2c$. Put this back: $2b^2 = 4c^2$. This simplifies to $b^2 = 2c^2$.
4. This means 2 divides $b^2$. So, 2 divides $b$.
5. Now, $a$ and $b$ share a common factor 2. This is a contradiction. They were coprime!
6. So, $\sqrt{2}$ must be irrational.

## 6. ⚠️ Common Mistakes
- Thinking the HCF and LCM formula works for three numbers. It does not!
- Confusing factors with multiples. Factors divide the number. Multiples are what the number multiplies into.
- Forgetting to show that both numbers share a factor when writing the proof by contradiction.

## 7. 💡 Memory Tricks
- **HCF is Small, LCM is Tall**: HCF uses the smallest power of prime factors. LCM uses the greatest power.
- **Coprime are Strangers**: They do not share any friends (factors) except the number 1.

## 8. 📝 Quick Practice
- **Question 1**: Find the HCF of 96 and 404 using prime factorization.
  - *Answer*: $96 = 2^5 \times 3$. $404 = 2^2 \times 101$. The only common prime is 2. The smallest power is $2^2 = 4$. So, the HCF is 4.
- **Question 2**: If $\text{HCF}(a, b) = 4$ and $\text{LCM}(a, b) = 24$, and $a = 8$, find $b$.
  - *Answer*: Use the formula: $\text{HCF} \times \text{LCM} = a \times b$. So, $4 \times 24 = 8 \times b \implies 96 = 8b \implies b = 12$.

## 9. 🎓 Board Tips
- Examiners always ask you to prove that $\sqrt{3}$ or $5 - \sqrt{3}$ is irrational. Memorize the steps.
- Always write the prime factorization clearly in power form first. This avoids simple math errors.

## 10. 🔄 One-Minute Revision
- Prime factors are the building blocks of composite numbers.
- Every composite number has only one unique set of prime factors.
- HCF uses the smallest powers of shared prime factors.
- LCM uses the greatest powers of all prime factors.
- The product of two numbers is equal to the product of their HCF and LCM.

## 11. 🎬 Comic Recap
```
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "Priya: I am trying to share 6      │
│         cookies and 20 candies. What is the│
│         largest group I can share them     │
│         with?"                             │
│ Rahul: "Rahul: That is the HCF! Use prime  │
│         factorization. You get 2."         │
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "Priya: And when do they meet if    │
│         they repeat?"                      │
│ Rahul: "Rahul: That is the LCM! For 6 and  │
│         20, the LCM is 60."                │
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "Priya: What about the square root  │
│         of 2? Can I write it as a          │
│         fraction?"                         │
│ Rahul: "Rahul: No, it is irrational! If you│
│         try, you will get a                │
│         contradiction."                    │
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ HCF is the smallest power, LCM is the      │
│ greatest power.                            │
│ HCF(a,b) * LCM(a,b) = a * b.               │
└────────────────────────────────────────────┘
```', TRUE, 3)
ON CONFLICT (id) DO UPDATE SET note_content = EXCLUDED.note_content;


-- 2. Chemical Reactions Revision Notes
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380005', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380221', 'Revision Notes: Chemical Reactions', 'note', NULL, NULL,
'# Chapter 1: Chemical Reactions and Equations

## 1. 🎯 Chapter Goal
Learn how to write and balance chemical equations. Learn the different types of chemical reactions.

## 2. 🪝 Hook
Leave a shiny iron nail outside in the rain. In a few days, it turns brown and flaky. Why does this happen? The iron reacted with air and water. Let''s explore how substances change!

## 3. 📖 Concept 1: What is a Chemical Reaction?
A **[JARGON: Chemical Reaction | A process where chemical bonds break and form to make new substances | Iron rusting is a chemical reaction]** (a process that changes one set of chemicals into another) turns starting materials into new materials.

We call the starting substances **[JARGON: Reactants | The starting substances in a chemical reaction that change into new substances | In making water, hydrogen and oxygen are the reactants]** (the starting chemicals). We call the new substances **[JARGON: Products | The new substances formed during a chemical reaction | In making water, water is the product]** (the end chemicals).

We can spot a reaction by:
- Change in state (e.g., liquid to gas).
- Change in color.
- Gas release.
- Temperature change.

## 4. 📖 Concept 2: Balancing Chemical Equations
A chemical equation shows the reactants and products. We must balance it. This satisfies the **[JARGON: Law of Conservation of Mass | Mass cannot be created or destroyed in a chemical reaction | Total mass of reactants must equal total mass of products]** (the rule that total mass does not change). The total atoms on both sides must match.

To balance an equation:
1. Write the raw equation: $Mg + O_2 \rightarrow MgO$.
2. Count the atoms of each element on both sides.
3. Put numbers in front of formulas, not inside them.
4. Balanced: $2Mg + O_2 \rightarrow 2MgO$.
Magnesium burns with a bright white flame to form white magnesium oxide powder.

## 5. 📖 Concept 3: Types of Chemical Reactions
Reactions happen in different ways:
- **[JARGON: Combination Reaction | A reaction where two or more reactants join to form one single product | Burning magnesium to form magnesium oxide]** (joining together): Two reactants join into one product. $2Mg + O_2 \rightarrow 2MgO$.
- **[JARGON: Decomposition Reaction | A reaction where a single reactant breaks down into two or more products | Heating calcium carbonate to get calcium oxide and carbon dioxide]** (breaking apart): One reactant splits into two or more products. $CaCO_3 \rightarrow CaO + CO_2$.
- **[JARGON: Displacement Reaction | A reaction where a more reactive element pushes out a less reactive element | Iron nail in copper sulfate solution]** (pushing out): A stronger element replaces a weaker one. $Fe + CuSO_4 \rightarrow FeSO_4 + Cu$. The blue copper solution turns green!
- **[JARGON: Double Displacement Reaction | A reaction where two compounds swap ions to form new compounds | Barium chloride reacting with sodium sulfate]** (swapping partners): Reactants swap ions. $Na_2SO_4 + BaCl_2 \rightarrow BaSO_4 + 2NaCl$.
- **[JARGON: Exothermic Reaction | A reaction that releases heat energy into the surroundings | Respiration inside our cells]** (heat releasing): Releases heat. Example: respiration.
- **[JARGON: Endothermic Reaction | A reaction that absorbs heat energy from the surroundings | Photosynthesis in plants]** (heat absorbing): Absorbs heat. Example: photosynthesis.

## 6. ⚠️ Common Mistakes
- Balancing by changing chemical formulas (e.g., writing $H_2O_2$ instead of $2H_2O$).
- Forgetting to write physical states like solid (s), liquid (l), gas (g), and aqueous (aq).
- Confusing single displacement with double displacement.

## 7. 💡 Memory Tricks
- **Combination**: Two friends join hands to form a team.
- **Decomposition**: A team splits into separate friends.
- **Displacement**: A stronger kid takes a seat from a weaker kid.
- **Double Displacement**: Two couples swap partners to dance.

## 8. 📝 Quick Practice
- **Question 1**: What type of reaction is $2H_2 + O_2 \rightarrow 2H_2O$?
  - *Answer*: Combination reaction. Two reactants join to form one product.
- **Question 2**: Balance this equation: $H_2 + Cl_2 \rightarrow HCl$.
  - *Answer*: $H_2 + Cl_2 \rightarrow 2HCl$.

## 9. 🎓 Board Tips
- Always clean the magnesium ribbon with sandpaper before burning it. This removes the protective oxide layer on its surface.
- Remember the color changes! Iron in copper sulfate turns the blue solution pale green.

## 10. 🔄 One-Minute Revision
- Chemical reactions turn reactants into products.
- You must balance equations to show that mass is conserved.
- Combination joins elements; decomposition breaks them down.
- Displacement swaps elements based on how reactive they are.
- Exothermic reactions release heat; endothermic reactions absorb heat.

## 11. 🎬 Comic Recap
```
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "Priya: Why did the blue copper     │
│         solution turn pale green?"         │
│ Rahul: "Rahul: The iron nail pushed out    │
│         the copper! That is a              │
│         displacement reaction."            │
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "Priya: And why do we balance       │
│         equations anyway?"                 │
│ Rahul: "Rahul: Because mass cannot be      │
│         created or destroyed. We must have │
│         equal atoms on both sides."        │
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "Priya: Respiration releases        │
│         energy. Is that endothermic?"      │
│ Rahul: "Rahul: No, it releases heat, so it │
│         is exothermic!"                    │
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ Reactants turn into products.              │
│ Always balance the atoms on both sides.    │
└────────────────────────────────────────────┘
```', TRUE, 3)
ON CONFLICT (id) DO UPDATE SET note_content = EXCLUDED.note_content;


-- 3. Polynomials Revision Notes
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380023', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380112', 'Revision Notes: Polynomials', 'note', NULL, NULL,
'# Chapter 2: Polynomials

## 1. 🎯 Chapter Goal
Learn what polynomials are. Find their zeroes and understand what they look like on a graph.

## 2. 🪝 Hook
Imagine throwing a basketball. It rises, curves, and falls. Can we use math to describe this beautiful path? Yes, we use polynomials! Let''s see how they work.

## 3. 📖 Concept 1: What is a Polynomial?
A **[JARGON: Polynomial | An expression with variables and coefficients that uses only addition, subtraction, multiplication, and non-negative integer exponents | 2x^2 - 3x + 4 is a polynomial]** (a math expression with variables and positive power exponents) has terms with variable powers. These powers must be whole numbers.

The **[JARGON: Degree of Polynomial | The highest power of the variable in the polynomial | In 3x^2 + 5, the degree is 2]** (the highest power of x) determines the type of polynomial:
- Linear Polynomial: Degree is 1. Example: $2x - 3$.
- Quadratic Polynomial: Degree is 2. Example: $x^2 - 3x - 4$.
- Cubic Polynomial: Degree is 3. Example: $x^3 - 4x$.

A **[JARGON: Zero of a Polynomial | A number that makes the value of the polynomial equal to zero | If p(x) = x - 2, then 2 is a zero because p(2) = 0]** (a value that makes the expression zero) is a number $k$ where $p(k) = 0$.

## 4. 📖 Concept 2: Geometrical Meaning of Zeroes
The zeroes of a polynomial $p(x)$ are the x-coordinates where the graph of $y = p(x)$ crosses the x-axis.

A quadratic graph is a U-shaped curve. We call it a **[JARGON: Parabola | A U-shaped curve that represents a quadratic polynomial on a graph | The path of a thrown ball is a parabola]** (a U-shaped curve).
- The parabola opens upward if the coefficient of $x^2$ is positive.
- The parabola opens downward if the coefficient of $x^2$ is negative.

A polynomial of degree $n$ has at most $n$ zeroes. This means its graph crosses the x-axis at most $n$ times.

## 5. 📖 Concept 3: Relationship between Zeroes and Coefficients
For a quadratic polynomial $ax^2 + bx + c$ with zeroes $\alpha$ and $\beta$:
- **Sum of zeroes**: $\alpha + \beta = -\frac{b}{a} = -\frac{\text{Coefficient of } x}{\text{Coefficient of } x^2}$
- **Product of zeroes**: $\alpha\beta = \frac{c}{a} = \frac{\text{Constant term}}{\text{Coefficient of } x^2}$

If you know the sum ($S$) and product ($P$), you can build the polynomial:
$$x^2 - Sx + P$$

## 6. ⚠️ Common Mistakes
- Forgetting the negative sign in the sum formula: $\alpha + \beta = -b/a$.
- Counting y-axis intercepts as zeroes. Zeroes are only on the x-axis!
- Thinking a polynomial can have negative or fractional powers. Exponents must be whole numbers.

## 7. 💡 Memory Tricks
- **Sum is Negative Boy over Apple** ($\alpha+\beta = -b/a$), **Product is Cat over Apple** ($\alpha\beta = c/a$).
- **Smile and Frown**: Positive $x^2$ makes a happy face curve (opens up). Negative $x^2$ makes a sad face curve (opens down).

## 8. 📝 Quick Practice
- **Question 1**: Find the number of zeroes for a graph that crosses the x-axis 3 times and y-axis 1 time.
  - *Answer*: It crosses the x-axis 3 times, so it has 3 zeroes. We ignore the y-axis intercept.
- **Question 2**: Find the zeroes of $x^2 - 5x + 6$.
  - *Answer*: Split the middle term: $x^2 - 2x - 3x + 6 = 0 \implies (x-2)(x-3) = 0$. The zeroes are 2 and 3.

## 9. 🎓 Board Tips
- Look at the graph questions carefully. Count the points of intersection on the x-axis. This is an easy 1-mark question!
- Always verify your factorized zeroes using the sum and product formulas.

## 10. 🔄 One-Minute Revision
- The degree of a polynomial is the highest exponent power of its variable.
- Graph crossings on the x-axis represent the zeroes.
- A quadratic polynomial graph is a parabola.
- Sum of zeroes is $-b/a$. Product of zeroes is $c/a$.
- A polynomial of degree $n$ has at most $n$ zeroes.

## 11. 🎬 Comic Recap
```
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "Priya: Look at this graph! It      │
│         looks like a giant U."             │
│ Rahul: "Rahul: That is a parabola! It      │
│         shows a quadratic polynomial."     │
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "Priya: It crosses the x-axis at    │
│         two points. What does that mean?"  │
│ Rahul: "Rahul: Those are the zeroes of the │
│         polynomial!"                       │
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "Priya: How do we find the sum of   │
│         these zeroes?"                     │
│ Rahul: "Rahul: Just use -b/a. And for the  │
│         product, use c/a."                 │
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ Zeroes are x-intercepts.                   │
│ Sum = -b/a, Product = c/a.                 │
└────────────────────────────────────────────┘
```', TRUE, 3)
ON CONFLICT (id) DO UPDATE SET note_content = EXCLUDED.note_content;


-- 4. Electricity Revision Notes
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380122', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', 'Revision Notes: Electricity', 'note', NULL, NULL,
'# Chapter 11: Electricity

## 1. 🎯 Chapter Goal
Master the principles of electricity, from the fundamental flow of charges to the practical applications of heating effects. Understand circuit diagrams, Ohm''s law, and calculate resistance in series and parallel combinations.

## 2. 🪝 Hook
We are surrounded by electricity! Every time you turn on your TV, charge your phone, or use a toaster, invisible electrons are rushing through wires at incredible speeds. But how do we control this invisible river of energy?

## 3. 📖 Concept 1: Electric Current and Circuit
An **[JARGON: Electric Current | The rate of flow of electric charge through a conductor | Current flowing through a copper wire]** is the continuous flow of electric charges.
- **Direction:** By convention, electric current flows from the positive terminal to the negative terminal of a battery. This is opposite to the direction of flow of electrons (negative charges).
- **Formula:** $$I = \frac{Q}{t}$$
  - $I$ = Current in Amperes (A)
  - $Q$ = Net charge in Coulombs (C)
  - $t$ = Time in seconds (s)

We measure current using an **[JARGON: Ammeter | A device with low resistance used to measure electric current | An ammeter is always connected in series]**. It is always connected in **series** in a circuit so that all the current passes through it.

## 4. 📖 Concept 2: Electric Potential and Potential Difference
Water only flows in a pipe if there is a pressure difference. Similarly, electrons only move in a wire if there is an "electric pressure" difference, called **[JARGON: Potential Difference | The work done to move a unit charge from one point to another | A 1.5 Volt cell provides potential difference]**.
- **Formula:** $$V = \frac{W}{Q}$$
  - $V$ = Potential Difference in Volts (V)
  - $W$ = Work done in Joules (J)
  - $Q$ = Charge in Coulombs (C)

We measure voltage using a **[JARGON: Voltmeter | A device with high resistance used to measure potential difference | A voltmeter is always connected in parallel]**. It is always connected in **parallel** across the points where the potential difference is to be measured.

## 5. 📖 Concept 3: Circuit Diagram Symbols
To study electricity, we draw circuit diagrams using standard symbols:

[FIGURE: circuit_symbols]

- **Electric Cell:** A long line (positive) and a shorter, thicker line (negative).
- **Battery:** A combination of cells connected in series.
- **Plug Key or Switch (Open / Closed):** Represents whether the circuit is broken or complete.
- **A Wire Joint / Wires crossing without joining:** Shows connections.
- **Electric Bulb:** A loop or standard bulb icon.
- **Resistor:** A zigzag line.
- **Variable Resistor (Rheostat):** A zigzag line with an arrow pointing through or down on it. Used to change the resistance in the circuit.

## 6. 📖 Concept 4: Ohm''s Law
Ohm''s Law is the most important law in electricity! It states that the potential difference ($V$) across the ends of a given metallic wire in an electric circuit is directly proportional to the current ($I$) flowing through it, provided its temperature remains the same.

- **Formula:** $$V = IR$$

[FIGURE: ohms_law_circuit]

Here, $R$ is a constant called **[JARGON: Resistance | The property of a conductor to resist the flow of charges through it | A wire has a resistance of 10 Ohms]**. Its SI unit is the **Ohm ($\Omega$)**.

### Activity 11.1: Verifying Ohm''s Law
*Caution: Do not leave the key plugged in for too long, as the wires will heat up and resistance will change, altering the readings.*
1. Set up a circuit with a nichrome wire, an ammeter, a voltmeter, and four cells of 1.5V each.
2. Connect only one cell first. Note the current ($I$) and voltage ($V$).
3. Repeat the process by connecting two, three, and four cells successively.
4. Calculate the ratio $V/I$ for each case. You will find that $V/I$ is almost constant.
5. If you plot a graph of $V$ (y-axis) versus $I$ (x-axis), you get a straight line passing through the origin. This proves Ohm''s Law!

[TIP: The V-I graph for a metallic conductor is a straight line passing through the origin. The slope of this graph gives the resistance of the conductor.]

## 7. 📖 Concept 5: Factors on which Resistance Depends
The resistance of a conductor depends on three main factors:
1. **Length ($l$):** Resistance is directly proportional to length. ($R \propto l$)
2. **Area of Cross-section ($A$):** Resistance is inversely proportional to the area (thickness). ($R \propto 1/A$)
3. **Nature of Material:** Different materials have different resistances.

Combining these:
$$R = \rho \frac{l}{A}$$
Here, $\rho$ (rho) is the constant of proportionality called **[JARGON: Electrical Resistivity | A fundamental property of a material measuring how strongly it resists electric current | Silver has a very low resistivity]**.
- SI Unit of resistivity: Ohm-meter ($\Omega\cdot m$).
- **Metals and alloys** have very low resistivity (good conductors).
- **Insulators** (like rubber or glass) have extremely high resistivity.
- **Alloys** (like nichrome) have higher resistivity than their constituent metals and do not oxidize (burn) easily at high temperatures. This is why alloys are used in electrical heating devices like irons and toasters.

## 8. 📖 Concept 6: Resistance of a System of Resistors
Resistors can be connected in two main ways: Series and Parallel.

**1. Resistors in Series:**
When resistors are joined end to end, they are in series.
- The **current ($I$) is the same** through every resistor.
- The total potential difference is the sum of potential differences across each resistor: $V = V_1 + V_2 + V_3$
- By Ohm''s Law: $IR_s = IR_1 + IR_2 + IR_3$
- **Equivalent Resistance Formula:** $$R_s = R_1 + R_2 + R_3$$
- The total resistance in series is *greater* than the highest individual resistance.

**2. Resistors in Parallel:**
When resistors are connected between the same two points, they are in parallel.
- The **potential difference ($V$) is the same** across all resistors.
- The total current is the sum of currents: $I = I_1 + I_2 + I_3$
- By Ohm''s Law: $\frac{V}{R_p} = \frac{V}{R_1} + \frac{V}{R_2} + \frac{V}{R_3}$
- **Equivalent Resistance Formula:** $$\frac{1}{R_p} = \frac{1}{R_1} + \frac{1}{R_2} + \frac{1}{R_3}$$
- The total resistance in parallel is *less* than the lowest individual resistance.

[INFO: Disadvantages of Series Circuits in Homes: If one appliance fails in a series circuit, the circuit breaks and none of the appliances work. Also, different appliances need different currents, but a series circuit forces the same current through all of them. This is why domestic wiring is always in parallel!]

## 9. 📖 Concept 7: Heating Effect of Electric Current
When an electric current passes through a high resistance wire (like nichrome), the electrical energy is converted into heat energy. This is known as the heating effect of current.

**Joule''s Law of Heating** states that the heat ($H$) produced in a resistor is:
1. Directly proportional to the square of current ($I^2$)
2. Directly proportional to resistance ($R$)
3. Directly proportional to time ($t$)

- **Formula:** $$H = I^2 R t$$

**Practical Applications:**
- **Electric Bulb:** The filament is made of **Tungsten** because it has a very high melting point (3380°C) and emits light when heated to a high temperature. The bulb is filled with chemically inactive nitrogen and argon gases to prolong the life of the filament.
- **Electric Fuse:** A safety device placed in series. It is a piece of wire (often an alloy of lead and tin) with an appropriate melting point. If a current larger than the specified value flows, the fuse wire melts and breaks the circuit, protecting appliances from damage.

## 10. 📖 Concept 8: Electric Power
**[JARGON: Electric Power | The rate at which electrical energy is dissipated or consumed in an electric circuit | A 100W bulb consumes energy faster than a 60W bulb]**
- **Formulas:** 
  $$P = VI$$
  $$P = I^2 R$$
  $$P = \frac{V^2}{R}$$
- **SI Unit:** Watt (W). 1 Watt = 1 Volt × 1 Ampere.

**Commercial Unit of Energy:**
Since the Watt is very small, we use **kilowatt-hour (kWh)** for commercial purposes (like your electricity bill). 1 kWh is the energy consumed when 1000 Watts of power is used for 1 hour.
- **1 kWh = 1 Unit of electricity**
- **Value in Joules:** $$1\text{ kWh} = 3.6 \times 10^6\text{ J}$$

## 11. ⚠️ Common Mistakes
- **Confusing Series/Parallel ammeters and voltmeters:** Remember, Ammeter is always in Series (A-S), Voltmeter is always in Parallel (V-P).
- **Adding parallel resistors incorrectly:** You must sum their reciprocals ($1/R_p = 1/R_1 + 1/R_2$), and then **invert the final answer** to get $R_p$. Many students forget the final inversion step!
- **Changing resistivity:** Resistivity ($\rho$) does NOT change if you cut or stretch a wire. It only changes if you change the material or the temperature.

## 12. 🔄 One-Minute Revision
- Current ($I=Q/t$) is measured by an ammeter (in series). Voltage ($V=W/Q$) is measured by a voltmeter (in parallel).
- Ohm''s law: $V=IR$. The V-I graph is a straight line.
- Resistance $R = \rho(l/A)$. Alloys have high resistivity and don''t burn easily.
- Series Resistance: $R_s = R_1 + R_2$. Current is constant.
- Parallel Resistance: $1/R_p = 1/R_1 + 1/R_2$. Voltage is constant. Home wiring uses parallel.
- Joule''s Heating: $H = I^2Rt$. Used in bulbs (Tungsten) and fuses.
- Electric Power: $P = VI = I^2R = V^2/R$. Commercial unit is kWh ($3.6 \times 10^6$ Joules).

## 13. 🎬 Comic Recap
```
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "Why does my toaster wire glow red, │
│         but the wall cord doesn''t?"       │
│ Rahul: "The toaster uses an alloy like     │
│         nichrome! It has high resistance,  │
│         so it heats up (Joule Heating!)."  │
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "And why is my house wired in       │
│         parallel instead of series?"       │
│ Rahul: "Imagine if one bulb fused and the  │
│         TV shut off! Parallel keeps        │
│         voltage constant for everything."  │
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "Wow. So if I buy a 1000W heater,   │
│         it costs more to run than a bulb?" │
│ Rahul: "Yes! Power = Energy/Time. It uses  │
│         more kilowatt-hours (kWh), which   │
│         shows up on the electric bill!"    │
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ V = IR                                     │
│ H = I²Rt                                   │
│ P = VI                                     │
│ 1 kWh = 3.6 × 10⁶ Joules                   │
└────────────────────────────────────────────┘
```', TRUE, 3)
ON CONFLICT (id) DO UPDATE SET note_content = EXCLUDED.note_content;


-- 5. Nationalism in India Revision Notes
INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380080', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', 'Revision Notes: Nationalism in India', 'note', NULL, NULL,
'# Chapter 1: Nationalism in India

## 1. 🎯 Chapter Goal
Learn how the idea of nationalism grew in India. Understand how Gandhiji led peaceful protests to win freedom.

## 2. 🪝 Hook
Imagine a time when you could not make your own salt or gather peacefully in a park. This was India under British rule. How did a simple handful of salt spark a massive revolution? Let''s find out!

## 3. 📖 Concept 1: The First World War and Satyagraha
The First World War (1914–1918) caused trouble in India. The British raised taxes and prices doubled. They also forced villagers to join the army. Crops failed and millions died from hunger and flu.

Mahatma Gandhi returned from South Africa in 1915. He introduced **[JARGON: Satyagraha | A non-violent method of protest based on truth and peaceful resistance | Gandhiji fasting to support mill workers in Ahmedabad]** (peaceful protest based on truth). He believed that truth does not need physical force.

He led three early protests:
1. Champaran (1917): Supported indigo farmers.
2. Kheda (1918): Demanded tax relief for farmers.
3. Ahmedabad (1918): Supported striking cotton mill workers.

## 4. 📖 Concept 2: Rowlatt Act and Non-Cooperation
In 1919, the British passed the **[JARGON: Rowlatt Act | A British law that allowed the arrest of political protestors without a trial for up to two years | British police arresting Indian leaders without going to court]** (the law allowing jail without trial). This law allowed them to arrest leaders without trial for two years.

This led to protests. On 13 April 1919, the **[JARGON: Jallianwala Bagh Massacre | The event where British soldiers fired on a peaceful crowd in Amritsar, killing hundreds | General Dyer blocking exits and firing on a crowd celebrating Baisakhi]** (the shooting of peaceful protestors in Amritsar) occurred. General Dyer blocked the exits of a park in Amritsar. His soldiers fired on a peaceful crowd and killed hundreds.

Gandhiji then launched the **[JARGON: Non-Cooperation Movement | A peaceful protest where Indians refused to use British goods, schools, and services | Students leaving British schools and lawyers leaving colonial courts]** (refusing to cooperate with British rule) in 1921. He asked Indians to stop cooperating with the British. People boycotted British schools, courts, and clothes.

Gandhiji called off the movement in 1922. This happened after the **[JARGON: Chauri Chaura Incident | A violent clash where a crowd burned a police station, killing 22 policemen | Gandhiji calling off the movement because it turned violent]** (violence that stopped the protest). A crowd burned down a police station and killed 22 policemen.

## 5. 📖 Concept 3: Civil Disobedience and Collective Belonging
In 1930, Gandhiji started the **[JARGON: Civil Disobedience Movement | A protest where people broke colonial laws, such as making salt and refusing to pay taxes | Gandhiji marching to Dandi to make salt]** (breaking unfair laws peacefully).

He began the Salt March:
- He walked 240 miles from Sabarmati to Dandi.
- 78 volunteers joined him.
- On 6 April 1930, he boiled seawater to make salt. This broke the British salt law.

In 1932, Gandhiji and Dr. B.R. Ambedkar signed the **[JARGON: Poona Pact | An agreement that gave reserved seats to lower classes (Depressed Classes) in elections | Dr. B.R. Ambedkar and Mahatma Gandhi signing the seat agreement in 1932]** (the agreement reserving seats for lower classes). This gave reserved seats in councils to the Depressed Classes.

Indians also built a sense of unity using cultural symbols:
- **Bharat Mata**: A mother figure representing the nation.
- The Swaraj Flag: Designed by Gandhiji with a spinning wheel in the middle.
- Reinterpreting history to show India''s past achievements.

## 6. ⚠️ Common Mistakes
- Confusing Non-Cooperation (refusing help, 1921) with Civil Disobedience (breaking laws, 1930).
- Writing that Jawaharlal Nehru formed the Swaraj Party. It was Motilal Nehru and C.R. Das!
- Forgetting the main reason for the Poona Pact, which resolved the issue of separate electorates.

## 7. 💡 Memory Tricks
- **CAK** (Cake) for early protests: **C**hamparan, **A**hmedabad, **K**heda.
- **Dandi is for Disobedience**: Breaking the salt law at Dandi started the Civil Disobedience Movement.

## 8. 📝 Quick Practice
- **Question 1**: Who started the Swaraj Party?
  - *Answer*: Motilal Nehru and C.R. Das in 1923.
- **Question 2**: When did the Jallianwala Bagh Massacre happen?
  - *Answer*: On 13 April 1919 in Amritsar.

## 9. 🎓 Board Tips
- Examiners often ask why Gandhiji chose salt as a symbol. Salt is eaten by both rich and poor, so it united everyone.
- Practice drawing the Dandi route on a map. It is a common map question.

## 10. 🔄 One-Minute Revision
- First World War caused high inflation and distress.
- Satyagraha uses truth and non-violence to fight injustice.
- Non-Cooperation (1921-1922) started after Jallianwala Bagh and stopped after Chauri Chaura.
- Salt March (1930) started Civil Disobedience.
- Poona Pact (1932) gave reserved seats to lower classes.

## 11. 🎬 Comic Recap
```
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "Priya: How is Civil Disobedience   │
│         different from Non-Cooperation?"   │
│ Rahul: "Rahul: In Non-Cooperation, we did  │
│         not help the British. In Civil     │
│         Disobedience, we broke their laws!"│
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "Priya: Like making salt at Dandi?" │
│ Rahul: "Rahul: Yes! Salt is eaten by       │
│         everyone. It was a perfect symbol  │
│         of unity."                         │
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "Priya: How did we create a sense   │
│         of belonging?"                     │
│ Rahul: "Rahul: Through songs, flags, and   │
│         the beautiful image of Bharat Mata."│
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ Satyagraha is non-violence.                │
│ Salt march started Civil Disobedience.      │
└────────────────────────────────────────────┘
```', TRUE, 2)
ON CONFLICT (id) DO UPDATE SET note_content = EXCLUDED.note_content;


-- --- FROM FILE db/seed_quizzes_batch1.sql ---

-- CBSE Class 10 Learning Portal Quizzes and Quiz Questions - Batch 1
-- Generated on 2026-06-23
-- Format: Clean SQL with ON CONFLICT (id) DO NOTHING for safe re-runs.

-- 1. Create new Quizzes if they do not exist
INSERT INTO quizzes (id, chapter_id, title, passing_percentage) VALUES
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380122', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', 'Science Chapter 12 Assessment', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', 'Social Science History Chapter 1 Quiz', 60)
ON CONFLICT (id) DO NOTHING;

-- 2. Insert new Quiz Questions
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES

-- =========================================================================
-- Science Chapter 1 (Chemical Reactions & Equations) - Quiz ID: d0eebc99-9c0b-4ef8-bb6d-6bb9bd380099
-- ADDING 6 more questions (currently has 4)
-- =========================================================================
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd381115', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', 'When green ferrous sulphate crystals are heated in a dry test tube, they lose water and the colour of the crystals changes. Upon further heating, it decomposes into ferric oxide, sulphur dioxide, and sulphur trioxide. What is the correct observation and chemical formula of the solid residue left behind?', 'multiple_choice', 
'["A. The green crystals turn white and then a dark brown/red solid of ferric oxide (Fe2O3) is formed.", "B. The green crystals turn blue and then a black solid of ferrous oxide (FeO) is formed.", "C. The crystals melt into a yellow liquid of iron sulphate (FeSO4).", "D. The green crystals turn grey and then a shiny silver solid of iron metal (Fe) is formed."]', 0, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd381116', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', 'In the electrolysis of water, two gases are collected in separate test tubes. Which of the following statements is correct regarding the volume and identity of these gases?', 'multiple_choice', 
'["A. The volume of oxygen collected at the anode is double the volume of hydrogen collected at the cathode.", "B. The volume of hydrogen collected at the cathode is double the volume of oxygen collected at the anode.", "C. Equal volumes of hydrogen and oxygen are collected at the cathode and anode respectively.", "D. Nitrogen gas is collected at the anode and hydrogen at the cathode."]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd381117', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', 'When solutions of sodium sulphate (Na2SO4) and barium chloride (BaCl2) are mixed in a test tube, a double displacement reaction takes place. What is the correct description of the precipitate formed in this reaction?', 'multiple_choice', 
'["A. A yellow precipitate of barium sulphate (BaSO4) is formed.", "B. A white precipitate of barium sulphate (BaSO4) is formed.", "C. A blue precipitate of sodium chloride (NaCl) is formed.", "D. A green precipitate of barium sulphate (BaSO4) is formed."]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd381118', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', 'When metals are exposed to moisture, air, acids, etc. for some time, they undergo corrosion. What are the characteristic colours of the coatings formed on silver and copper articles respectively due to corrosion?', 'multiple_choice', 
'["A. Silver: black coating; Copper: green coating", "B. Silver: green coating; Copper: black coating", "C. Silver: brown coating; Copper: blue coating", "D. Silver: grey coating; Copper: red coating"]', 0, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd381119', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', 'Consider the following chemical equation representing a redox reaction: CuO(s) + H2(g) --(heat)--> Cu(s) + H2O(l). Which substance undergoes reduction in this reaction?', 'multiple_choice', 
'["A. CuO", "B. H2", "C. Cu", "D. H2O"]', 0, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd381120', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', 'To prevent potato chips from getting oxidised and turning rancid, packet manufacturers flush the bags with which of the following gases?', 'multiple_choice', 
'["A. Oxygen", "B. Hydrogen", "C. Nitrogen", "D. Carbon dioxide"]', 2, NULL, 1),

-- =========================================================================
-- Mathematics Chapter 1 (Real Numbers) - Quiz ID: d0eebc99-9c0b-4ef8-bb6d-6bb9bd380088
-- ADDING 6 more questions (currently has 4)
-- =========================================================================
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380815', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380088', 'Let p be a prime number. If p divides a^2, then p divides a for any positive integer a. If we know that a prime p divides b^2, which of the following is always true?', 'multiple_choice', 
'["A. p^2 must divide b", "B. p divides b", "C. p is equal to b", "D. p does not divide b"]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380816', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380088', 'What are the HCF and LCM of the numbers 6, 72, and 120 respectively, using the prime factorization method?', 'multiple_choice', 
'["A. HCF = 6, LCM = 360", "B. HCF = 12, LCM = 360", "C. HCF = 6, LCM = 720", "D. HCF = 12, LCM = 720"]', 0, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380817', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380088', 'If p, q, and r are three distinct prime numbers, what is their Highest Common Factor (HCF) and Least Common Multiple (LCM)?', 'multiple_choice', 
'["A. HCF = 1, LCM = p * q * r", "B. HCF = p * q * r, LCM = 1", "C. HCF = 1, LCM = p + q + r", "D. HCF = p + q + r, LCM = p * q * r"]', 0, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380818', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380088', 'If the product of two positive integers a and b is 1800, and their LCM is 120, what is their HCF?', 'multiple_choice', 
'["A. 15", "B. 20", "C. 150", "D. 180"]', 0, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380819', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380088', 'Let a be a non-zero rational number and b be an irrational number. Which of the following statements is always true about their product a * b and their sum a + b?', 'multiple_choice', 
'["A. Both the product and the sum are rational numbers.", "B. The product is rational, but the sum is irrational.", "C. The product is irrational, but the sum is rational.", "D. Both the product and the sum are irrational numbers."]', 3, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380820', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380088', 'The prime factorization of a positive integer is expressed as 2^3 * 3^2 * 5 * 7 * 13. Which of the following composite numbers is represented by this factorization?', 'multiple_choice', 
'["A. 32760", "B. 16380", "C. 8190", "D. 65520"]', 0, NULL, 1),

-- =========================================================================
-- Mathematics Chapter 2 (Polynomials) - Quiz ID: d0eebc99-9c0b-4ef8-bb6d-6bb9bd380022
-- ADDING 6 more questions (currently has 4)
-- =========================================================================
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380225', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380022', 'For a quadratic polynomial ax^2 + bx + c, the graph of the corresponding equation y = ax^2 + bx + c is a U-shaped curve called a parabola. Under what condition does this parabola open downwards?', 'multiple_choice', 
'["A. a > 0", "B. a < 0", "C. b < 0", "D. c < 0"]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380226', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380022', 'What are the zeroes of the quadratic polynomial x^2 - 3?', 'multiple_choice', 
'["A. √3 and -√3", "B. 3 and -3", "C. √3 and √3", "D. 3 and 0"]', 0, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380227', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380022', 'What are the sum and the product of the zeroes of the quadratic polynomial 2x^2 - 8x + 6?', 'multiple_choice', 
'["A. Sum = 4, Product = 3", "B. Sum = -4, Product = 3", "C. Sum = 4, Product = -3", "D. Sum = -4, Product = -3"]', 0, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380228', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380022', 'In general, a polynomial p(x) of degree n can have at most how many zeroes?', 'multiple_choice', 
'["A. n - 1 zeroes", "B. n zeroes", "C. n + 1 zeroes", "D. 2n zeroes"]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380229', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380022', 'The zero of a linear polynomial ax + b (where a is not equal to 0) is given by:', 'multiple_choice', 
'["A. b/a", "B. -b/a", "C. a/b", "D. -a/b"]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380230', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380022', 'If α, β, and γ are the zeroes of the cubic polynomial 3x^3 - 5x^2 - 11x - 3, what is the sum of its zeroes (α + β + γ)?', 'multiple_choice', 
'["A. 5/3", "B. -5/3", "C. 11/3", "D. 1"]', 0, NULL, 1),

-- =========================================================================
-- Science Chapter 12 (Electricity) - Quiz ID: d0eebc99-9c0b-4ef8-bb6d-6bb9bd380122
-- CREATING new quiz + 10 questions (from science_12.txt - Magnetic Effects of Electric Current)
-- =========================================================================
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd381201', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380122', 'Who accidentally discovered in 1820 that a compass needle gets deflected when an electric current passes through a metallic wire placed nearby?', 'multiple_choice', 
'["A. Andre Marie Ampere", "B. Hans Christian Oersted", "C. Michael Faraday", "D. James Clerk Maxwell"]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd381202', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380122', 'By convention, what is the direction of magnetic field lines outside a bar magnet, and how does it compare to the direction inside the magnet?', 'multiple_choice', 
'["A. Outside: from South pole to North pole; Inside: from North pole to South pole", "B. Outside: from North pole to South pole; Inside: from South pole to North pole", "C. Both outside and inside: from North pole to South pole", "D. Both outside and inside: from South pole to North pole"]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd381203', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380122', 'Why is it that no two magnetic field lines are ever found to cross (intersect) each other?', 'multiple_choice', 
'["A. Because magnetic field lines are always parallel to each other.", "B. Because the magnetic field strength is zero at the point of intersection.", "C. Because at the point of intersection, a compass needle would have to point in two different directions, which is not possible.", "D. Because field lines only exist in two dimensions."]', 2, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd381204', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380122', 'How does the magnetic field produced by a straight current-carrying wire change as the distance from the wire increases?', 'multiple_choice', 
'["A. The magnetic field increases, and the concentric field circles get closer.", "B. The magnetic field remains constant, but the direction changes.", "C. The magnetic field decreases, and the concentric field circles become larger and larger.", "D. The magnetic field drops to zero immediately."]', 2, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd381205', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380122', 'According to the Right-Hand Thumb Rule (also known as Maxwell''s corkscrew rule), if the thumb points in the direction of the current, what do the wrapped fingers represent?', 'multiple_choice', 
'["A. The direction of the electric field", "B. The direction of the force on the conductor", "C. The direction of the magnetic field lines", "D. The direction of the motion of electrons"]', 2, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd381206', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380122', 'Which of the following statements is correct regarding the magnetic field lines inside a long, straight, current-carrying solenoid?', 'multiple_choice', 
'["A. The field lines are circular, meaning the field is non-uniform.", "B. The field lines are parallel straight lines, indicating that the magnetic field is uniform and the same at all points inside.", "C. The field is strongest at the center and decreases towards the ends.", "D. The magnetic field inside the solenoid is zero."]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd381207', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380122', 'When is the displacement of a current-carrying conductor placed in a magnetic field the largest (meaning the magnitude of the force is highest)?', 'multiple_choice', 
'["A. When the direction of current is parallel to the magnetic field.", "B. When the direction of current is at right angles (perpendicular) to the magnetic field.", "C. When the direction of current is at an angle of 45 degrees to the magnetic field.", "D. The force is always the same regardless of the angle."]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd381208', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380122', 'In Fleming''s Left-Hand Rule, if the forefinger points in the direction of the magnetic field and the middle finger points in the direction of the current, what does the thumb indicate?', 'multiple_choice', 
'["A. The direction of the electric potential difference", "B. The direction of the motion of the conductor or force acting on it", "C. The direction of induced current", "D. The direction of the earth''s gravity"]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd381209', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380122', 'In domestic electric circuits in India, what is the potential difference between the live wire (red insulation) and the neutral wire (black insulation)?', 'multiple_choice', 
'["A. 110 V", "B. 220 V", "C. 440 V", "D. 12 V"]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd381210', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380122', 'What is the function of an earth wire (green insulation) in domestic appliances with a metallic body, such as an electric press or refrigerator?', 'multiple_choice', 
'["A. It increases the voltage supply to the appliance.", "B. It provides a low-resistance conducting path, ensuring any leakage current goes to the earth, preventing severe electric shocks.", "C. It acts as a backup live wire in case the main supply fails.", "D. It regulates the temperature of the appliance."]', 1, NULL, 1),

-- =========================================================================
-- Social Science History Chapter 1 (Nationalism in India) - Quiz ID: d0eebc99-9c0b-4ef8-bb6d-6bb9bd380331
-- CREATING new quiz + 10 questions (from social-history_2.txt - Nationalism in India)
-- =========================================================================
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383101', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', 'Mahatma Gandhi returned to India in January 1915 from South Africa, where he had successfully fought the racist regime using satyagraha. In which order did he organize his first three satyagraha movements in India?', 'multiple_choice', 
'["A. Kheda (1918) -> Champaran (1917) -> Ahmedabad (1918)", "B. Champaran (1917) -> Kheda (1918) -> Ahmedabad (1918)", "C. Ahmedabad (1918) -> Champaran (1917) -> Kheda (1918)", "D. Champaran (1917) -> Ahmedabad (1918) -> Kheda (1918)"]', 3, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383102', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', 'The Rowlatt Act of 1919, which Gandhiji decided to launch a satyagraha against, gave the British government enormous powers to repress political activities. What was its most controversial provision?', 'multiple_choice', 
'["A. It banned all public assemblies and newspapers in India.", "B. It allowed detention of political prisoners without trial for up to two years.", "C. It doubled the land revenue rates on all Indian peasants.", "D. It forced all adult males to register for military service."]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383103', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', 'Why did a large crowd gather in the enclosed ground of Jallianwala Bagh on 13 April 1919 before General Dyer opened fire on them?', 'multiple_choice', 
'["A. To welcome Mahatma Gandhi back to Amritsar.", "B. To celebrate the victory of the Allied powers in World War I.", "C. Some came to protest against new repressive measures, while others had come to attend the annual Baisakhi fair.", "D. To plan a violent attack on local railway stations."]', 2, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383104', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', 'At which Congress session in December 1920 was the compromise worked out and the Non-Cooperation program formally adopted?', 'multiple_choice', 
'["A. Calcutta session", "B. Nagpur session", "C. Lahore session", "D. Madras session"]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383105', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', 'In his famous book ''Hind Swaraj'' (1909), Mahatma Gandhi declared that British rule was established and survived in India because of:', 'multiple_choice', 
'["A. The superior military technology of the British.", "B. The cooperation of Indians.", "C. The divisions among Indian princely states.", "D. The support of the French and Portuguese."]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383106', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', 'In Awadh, the peasant movement against talukdars and landlords was led by Baba Ramchandra. Who was Baba Ramchandra?', 'multiple_choice', 
'["A. A high-court lawyer who fought cases for poor tenants.", "B. A sanyasi who had earlier been to Fiji as an indentured labourer.", "C. An active member of the Swaraj Party from Delhi.", "D. A local landowner who opposed British taxation."]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383107', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', 'Which incident in February 1922 led Mahatma Gandhi to abruptly call off and withdraw the Non-Cooperation Movement?', 'multiple_choice', 
'["A. The arrest of Abdul Ghaffar Khan in Peshawar.", "B. The Jallianwala Bagh massacre.", "C. The violent clash and burning of the police station at Chauri Chaura.", "D. The signing of the Gandhi-Irwin Pact."]', 2, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383108', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', 'The Statutory Commission headed by Sir John Simon was greeted with the slogan ''Go back Simon'' when it arrived in India in 1928. What was the main reason for this protest?', 'multiple_choice', 
'["A. It recommended the division of India into separate states.", "B. It did not have a single Indian member.", "C. It proposed a massive hike in land revenues and salt tax.", "D. It was hosted by Lord Irwin without consulting the Swaraj Party."]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383109', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', 'Under whose presidency did the Lahore Congress session in December 1929 formalize the demand for ''Purna Swaraj'' or full independence?', 'multiple_choice', 
'["A. Subhas Chandra Bose", "B. Jawaharlal Nehru", "C. Motilal Nehru", "D. Vallabhbhai Patel"]', 1, NULL, 1),

('f0eebc99-9c0b-4ef8-bb6d-6bb9bd383110', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', 'What was the outcome of the Poona Pact of September 1932 signed between Dr. B.R. Ambedkar and Mahatma Gandhi?', 'multiple_choice', 
'["A. It granted separate electorates for the Depressed Classes in all elections.", "B. It gave the Depressed Classes reserved seats in provincial and central legislative councils, to be voted in by the general electorate.", "C. It declared the Civil Disobedience Movement illegal.", "D. It established the Swaraj Party to participate in council elections."]', 1, NULL, 1)
ON CONFLICT (id) DO NOTHING;


-- --- FROM FILE db/seed_science_ch1_quizzes.sql ---

-- Seed data for Science Chapter 1 Quiz Questions
-- Quiz: Science Chapter 1 Assessment (ID: d0eebc99-9c0b-4ef8-bb6d-6bb9bd380099)
-- Reference: science_1.txt (CBSE Class 10 Science Chapter 1)

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks) VALUES
(
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd385551',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099',
    'When lead nitrate powder is heated in a boiling tube, brown fumes are emitted. These brown fumes consist of which gas?',
    'multiple_choice',
    '["A. Nitrogen monoxide (NO)", "B. Nitrogen dioxide (NO2)", "C. Dinitrogen oxide (N2O)", "D. Nitrogen pentoxide (N2O5)"]',
    1,
    NULL,
    1
),
(
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd385552',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099',
    'During the whitewashing of walls, slaked lime reacts slowly with carbon dioxide in the air to form a thin, shiny layer of which substance?',
    'multiple_choice',
    '["A. Calcium oxide", "B. Calcium sulphate", "C. Calcium carbonate", "D. Calcium chloride"]',
    2,
    NULL,
    1
),
(
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd385553',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099',
    'White silver chloride turns grey when exposed to sunlight. This colour change is due to the decomposition of silver chloride into:',
    'multiple_choice',
    '["A. Silver metal and chlorine gas", "B. Silver oxide and chlorine gas", "C. Silver metal and oxygen gas", "D. Silver nitrate and chlorine gas"]',
    0,
    NULL,
    1
),
(
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd385554',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099',
    'Which of the following is NOT a typically observed change that helps us determine whether a chemical reaction has taken place?',
    'multiple_choice',
    '["A. Evolution of a gas", "B. Change in physical state", "C. Increase in the total mass of substances", "D. Change in temperature"]',
    2,
    NULL,
    1
),
(
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd385555',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099',
    'What happens when iron nails are kept in a copper sulphate solution for some time?',
    'multiple_choice',
    '["A. The blue colour of the solution intensifies and the nail remains grey", "B. The blue colour of the solution fades and the nail becomes brownish", "C. The solution turns yellow and the nail dissolves completely", "D. There is no change in colour or state of either the solution or nail"]',
    1,
    NULL,
    1
)
ON CONFLICT (id) DO NOTHING;


-- --- FROM FILE db/seed_question_types_batch1.sql ---

-- CBSE Class 10 Learning Portal Question Expansion - Mathematics (041)
-- Generated on 2026-06-24
-- ON CONFLICT (id) DO NOTHING to allow safe re-runs.

-- 1. Create new Quizzes if they do not exist (Ch 8 & 9)
INSERT INTO quizzes (id, chapter_id, title, passing_percentage) VALUES
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380080', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380118', 'Mathematics Chapter 8 Quiz', 60),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380090', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380119', 'Mathematics Chapter 9 Quiz', 60)
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('7236ce04-d116-46f4-8c5e-41ff5206f67c', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380088', 'State the Fundamental Theorem of Arithmetic. Use it to find HCF and LCM of 96 and 404.', 'short_answer_2mark', NULL, NULL, NULL, 2, 'Prime factorization: 96 = 2^5 * 3, 404 = 2^2 * 101. HCF is the product of the lowest power of common factors.', 'easy', '041/241', 'original', 'Fundamental Theorem of Arithmetic', 'The Fundamental Theorem of Arithmetic states that every composite number can be factorized uniquely as a product of prime numbers, up to their order.
96 = 2^5 * 3
404 = 2^2 * 101
HCF = 2^2 = 4
LCM = 2^5 * 3 * 101 = 9696', '2');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('4e8babe5-fac0-4422-af56-5b97f83cabd6', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380088', 'Prove that 3 + 2√5 is irrational.', 'short_answer_3mark', NULL, NULL, NULL, 3, 'Use proof by contradiction by setting the number equal to a/b and isolating the radical.', 'medium', '041/241', 'original', 'Irrationality Proof', 'Let us assume 3 + 2√5 is rational. So, 3 + 2√5 = a/b (where a and b are coprime integers, b != 0).
2√5 = (a/b) - 3 = (a - 3b)/b
√5 = (a - 3b)/(2b)
Since a, b are integers, (a - 3b)/(2b) is rational. This implies √5 is rational.
But this contradicts the fact that √5 is irrational.
Hence, our assumption is false and 3 + 2√5 is irrational.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('fb9b6c6a-2f2a-4fe3-99f1-95588690bc50', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380088', 'Prove that √2 is irrational.', 'proof', NULL, NULL, NULL, 5, 'This is a fundamental theorem proof. Apply properties of prime numbers dividing squares.', 'hard', '041/241', 'original', 'Irrationality of Root 2', 'Assume √2 is rational. So, √2 = a/b where a, b are coprimes and b != 0.
Squaring: 2 = a^2/b^2 -> 2b^2 = a^2.
So 2 divides a^2 -> 2 divides a.
Let a = 2c. Then 2b^2 = 4c^2 -> b^2 = 2c^2.
So 2 divides b^2 -> 2 divides b.
Thus 2 divides both a and b, which contradicts that a and b are coprime.
Hence, √2 is irrational.', '5');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('cdb82593-c9fb-4e53-b3cf-fea12b9b4527', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380088', 'Assertion (A): The HCF of two numbers is 5 and their LCM is 200. The product of the two numbers is 1000.
Reason (R): For any two positive integers a and b, HCF(a, b) * LCM(a, b) = a * b.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'The assertion uses the formula Product = HCF * LCM = 5 * 200 = 1000. The reason correctly states the formula.', 'medium', '041/241', 'original', 'HCF and LCM relation');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('40d18033-d30a-467e-8742-a40c7c16322b', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380088', 'Assertion (A): The number 13/3125 has a terminating decimal expansion.
Reason (R): A rational number p/q has a terminating decimal expansion if the prime factorization of q is of the form 2^n * 5^m.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'Here, 3125 = 5^5 = 2^0 * 5^5. The denominator is of the correct form, so the decimal terminates. Both A and R are true and R explains A.', 'medium', '041/241', 'original', 'Decimal expansion terminating condition');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('e8a787ad-36cd-42bf-81c7-a638c3f124ed', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380022', 'Find the zeroes of the quadratic polynomial x^2 + 7x + 10, and verify the relationship between the zeroes and the coefficients.', 'short_answer_3mark', NULL, NULL, NULL, 3, 'Factor the quadratic expression to find the zeroes. Sum = -b/a, Product = c/a.', 'medium', '041/241', 'original', 'Zeroes of Quadratic Polynomial', 'x^2 + 7x + 10 = (x + 5)(x + 2) -> Zeroes are -5 and -2.
Sum of zeroes = -5 + (-2) = -7 = -b/a = -7/1.
Product of zeroes = (-5) * (-2) = 10 = c/a = 10/1.
Relationship is verified.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('61485826-cf2b-4792-b54c-2169bb1f9864', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380022', 'Find a quadratic polynomial, the sum and product of whose zeroes are -3 and 2, respectively.', 'short_answer_2mark', NULL, NULL, NULL, 2, 'Apply formula: x^2 - (sum of zeroes)x + (product of zeroes).', 'easy', '041/241', 'original', 'Forming Quadratic Polynomial', 'Let zeroes be alpha and beta.
Sum of zeroes S = alpha + beta = -3.
Product of zeroes P = alpha * beta = 2.
Quadratic polynomial is k[x^2 - Sx + P] = k[x^2 + 3x + 2]. For k=1, polynomial is x^2 + 3x + 2.', '2');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('976dbae9-113a-49d2-a4ea-de143ba5e6e5', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380022', 'If one zero of the quadratic polynomial 2x^2 + kx - 6 is 2, find the value of k. Also find the other zero.', 'short_answer_3mark', NULL, NULL, NULL, 3, 'Substitute x=2 into f(x)=0 to find k. Factorize the resulting polynomial to find the second zero.', 'medium', '041/241', 'original', 'Finding coefficient and other zero', 'Since 2 is a zero: f(2) = 2(2)^2 + k(2) - 6 = 0 -> 8 + 2k - 6 = 0 -> 2k + 2 = 0 -> k = -1.
Polynomial is 2x^2 - x - 6 = 2x^2 - 4x + 3x - 6 = 2x(x - 2) + 3(x - 2) = (2x + 3)(x - 2).
Zeroes are 2 and -3/2. The other zero is -3/2.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('ecef3787-0047-4c73-958b-4e57af2496d3', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380022', 'Assertion (A): The degree of a quadratic polynomial is 2.
Reason (R): A quadratic polynomial can have at most two zeroes.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 1, NULL, 1, 'Both statements are true. However, R is not the correct explanation of why the degree is 2. The degree is 2 by definition of the highest exponent of the variable.', 'medium', '041/241', 'original', 'Degree of quadratic polynomial');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('f374e698-44f6-40cf-8c0d-7707af9ae609', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380022', 'Assertion (A): The graph of y = ax^2 + bx + c opens downwards if a is negative.
Reason (R): A quadratic polynomial always intersects the x-axis at two distinct points.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 2, NULL, 1, 'A is true (opens downwards for a < 0), but R is false (it may touch the x-axis at one point or not intersect it at all, depending on the discriminant).', 'medium', '041/241', 'original', 'Parabola opening and zeroes');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('ac0f5723-dfa9-446c-8671-a4e6abe38768', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380033', 'Solve the following pair of linear equations by elimination method:
9x - 4y = 2000
7x - 3y = 2000', 'short_answer_3mark', NULL, NULL, NULL, 3, 'Equate the coefficients of y by multiplying both equations by suitable integers, then subtract.', 'medium', '041/241', 'original', 'Elimination Method', 'Multiply eq 1 by 3: 27x - 12y = 6000
Multiply eq 2 by 4: 28x - 12y = 8000
Subtract: (28x - 12y) - (27x - 12y) = 8000 - 6000 -> x = 2000.
Substitute x in eq 1: 9(2000) - 4y = 2000 -> 18000 - 4y = 2000 -> 4y = 16000 -> y = 4000.
Solution is x = 2000, y = 4000.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('07400506-77bf-4617-ab7c-e6f10ba96950', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380033', 'For what values of p does the pair of equations 4x + py + 8 = 0 and 2x + 2y + 2 = 0 have a unique solution?', 'short_answer_2mark', NULL, NULL, NULL, 2, 'Unique solution condition is a1/a2 != b1/b2.', 'easy', '041/241', 'original', 'Condition for Unique Solution', 'For unique solution, a1/a2 != b1/b2.
Here, a1=4, b1=p, a2=2, b2=2.
So 4/2 != p/2 -> 2 != p/2 -> p != 4.
Therefore, the equations have a unique solution for all real values of p except 4.', '2');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('26b595e6-f2f2-42a6-a9b7-2a7bb3e83fb3', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380033', 'Find the values of a and b for which the following system of linear equations has infinitely many solutions:
2x + 3y = 7
(a - b)x + (a + b)y = 3a + b - 2', 'long_answer_5mark', NULL, NULL, NULL, 5, 'Set the ratios of coefficients equal. Obtain two linear equations in terms of a and b, and solve them.', 'hard', '041/241', 'original', 'Infinitely Many Solutions', 'For infinite solutions, a1/a2 = b1/b2 = c1/c2.
2/(a - b) = 3/(a + b) = 7/(3a + b - 2)
From first two: 2(a + b) = 3(a - b) -> 2a + 2b = 3a - 3b -> a = 5b  (Eq 1)
From second two: 3(3a + b - 2) = 7(a + b) -> 9a + 3b - 6 = 7a + 7b -> 2a - 4b = 6 -> a - 2b = 3 (Eq 2)
Substitute Eq 1 into Eq 2: 5b - 2b = 3 -> 3b = 3 -> b = 1.
Substitute b = 1 in Eq 1: a = 5(1) = 5.
Hence, a = 5, b = 1.', '5');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('0cef40ea-6de1-4cd6-a105-0dbcbc540c03', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380033', 'Assertion (A): The pair of equations x + 2y + 5 = 0 and -3x - 6y + 1 = 0 has no solution.
Reason (R): The lines representing these equations are parallel to each other.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'Here, a1/a2 = 1/-3 = -1/3; b1/b2 = 2/-6 = -1/3; c1/c2 = 5/1 = 5. Since a1/a2 = b1/b2 != c1/c2, the lines are parallel and have no solution. Both A and R are true and R explains A.', 'medium', '041/241', 'original', 'Condition for parallel lines');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('90fb3a62-34a4-41af-8634-1edf3b04061b', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380033', 'Assertion (A): The system of equations 2x + 3y = 5 and 4x + 6y = 15 is consistent.
Reason (R): A system of linear equations is consistent if it has at least one solution.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 3, NULL, 1, 'A is false because a1/a2 = b1/b2 = 1/2 != c1/c2 = 5/15 = 1/3 (parallel lines, inconsistent). R is true by definition. So A is false, R is true.', 'medium', '041/241', 'original', 'Consistency of equations');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('a703f0e8-9cf5-4a01-9ada-9781734bc078', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380044', 'Solve the quadratic equation 2x^2 - 5x + 3 = 0 using the quadratic formula.', 'short_answer_2mark', NULL, NULL, NULL, 2, 'Use standard formula x = [-b +/- √(b^2 - 4ac)] / 2a.', 'easy', '041/241', 'original', 'Quadratic Formula Application', 'Here a=2, b=-5, c=3.
Discriminant D = b^2 - 4ac = (-5)^2 - 4(2)(3) = 25 - 24 = 1.
Since D > 0, roots are real and given by:
x = (-b +/- √D) / 2a = (5 +/- √1) / 4.
x1 = (5 + 1)/4 = 6/4 = 3/2.
x2 = (5 - 1)/4 = 4/4 = 1.
Roots are 3/2 and 1.', '2');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('04e78a94-8852-4f68-988f-3b23cdc93d46', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380044', 'Find the nature of the roots of the quadratic equation 3x^2 - 4√3 x + 4 = 0. If real roots exist, find them.', 'short_answer_3mark', NULL, NULL, NULL, 3, 'Calculate the discriminant. If D = 0, roots are equal and real. Value is -b/2a.', 'medium', '041/241', 'original', 'Nature of Roots', 'a=3, b=-4√3, c=4.
D = b^2 - 4ac = (-4√3)^2 - 4(3)(4) = 48 - 48 = 0.
Since D = 0, the roots are real and equal.
Roots are x = -b / 2a = 4√3 / 6 = 2√3/3 = 2/√3.
Equal roots are 2/√3, 2/√3.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('6be95612-a129-4df4-9c05-6ed0cc819b01', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380044', 'A motor boat whose speed is 18 km/h in still water takes 1 hour more to go 24 km upstream than to return downstream to the same spot. Find the speed of the stream.', 'long_answer_5mark', NULL, NULL, NULL, 5, 'Set up quadratic equation using Time = Distance / Speed. Solve for x (discarding negative value).', 'hard', '041/241', 'original', 'Quadratic Equation Word Problem', 'Let speed of stream be x km/h.
Upstream speed = 18 - x km/h.
Downstream speed = 18 + x km/h.
Time upstream - Time downstream = 1 hour
24/(18 - x) - 24/(18 + x) = 1
24[ (18 + x) - (18 - x) ] / (324 - x^2) = 1
24(2x) = 324 - x^2
48x = 324 - x^2 -> x^2 + 48x - 324 = 0
(x + 54)(x - 6) = 0
Since speed cannot be negative, x = 6 km/h.
Speed of stream is 6 km/h.', '5');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('870b06d6-c14b-41f4-81bf-00071f68c4f3', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380044', 'Assertion (A): The quadratic equation x^2 - 4x + 5 = 0 has no real roots.
Reason (R): For any quadratic equation ax^2 + bx + c = 0, if the discriminant D = b^2 - 4ac < 0, then the roots are not real.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'D = (-4)^2 - 4(1)(5) = 16 - 20 = -4 < 0. So there are no real roots. Both A and R are true and R is the correct explanation of A.', 'medium', '041/241', 'original', 'Nature of roots condition');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('c291f72c-6022-4077-84fd-2c6cf9befb3f', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380044', 'Assertion (A): If the product of the roots of the equation x^2 - 3x + k = 0 is 4, then k = 4.
Reason (R): Product of the roots of a quadratic equation ax^2 + bx + c = 0 is c/a.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'Product of roots is c/a = k/1 = k. If product is 4, then k = 4. Both are true and R is the correct explanation of A.', 'medium', '041/241', 'original', 'Product of roots formula');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('67820bf8-4faa-44ae-9a51-2976bf72cad4', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380055', 'Write the first four terms of the AP, when the first term a = -1.25 and the common difference d = -0.25.', 'short_answer_2mark', NULL, NULL, NULL, 2, 'Generate terms recursively: a_n = a_{n-1} + d.', 'easy', '041/241', 'original', 'AP Term generation', 'a1 = a = -1.25
a2 = a1 + d = -1.25 + (-0.25) = -1.50
a3 = a2 + d = -1.50 + (-0.25) = -1.75
a4 = a3 + d = -1.75 + (-0.25) = -2.00
First four terms are: -1.25, -1.50, -1.75, -2.00', '2');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme, expected_numerical_answer, expected_unit) 
VALUES ('d43ef29f-2634-4061-a3d7-b1ccb7b26333', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380055', 'Which term of the AP: 21, 18, 15, ... is -81?', 'numerical', NULL, NULL, NULL, 3, 'Use formula an = a + (n - 1)d and solve for integer n.', 'medium', '041/241', 'original', 'nth term of AP', 'Here a = 21, d = 18 - 21 = -3.
Let the nth term be -81. So an = a + (n - 1)d = -81
21 + (n - 1)(-3) = -81
(n - 1)(-3) = -102
n - 1 = 34
n = 35.
So, the 35th term is -81.', '3', 35, 'integer');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme, expected_numerical_answer, expected_unit) 
VALUES ('ac4f4ed2-7680-4c75-a683-35c449daceb9', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380055', 'Find the sum of the first 22 terms of the AP: 8, 3, -2, ...', 'numerical', NULL, NULL, NULL, 3, 'Apply formula Sn = n/2 * [2a + (n-1)d] and substitute the values.', 'medium', '041/241', 'original', 'Sum of AP', 'Here a = 8, d = 3 - 8 = -5, n = 22.
Sum Sn = (n / 2) * [2a + (n - 1)d]
S22 = (22 / 2) * [2(8) + (22 - 1)(-5)]
S22 = 11 * [16 + 21 * (-5)]
S22 = 11 * [16 - 105]
S22 = 11 * [-89] = -979.
Sum of first 22 terms is -979.', '3', -979, 'integer');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('f6da13d3-b049-408a-9fe1-3a702fbb17e6', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380055', 'Assertion (A): The sequence 2, 5, 8, 11, ... forms an AP.
Reason (R): A sequence forms an AP if the difference between consecutive terms remains constant.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'The difference between consecutive terms is 3 (constant). So it is an AP. Both A and R are true and R is the correct explanation.', 'medium', '041/241', 'original', 'AP Definition');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('74a8700f-f125-438b-aaea-75acc04ced0c', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380055', 'Assertion (A): The sum of the first n terms of an AP with first term a and last term l is given by Sn = (n/2)(a + l).
Reason (R): The 10th term of the AP: 10, 7, 4, ... is -17.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 1, NULL, 1, 'A is a true standard formula. For R: a10 = 10 + 9(-3) = 10 - 27 = -17. Both statements are true, but R is not the explanation of A.', 'medium', '041/241', 'original', 'AP Formulas');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('5135396e-8a4d-47a8-a5ff-65b967fd4d64', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380066', 'State the Basic Proportionality Theorem (BPT) (Thales Theorem).', 'short_answer_2mark', NULL, NULL, NULL, 2, 'Correct statement of the theorem.', 'easy', '041/241', 'original', 'Basic Proportionality Theorem', 'If a line is drawn parallel to one side of a triangle to intersect the other two sides in distinct points, the other two sides are divided in the same ratio.', '2');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('eb1081ad-aa7a-4a2a-8346-522d61ccad88', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380066', 'In triangle ABC, DE || BC. If AD = 1.5 cm, DB = 3 cm, and AE = 1 cm, find EC.', 'short_answer_2mark', NULL, NULL, NULL, 2, 'Apply BPT: AD/DB = AE/EC. Solve for EC.', 'easy', '041/241', 'original', 'BPT Application', 'By Basic Proportionality Theorem, AD/DB = AE/EC.
1.5 / 3 = 1 / EC
1/2 = 1 / EC -> EC = 2 cm.', '2');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('c6bfc5b6-0923-4113-beec-e30e43aed4f9', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380066', 'Prove the Basic Proportionality Theorem (BPT): If a line is drawn parallel to one side of a triangle to intersect the other two sides in distinct points, then the other two sides are divided in the same ratio.', 'proof', NULL, NULL, NULL, 5, 'Draw construction, set up areas, equate areas of triangles on same base between same parallels.', 'hard', '041/241', 'original', 'BPT Proof', 'Given: In triangle ABC, a line DE || BC intersects AB at D and AC at E.
To prove: AD/DB = AE/EC.
Construction: Join BE and CD. Draw DM perp AC and EN perp AB.
Proof:
Area(ADE) = 1/2 * AD * EN
Area(BDE) = 1/2 * DB * EN
So, Area(ADE)/Area(BDE) = AD/DB (Eq 1)
Area(ADE) = 1/2 * AE * DM
Area(DEC) = 1/2 * EC * DM
So, Area(ADE)/Area(DEC) = AE/EC (Eq 2)
Since triangles BDE and DEC are on the same base DE and between the same parallel lines DE and BC, Area(BDE) = Area(DEC) (Eq 3)
From Eq 1, 2, and 3, AD/DB = AE/EC. Hence proved.', '5');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('bbb1a597-80c8-4714-a298-b7237f338556', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380066', 'Assertion (A): All equilateral triangles are similar.
Reason (R): Two polygons are similar if their corresponding angles are equal and their corresponding sides are in the same ratio.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'Equilateral triangles always have angles equal to 60 degrees (similar by AAA). R explains the general similarity criteria which equilateral triangles satisfy.', 'medium', '041/241', 'original', 'Similarity criteria');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('143a3945-42a4-45b3-a3ca-003f1ca34f4a', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380066', 'Assertion (A): If the areas of two similar triangles are equal, then they are congruent.
Reason (R): The ratio of the areas of two similar triangles is equal to the square of the ratio of their corresponding sides.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'Since areas are equal, the ratio is 1. Thus the ratio of sides is 1 (sides are equal). Hence they are congruent. R is the correct explanation of A.', 'medium', '041/241', 'original', 'Similar triangles areas');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme, expected_numerical_answer, expected_unit) 
VALUES ('1a6977f8-cd57-42a6-80a5-1b280bc91c84', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380077', 'Find the distance between the points (2, 3) and (4, 1).', 'numerical', NULL, NULL, NULL, 2, 'Apply distance formula.', 'easy', '041/241', 'original', 'Distance Formula', 'Distance d = √[(x2 - x1)^2 + (y2 - y1)^2]
d = √[(4 - 2)^2 + (1 - 3)^2]
d = √[2^2 + (-2)^2]
d = √[4 + 4] = √8 = 2√2 units.', '2', 2.83, 'units');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme, expected_numerical_answer, expected_unit) 
VALUES ('970f8c9a-5a2d-4565-a48a-8554a92bbdd8', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380077', 'Find the coordinates of the point which divides the line segment joining the points (4, -3) and (8, 5) in the ratio 3 : 1 internally.', 'numerical', NULL, NULL, NULL, 3, 'Apply section formula.', 'medium', '041/241', 'original', 'Section Formula', 'By section formula, x = (m1*x2 + m2*x1) / (m1 + m2), y = (m1*y2 + m2*y1) / (m1 + m2).
Here (x1, y1) = (4, -3), (x2, y2) = (8, 5), m1=3, m2=1.
x = (3*8 + 1*4) / (3 + 1) = (24 + 4) / 4 = 28 / 4 = 7.
y = (3*5 + 1*(-3)) / (3 + 1) = (15 - 3) / 4 = 12 / 4 = 3.
The point is (7, 3).', '3', 7.0, 'x-coordinate');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('fa539d9a-1f1a-4755-a0bf-83188f0ccb4c', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380077', 'Find a relation between x and y such that the point (x, y) is equidistant from the points (7, 1) and (3, 5).', 'short_answer_3mark', NULL, NULL, NULL, 3, 'Set distance formulas squared equal. Expand, simplify terms to get a linear equation relation.', 'medium', '041/241', 'original', 'Equidistant relation', 'Let P(x, y) be equidistant from A(7, 1) and B(3, 5). So PA^2 = PB^2.
(x - 7)^2 + (y - 1)^2 = (x - 3)^2 + (y - 5)^2
x^2 - 14x + 49 + y^2 - 2y + 1 = x^2 - 6x + 9 + y^2 - 10y + 25
-14x - 2y + 50 = -6x - 10y + 34
-14x + 6x - 2y + 10y + 50 - 34 = 0
-8x + 8y + 16 = 0 -> x - y - 2 = 0.
Relation is x - y = 2.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('05dcd153-5838-462e-92b9-d8daea7974da', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380077', 'Assertion (A): The point (0, 4) lies on the y-axis.
Reason (R): The x-coordinate of any point on the y-axis is zero.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'Since the x-coordinate of (0,4) is 0, it lies on the y-axis. R is the correct explanation of A.', 'medium', '041/241', 'original', 'Coordinates axes positioning');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('240d5560-72c2-4a95-8298-a6d8381ad270', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380077', 'Assertion (A): The midpoint of the line segment joining (2, 6) and (6, 2) is (4, 4).
Reason (R): The midpoint coordinates are given by [(x1+x2)/2, (y1+y2)/2].', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'Midpoint is ((2+6)/2, (6+2)/2) = (4,4). Both are true and R is the correct explanation.', 'medium', '041/241', 'original', 'Midpoint formula verification');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('2fee1408-0610-430a-9c10-db1380db37d9', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380080', 'In triangle ABC, right-angled at B, AB = 24 cm, BC = 7 cm. Determine sin A and cos A.', 'short_answer_2mark', NULL, NULL, NULL, 2, 'Find hypotenuse using Pythagoras, then write ratios for sin A and cos A.', 'easy', '041/241', 'original', 'Trigonometric Ratios', 'By Pythagoras Theorem, AC = √[AB^2 + BC^2] = √[24^2 + 7^2] = √[576 + 49] = √625 = 25 cm.
sin A = opposite / hypotenuse = BC / AC = 7/25.
cos A = adjacent / hypotenuse = AB / AC = 24/25.', '2');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme, expected_numerical_answer, expected_unit) 
VALUES ('05b0724e-25f4-4326-a305-0b25cbdd22b7', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380080', 'Evaluate: (5 cos^2 60 + 4 sec^2 30 - tan^2 45) / (sin^2 30 + cos^2 30)', 'numerical', NULL, NULL, NULL, 3, 'Substitute standard trigonometric values and simplify the fraction.', 'medium', '041/241', 'original', 'Trigonometric Values Evaluation', 'Substitute standard values:
cos 60 = 1/2, sec 30 = 2/√3, tan 45 = 1, sin 30 = 1/2, cos 30 = √3/2.
Numerator: 5(1/4) + 4(4/3) - 1 = 5/4 + 16/3 - 1 = (15 + 64 - 12)/12 = 67/12.
Denominator: (1/2)^2 + (√3/2)^2 = 1/4 + 3/4 = 1.
Result: 67/12.', '3', 5.58, 'value');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('22e70055-5df0-48d2-8bd7-44298b85fe0f', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380080', 'Prove the trigonometric identity: (cosec theta - cot theta)^2 = (1 - cos theta) / (1 + cos theta)', 'short_answer_3mark', NULL, NULL, NULL, 3, 'Express LHS in terms of sine and cosine. Simplify the expression and use sin^2 = 1 - cos^2 to factor and cancel.', 'medium', '041/241', 'original', 'Trigonometric Identity Proof', 'LHS = (cosec theta - cot theta)^2 = (1/sin theta - cos theta/sin theta)^2
= ((1 - cos theta) / sin theta)^2
= (1 - cos theta)^2 / sin^2 theta
= (1 - cos theta)^2 / (1 - cos^2 theta)
= (1 - cos theta)^2 / [(1 - cos theta)(1 + cos theta)]
= (1 - cos theta) / (1 + cos theta) = RHS. Hence proved.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('95dbba39-7fb8-406d-8ef6-4ee47ab35462', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380080', 'Assertion (A): value of sin 60 is √3/2.
Reason (R): sin theta increases as theta increases from 0 to 90 degrees.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 1, NULL, 1, 'Both statements are true (sin 60 is indeed √3/2, and sin theta is increasing). But R is not the explanation of why sin 60 is √3/2.', 'medium', '041/241', 'original', 'Trig function monotonicity');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('c81a0428-827e-40e3-9694-0b42dbcd1fe2', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380080', 'Assertion (A): For any acute angle theta, sin^2 theta + cos^2 theta = 1.
Reason (R): value of cos^2 45 - sin^2 45 is 0.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 1, NULL, 1, 'A is the fundamental identity (true). R is cos^2 45 - sin^2 45 = (1/√2)^2 - (1/√2)^2 = 1/2 - 1/2 = 0 (true). Both are true, but R does not explain A.', 'medium', '041/241', 'original', 'Basic identity and values');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme, expected_numerical_answer, expected_unit) 
VALUES ('12c7f556-1819-42ed-82df-1138b56e6af6', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380090', 'A tower stands vertically on the ground. From a point on the ground, which is 15 m away from the foot of the tower, the angle of elevation of the top of the tower is found to be 60 degrees. Find the height of the tower.', 'numerical', NULL, NULL, NULL, 3, 'Set up tan 60 = height / base and solve for height.', 'easy', '041/241', 'original', 'Height of tower', 'Let height of tower be h.
tan 60 = height / distance = h / 15
√3 = h / 15 -> h = 15√3 m.
So height of tower is 15√3 m (approx 25.98 m).', '3', 25.98, 'meters');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('fd23a881-a897-4222-b2e7-ae82bf253434', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380090', 'The angle of elevation of the top of a building from the foot of the tower is 30 degrees and the angle of elevation of the top of the tower from the foot of the building is 60 degrees. If the tower is 50 m high, find the height of the building.', 'short_answer_3mark', NULL, NULL, NULL, 3, 'Set up two tangent equations using the shared horizontal distance. Solve for height h.', 'medium', '041/241', 'original', 'Building and tower height', 'Let AB be building of height h, CD be tower of height 50 m. Let distance between feet be x.
From triangle BCD: tan 60 = 50/x -> √3 = 50/x -> x = 50/√3 m.
From triangle ABD: tan 30 = h/x -> 1/√3 = h / (50/√3) -> h = 50 / 3 = 16.67 m.
Height of building is 16.67 m.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('2e48ba24-c10e-4b38-a1e1-cb18b0fce161', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380090', 'As observed from the top of a 75 m high lighthouse from the sea-level, the angles of depression of two ships are 30 degrees and 45 degrees. If one ship is exactly behind the other on the same side of the lighthouse, find the distance between the two ships.', 'long_answer_5mark', NULL, NULL, NULL, 5, 'Find distances of both ships from the base of the lighthouse using tan ratios, then subtract.', 'hard', '041/241', 'original', 'Distance between ships', 'Let AB be lighthouse = 75 m. Let ships be at C and D. Angles of elevation from C and D are 45 and 30 degrees.
In triangle ABC: tan 45 = 75/BC -> 1 = 75/BC -> BC = 75 m.
In triangle ABD: tan 30 = 75/BD -> 1/√3 = 75/BD -> BD = 75√3 m.
Distance between ships CD = BD - BC = 75√3 - 75 = 75(√3 - 1) m.
CD = 75(1.732 - 1) = 75(0.732) = 54.9 m.', '5');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('c8cff090-3b69-4eec-b378-704dedd36fe9', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380090', 'Assertion (A): The angle of elevation of an object viewed is the angle formed by the line of sight with the horizontal when the object is above the horizontal level.
Reason (R): If a person stands on a tower and looks down at a car on the ground, the angle formed is the angle of depression.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 1, NULL, 1, 'Both statements are correct definitions of angle of elevation and angle of depression, but they are independent statements. R does not explain A.', 'medium', '041/241', 'original', 'Definitions of angles');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('c130bd49-8950-4e4b-bd4c-bd54169f0f7d', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380090', 'Assertion (A): As the observer moves closer to a vertical tower, the angle of elevation of its top increases.
Reason (R): As the distance from the foot of the tower decreases, the value of the tangent of the angle of elevation must increase.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'Since height is constant, if distance d decreases, h/d increases, which means tan theta increases. Since tan is increasing in [0, 90], theta increases. R correctly explains A.', 'medium', '041/241', 'original', 'Angle of elevation variation');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('9b4503b8-26ce-4fd1-b976-bfad6fb7ce89', 'f74988e3-1c7d-5089-8d52-b514a63fa1c6', 'Prove that the tangent at any point of a circle is perpendicular to the radius through the point of contact.', 'proof', NULL, NULL, NULL, 5, 'Show that any other point Q on the tangent lies outside the circle, making OQ > OP. Conclude that OP is the shortest path and therefore perpendicular.', 'medium', '041/241', 'original', 'Tangent Perpendicularity Theorem', 'Given: A circle with center O and a tangent XY at point P.
To prove: OP perp XY.
Construction: Take any point Q on XY other than P, and join OQ.
Proof:
Since Q lies on the tangent XY and is not P, it must lie outside the circle (if it lay inside, XY would be a secant, not a tangent).
Therefore, OQ must be longer than the radius OP. That is, OQ > OP.
Since this holds for every point on XY except P, OP is the shortest distance from O to the line XY.
The shortest distance from a point to a line is perpendicular. Thus, OP perp XY. Hence proved.', '5');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('2f2dd662-6795-43c6-b47e-198a2d4adb92', 'f74988e3-1c7d-5089-8d52-b514a63fa1c6', 'Prove that the lengths of tangents drawn from an external point to a circle are equal.', 'proof', NULL, NULL, NULL, 5, 'Use RHS congruence on the triangles formed by the radii, common hypotenuse, and tangents.', 'hard', '041/241', 'original', 'Equal Tangents Theorem', 'Given: A circle with center O and two tangents PQ and PR drawn from external point P.
To prove: PQ = PR.
Construction: Join OP, OQ, and OR.
Proof:
In right triangles OQP and ORP:
OQ = OR (Radii of same circle)
OP = OP (Common side)
Angle OQP = Angle ORP = 90 degrees (Radius perp tangent)
By RHS Congruence criterion, triangle OQP congruent to triangle ORP.
Hence, PQ = PR (By CPCT). Hence proved.', '5');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('3b0ae93d-a683-4239-b5d5-2c03e7f7d771', 'f74988e3-1c7d-5089-8d52-b514a63fa1c6', 'A quadrilateral ABCD is drawn to circumscribe a circle. Prove that AB + CD = AD + BC.', 'short_answer_3mark', NULL, NULL, NULL, 3, 'Express each vertex as an external point with equal tangent segments. Group terms to match the sides of the quadrilateral.', 'medium', '041/241', 'original', 'Quadrilateral circumscribing circle', 'Let the circle touch sides AB, BC, CD, DA at P, Q, R, S respectively.
Lengths of tangents from external points are equal:
AP = AS  (Eq 1)
BP = BQ  (Eq 2)
CR = CQ  (Eq 3)
DR = DS  (Eq 4)
Adding all equations:
(AP + BP) + (CR + DR) = (AS + DS) + (BQ + CQ)
AB + CD = AD + BC. Hence proved.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('e450c172-3705-48bb-b84d-a86059492348', 'f74988e3-1c7d-5089-8d52-b514a63fa1c6', 'Assertion (A): From an external point, exactly two tangents can be drawn to a circle.
Reason (R): A tangent is a line that intersects the circle at exactly one point.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 1, NULL, 1, 'Both are true facts. However, the definition of a tangent (R) does not explain why exactly two tangents can be drawn from an external point (which depends on geometry and coordinates).', 'medium', '041/241', 'original', 'Circle tangent properties');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('72a41ae3-6d3f-4396-ad9d-f345e6c1ea35', 'f74988e3-1c7d-5089-8d52-b514a63fa1c6', 'Assertion (A): If the angle between two tangents drawn from an external point to a circle is 60 degrees, then the angle between the radii through the points of contact is 120 degrees.
Reason (R): The angle between the two tangents and the angle between the radii joining the points of contact to the center are supplementary.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'The quadrilateral formed by the center, point of contact, external point has two 90 degree angles. Thus the remaining two angles are supplementary (60 + 120 = 180). Both are true and R explains A.', 'medium', '041/241', 'original', 'Angle relation at circle center');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme, expected_numerical_answer, expected_unit) 
VALUES ('270bc2b5-e309-474e-9ea9-32779e71de18', '7989b2ed-649c-5658-a2ee-146ae15ede8f', 'Find the area of a sector of a circle with radius 6 cm if angle of the sector is 60 degrees.', 'numerical', NULL, NULL, NULL, 2, 'Apply formula Area = (theta/360) * pi * r^2.', 'easy', '041/241', 'original', 'Sector Area', 'Area of sector = (theta / 360) * pi * r^2
Area = (60 / 360) * (22/7) * 6 * 6
Area = (1/6) * (22/7) * 36
Area = 22/7 * 6 = 132/7 = 18.86 cm^2.', '2', 18.86, 'cm^2');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme, expected_numerical_answer, expected_unit) 
VALUES ('595df3b2-d618-4eae-b68c-59e6a84c31ea', '7989b2ed-649c-5658-a2ee-146ae15ede8f', 'The length of the minute hand of a clock is 14 cm. Find the area swept by the minute hand in 5 minutes.', 'numerical', NULL, NULL, NULL, 3, 'Find sector angle (30 degrees), then apply sector area formula.', 'medium', '041/241', 'original', 'Clock swept area', 'In 60 minutes, the minute hand sweeps 360 degrees.
In 5 minutes, it sweeps (360/60) * 5 = 30 degrees.
Area swept = Area of sector with r = 14 cm, theta = 30 degrees.
Area = (30/360) * (22/7) * 14 * 14
Area = (1/12) * 22 * 2 * 14 = (1/12) * 616 = 51.33 cm^2 (or 154/3 cm^2).', '3', 51.33, 'cm^2');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('8cd10737-823d-42fa-a7d7-ee1ea5c7e6ac', '7989b2ed-649c-5658-a2ee-146ae15ede8f', 'A chord of a circle of radius 10 cm subtends a right angle at the centre. Find the area of the corresponding major sector. (Use pi = 3.14)', 'short_answer_3mark', NULL, NULL, NULL, 3, 'Find the major sector angle (270 degrees) and use the sector area formula with pi = 3.14.', 'medium', '041/241', 'original', 'Major sector area', 'Angle of minor sector is 90 degrees.
Angle of major sector = 360 - 90 = 270 degrees.
Area of major sector = (270 / 360) * pi * r^2
Area = (3/4) * 3.14 * 10 * 10
Area = 0.75 * 314 = 235.5 cm^2.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('f8c06062-b91e-403b-b23f-baac25d218af', '7989b2ed-649c-5658-a2ee-146ae15ede8f', 'Assertion (A): The perimeter of a sector of a circle of radius r and sector angle theta is 2r + (theta/360)*2*pi*r.
Reason (R): Area of a circle of radius r is pi * r^2.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 1, NULL, 1, 'Both statements are true. The perimeter of a sector consists of two radii plus the arc length (which is indeed (theta/360)*2*pi*r). R is the formula for the area of a circle. R does not explain A.', 'medium', '041/241', 'original', 'Sector perimeter and area');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('5b9886fc-2431-44d6-93de-3305d4854412', '7989b2ed-649c-5658-a2ee-146ae15ede8f', 'Assertion (A): If the radius of a circle is doubled, its area becomes four times.
Reason (R): Area of a circle is directly proportional to the square of its radius.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'Area = pi * r^2. If r becomes 2r, Area becomes pi*(2r)^2 = 4*pi*r^2. R is the correct explanation of A.', 'medium', '041/241', 'original', 'Area proportionality');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme, expected_numerical_answer, expected_unit) 
VALUES ('84aa9a47-8be5-4bec-9401-2c94bb25515d', '44590101-d2da-565b-adb0-df1b763cd71f', '2 cubes each of volume 64 cm^3 are joined end to end. Find the surface area of the resulting cuboid.', 'numerical', NULL, NULL, NULL, 2, 'Find cube edge length, determine cuboid dimensions, and apply surface area formula.', 'easy', '041/241', 'original', 'Combined solid surface area', 'Volume of cube = a^3 = 64 -> a = 4 cm.
When two cubes are joined end to end, the cuboid formed has:
length l = 4 + 4 = 8 cm, breadth b = 4 cm, height h = 4 cm.
Surface area of cuboid = 2(lb + bh + hl) = 2(8*4 + 4*4 + 4*8)
= 2(32 + 16 + 32) = 2(80) = 160 cm^2.', '2', 160.0, 'cm^2');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme, expected_numerical_answer, expected_unit) 
VALUES ('43433ec4-2f73-4070-9d60-fab1478d528f', '44590101-d2da-565b-adb0-df1b763cd71f', 'A toy is in the form of a cone of radius 3.5 cm mounted on a hemisphere of same radius. The total height of the toy is 15.5 cm. Find the total surface area of the toy.', 'numerical', NULL, NULL, NULL, 3, 'Calculate cone slant height l, then add CSA of cone and CSA of hemisphere.', 'medium', '041/241', 'original', 'Toy surface area', 'Hemisphere radius r = 3.5 cm. Height of hemisphere = 3.5 cm.
Height of cone h = Total height - hemisphere radius = 15.5 - 3.5 = 12 cm.
Slant height of cone l = √[r^2 + h^2] = √[3.5^2 + 12^2] = √[12.25 + 144] = √156.25 = 12.5 cm.
Total surface area = Curved Surface Area of cone + CSA of hemisphere
TSA = pi * r * l + 2 * pi * r^2 = pi * r * (l + 2r)
TSA = (22/7) * 3.5 * (12.5 + 2*3.5) = 11 * (12.5 + 7) = 11 * 19.5 = 214.5 cm^2.', '3', 214.5, 'cm^2');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('011e5f36-0649-461a-89d6-30ab161e1885', '44590101-d2da-565b-adb0-df1b763cd71f', 'A solid toy is in the form of a hemisphere surmounted by a right circular cone. The height of the cone is 2 cm and the diameter of the base is 4 cm. Determine the volume of the toy. (Take pi = 3.14)', 'short_answer_3mark', NULL, NULL, NULL, 3, 'Calculate the volumes of the cone and hemisphere separately and sum them.', 'medium', '041/241', 'original', 'Combined solid volume', 'Base radius r = 4/2 = 2 cm. Height of cone h = 2 cm.
Volume of toy = Volume of cone + Volume of hemisphere
Volume = (1/3) * pi * r^2 * h + (2/3) * pi * r^3
Volume = (1/3) * pi * r^2 * (h + 2r)
Volume = (1/3) * 3.14 * 2^2 * (2 + 2*2)
Volume = (1/3) * 3.14 * 4 * 6 = 3.14 * 4 * 2 = 25.12 cm^3.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('76e61a83-4f1f-45b6-98f4-b6a0aea7a880', '44590101-d2da-565b-adb0-df1b763cd71f', 'Assertion (A): The volume of a sphere of radius r is (4/3) * pi * r^3.
Reason (R): Total surface area of a cylinder of base radius r and height h is 2*pi*r*(r + h).', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 1, NULL, 1, 'Both statements are true standard geometric formulas. However, the surface area formula of a cylinder has nothing to do with the volume of a sphere. So R does not explain A.', 'medium', '041/241', 'original', 'Solid formulas');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('b6226a08-70c2-40b2-953a-958d95064242', '44590101-d2da-565b-adb0-df1b763cd71f', 'Assertion (A): If the radius of a cone is halved and its height is doubled, its volume remains the same.
Reason (R): The volume of a cone is given by V = (1/3) * pi * r^2 * h.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 3, NULL, 1, 'For new cone, V'''' = 1/3 * pi * (r/2)^2 * (2h) = 1/3 * pi * r^2/4 * 2h = 1/2 * V (halved, not same). A is false, R is true.', 'medium', '041/241', 'original', 'Cone volume variation');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme, expected_numerical_answer, expected_unit) 
VALUES ('339d9c33-9594-4696-8a98-e7d7aa661bd8', '77c4c570-7043-57ff-b680-79811428a1a5', 'The following table gives the literacy rate (in percentage) of 35 cities. Find the mean literacy rate:
Literacy Rate (%): 45-55, 55-65, 65-75, 75-85, 85-95
Number of cities: 3, 10, 11, 8, 3', 'numerical', NULL, NULL, NULL, 3, 'Determine class marks, compute fi*xi, sum them up and divide by total frequency.', 'medium', '041/241', 'original', 'Mean Calculation', 'Class marks (xi): 50, 60, 70, 80, 90.
fi: 3, 10, 11, 8, 3. Sum of fi = 35.
fi*xi: 150, 600, 770, 640, 270. Sum of fi*xi = 2430.
Mean = Sum(fi*xi)/Sum(fi) = 2430 / 35 = 69.43%.', '3', 69.43, 'percent');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme, expected_numerical_answer, expected_unit) 
VALUES ('f6e7e291-b071-4fe0-82ce-107ddd74abc5', '77c4c570-7043-57ff-b680-79811428a1a5', 'Find the median of the following frequency distribution:
Class: 0-10, 10-20, 20-30, 30-40, 40-50
Frequency: 5, 8, 20, 15, 7', 'numerical', NULL, NULL, NULL, 3, 'Create cumulative frequency list, identify median class, apply formula Median = l + ((N/2 - cf)/f)*h.', 'medium', '041/241', 'original', 'Median Calculation', 'Frequency fi: 5, 8, 20, 15, 7. Sum N = 55.
Cumulative frequency cf: 5, 13, 33, 48, 55.
N/2 = 27.5. Median class is 20-30 (since 33 is first cf >= 27.5).
l = 20, cf = 13 (preceding), f = 20, h = 10.
Median = l + [(N/2 - cf)/f] * h = 20 + [(27.5 - 13)/20] * 10
Median = 20 + [14.5 / 20] * 10 = 20 + 7.25 = 27.25.', '3', 27.25, 'value');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('0caa0504-d5cd-4472-addb-2398fea4a136', '77c4c570-7043-57ff-b680-79811428a1a5', 'Find the mode of the following data showing the family size of 20 households:
Family Size: 1-3, 3-5, 5-7, 7-9, 9-11
Number of Families: 7, 8, 2, 2, 1', 'short_answer_3mark', NULL, NULL, NULL, 3, 'Identify modal class (highest frequency). Apply formula Mode = l + ((f1-f0)/(2f1-f0-f2))*h.', 'easy', '041/241', 'original', 'Mode Calculation', 'Maximum frequency is 8, corresponding to class 3-5 (modal class).
l = 3, f1 = 8, f0 = 7, f2 = 2, h = 2.
Mode = l + [(f1 - f0)/(2f1 - f0 - f2)] * h
Mode = 3 + [(8 - 7)/(16 - 7 - 2)] * 2
Mode = 3 + [1/7] * 2 = 3 + 0.286 = 3.286.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('f4d1eb68-7f94-42dc-8345-af4353129d42', '77c4c570-7043-57ff-b680-79811428a1a5', 'Assertion (A): The empirical relationship between three measures of central tendency is: 3 Median = Mode + 2 Mean.
Reason (R): If the mode of a distribution is 5.2 and mean is 4.8, then the median is 5.0.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'Using empirical formula: 3 Median = 5.2 + 2(4.8) = 5.2 + 9.6 = 14.8 -> Median = 4.93. The reason''s calculation gives median 5.0, which is incorrect. So A is true, R is false (since R states median is 5.0). Wait, A is true, but R''s math is false. So A is true, R is false.', 'medium', '041/241', 'original', 'Empirical relationship stats');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('8d185bbd-9fe3-4d48-aa1b-75c27994095a', '77c4c570-7043-57ff-b680-79811428a1a5', 'Assertion (A): Cumulative frequency table is useful in determining the median of a distribution.
Reason (R): Mode is the value of the observation having the maximum frequency.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 1, NULL, 1, 'Both statements are true. A cumulative frequency table helps locate the median position. The definition of mode is correct. But R does not explain A.', 'medium', '041/241', 'original', 'Median and Mode definitions');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme, expected_numerical_answer, expected_unit) 
VALUES ('2d8f2d9a-31cd-4c94-8ded-bd1faf6fc336', '2ee0a7c2-bdba-52ba-8196-f11476484efe', 'A bag contains 3 red balls and 5 black balls. A ball is drawn at random from the bag. What is the probability that the ball drawn is (i) red? (ii) not red?', 'numerical', NULL, NULL, NULL, 2, 'P(E) = favorable outcomes / total outcomes. Complementary event probability = 1 - P(E).', 'easy', '041/241', 'original', 'Probability of balls', 'Total balls = 3 + 5 = 8.
(i) P(Red) = Number of red balls / Total balls = 3/8.
(ii) P(Not Red) = 1 - P(Red) = 1 - 3/8 = 5/8.', '2', 0.375, 'value');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme, expected_numerical_answer, expected_unit) 
VALUES ('b9fd529d-7693-4295-a2ae-5d160a62007f', '2ee0a7c2-bdba-52ba-8196-f11476484efe', 'One card is drawn from a well-shuffled deck of 52 cards. Calculate the probability that the card will (i) be an ace, (ii) not be an ace.', 'numerical', NULL, NULL, NULL, 2, 'Use card counts. P(Ace) = 4/52, P(Not Ace) = 48/52.', 'easy', '041/241', 'original', 'Card probability', 'Total cards = 52. Aces = 4.
(i) P(Ace) = 4/52 = 1/13.
(ii) P(Not Ace) = 1 - P(Ace) = 1 - 1/13 = 12/13.', '2', 0.077, 'value');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('b690e60d-36b4-4537-8387-9a8ba0f5a661', '2ee0a7c2-bdba-52ba-8196-f11476484efe', 'A box contains 90 discs which are numbered from 1 to 90. If one disc is drawn at random from the box, find the probability that it bears (i) a two-digit number, (ii) a perfect square number.', 'short_answer_3mark', NULL, NULL, NULL, 3, 'Find counts of outcomes satisfying the conditions out of 90 total outcomes.', 'medium', '041/241', 'original', 'Number probabilities', 'Total discs = 90.
(i) Two-digit numbers are 10 to 90 (total 90 - 9 = 81 numbers). P(Two-digit) = 81/90 = 9/10 = 0.9.
(ii) Perfect squares from 1 to 90 are: 1, 4, 9, 16, 25, 36, 49, 64, 81 (total 9 numbers). P(Perfect square) = 9/90 = 1/10 = 0.1.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('2b27fd72-17ff-4633-8d86-687b84926c3a', '2ee0a7c2-bdba-52ba-8196-f11476484efe', 'Assertion (A): The probability of an impossible event is 0.
Reason (R): The probability of any event E lies between 0 and 1 (inclusive of both).', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 1, NULL, 1, 'Both are true facts about probability. But R (the general range) is not the specific explanation of why an impossible event has a probability of exactly 0. So R does not explain A.', 'medium', '041/241', 'original', 'Probability boundaries');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('04d3c1d1-a5ff-46c9-9a4e-c9f8f62464dc', '2ee0a7c2-bdba-52ba-8196-f11476484efe', 'Assertion (A): If a coin is tossed twice, the probability of getting at least one head is 3/4.
Reason (R): The sample space of tossing a coin twice is {HH, HT, TH, TT}.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'Sample space is indeed correct (4 outcomes). At least one head contains {HH, HT, TH} (3 outcomes). P = 3/4. Both are true and R explains A.', 'medium', '041/241', 'original', 'Coin toss sample space');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, difficulty, board_code, source_year, topic)
VALUES ('1c5d118c-87be-4395-ad48-8dd123ee5e22', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380088', 'A seminar is being conducted by an Educational Organisation, where the participants will be educators of Mathematics, Science and Social Science. The number of participants in Mathematics, Science and Social Science are 60, 84 and 108 respectively.\n\nBased on the above information, answer the following questions:', 'case_study', 4, 'medium', '041/241', 'original', 'Real Numbers Case Study');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('112af0f4-e006-4f07-8a33-b1f6a639701d', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380088', '(i) Find the maximum number of participants that can be accommodated in each room if in each room the same number of participants are to be seated and all of them being in the same subject.', 'short_answer_2mark', 1, '12', 'The maximum number of participants per room is the HCF of 60, 84 and 108.\n60 = 2^2 * 3 * 5\n84 = 2^2 * 3 * 7\n108 = 2^2 * 3^3\nHCF = 2^2 * 3 = 12.', '1', '1c5d118c-87be-4395-ad48-8dd123ee5e22', 1, 'easy', '041/241');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('10beadd4-1352-4be0-946b-63a5f0c4b565', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380088', '(ii) Find the minimum number of rooms required for the event.', 'short_answer_2mark', 1, '21', 'Total participants = 60 + 84 + 108 = 252.\nSince each room accommodates 12 participants, total rooms = 252 / 12 = 21 rooms.', '1', '1c5d118c-87be-4395-ad48-8dd123ee5e22', 2, 'medium', '041/241');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('9a300c22-c975-4a7c-83df-90392b404fe0', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380088', '(iii) Find the LCM of 60, 84 and 108.', 'short_answer_2mark', 2, '3780', '60 = 2^2 * 3 * 5\n84 = 2^2 * 3 * 7\n108 = 2^2 * 3^3\nLCM = 2^2 * 3^3 * 5 * 7 = 4 * 27 * 35 = 3780.', '2', '1c5d118c-87be-4395-ad48-8dd123ee5e22', 3, 'medium', '041/241');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, difficulty, board_code, source_year, topic)
VALUES ('d11c5687-f9d9-4416-a8da-bacd5bfa468a', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380055', 'India is competitive manufacturing location due to the low cost of manpower and strong technical and engineering capabilities contributing to higher quality production runs. The production of TV sets in a factory increases uniformly by a fixed number every year. It produced 16000 sets in 6th year and 22600 in 9th year.\n\nBased on the above information, answer the following questions:', 'case_study', 4, 'medium', '041/241', 'original', 'AP Case Study');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('87b44224-7075-4cc2-b335-ae7edbb55fbd', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380055', '(i) Find the production during the first year.', 'short_answer_2mark', 1, '5000', 'Let first year production be a, and annual increase be d.\na6 = a + 5d = 16000\na9 = a + 8d = 22600\nSubtracting: 3d = 6600 -> d = 2200.\na = 16000 - 5(2200) = 5000.', '1', 'd11c5687-f9d9-4416-a8da-bacd5bfa468a', 1, 'easy', '041/241');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('9bbe7ba6-75a7-44ed-91f5-8ca46b1b5f46', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380055', '(ii) Find the production during the 8th year.', 'short_answer_2mark', 1, '20400', 'a8 = a + 7d = 5000 + 7(2200) = 5000 + 15400 = 20400.', '1', 'd11c5687-f9d9-4416-a8da-bacd5bfa468a', 2, 'easy', '041/241');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('659a1ee6-652b-4441-8ef5-9de763187d8d', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380055', '(iii) Find the total production in 8 years.', 'short_answer_2mark', 2, '101600', 'S8 = (8 / 2) * [2a + 7d] = 4 * [2(5000) + 7(2200)] = 4 * [10000 + 15400] = 4 * 25400 = 101600.', '2', 'd11c5687-f9d9-4416-a8da-bacd5bfa468a', 3, 'medium', '041/241');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, difficulty, board_code, source_year, topic)
VALUES ('238b007e-359c-477c-bce4-48f0799ab359', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380077', 'To conduct Sports Day activities in a rectangular shaped school ground ABCD, lines have been drawn with chalk powder at a distance of 1m each. 100 flower pots have been placed at a distance of 1m from each other along AD. Niharika runs 1/4th the distance AD on the 2nd line and posts a green flag. Preet runs 1/5th the distance AD on the 8th line and posts a red flag.\n\nBased on the above information, answer the following questions:', 'case_study', 4, 'medium', '041/241', 'original', 'Coordinate Geometry Case Study');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('331bfc57-d1f6-45c4-953c-c5070ed335d3', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380077', '(i) Find the position coordinates of the green flag.', 'short_answer_2mark', 1, '(2, 25)', 'Niharika runs on the 2nd line (x=2).\nDistance = 1/4 of 100 = 25m (y=25).\nCoordinates of green flag are (2, 25).', '1', '238b007e-359c-477c-bce4-48f0799ab359', 1, 'easy', '041/241');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('ec3f99cb-edd5-4027-9394-a4072d0d6e13', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380077', '(ii) Find the position coordinates of the red flag.', 'short_answer_2mark', 1, '(8, 20)', 'Preet runs on the 8th line (x=8).\nDistance = 1/5 of 100 = 20m (y=20).\nCoordinates of red flag are (8, 20).', '1', '238b007e-359c-477c-bce4-48f0799ab359', 2, 'easy', '041/241');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('4a01f2c5-a046-4e49-a788-b413ba73cb79', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380077', '(iii) Find the distance between both the flags.', 'short_answer_2mark', 2, '6.08', 'Using distance formula between (2, 25) and (8, 20):\nd = √[(8 - 2)^2 + (20 - 25)^2] = √[6^2 + (-5)^2] = √[36 + 25] = √61 = 7.81m.', '2', '238b007e-359c-477c-bce4-48f0799ab359', 3, 'medium', '041/241');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, difficulty, board_code, source_year, topic)
VALUES ('c8433973-edee-4cee-b399-1f6315b1ab29', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380090', 'A group of students of Class X visited India Gate. The teacher explained that India Gate is 42 m high. From a point on the ground, the angle of elevation of the top is 45 degrees. A tourist stands further away from the same point, making an angle of elevation of 30 degrees.\n\nBased on the above information, answer the following questions:', 'case_study', 4, 'medium', '041/241', 'original', 'Trig Height Case Study');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('92229d8f-0b4e-42de-8884-5c54dc23cb0b', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380090', '(i) Find the distance of the first point from the base of India Gate.', 'short_answer_2mark', 1, '42', 'Let distance be x. Height h = 42m.\ntan 45 = h / x -> 1 = 42 / x -> x = 42m.', '1', 'c8433973-edee-4cee-b399-1f6315b1ab29', 1, 'easy', '041/241');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('f4f5b52f-2c5e-47cf-a337-91c1085d4abd', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380090', '(ii) Find the distance of the tourist from the base.', 'short_answer_2mark', 1, '72.74', 'Let distance of tourist be y.\ntan 30 = 42 / y -> 1/√3 = 42 / y -> y = 42√3 m = 42 * 1.732 = 72.74 m.', '1', 'c8433973-edee-4cee-b399-1f6315b1ab29', 2, 'medium', '041/241');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('a24786e1-61ae-40a3-abbe-1b67bc8af6f8', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380090', '(iii) Find the distance between the two points.', 'short_answer_2mark', 2, '30.74', 'Distance between points = y - x = 42√3 - 42 = 42(√3 - 1) = 42(0.732) = 30.74 m.', '2', 'c8433973-edee-4cee-b399-1f6315b1ab29', 3, 'medium', '041/241');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, difficulty, board_code, source_year, topic)
VALUES ('a3eaa2bd-9014-4c53-b09f-93e6a00f9f12', '44590101-d2da-565b-adb0-df1b763cd71f', 'A solid toy is in the form of a hemisphere surmounted by a right circular cone of the same radius. The height of the cone is 4 cm and the diameter of the base is 6 cm.\n\nBased on the above information, answer the following questions:', 'case_study', 4, 'medium', '041/241', 'original', 'Volumes Case Study');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('038eb9e0-5f13-4f66-95ec-46add10ef999', '44590101-d2da-565b-adb0-df1b763cd71f', '(i) Find the volume of the conical portion of the toy.', 'short_answer_2mark', 1, '37.68', 'Radius r = 6/2 = 3 cm. Height h = 4 cm.\nVolume of cone = (1/3) * pi * r^2 * h = (1/3) * 3.14 * 9 * 4 = 37.68 cm^3.', '1', 'a3eaa2bd-9014-4c53-b09f-93e6a00f9f12', 1, 'easy', '041/241');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('d6793b53-179b-497e-841e-cd6be5b924c8', '44590101-d2da-565b-adb0-df1b763cd71f', '(ii) Find the volume of the hemispherical portion.', 'short_answer_2mark', 1, '56.52', 'Volume of hemisphere = (2/3) * pi * r^3 = (2/3) * 3.14 * 27 = 56.52 cm^3.', '1', 'a3eaa2bd-9014-4c53-b09f-93e6a00f9f12', 2, 'easy', '041/241');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('3efedef5-3529-4718-9f39-355685d37cc6', '44590101-d2da-565b-adb0-df1b763cd71f', '(iii) Find the total volume of the toy.', 'short_answer_2mark', 2, '94.20', 'Total volume = Volume of cone + Volume of hemisphere = 37.68 + 56.52 = 94.20 cm^3.', '2', 'a3eaa2bd-9014-4c53-b09f-93e6a00f9f12', 3, 'easy', '041/241');
-- =========================================================================
-- Science (Code 086) Questions Seeding
-- =========================================================================

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('b5c26405-3b61-4111-9ef6-7f1925fa2581', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', 'Why is respiration considered an exothermic reaction? Explain with a chemical equation.', 'short_answer_2mark', NULL, NULL, NULL, 2, 'Glucose combines with oxygen to release energy. The chemical equation must be balanced.', 'easy', '086', 'original', 'Exothermic Reactions', 'During respiration, the glucose obtained from food combines with oxygen in our body cells to release energy in the form of ATP. Since energy is released, it is an exothermic reaction.
C6H12O6(aq) + 6O2(g) -> 6CO2(g) + 6H2O(l) + Energy', '2');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('3cce141b-5e5a-483e-aab2-84f14f3fe8eb', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', 'Write the balanced chemical equation for the following: (i) Hydrogen + Chlorine -> Hydrogen Chloride, (ii) Barium Chloride + Aluminium Sulphate -> Barium Sulphate + Aluminium Chloride.', 'short_answer_2mark', NULL, NULL, NULL, 2, 'Each balanced equation is worth 1 mark.', 'medium', '086', 'original', 'Chemical Equations Balancing', '(i) H2 + Cl2 -> 2HCl
(ii) 3BaCl2 + Al2(SO4)3 -> 3BaSO4 + 2AlCl3', '2');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('dc3905da-f83f-4024-8e9e-6a58beb0d871', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', 'Explain combination, decomposition, and displacement reactions with one example equation for each.', 'long_answer_5mark', NULL, NULL, NULL, 5, '1.5 marks for combination with example, 1.5 marks for decomposition with example, 2 marks for displacement with example.', 'medium', '086', 'original', 'Types of Chemical Reactions', '1. Combination: Two or more reactants form a single product. Example: C + O2 -> CO2.
2. Decomposition: A single reactant breaks down into two or more products. Example: CaCO3 --(heat)--> CaO + CO2.
3. Displacement: A more reactive element displaces a less reactive element from its salt solution. Example: Fe + CuSO4 -> FeSO4 + Cu.', '5');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('95efabf7-4f50-428d-80f0-d3a34b6bdd8f', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', 'Assertion (A): Nitrogen gas is flushed into packets of chips to prevent them from becoming rancid.
Reason (R): Nitrogen is a highly reactive gas that prevents oxidation of fats and oils.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 2, NULL, 1, 'Assertion is true, but Reason is false. Nitrogen is an unreactive (inert) gas, which is why it is used as a flushing gas to prevent oxidation.', 'medium', '086', 'original', 'Rancidity prevention');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('7f8fd7bb-cc18-41c2-8d39-3ee314bd65c0', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', 'Assertion (A): Silver chloride turns grey in sunlight.
Reason (R): Decomposition of silver chloride in the presence of sunlight is a photolytic decomposition reaction.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'Silver chloride decomposes into silver metal (grey) and chlorine gas under sunlight. The reason correctly explains this photolytic reaction.', 'medium', '086', 'original', 'Photolytic Decomposition');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('1d5026c7-3eed-4365-bc16-b0631b15b062', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380224', 'Why does dry HCl gas not change the colour of dry litmus paper?', 'short_answer_2mark', NULL, NULL, NULL, 2, 'Explain the role of water in the dissociation of H+ ions for dry HCl gas.', 'easy', '086', 'original', 'Acidic character', 'Dry HCl gas does not contain water. Acidic properties are only shown when HCl dissociates into H+ ions, which requires water (moisture). Therefore, dry HCl does not release H+ ions and does not change the color of dry litmus.', '2');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('a5da5f4a-dc77-4e14-916a-f4a0aa308366', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380224', 'A solution reacts with crushed egg-shells to give a gas that turns lime-water milky. Name the solution and identify the gas. Write the chemical equation.', 'short_answer_3mark', NULL, NULL, NULL, 3, '1 mark for identifying HCl, 1 mark for CO2, 1 mark for the correct chemical equation.', 'medium', '086', 'original', 'Egg shell acid reaction', 'Crushed egg shells contain calcium carbonate (CaCO3). The solution is hydrochloric acid (HCl), and the gas released is carbon dioxide (CO2).
Equation: CaCO3 + 2HCl -> CaCl2 + H2O + CO2', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('fe6ca407-b6be-4f34-a07f-3c701ab3211d', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380224', 'Explain the importance of pH in: (i) Soil testing for crop growth, (ii) Preventing tooth decay, (iii) Digestive system of humans.', 'long_answer_5mark', NULL, NULL, NULL, 5, '1.5 marks for soil, 1.5 marks for tooth decay, 2 marks for digestion details.', 'medium', '086', 'original', 'Importance of pH', '(i) Crops grow best in a specific pH range. If soil is too acidic, it is treated with quicklime. If too basic, organic matter is added.
(ii) Tooth decay starts when mouth pH falls below 5.5. Bacteria produce acids that corrode calcium phosphate enamel. Toothpastes are basic and neutralize this acid.
(iii) The stomach produces HCl (pH 1-3) to digest food. Excess acid causes acidity, which is treated with antacids like Milk of Magnesia (Mg(OH)2).', '5');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('dccbe2f8-3b27-44c4-9837-a93c6757380b', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380224', 'Assertion (A): Plaster of Paris should be stored in moisture-proof containers.
Reason (R): Plaster of Paris absorbs moisture to set into a hard solid mass called Gypsum.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'POP (CaSO4 . 1/2 H2O) reacts with water to form gypsum (CaSO4 . 2H2O). Both A and R are true and R explains A.', 'medium', '086', 'original', 'Plaster of Paris hydration');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('1a0a095a-a99e-4f50-bbf8-f05947a86092', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380233', 'Define amphoteric oxides. Give two examples of amphoteric oxides with their chemical formulas.', 'short_answer_3mark', NULL, NULL, NULL, 3, '1 mark for definition, 2 marks for the two correct formulas.', 'medium', '086', 'original', 'Amphoteric Oxides', 'Metal oxides which react with both acids as well as bases to produce salt and water are called amphoteric oxides.
Examples: Aluminium oxide (Al2O3) and Zinc oxide (ZnO).', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('eedbfff7-4dee-4dcc-8d63-06d41bd8650e', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380233', 'Why are ionic compounds solid, and why do they have high melting and boiling points?', 'short_answer_2mark', NULL, NULL, NULL, 2, '1 mark for electrostatic attraction, 1 mark for energy required to break bonds.', 'easy', '086', 'original', 'Ionic Compounds properties', 'Ionic compounds are solids because they have strong electrostatic forces of attraction between positive and negative ions. A large amount of energy is required to break these strong inter-ionic attractions, resulting in high melting and boiling points.', '2');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('e6e217c7-fcb4-48b3-8533-e90bf7d936cc', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380233', 'Assertion (A): Sodium and potassium metals are stored under kerosene oil.
Reason (R): They react vigorously with air and water, catching fire due to the highly exothermic nature of the reaction.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'Sodium and potassium are highly reactive and react with moisture and oxygen in air. Storing in kerosene prevents this. Both A and R are true and R explains A.', 'medium', '086', 'original', 'Alkali metal storage');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('c7eb829c-bd1a-4afa-a5f5-40fe57554cb4', '55c86387-db5e-47b7-8d92-8a1b846d760f', 'Define homologous series of carbon compounds. State two characteristic properties of a homologous series.', 'short_answer_3mark', NULL, NULL, NULL, 3, '1 mark for definition, 2 marks for two properties.', 'medium', '086', 'original', 'Homologous Series', 'A series of carbon compounds having the same functional group, where successive members differ by a -CH2- unit, is a homologous series.
Properties: (1) Members share similar chemical properties, (2) Difference in molecular mass between successive members is 14 u, (3) Gradual gradation in physical properties.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('3e4d085a-59ea-472d-ab73-88783ed940c3', '55c86387-db5e-47b7-8d92-8a1b846d760f', 'Explain the mechanism of the cleansing action of soap. What is micelle formation?', 'long_answer_5mark', NULL, NULL, NULL, 5, '2 marks for molecular structure (heads/tails), 2 marks for micelle alignment, 1 mark for cleaning mechanism description.', 'hard', '086', 'original', 'Cleansing Action of Soap', 'Soap molecules consist of a hydrophilic ionic head and a hydrophobic hydrocarbon tail.
When soap is added to water containing dirt (oils), the hydrophobic tails align towards the dirt/oil, while the hydrophilic heads align outwards towards water.
This forms a spherical structure called a micelle. The oil droplet is trapped at the center of the micelle. When the water is agitated, the micelles carrying the dirt are washed away.', '5');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('13969318-7a1b-49fc-bd42-c153d066efcd', '55c86387-db5e-47b7-8d92-8a1b846d760f', 'Assertion (A): Covalent compounds are generally poor conductors of electricity.
Reason (R): Covalent compounds are formed by sharing of electrons and do not contain free ions or charged particles.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'Electricity conduction requires free ions or electrons. Since covalent compounds share electrons, no ions are formed. Both statements are true and R explains A.', 'medium', '086', 'original', 'Covalent bond conductivity');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('6938c72b-8ce2-47b4-a432-460abb69d883', '274eaed4-ab07-4c2f-8bee-753cd15c0800', 'Explain double circulation in human beings. Why is it necessary?', 'short_answer_3mark', NULL, NULL, NULL, 3, '1 mark for definition/flow, 1 mark for the two paths, 1 mark for the necessity (separation/efficiency).', 'medium', '086', 'original', 'Double Circulation', 'In double circulation, blood flows through the heart twice during one complete cycle. It consists of pulmonary circulation (heart to lungs and back) and systemic circulation (heart to body and back).
It is necessary to separate oxygenated and deoxygenated blood, ensuring a highly efficient supply of oxygen to the body to maintain constant body temperature.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('dca9eac7-6f6a-401d-bc81-2cd5fb7d2987', '274eaed4-ab07-4c2f-8bee-753cd15c0800', 'Explain the structure and function of nephrons with the help of a neat diagrammatic description of the steps of filtration.', 'diagram_label', NULL, NULL, NULL, 3, '1 mark for filtration/Bowman''''s capsule, 1 mark for reabsorption in tubule, 1 mark for final excretion path.', 'hard', '086', 'original', 'Structure of Nephron', 'A nephron is the filtration unit of the kidney. Structure components:
1. Bowman''''s Capsule: Cup-like structure that contains the glomerulus (network of capillaries).
2. Glomerulus: Filters blood under pressure (ultrafiltration).
3. Renal Tubule: Selective reabsorption of glucose, amino acids, salts, and excess water occurs here.
Function: Collects the remaining waste as urine, which is sent to the collecting duct.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('dffeed5a-dad0-432d-84f3-9f520ca5b635', '274eaed4-ab07-4c2f-8bee-753cd15c0800', 'Assertion (A): Bile juice does not contain any digestive enzymes, yet it is essential for digestion.
Reason (R): Bile emulsifies fats, breaking them down into small globules, and makes the medium alkaline for pancreatic lipase to act.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'Bile has no enzymes but performs emulsification and activates lipase. Both A and R are true and R explains A.', 'medium', '086', 'original', 'Bile digestion role');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('28e2df12-e817-4bd5-aee5-689a5fae30e9', '27754dde-2e5c-4db4-852f-57b05475d565', 'Define reflex arc. Trace the pathway of nerve impulses in a reflex action when a hand touches a hot object.', 'short_answer_3mark', NULL, NULL, NULL, 3, '1 mark for definition, 2 marks for tracing the correct sequence of neurons and organs.', 'medium', '086', 'original', 'Reflex Arc Pathway', 'A reflex arc is the pathway traversed by nerve impulses during a reflex action.
Pathway: Receptor (Skin) -> Sensory Neuron -> Spinal Cord (Integration) -> Motor Neuron -> Effector (Muscle) -> Response (Withdrawal of hand).', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('5c8bfd5c-2012-4ec8-8bdf-46db994d6875', '27754dde-2e5c-4db4-852f-57b05475d565', 'Assertion (A): Pancreas is both an endocrine and an exocrine gland.
Reason (R): It secretes pancreatic juice (containing enzymes) into the duodenum and hormones (insulin and glucagon) directly into the blood.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'Dual function means endocrine (ductless hormones) and exocrine (ducted juice). Pancreas performs both. Both A and R are true and R explains A.', 'medium', '086', 'original', 'Pancreas dual function');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('834fa4aa-a848-4dd5-be68-ea2134e34701', '3d4954a5-596d-44ff-97c7-115a3865ce46', 'State the differences between self-pollination and cross-pollination.', 'short_answer_2mark', NULL, NULL, NULL, 2, '1 mark for self-pollination definition, 1 mark for cross-pollination definition.', 'easy', '086', 'original', 'Pollination differences', 'Self-pollination: Transfer of pollen grains from the anther to the stigma of the same flower or another flower on the same plant. No pollinating agent is required.
Cross-pollination: Transfer of pollen grains from the anther of a flower to the stigma of a flower on a different plant of the same species. External agents (wind, water, insects) are required.', '2');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('63cd73dc-5830-4607-abc2-1bed593bb588', '3d4954a5-596d-44ff-97c7-115a3865ce46', 'Assertion (A): Vegetative propagation produces plants that are genetically identical to the parent plant.
Reason (R): Vegetative reproduction involves only mitotic cell division without the fusion of gametes.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'Vegetative propagation is asexual, using parts like stem/leaf. It relies on mitotic division, preserving the exact genetic code. Both are true and R explains A.', 'medium', '086', 'original', 'Vegetative cloning');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('0d8383c4-075a-4fc5-95bb-a2e965bc7958', 'e6a4048a-e777-4d50-9218-106e9c61b1fd', 'Explain how the sex of a child is determined in human beings.', 'short_answer_3mark', NULL, NULL, NULL, 3, '1 mark for chromosomes of parents, 1 mark for zygote combinations, 1 mark for concluding the father''''s role.', 'medium', '086', 'original', 'Sex Determination', 'Humans have 23 pairs of chromosomes, out of which 1 pair is the sex chromosome. Females have XX chromosomes, while males have XY chromosomes.
All eggs contain X chromosomes. Sperm can carry either X or Y chromosomes.
- If a sperm carrying an X chromosome fertilizes the egg, the zygote is XX (female).
- If a sperm carrying a Y chromosome fertilizes the egg, the zygote is XY (male).
Thus, the sex of the child is determined by the chromosome contributed by the father.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('4e4b2109-b259-48ca-8331-fa981243e875', 'e6a4048a-e777-4d50-9218-106e9c61b1fd', 'Assertion (A): Acquired traits during the lifetime of an individual are not inherited.
Reason (R): Changes in non-reproductive tissues (somatic cells) cannot be passed on to the DNA of germ cells.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'Somatic changes (like muscle building) do not affect DNA in sperm/eggs, hence cannot be inherited. Both A and R are true and R explains A.', 'medium', '086', 'original', 'Acquired vs Inherited traits');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme, expected_numerical_answer, expected_unit) 
VALUES ('de9e96ea-4213-4fab-96cd-c5ee9662eb3d', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383009', 'A convex mirror used for rearview on an automobile has a radius of curvature of 3.0 m. If a bus is located at 5.0 m from this mirror, find the position, nature and magnification of the image.', 'numerical', NULL, NULL, NULL, 3, 'Calculate f, apply 1/f = 1/v + 1/u, solve for image distance v and magnification m.', 'medium', '086', 'original', 'Mirror Formula Application', 'Radius of curvature R = 3.0 m -> focal length f = R/2 = +1.5 m.
Object distance u = -5.0 m.
Using mirror formula: 1/f = 1/v + 1/u
1/v = 1/f - 1/u = 1/1.5 - 1/(-5.0) = 1/1.5 + 1/5 = 10/15 + 3/15 = 13/15
v = 15/13 = +1.15 m.
Image is virtual, erect, and formed behind the mirror.
Magnification m = -v/u = -(1.15) / (-5) = +0.23.', '3', 1.15, 'meters');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme, expected_numerical_answer, expected_unit) 
VALUES ('5b8791ac-2780-4db6-acf9-ffa418fe936d', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383009', 'A concave lens has a focal length of 15 cm. At what distance should the object from the lens be placed so that it forms an image at 10 cm from the lens? Also find the magnification.', 'numerical', NULL, NULL, NULL, 3, 'Substitute f=-15 and v=-10 in lens formula to solve for object distance u.', 'medium', '086', 'original', 'Lens Formula Application', 'For concave lens, f = -15 cm, v = -10 cm (virtual image).
Using lens formula: 1/f = 1/v - 1/u
1/u = 1/v - 1/f = 1/(-10) - 1/(-15) = -1/10 + 1/15 = (-3 + 2)/30 = -1/30
u = -30 cm.
Object distance is 30 cm.
Magnification m = v/u = -10 / -30 = +1/3 = +0.33.', '3', -30.0, 'cm');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('089116f6-7317-44e0-92e3-e7c42d2275cb', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383009', 'Assertion (A): The refractive index of a medium with respect to vacuum is always greater than 1.
Reason (R): The speed of light in vacuum is the maximum speed possible, and it decreases when light enters any optical medium.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'Refractive index n = c/v. Since c (speed in vacuum) is greater than v (speed in medium), n must be greater than 1. Both A and R are true and R explains A.', 'medium', '086', 'original', 'Refractive index meaning');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('84ba7d94-7b34-4de4-aa81-fe235501e5d3', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383010', 'What is myopia (near-sightedness)? State its two main causes and explain how it is corrected.', 'short_answer_3mark', NULL, NULL, NULL, 3, '1 mark for definition/symptom, 1 mark for two causes, 1 mark for corrective concave lens.', 'medium', '086', 'original', 'Myopia Defect', 'Myopia is a defect of vision in which a person can see nearby objects clearly but cannot see distant objects distinctly. The image of a distant object is formed in front of the retina.
Causes: (1) Excessive curvature of the eye lens, (2) Elongation of the eyeball.
Correction: It is corrected by using a concave lens of suitable focal length, which diverges the rays so they focus on the retina.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('672126d9-5986-4dae-9fb3-f7cc623f1224', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383010', 'Assertion (A): The sky appears blue during a clear day.
Reason (R): Molecules of air and other fine particles in the atmosphere have a size smaller than the wavelength of visible light, and scatter blue light of shorter wavelengths more strongly than red light.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'Rayleigh scattering scatters shorter wavelengths (blue) more than longer (red). Both A and R are true and R explains A.', 'medium', '086', 'original', 'Rayleigh scattering');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme, expected_numerical_answer, expected_unit) 
VALUES ('a1c591c2-cb10-49fe-8f15-4b0b3b06206b', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380122', 'An electric lamp of resistance 20 ohm and a conductor of 4 ohm resistance are connected in series to a 6 V battery. Calculate: (a) the total resistance of the circuit, (b) the current flowing through the circuit.', 'numerical', NULL, NULL, NULL, 3, 'Calculate series resistance Rs, then apply I = V/R.', 'easy', '086', 'original', 'Series Circuit Calculations', '(a) In series, Rs = R1 + R2 = 20 + 4 = 24 ohm.
(b) According to Ohm''''s Law, I = V / Rs = 6 / 24 = 0.25 A.', '3', 0.25, 'amperes');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme, expected_numerical_answer, expected_unit) 
VALUES ('5f0997f9-f94f-4260-853d-3a58eecda5da', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380122', 'An electric heater of resistance 8 ohm draws 15 A from the service mains for 2 hours. Calculate the rate at which heat is developed in the heater.', 'numerical', NULL, NULL, NULL, 3, 'Rate of heat is Power P = I^2 * R. Time t is irrelevant for rate.', 'medium', '086', 'original', 'Joule''''s Heating Rate', 'Given: R = 8 ohm, I = 15 A, t = 2 hours.
Rate of heat development is Power (P).
P = I^2 * R
P = 15^2 * 8 = 225 * 8 = 1800 W = 1800 J/s.
Rate of heat development is 1800 W (or J/s).', '3', 1800.0, 'watts');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('eab7c5d7-30b0-435c-a81a-780041db8739', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380122', 'Assertion (A): Alloys are commonly used in electrical heating devices like electric irons and toasters.
Reason (R): Alloys have higher resistivity than their constituent metals and do not oxidize (burn) easily at high temperatures.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'Alloys don''''t melt or oxidize at high heat and resist current more. Both A and R are true and R explains A.', 'medium', '086', 'original', 'Alloy heating element');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('41a41cca-c5e3-4275-a987-76720d42e812', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383012', 'State Fleming''''s Left-Hand Rule. How does it help find the direction of force on a current-carrying conductor in a magnetic field?', 'short_answer_3mark', NULL, NULL, NULL, 3, '2 marks for correct finger alignments, 1 mark for identifying thumb as the force direction.', 'medium', '086', 'original', 'Fleming''''s Left-Hand Rule', 'Fleming''''s Left-Hand Rule: Stretch the thumb, forefinger, and middle finger of your left hand such that they are mutually perpendicular. If the forefinger points in the direction of the magnetic field and the middle finger points in the direction of the current, then the thumb points in the direction of motion or the force acting on the conductor.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('680c003a-1965-46ed-aff8-49a18765b3ae', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383012', 'Assertion (A): A compass needle gets deflected when placed near a current-carrying wire.
Reason (R): Current flowing through a metallic conductor produces a magnetic field around it.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'The compass needle reacts to the magnetic field generated by the current. Both A and R are true and R explains A.', 'medium', '086', 'original', 'Oersted experiment');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('9cb33127-1a6e-44ce-b2c5-acb3e0c1c620', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383013', 'What is biomagnification (biological magnification)? Explain with an example.', 'short_answer_2mark', NULL, NULL, NULL, 2, '1 mark for definition, 1 mark for example.', 'easy', '086', 'original', 'Biomagnification', 'Biomagnification is the progressive increase in the concentration of toxic, non-biodegradable chemicals (like DDT) at each successive trophic level in a food chain.
Example: Runoff pesticides enter water -> absorbed by phytoplanktons -> consumed by zooplanktons -> small fish -> large fish -> fish-eating birds (highest concentration).', '2');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('dcc6e866-1ee7-4f0b-b06c-9bec0583d159', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd383013', 'Assertion (A): Decomposers play a vital role in maintaining the balance of nutrients in an ecosystem.
Reason (R): Decomposers break down the complex organic substances of dead plants and animals into simple inorganic substances that go into the soil.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'Decomposers recycle nutrients by breaking down organic decay. Both A and R are true and R explains A.', 'medium', '086', 'original', 'Decomposers role');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, difficulty, board_code, source_year, topic)
VALUES ('06ac8045-148e-4015-b4d8-ecf345994df1', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', 'A student took three test tubes A, B, and C containing copper sulphate, zinc sulphate, and iron sulphate solutions respectively. She added iron nails to test tube A, copper turnings to test tube B, and zinc granules to test tube C.\n\nBased on the above information, answer the following questions:', 'case_study', 4, 'medium', '086', 'original', 'Chemistry Displacement Case Study');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('d6aa6423-c1c2-4e0f-841a-7f51faaea6ab', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', '(i) What changes are observed in test tube A (iron nails in copper sulphate)?', 'short_answer_2mark', 1, 'Blue solution turns pale green', 'Iron is more reactive than copper, so it displaces copper from CuSO4. The blue solution of CuSO4 turns pale green due to formation of FeSO4, and a reddish-brown coating of copper is deposited on the iron nails.', '1', '06ac8045-148e-4015-b4d8-ecf345994df1', 1, 'easy', '086');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('7bd46e9c-f44e-49db-abd9-07c186038640', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', '(ii) Why does no reaction take place in test tube B (copper in zinc sulphate)?', 'short_answer_2mark', 1, 'Copper is less reactive than zinc', 'Copper is lower than zinc in the reactivity series and is less reactive. Therefore, copper cannot displace zinc from zinc sulphate solution.', '1', '06ac8045-148e-4015-b4d8-ecf345994df1', 2, 'easy', '086');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('85e38574-9c1f-4fc1-9d6d-9ff77f3da77d', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099', '(iii) Write the chemical equation for the reaction in test tube C (zinc in iron sulphate).', 'short_answer_2mark', 2, 'Zn + FeSO4 -> ZnSO4 + Fe', 'Zinc is more reactive than iron. It displaces iron from FeSO4.\nEquation: Zn(s) + FeSO4(aq) -> ZnSO4(aq) + Fe(s)', '2', '06ac8045-148e-4015-b4d8-ecf345994df1', 3, 'medium', '086');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, difficulty, board_code, source_year, topic)
VALUES ('0ed711d8-d82e-4bf4-9bd0-024dac672d44', '274eaed4-ab07-4c2f-8bee-753cd15c0800', 'In humans, the food we eat is digested in the alimentary canal. Proteins, carbohydrates, and fats are digested in various parts. The pancreas secretes enzymes like trypsin and lipase, while the liver secretes bile juice into the small intestine.\n\nBased on the above information, answer the following questions:', 'case_study', 4, 'medium', '086', 'original', 'Life Processes Case Study');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('0964f959-5b42-4e0c-a34f-cc102e30dc56', '274eaed4-ab07-4c2f-8bee-753cd15c0800', '(i) What is the function of trypsin and lipase respectively?', 'short_answer_2mark', 1, 'Trypsin digests proteins, lipase digests fats', 'Trypsin digests proteins into amino acids. Lipase digests emulsified fats into fatty acids and glycerol.', '1', '0ed711d8-d82e-4bf4-9bd0-024dac672d44', 1, 'easy', '086');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('fec72162-3dd2-4539-b744-b1bc33ca17ab', '274eaed4-ab07-4c2f-8bee-753cd15c0800', '(ii) Why is the small intestine design suited for absorption?', 'short_answer_2mark', 1, 'Contains villi to increase surface area', 'The inner wall of the small intestine contains millions of finger-like projections called villi, which immensely increase the surface area for absorption of digested food.', '1', '0ed711d8-d82e-4bf4-9bd0-024dac672d44', 2, 'easy', '086');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('8c48c038-8b8f-4786-b991-c5c16ef329f5', '274eaed4-ab07-4c2f-8bee-753cd15c0800', '(iii) Explain the role of bile juice in fat digestion.', 'short_answer_2mark', 2, 'Emulsifies fats and makes medium alkaline', 'Bile juice contains bile salts that emulsify large fat globules into smaller ones (increasing enzyme action) and provides an alkaline medium for pancreatic enzymes.', '2', '0ed711d8-d82e-4bf4-9bd0-024dac672d44', 3, 'medium', '086');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, difficulty, board_code, source_year, topic)
VALUES ('50853855-1eeb-434d-a152-2892883e88ff', 'e6a4048a-e777-4d50-9218-106e9c61b1fd', 'Gregor Mendel conducted experiments on garden pea plants (Pisum sativum) to study inheritance. In one monohybrid cross, he crossed pure tall pea plants (TT) with pure dwarf pea plants (tt). All F1 offspring were tall. Then he self-pollinated the F1 generation to obtain F2 generation.\n\nBased on the above information, answer the following questions:', 'case_study', 4, 'medium', '086', 'original', 'Heredity Case Study');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('7aca9058-d264-4a6f-aaa0-c5e17d8a9f8a', 'e6a4048a-e777-4d50-9218-106e9c61b1fd', '(i) What was the genotype of the F1 generation?', 'short_answer_2mark', 1, 'Tt', 'The F1 generation genotype is Tt (heterozygous tall), carrying one allele for tallness and one for dwarfness.', '1', '50853855-1eeb-434d-a152-2892883e88ff', 1, 'easy', '086');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('6c5aa149-cca7-4ebc-a74d-704b6c691d04', 'e6a4048a-e777-4d50-9218-106e9c61b1fd', '(ii) What is the phenotypic ratio of tall to dwarf plants in the F2 generation?', 'short_answer_2mark', 1, '3:1', 'The phenotypic ratio is 3 tall : 1 dwarf plant in the F2 generation.', '1', '50853855-1eeb-434d-a152-2892883e88ff', 2, 'easy', '086');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('165f34f7-7c01-41df-9517-bb95363acf5f', 'e6a4048a-e777-4d50-9218-106e9c61b1fd', '(iii) Explain what law Mendel formulated based on this monohybrid cross.', 'short_answer_2mark', 2, 'Law of Dominance', 'Mendel formulated the Law of Dominance, which states that in a heterozygote, one allele (dominant, T) masks the expression of another allele (recessive, t) for the same character.', '2', '50853855-1eeb-434d-a152-2892883e88ff', 3, 'medium', '086');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, difficulty, board_code, source_year, topic)
VALUES ('e223a82a-206c-498f-932a-39a4fc161574', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380122', 'A student connects three resistors R1 = 2 ohm, R2 = 3 ohm, and R3 = 6 ohm to a 12 V battery in different arrangements (series and parallel) to study current and resistance variations.\n\nBased on the above information, answer the following questions:', 'case_study', 4, 'medium', '086', 'original', 'Electricity Case Study');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('ac7bb31f-21d0-447c-9fe5-350c73a75429', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380122', '(i) Calculate equivalent resistance when connected in series.', 'short_answer_2mark', 1, '11 ohm', 'Rs = R1 + R2 + R3 = 2 + 3 + 6 = 11 ohm.', '1', 'e223a82a-206c-498f-932a-39a4fc161574', 1, 'easy', '086');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('77b3f3fa-c3d4-4bd2-9c31-e9e97c37d565', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380122', '(ii) Calculate equivalent resistance when connected in parallel.', 'short_answer_2mark', 1, '1 ohm', '1/Rp = 1/2 + 1/3 + 1/6 = (3 + 2 + 1)/6 = 6/6 = 1 -> Rp = 1 ohm.', '1', 'e223a82a-206c-498f-932a-39a4fc161574', 2, 'easy', '086');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('1a1c13cc-62eb-4262-857c-2bc506b4305a', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380122', '(iii) What is the total current drawn from the battery in the parallel arrangement?', 'short_answer_2mark', 2, '12 A', 'I = V / Rp = 12 V / 1 ohm = 12 A.', '2', 'e223a82a-206c-498f-932a-39a4fc161574', 3, 'medium', '086');
-- =========================================================================
-- Social Science (Code 087) Questions Seeding
-- =========================================================================

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('5025fbab-e32e-471a-9f0e-4e47cc2655fa', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', 'Why did Mahatma Gandhi decide to launch a nationwide Satyagraha against the proposed Rowlatt Act 1919?', 'short_answer_2mark', NULL, NULL, NULL, 2, 'Explain the provisions of the Rowlatt Act (detention without trial for 2 years) and Gandhiji''''s opposition.', 'easy', '087', 'original', 'Rowlatt Act Satyagraha', 'The Rowlatt Act was passed hurriedly by the Imperial Legislative Council despite united opposition from Indian members. It gave the government enormous powers to repress political activities, and allowed detention of political prisoners without trial for two years. Gandhiji wanted non-violent civil disobedience against such unjust laws.', '2');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('46e2b77c-7689-4033-a278-b68ac72c2d51', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', 'Explain the effects of the Non-Cooperation Movement on the economic front in India.', 'short_answer_3mark', NULL, NULL, NULL, 3, '1 mark for boycott of goods, 1 mark for decrease in imports, 1 mark for growth of local industry.', 'medium', '087', 'original', 'Non-Cooperation Economic Impact', '(1) Foreign goods were boycotted, liquor shops picketed, and foreign cloth burnt in huge bonfires.
(2) The import of foreign cloth halved between 1921 and 1922, its value dropping from 102 crore to 57 crore rupees.
(3) In many places, merchants and traders refused to trade in foreign goods or finance foreign trade. This boosted Indian textile mills and handlooms.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('e1a340b7-edff-4f06-b1b6-f63cab8bcdd5', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', 'Describe the course and significance of the Salt March (Dandi March) launched by Mahatma Gandhi.', 'long_answer_5mark', NULL, NULL, NULL, 5, '1 mark for salt as symbol, 2 marks for course of march (miles, days, Dandi), 2 marks for significance (beginning of Civil Disobedience, law breaking).', 'hard', '087', 'original', 'Salt March and Civil Disobedience', 'Gandhiji found in salt a powerful symbol that could unite the nation, as it was consumed by both rich and poor.
Course: On 12 March 1930, Gandhiji started his famous march from Sabarmati Ashram with 78 trusted volunteers. They walked for 24 days, covering 240 miles to reach the coastal town of Dandi in Gujarat. On 6 April, he ceremonially violated the law, manufacturing salt by boiling sea water.
Significance: This marked the beginning of the Civil Disobedience Movement. People were now asked not only to refuse cooperation with the British (as in Non-Cooperation) but also to break colonial laws. It led to large-scale boycotts, refusal of forest laws, and peasant tax strikes.', '5');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('bbf3971e-598a-43b9-98d9-35d71d312533', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', 'Assertion (A): Mahatma Gandhi called off the Non-Cooperation Movement in February 1922.
Reason (R): A violent clash occurred at Chauri Chaura in Gorakhpur where a mob set fire to a police station, burning 22 policemen alive.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'Gandhiji, being strictly non-violent, withdrew the movement when it turned violent at Chauri Chaura. Both statements are true and R explains A.', 'medium', '087', 'original', 'Chauri Chaura incident');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('f802dccf-309d-4038-b1e7-833731f10433', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380333', 'Distinguish between ''''Coming Together'''' and ''''Holding Together'''' federations with examples.', 'short_answer_3mark', NULL, NULL, NULL, 3, '1.5 marks for Coming Together details/examples, 1.5 marks for Holding Together details/examples.', 'medium', '087', 'original', 'Types of Federations', 'Coming Together: Independent states come together on their own to form a bigger unit, pooling sovereignty but retaining identity to increase security. All constituent states have equal power. Examples: USA, Switzerland, Australia.
Holding Together: A large country decides to divide its power between the constituent states and the national government. The central government tends to be more powerful vis-a-vis the states. Constituent units often have unequal powers. Examples: India, Spain, Belgium.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('e4848e69-448a-49e6-b9fd-fa8193ae79d6', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389030', 'What was the main aim of the Treaty of Vienna in 1815? State any two steps taken to achieve this.', 'short_answer_3mark', NULL, NULL, NULL, 3, '1 mark for aim (restore monarchies/undo changes), 2 marks for two correct steps.', 'medium', '087', 'original', 'Treaty of Vienna 1815', 'The main aim of the Treaty of Vienna was to undo most of the changes that had come about in Europe during the Napoleonic wars and restore the conservative monarchies.
Steps: (1) The Bourbon dynasty was restored to power in France, (2) A series of barrier states were set up on the boundaries of France to prevent French expansion in future (e.g., Kingdom of Netherlands established in the north).', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('536b1917-f93c-41a5-a127-62128fbf9b28', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389030', 'Explain the process of unification of Germany.', 'long_answer_5mark', NULL, NULL, NULL, 5, '1 mark for 1848 background, 1 mark for Prussia leadership, 1 mark for Bismarck''''s role, 1 mark for the three wars, 1 mark for King William I proclamation.', 'hard', '087', 'original', 'German Unification', '1. Nationalist feelings were widespread among middle-class Germans, who tried to unite the different regions into a nation-state in 1848, but were repressed by the monarchy and military.
2. Prussia took on the leadership of the movement for national unification.
3. Otto von Bismarck, the Chief Minister of Prussia, was the architect of this process, carried out with the help of the Prussian army and bureaucracy.
4. Three wars over seven years—with Austria, Denmark, and France—ended in Prussian victory and completed the process of unification.
5. In January 1871, the Prussian King, William I, was proclaimed German Emperor in a ceremony at Versailles.', '5');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('13c192d0-1eca-4c52-b619-10fe1e54720b', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389070', 'Why is power sharing desirable? Give one prudential and one moral reason.', 'short_answer_2mark', NULL, NULL, NULL, 2, '1 mark for prudential reason, 1 mark for moral reason.', 'easy', '087', 'original', 'Reasons for Power Sharing', 'Prudential Reason: Power sharing helps to reduce the possibility of conflict between social groups, ensuring stability of political order.
Moral Reason: Power sharing is the very spirit of democracy. A democratic rule involves sharing power with those affected by its exercise, making governance legitimate.', '2');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('3e64e610-5071-46ab-889b-656de5539a19', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389110', 'What is sustainable development? Why is it essential for resource planning?', 'short_answer_2mark', NULL, NULL, NULL, 2, '1 mark for definition, 1 mark for explanation of its necessity.', 'easy', '087', 'original', 'Sustainable Development concept', 'Sustainable development means development should take place without damaging the environment, and development in the present should not compromise the needs of future generations.
It is essential because resources are limited and unevenly distributed; uncontrolled exploitation leads to environmental crises (global warming, pollution) and resource depletion.', '2');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('69843abc-2581-44ac-9fbb-e12f64c6598f', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389190', 'Explain the three sectors of economic activities with one example of each.', 'short_answer_3mark', NULL, NULL, NULL, 3, '1 mark for each sector description and correct example.', 'easy', '087', 'original', 'Sectors of Economy', '1. Primary Sector: Activities undertaken by directly using natural resources. Example: Agriculture, forestry, dairy.
2. Secondary Sector: Activities in which natural products are changed into other forms through manufacturing. Example: Spinning yarn, making sugar from sugarcane.
3. Tertiary Sector: Activities that aid or support the production process by providing services. Example: Transport, banking, communication.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('c9e780ff-6387-465b-8f78-6150ef5663ee', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389190', 'Why is the tertiary sector becoming so important in India? Give three reasons.', 'short_answer_3mark', NULL, NULL, NULL, 3, '1 mark for each valid reason (linked to primary/secondary development, rising income levels, basic public services).', 'medium', '087', 'original', 'Growth of Tertiary Sector', '(1) Development of primary and secondary sectors leads to the growth of services like transport, trade, and storage.
(2) As income levels rise, people demand services like eating out, tourism, private schooling, and shopping.
(3) Basic services like hospitals, schools, post office, and police stations are essential and provided by the government.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('9261c806-ee72-41a5-90b1-eaa03b78a945', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389200', 'Why are formal sources of credit preferred over informal sources? State three reasons.', 'short_answer_3mark', NULL, NULL, NULL, 3, '1 mark for interest rate comparison, 1 mark for RBI supervision, 1 mark for transparency/terms.', 'medium', '087', 'original', 'Formal vs Informal Credit', '(1) Formal sources (banks, cooperatives) charge much lower interest rates than informal moneylenders, saving borrowers from debt-traps.
(2) Formal sources are supervised by the Reserve Bank of India (RBI), ensuring fair practices, whereas informal sources have no supervisor and use unfair means to recover money.
(3) Formal credit terms are transparent, with clear collateral requirements and repayment schedules.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, difficulty, board_code, topic)
VALUES ('f325cf4d-b45e-4c0a-b201-2781b3302642', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', 'On the outline political map of India, locate and label the following centers of Indian National Movement:\n(a) Champaran - The place associated with the Peasant Satyagraha of 1917.\n(b) Dandi - The place where Gandhiji violated the salt law.', 'map_marking', 2, '(a) Champaran (Bihar), (b) Dandi (Gujarat)', 'Mark Champaran in the northern region of Bihar. Mark Dandi on the coastal region of southern Gujarat.', 'medium', '087', 'Indian National Movement Map');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, difficulty, board_code, topic)
VALUES ('c76f7443-480e-4f3b-bb49-e9eaf8cf4074', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389110', 'On the outline soil map of India, identify and name the major soil types marked at:\n(a) The region covering Jammu & Kashmir and Himachal Pradesh.\n(b) The region covering Rajasthan and parts of Gujarat.', 'map_marking', 2, '(a) Forest and Mountainous Soil, (b) Arid Soil', 'Region (a) represents Forest and Mountainous Soil found in high altitude regions. Region (b) represents Arid Soil found in dry/desert regions.', 'easy', '087', 'Soil Types Map');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, difficulty, board_code, source_year, topic)
VALUES ('4967b54c-0a71-4eff-854a-7da8092219a0', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', 'Read the source given below and answer the questions that follow:\n\n"In his famous book Hind Swaraj (1909) Mahatma Gandhi declared that British rule was established in India with the cooperation of Indians, and had survived only because of this cooperation. If Indians refused to cooperate, British rule in India would collapse within a year, and swaraj would come. How could non-cooperation become a movement? Gandhiji proposed that the movement should unfold in stages. It should begin with the surrender of titles that the government awarded, and a boycott of civil services, army, police, courts and legislative councils, school, and foreign goods..."', 'source_based', 4, 'medium', '087', 'original', 'Hind Swaraj Source');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('4f2610c3-cbdf-4a38-a610-009fbcdd363d', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', '(i) Who is the author of the book ''Hind Swaraj''?', 'short_answer_2mark', 1, 'Mahatma Gandhi', 'The author of ''Hind Swaraj'' is Mahatma Gandhi.', '1', '4967b54c-0a71-4eff-854a-7da8092219a0', 1, 'easy', '087');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('9b1ced47-7311-415f-b478-ccd0a6a09cb1', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', '(ii) Why did Gandhiji believe British rule survived in India?', 'short_answer_2mark', 1, 'Because of the cooperation of Indians', 'Gandhiji believed British rule was established and survived only due to the cooperation of Indians.', '1', '4967b54c-0a71-4eff-854a-7da8092219a0', 2, 'easy', '087');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('dca4db97-380a-4980-906a-7e7157247a90', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', '(iii) State any two boycotts proposed as part of the Non-Cooperation Movement in the passage.', 'short_answer_2mark', 2, 'Boycott of civil services and foreign goods', 'The passage proposes the surrender of government titles, and the boycott of civil services, army, police, courts, legislative councils, schools, and foreign goods.', '2', '4967b54c-0a71-4eff-854a-7da8092219a0', 3, 'medium', '087');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, difficulty, board_code, source_year, topic)
VALUES ('77e4f6a9-cf18-40f2-b0c9-a24dcc116cad', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380333', 'Belgium is a small country in Europe. Of the country''s total population, 59 percent lives in the Flemish region and speaks Dutch language. Another 40 percent lives in the Wallonia region and speaks French. The minority French-speaking community was relatively rich and powerful. This led to tensions between the communities during the 1950s and 1960s.\n\nBased on the above information, answer the following questions:', 'case_study', 4, 'medium', '087', 'original', 'Power Sharing Case Study');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('440d8934-e30d-44a7-8232-863f61f9d2a0', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380333', '(i) Which language is spoken by the majority of the population in Belgium?', 'short_answer_2mark', 1, 'Dutch', 'Dutch is spoken by the majority (59 percent) of the population in Belgium.', '1', '77e4f6a9-cf18-40f2-b0c9-a24dcc116cad', 1, 'easy', '087');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('4566e04b-62e7-4184-8dc1-9db265f866ce', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380333', '(ii) Why was there tension between the Dutch-speaking and French-speaking communities?', 'short_answer_2mark', 1, 'French-speaking minority was richer and more powerful', 'The Dutch-speaking community got the benefit of economic development and education much later, leading to resentment against the rich and powerful French minority.', '1', '77e4f6a9-cf18-40f2-b0c9-a24dcc116cad', 2, 'medium', '087');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('956916dc-3ae9-4133-9266-32d7eec2c7eb', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380333', '(iii) How did Belgium solve its linguistic tensions?', 'short_answer_2mark', 2, 'By amending the constitution for equal representation', 'Belgium amended its constitution four times between 1970 and 1993 to adopt a power-sharing model, ensuring equal ministers from both groups at the center and regional autonomy.', '2', '77e4f6a9-cf18-40f2-b0c9-a24dcc116cad', 3, 'medium', '087');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, difficulty, board_code, source_year, topic)
VALUES ('8d3b7235-2c7a-4eb4-bcaa-0e8386ccee17', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389200', 'Swapna, a small farmer, grows groundnut on her three acres of land. She takes a loan from the local moneylender to meet the expenses of cultivation, hoping that her harvest would help repay the loan. Mid-season, the crop is hit by pests and fails. She has to take another loan for next year, and gets caught in a debt-trap.\n\nBased on the above information, answer the following questions:', 'case_study', 4, 'medium', '087', 'original', 'Credit Debt Trap Case Study');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('f0bf102a-0975-4420-909e-cb0f835d04b2', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389200', '(i) From what source did Swapna borrow money?', 'short_answer_2mark', 1, 'Informal source (Moneylender)', 'Swapna borrowed from the local moneylender, which is an informal source of credit.', '1', '8d3b7235-2c7a-4eb4-bcaa-0e8386ccee17', 1, 'easy', '087');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('3cd847fb-ced5-4637-97d0-028091bfbfab', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389200', '(ii) What is a debt-trap?', 'short_answer_2mark', 1, 'A situation where debt is difficult or impossible to repay', 'A debt-trap is a situation where the borrower is forced into a cycle of borrowing to pay off existing debt, making repayment increasingly difficult.', '1', '8d3b7235-2c7a-4eb4-bcaa-0e8386ccee17', 2, 'easy', '087');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, marks, correct_answer_text, model_answer, marking_scheme, parent_question_id, sub_question_sequence, difficulty, board_code)
VALUES ('84541401-d213-4069-ba3e-c5a52a163542', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389200', '(iii) How could formal credit sources have helped Swapna?', 'short_answer_2mark', 2, 'By providing low-interest loans and crop insurance', 'Banks offer lower interest rates and crop insurance against failures, protecting farmers from losing their land due to high debt compound interest.', '2', '8d3b7235-2c7a-4eb4-bcaa-0e8386ccee17', 3, 'medium', '087');
-- =========================================================================
-- Update Existing MCQ Questions with difficulty and board_code
-- =========================================================================

-- Update Math MCQ questions (subject_id = 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11')
UPDATE quiz_questions qq
SET board_code = '041/241',
    difficulty = COALESCE(qq.difficulty, 'medium')
FROM quizzes q
JOIN chapters c ON q.chapter_id = c.id
WHERE qq.quiz_id = q.id
  AND c.subject_id = 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11'
  AND qq.type = 'multiple_choice';

-- Update Science MCQ questions (subject_id = 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22')
UPDATE quiz_questions qq
SET board_code = '086',
    difficulty = COALESCE(qq.difficulty, 'medium')
FROM quizzes q
JOIN chapters c ON q.chapter_id = c.id
WHERE qq.quiz_id = q.id
  AND c.subject_id = 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22'
  AND qq.type = 'multiple_choice';

-- Update Social Science MCQ questions (subject_id = 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33')
UPDATE quiz_questions qq
SET board_code = '087',
    difficulty = COALESCE(qq.difficulty, 'medium')
FROM quizzes q
JOIN chapters c ON q.chapter_id = c.id
WHERE qq.quiz_id = q.id
  AND c.subject_id = 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33'
  AND qq.type = 'multiple_choice';

-- =========================================================================
-- Social Science (Code 087) Remaining Chapters Questions
-- =========================================================================

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('b0ebd8c5-e38c-4666-919b-b8acf7de62eb', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389040', 'What was the Rinderpest and how did it affect Africa in the 1890s?', 'short_answer_2mark', NULL, NULL, NULL, 2, '1 mark for what it is (cattle plague), 1 mark for impact (90% cattle killed, labor market force, colonial conquest).', 'easy', '087', 'original', 'Rinderpest African Impact', 'Rinderpest was a fast-spreading cattle plague that arrived in Africa in the late 1880s. It killed 90 percent of Africa''''s cattle, which destroyed the livelihoods of pastoralists. This forced Africans into the labor market, allowing European colonizers to conquer and subdue the continent easily.', '2');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('791ce5e1-6e3e-446c-b023-6e15bfd37405', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389040', 'How did the Great Depression of 1929 affect the Indian economy?', 'short_answer_3mark', NULL, NULL, NULL, 3, '1 mark for trade drop, 1 mark for agricultural price crash, 1 mark for gold exports/peasant distress.', 'medium', '087', 'original', 'Great Depression Indian Economy', '(1) India''''s exports and imports halved between 1929 and 1934.
(2) Agricultural prices fell sharply (wheat prices fell by 50%), causing severe distress to peasants who still had to pay high land revenue.
(3) Peasants had to sell their gold, silver, and savings to survive, making India an exporter of precious metals (especially gold).', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('b39bc0d0-171c-4d7a-a392-6e433dea28ae', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389040', 'Assertion (A): The 19th-century indentured labor migration from India is described as a ''new system of slavery''.
Reason (R): Recruited workers were promised high wages but were forced to live and work under harsh conditions with few legal rights.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'Both A and R are true. The harsh, rights-deprived realities of indentured labor led historians to call it a new system of slavery. R explains A.', 'medium', '087', 'original', 'Indentured labor conditions');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('a34dac28-79ec-4768-80ce-9c95ba52cac5', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389050', 'Who was a Jobber in 19th-century Indian industries, and what was his role?', 'short_answer_2mark', NULL, NULL, NULL, 2, '1 mark for definition (trusted worker/recruiter), 1 mark for roles (getting jobs, helping settle, taking bribes).', 'easy', '087', 'original', 'Industrial Jobbers role', 'A Jobber was an old and trusted worker employed by industrialists to recruit new workers. His role was to bring people from his village, ensure them jobs, help them settle in the city, and provide financial help in times of crisis. Over time, jobbers began demanding money and gifts for these favors.', '2');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('8ba21f3d-a79e-4e8c-b262-4f1ee22c30d3', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389050', 'Why did merchants in Europe move to the countryside in the 17th and 18th centuries?', 'short_answer_3mark', NULL, NULL, NULL, 3, '1 mark for town guild barriers, 1 mark for peasant income supplementation, 1 mark for land enclosure impact.', 'medium', '087', 'original', 'Proto-industrialization Countryside shift', '(1) In towns, powerful guild associations controlled production, prices, and entry of new competitors, preventing merchants from expanding.
(2) In the countryside, poor peasants and cottagers readily agreed to work for merchants to supplement their shrinking incomes from small plots of land.
(3) Land enclosures had left many without jobs, making rural labor cheap and cooperative.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('22f81fc4-3f61-4134-a33d-b18741d4ab78', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389050', 'Assertion (A): The first cotton mill in India was established in Bombay in 1854.
Reason (R): Bombay was close to the vast black soil tract of Western India, which was a major source of raw cotton.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'The assertion is correct. The reason explains that proximity to raw cotton made Bombay the ideal location for the mill. Both A and R are true and R explains A.', 'medium', '087', 'original', 'First Indian Cotton Mill location');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('465cd7ef-99d4-4868-bd79-cb17efc30c5d', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389060', 'Explain how the print revolution transformed the lives of common people in Europe.', 'short_answer_3mark', NULL, NULL, NULL, 3, '1 mark for cost reduction/access, 1 mark for literacy/reading public, 1 mark for debates/ideas.', 'medium', '087', 'original', 'Print Revolution Impact', '(1) It reduced the cost of books, making them accessible to a wider public instead of just the elite.
(2) It transformed a hearing public (who listened to readings) into a reading public, encouraging literacy.
(3) It opened up new ways of looking at things and debating religious and political authority.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('0924ba20-27e0-4c28-8074-f1c5bdfeef2e', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389060', 'Assertion (A): Martin Luther wrote 95 Theses criticizing the Roman Catholic Church and pasted them on a church door.
Reason (R): He was printing his theses to start a violent revolution against the Pope.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 2, NULL, 1, 'Assertion is true. The Reason is false because Luther wanted a peaceful religious reform (Protestant Reformation) and discussion, not a violent political revolution.', 'medium', '087', 'original', 'Martin Luther and Printing press');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('dbaf861d-abf4-4940-b8eb-31365acfe662', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389080', 'Define secularism as practiced in India according to the Constitution.', 'short_answer_2mark', NULL, NULL, NULL, 2, '1 mark for no official religion, 1 mark for freedom of practice/non-discrimination.', 'easy', '087', 'original', 'Indian Secularism', 'Indian secularism means the state has no official religion. The Constitution guarantees freedom to practice, profess, and propagate any religion (or none). The state cannot discriminate against any citizen on grounds of religion.', '2');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('e391c554-6ebf-4a08-9066-8008cd035efc', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389080', 'Assertion (A): Caste is the only basis of political mobilization in India.
Reason (R): Political parties select candidates based on the caste composition of the constituency to secure votes.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 3, NULL, 1, 'Assertion is false because gender, class, and development are also bases of mobilization. Reason is true (caste matching is common). So A is false, R is true.', 'medium', '087', 'original', 'Caste in Politics');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('9d69a0d9-afbd-427d-8648-7b6136a6d040', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389090', 'State two key functions performed by political parties in a democracy.', 'short_answer_2mark', NULL, NULL, NULL, 2, '1 mark for each correct function.', 'easy', '087', 'original', 'Functions of Political Parties', '(1) Parties contest elections by putting forward candidates.
(2) Parties put forward different policies and programs, allowing voters to choose among them. (Other valid answers: making laws, forming governments, acting as opposition).', '2');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('db0e91b4-eccf-4f58-b00a-09012c20538e', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389090', 'Assertion (A): A one-party system is not a good option for a democratic country.
Reason (R): Democracy must allow at least two parties to compete in elections to provide a fair choice to voters.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'A one-party system (like China) lacks choice and competition, which are core democratic elements. Both A and R are true and R explains A.', 'medium', '087', 'original', 'One-party system critique');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('d26d6b8c-bfa3-4624-b850-a18688bc8231', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389100', 'In what ways is democracy an accountable, responsive, and legitimate government?', 'short_answer_3mark', NULL, NULL, NULL, 3, '1 mark for explaining each term (accountable, responsive, legitimate) in the context of democracy.', 'medium', '087', 'original', 'Democratic Outcomes', '(1) Accountable: Citizens have the right to choose rulers and hold them accountable through regular elections.
(2) Responsive: It responds to the needs and expectations of citizens through transparency and debates.
(3) Legitimate: It is a government of the people, by the people, and is bound by the constitution.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('b26d125b-009c-4c72-9b90-b98ce58dbf9c', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389100', 'Assertion (A): Non-democratic regimes often have higher rates of economic growth than democratic ones.
Reason (R): Non-democratic governments do not have to worry about public opinion, debates, and consensus, allowing quick decision-making.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'Dictatorships can enforce policies rapidly. While economic growth depends on many factors, historically dictatorships have shown slightly higher growth. Both A and R are true and R explains A.', 'medium', '087', 'original', 'Economic growth in regimes');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('f961941e-79a9-4e65-8858-ecb3703cea81', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389120', 'Distinguish between Reserved, Protected, and Unclassed forests in India.', 'short_answer_3mark', NULL, NULL, NULL, 3, '1 mark for each correct classification description.', 'medium', '087', 'original', 'Forest Classifications', '(1) Reserved Forests: Regarded as the most valuable for conservation; hunting and grazing are banned. Cover more than half of India''''s forests.
(2) Protected Forests: Protected from further depletion; local communities have limited gathering rights. Cover one-third of forests.
(3) Unclassed Forests: Consist of other forests and wastelands belonging to both government and private individuals/communities.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('5c817920-30eb-4d8b-a958-da325b6660c2', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389120', 'Assertion (A): The Chipko Movement in the Himalayas successfully resisted deforestation.
Reason (R): It proved that community-led conservation using traditional methods is highly effective.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'The Chipko movement involved locals hugging trees to stop loggers. Both statements are true and R explains A.', 'medium', '087', 'original', 'Chipko Movement community conservation');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('20973ce9-1a9e-4a3c-8599-51c250a7d4b4', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389130', 'Explain the concept of Rainwater Harvesting and write its two main objectives.', 'short_answer_3mark', NULL, NULL, NULL, 3, '1 mark for definition, 2 marks for two correct objectives.', 'medium', '087', 'original', 'Rainwater Harvesting', 'Rainwater harvesting is a technique of collecting and storing rainwater from rooftops or catchments for future use, preventing runoff.
Objectives: (1) Recharge the underground water table, (2) Meet water demands in dry seasons, reducing scarcity.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('43f66cec-d39f-428e-a05e-6863ebf279a8', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389130', 'Assertion (A): Large dams have faced resistance from environmentalists and local communities.
Reason (R): Construction of large dams causes massive displacement of local people, loss of agricultural land, and submergence of forests.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'Large dams submerge habitats and displace populations, leading to movements like Narmada Bachao Andolan. Both A and R are true and R explains A.', 'medium', '087', 'original', 'Dam construction impact');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('77f146fc-1e2d-4d21-a69c-cd653598457b', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389140', 'Compare Intensive Subsistence Farming and Commercial Farming.', 'short_answer_3mark', NULL, NULL, NULL, 3, '1.5 marks for subsistence farming details, 1.5 marks for commercial farming details.', 'medium', '087', 'original', 'Farming types comparison', 'Intensive Subsistence Farming: Practiced on small land holdings with high population pressure. Uses high doses of biochemical inputs and manual labor to obtain high yield. Production is mainly for family consumption.
Commercial Farming: Practiced on large land holdings using modern inputs (HYV seeds, chemical fertilizers, pesticides) to get higher productivity. Production is entirely for sale in the market.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('b60dcdd5-45b1-4884-90d6-9b654f93707e', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389140', 'Assertion (A): Rice is a Kharif crop that requires high temperature, high humidity, and annual rainfall above 100 cm.
Reason (R): Agriculture in India is completely independent of the monsoon rains due to advanced canal irrigation.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 2, NULL, 1, 'Assertion is true (rice is kharif). Reason is false because a large part of Indian agriculture still depends heavily on the monsoon, despite irrigation. So A is true, R is false.', 'medium', '087', 'original', 'Monsoon dependence in India');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('d90b775c-9a87-4c13-bd3e-36b79548557a', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389150', 'Why is energy conservation essential in India? State two measures individuals can take to conserve energy.', 'short_answer_3mark', NULL, NULL, NULL, 3, '1 mark for necessity, 2 marks for two practical measures.', 'easy', '087', 'original', 'Energy Conservation', 'Energy conservation is essential because economic development increases energy consumption, while fossil fuels are non-renewable and deplete rapidly. Saving energy reduces pollution and dependence on imports.
Measures: (1) Using public transport instead of personal vehicles, (2) Switching off lights/appliances when not in use.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('7e94a862-ac6d-4da8-b2b4-d552cb07a6e4', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389150', 'Assertion (A): Solar energy is a non-conventional and renewable source of energy in India.
Reason (R): India is a tropical country and has enormous possibilities of tapping solar energy.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 1, NULL, 1, 'Both are true facts. Solar is renewable, and India has high solar potential. However, R is not the explanation of why solar is classified as a ''non-conventional'' source (which is based on the history of usage).', 'medium', '087', 'original', 'Solar energy in India');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('f34dbab6-8711-4961-bd04-3c176a292e8b', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389160', 'How does industrial pollution affect water resources, and how can it be controlled?', 'short_answer_3mark', NULL, NULL, NULL, 3, '1 mark for pollution description, 2 marks for two control measures.', 'medium', '087', 'original', 'Industrial Water Pollution', 'Affect: Industries discharge organic and inorganic toxic waste, hot water, and heavy metals into rivers without treatment, killing aquatic life and polluting groundwater.
Control: (1) Treating hot water and effluents before releasing them into water bodies, (2) Recycling and reusing water within the industry, (3) Rainwater harvesting to meet industrial water requirements.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('875fe304-3796-4f85-aaa9-d11e9676530c', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389160', 'Assertion (A): The manufacturing sector is considered the backbone of economic development.
Reason (R): Manufacturing industries help in modernizing agriculture and reduce dependency of people on agricultural income by providing jobs.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'The reason outlines why manufacturing is so critical (agriculture modernisation and jobs creation). Both are true and R explains A.', 'medium', '087', 'original', 'Manufacturing sector value');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('69022db5-1667-4c7c-be81-e8cfaac104b9', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389170', 'Why are roadways preferred over railways in India? Give three reasons.', 'short_answer_3mark', NULL, NULL, NULL, 3, '1 mark for cost, 1 mark for topography/slopes, 1 mark for door-to-door service.', 'medium', '087', 'original', 'Roadways vs Railways', '(1) Construction cost of roads is much lower than that of railway lines.
(2) Roads can traverse more dissected and undulating topography, and steeper slopes (like mountains).
(3) Road transport provides door-to-door service, reducing loading and unloading costs.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('73a04a71-9012-4c8e-aa7b-ea2e0aab9b85', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389170', 'Assertion (A): Tourism in India has grown substantially over the last three decades.
Reason (R): Tourism promotes national integration, supports local handicrafts, and earns valuable foreign exchange.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 1, NULL, 1, 'Both statements are true. Tourism is growing, and it has many cultural/economic benefits. However, R (the benefits) does not explain the root cause of the growth of tourism (which is linked to infrastructure, safety, and marketing).', 'medium', '087', 'original', 'Tourism benefits in India');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('b754dc80-c190-462a-9191-76a4e4e276b1', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389210', 'What is a Multinational Corporation (MNC)? How do MNCs control production across countries?', 'short_answer_3mark', NULL, NULL, NULL, 3, '1 mark for definition, 2 marks for two methods of controlling production.', 'medium', '087', 'original', 'MNC Production Control', 'An MNC is a company that owns or controls production in more than one nation.
MNCs control production by: (1) Setting up partnerships with local companies, (2) Buying up local companies (e.g., Cargill Foods buying Parakh Foods), (3) Placing orders with small producers for garments/footwear, selling under their own brand names.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('06628b6d-7078-4367-964c-eb4416924673', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389210', 'Assertion (A): Rapid improvement in technology has been a major factor that has stimulated the globalisation process.
Reason (R): Development in transportation has made long-distance delivery of goods quicker at lower costs.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 1, NULL, 1, 'Both statements are true. Technology (transportation/IT) has boosted globalization. However, R (transportation) is only one facet and does not fully explain why technology as a whole (including internet/telecom) stimulated the process. So R is not the complete explanation of A.', 'medium', '087', 'original', 'Technology in Globalisation');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic, model_answer, marking_scheme) 
VALUES ('b7e30fce-6adf-4428-8a9d-a6da46f1a43e', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389220', 'Explain the three-tier quasi-judicial machinery set up under COPRA 1986 for redressal of consumer disputes.', 'short_answer_3mark', NULL, NULL, NULL, 3, '1 mark for each tier with its correct monetary jurisdiction limits.', 'medium', '087', 'original', 'COPRA Redressal Forums', '(1) District Consumer Disputes Redressal Forum: Deals with cases where claims are up to 20 lakh rupees.
(2) State Commission: Deals with cases between 20 lakh and 1 crore rupees.
(3) National Commission: Deals with cases exceeding 1 crore rupees.', '3');
INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty, board_code, source_year, topic) 
VALUES ('39a18c92-1e64-486f-82c7-b06c6f33a835', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd389220', 'Assertion (A): Consumers have the Right to Information regarding the ingredients, price, and manufacturing date of products.
Reason (R): Right to Information helps consumers make informed choices and claim compensation if the product is defective.', 'assertion_reason', '["A. Both A and R are true and R is the correct explanation of A.", "B. Both A and R are true but R is NOT the correct explanation of A.", "C. A is true but R is false.", "D. A is false but R is true."]', 0, NULL, 1, 'Right to Information provides packaging details so consumers can select products safely. Both A and R are true and R explains A.', 'medium', '087', 'original', 'Consumer Right to Information');

-- --- FROM FILE db/seed_study_guides.sql ---

DELETE FROM lessons WHERE type='study_guide' AND chapter_id = 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222';

INSERT INTO lessons (id, chapter_id, title, type, note_content, is_free, sequence_number) VALUES
('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380122', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', 'Chapter 11: Electricity (NCERT Simplified)', 'study_guide',
'# Chapter 11: Electricity (NCERT Simplified)

Welcome to the simplified, easy-to-grasp version of your NCERT Electricity chapter! We will follow the exact textbook structure, but explain everything simply and beautifully.

---

## 11.1 ELECTRIC CURRENT AND CIRCUIT

If a net charge $Q$ flows across any cross-section of a conductor in time $t$, then the **Electric Current ($I$)** is:
$$I = \frac{Q}{t}$$

The SI unit of electric charge is coulomb (C), which is equivalent to the charge contained in nearly $6 \times 10^{18}$ electrons. 
The electric current is expressed by a unit called [JARGON: ampere | Ampere (A) is named after the French scientist Andre-Marie Ampere. One ampere is constituted by the flow of one coulomb of charge per second.].

An **Electric Circuit** is a continuous and closed path of an electric current. If the circuit is broken anywhere (or the switch of the torch is turned off), the current stops flowing and the bulb does not glow.

[FIGURE: basic_circuit]

> **💡 TIPS & TRICKS**
> Remember: Current is measured by an **Ammeter**, which is always connected in **series** in a circuit!

**Example 11.1**
A current of 0.5 A is drawn by a filament of an electric bulb for 10 minutes. Find the amount of electric charge that flows through the circuit.

**Solution:**
We are given, $I = 0.5\text{ A}$; $t = 10\text{ min} = 600\text{ s}$.
From $I = Q/t$, we have $Q = It$
$$Q = 0.5\text{ A} \times 600\text{ s} = 300\text{ C}$$

**❓ QUESTIONS**
**1. What does an electric circuit mean?**
*Answer:* A continuous and closed path of an electric current.

**2. Define the unit of current.**
*Answer:* The unit of current is Ampere (A). 1 Ampere is the flow of 1 Coulomb of charge per second.

**3. Calculate the number of electrons constituting one coulomb of charge.**
*Answer:* 1 Coulomb contains $6.25 \times 10^{18}$ electrons. (Since $1\text{ e} = 1.6 \times 10^{-19}\text{ C}$, $1\text{ C} = 1 / (1.6 \times 10^{-19}) = 6.25 \times 10^{18}$).

---

## 11.2 ELECTRIC POTENTIAL AND POTENTIAL DIFFERENCE

What makes the electric charge to flow? Charges do not flow in a copper wire by themselves. For flow of charges in a conducting metallic wire, the electrons move only if there is a difference of electric pressure – called the **potential difference** along the conductor. This difference of potential may be produced by a battery.

We define the electric potential difference between two points in an electric circuit carrying some current as the work done to move a unit charge from one point to the other:
$$V = \frac{W}{Q}$$

The SI unit of electric potential difference is [JARGON: volt | Volt (V) is named after Alessandro Volta. 1 Volt = 1 Joule / 1 Coulomb.].

> **🧠 THINGS TO REMEMBER**
> Potential difference is measured by a **Voltmeter**. It is always connected in **parallel** across the points where potential difference is to be measured.

**Example 11.2**
How much work is done in moving a charge of 2 C across two points having a potential difference 12 V?

**Solution:**
The amount of charge $Q$, that flows between two points at potential difference $V = 12\text{ V}$ is $2\text{ C}$.
Thus, the amount of work $W$, done in moving the charge is:
$$W = VQ = 12\text{ V} \times 2\text{ C} = 24\text{ J}.$$

**❓ QUESTIONS**
**1. Name a device that helps to maintain a potential difference across a conductor.**
*Answer:* A battery or a cell.

**2. What is meant by saying that the potential difference between two points is 1 V?**
*Answer:* It means 1 Joule of work is done in moving 1 Coulomb of charge from one point to the other.

**3. How much energy is given to each coulomb of charge passing through a 6 V battery?**
*Answer:* 6 Joules (Since $W = V \times Q = 6 \text{ V} \times 1 \text{ C} = 6 \text{ J}$).

---

## 11.3 CIRCUIT DIAGRAM

To draw electric circuits conveniently, we use standard symbols for components.

[FIGURE: circuit_symbols]

---

## 11.4 OHM’S LAW

Is there a relationship between the potential difference across a conductor and the current through it? Yes! 
The German physicist Georg Simon Ohm found out that the potential difference, $V$, across the ends of a given metallic wire in an electric circuit is directly proportional to the current flowing through it, provided its temperature remains the same. This is called **Ohm’s law**.

$$V \propto I$$
$$V = I \times R$$

Here, $R$ is a constant for the given metallic wire at a given temperature and is called its **resistance**. It is the property of a conductor to resist the flow of charges through it. Its SI unit is [JARGON: ohm | Ohm ($\Omega$). If the potential difference across the two ends of a conductor is 1 V and the current through it is 1 A, then the resistance R is 1 $\Omega$.].

[FIGURE: ohms_law_circuit]

---

## 11.5 FACTORS ON WHICH THE RESISTANCE OF A CONDUCTOR DEPENDS

The resistance of a conductor depends:
1. On its length ($l$)
2. On its area of cross-section ($A$)
3. On the nature of its material

Mathematically:
$$R \propto \frac{l}{A}$$
$$R = \rho \frac{l}{A}$$

Where $\rho$ (rho) is a constant of proportionality and is called the **electrical resistivity** of the material of the conductor. The SI unit of resistivity is $\Omega$ m.

> **💡 TIPS & TRICKS**
> If you stretch a wire to double its length, its area becomes half, so its new resistance becomes 4 times the original!

**Example 11.3**
(a) How much current will an electric bulb draw from a 220 V source, if the resistance of the bulb filament is 1200 $\Omega$?
(b) How much current will an electric heater coil draw from a 220 V source, if the resistance of the heater coil is 100 $\Omega$?

**Solution:**
(a) We are given $V = 220\text{ V}$; $R = 1200\text{ }\Omega$.
From Eq. (11.6), we have the current $I = V/R = 220\text{ V}/1200\text{ }\Omega = 0.18\text{ A}$.
(b) We are given, $V = 220\text{ V}$, $R = 100\text{ }\Omega$.
From Eq. (11.6), we have the current $I = V/R = 220\text{ V}/100\text{ }\Omega = 2.2\text{ A}$.
*Note the difference of current drawn by an electric bulb and electric heater from the same 220 V source!*

**Example 11.4**
The potential difference between the terminals of an electric heater is 60 V when it draws a current of 4 A from the source. What current will the heater draw if the potential difference is increased to 120 V?

**Solution:**
We are given, potential difference $V = 60\text{ V}$, current $I = 4\text{ A}$.
According to Ohm’s law, $R = \frac{V}{I} = \frac{60\text{ V}}{4\text{ A}} = 15\text{ }\Omega$.
When the potential difference is increased to 120 V the current is given by:
$I = \frac{V}{R} = \frac{120\text{ V}}{15\text{ }\Omega} = 8\text{ A}$.
The current through the heater becomes 8 A.

**Example 11.5**
Resistance of a metal wire of length 1 m is 26 $\Omega$ at 20°C. If the diameter of the wire is 0.3 mm, what will be the resistivity of the metal at that temperature?

**Solution:**
We are given the resistance $R = 26\text{ }\Omega$, the diameter $d = 0.3\text{ mm} = 3 \times 10^{-4}\text{ m}$, and the length $l = 1\text{ m}$.
Therefore, from Eq. (11.10), the resistivity of the given metallic wire is $\rho = (R \times \pi d^2) / 4l$
Substitution of values gives $\rho = 1.84 \times 10^{-6}\text{ }\Omega\text{ m}$.

**Example 11.6**
A wire of given material having length $l$ and area of cross-section $A$ has a resistance of 4 $\Omega$. What would be the resistance of another wire of the same material having length $l/2$ and area of cross-section $2A$?

**Solution:**
For first wire: $R_1 = \rho \frac{l}{A} = 4\text{ }\Omega$
For second wire: $R_2 = \rho \frac{(l/2)}{2A} = \frac{1}{4} \rho \frac{l}{A}$
$R_2 = \frac{1}{4} R_1 = 1\text{ }\Omega$.
The resistance of the new wire is $1\text{ }\Omega$.

**❓ QUESTIONS**
**1. On what factors does the resistance of a conductor depend?**
*Answer:* Its length ($l$), area of cross-section ($A$), and the nature of its material.

**2. Will current flow more easily through a thick wire or a thin wire of the same material, when connected to the same source? Why?**
*Answer:* A thick wire. Because resistance is inversely proportional to the area of cross-section ($R \propto 1/A$). A thicker wire has more area, hence less resistance.

**3. Let the resistance of an electrical component remains constant while the potential difference across the two ends of the component decreases to half of its former value. What change will occur in the current through it?**
*Answer:* The current will also become half. (Because $I \propto V$ according to Ohm''s Law).

**4. Why are coils of electric toasters and electric irons made of an alloy rather than a pure metal?**
*Answer:* Alloys have higher resistivity than pure metals and do not melt or oxidize easily at high temperatures.

**5. Use the data in Table 11.2 to answer the following: (a) Which among iron and mercury is a better conductor? (b) Which material is the best conductor?**
*Answer:* (a) Iron is a better conductor (it has lower resistivity than mercury). (b) Silver is the best conductor (lowest resistivity).

---

## 11.6 RESISTANCE OF A SYSTEM OF RESISTORS

There are two methods of joining the resistors together: Series and Parallel.

### 11.6.1 Resistors in Series

When resistors are joined from end to end, they are said to be in series. 
In a series circuit, the current ($I$) is constant throughout the electric circuit. The total potential difference ($V$) is the sum of potential differences across individual resistors.

[FIGURE: series_circuit]

**Derivation:**
$$V = V_1 + V_2 + V_3$$
Using Ohm''s law ($V=IR$):
$$I R_s = I R_1 + I R_2 + I R_3$$
$$R_s = R_1 + R_2 + R_3$$

**Example 11.7**
An electric lamp, whose resistance is 20 $\Omega$, and a conductor of 4 $\Omega$ resistance are connected to a 6 V battery. Calculate (a) the total resistance of the circuit, (b) the current through the circuit, and (c) the potential difference across the electric lamp and conductor.

**Solution:**
(a) The resistance of electric lamp, $R_1 = 20\text{ }\Omega$. The resistance of the conductor connected in series, $R_2 = 4\text{ }\Omega$.
Total resistance, $R_s = R_1 + R_2 = 20\text{ }\Omega + 4\text{ }\Omega = 24\text{ }\Omega$.
(b) The total potential difference, $V = 6\text{ V}$.
By Ohm’s law, the current $I = V / R_s = 6\text{ V} / 24\text{ }\Omega = 0.25\text{ A}$.
(c) Potential difference across the electric lamp, $V_1 = I R_1 = 0.25\text{ A} \times 20\text{ }\Omega = 5\text{ V}$.
Potential difference across the conductor, $V_2 = I R_2 = 0.25\text{ A} \times 4\text{ }\Omega = 1\text{ V}$.

### 11.6.2 Resistors in Parallel

When resistors are connected together between the same two points, they are said to be in parallel.
In a parallel circuit, the potential difference ($V$) is constant across each resistor. The total current ($I$) is the sum of separate currents.

[FIGURE: parallel_circuit]

**Derivation:**
$$I = I_1 + I_2 + I_3$$
Using Ohm''s law ($I = V/R$):
$$\frac{V}{R_p} = \frac{V}{R_1} + \frac{V}{R_2} + \frac{V}{R_3}$$
$$\frac{1}{R_p} = \frac{1}{R_1} + \frac{1}{R_2} + \frac{1}{R_3}$$

**Example 11.8**
In the circuit diagram given in Fig. 11.3, suppose the resistors $R_1$, $R_2$ and $R_3$ have the values 5 $\Omega$, 10 $\Omega$, 30 $\Omega$, which have been connected to a battery of 12 V. Calculate (a) the current through each resistor, (b) the total current in the circuit, and (c) the total circuit resistance.

**Solution:**
$R_1 = 5\text{ }\Omega$, $R_2 = 10\text{ }\Omega$, $R_3 = 30\text{ }\Omega$, and $V = 12\text{ V}$.
(a) Current $I_1$ through $R_1 = V / R_1 = 12\text{ V} / 5\text{ }\Omega = 2.4\text{ A}$.
Current $I_2$ through $R_2 = V / R_2 = 12\text{ V} / 10\text{ }\Omega = 1.2\text{ A}$.
Current $I_3$ through $R_3 = V / R_3 = 12\text{ V} / 30\text{ }\Omega = 0.4\text{ A}$.
(b) Total current $I = I_1 + I_2 + I_3 = 2.4 + 1.2 + 0.4 = 4\text{ A}$.
(c) Total resistance $R_p$: $\frac{1}{R_p} = \frac{1}{5} + \frac{1}{10} + \frac{1}{30} = \frac{10}{30}$.
Thus, $R_p = 3\text{ }\Omega$.

**Example 11.9**
If in Fig. 11.4, $R_1 = 10\text{ }\Omega$, $R_2 = 40\text{ }\Omega$, $R_3 = 30\text{ }\Omega$, $R_4 = 20\text{ }\Omega$, $R_5 = 60\text{ }\Omega$, and a 12 V battery is connected to the arrangement. Calculate (a) the total resistance in the circuit, and (b) the total current flowing in the circuit.

**Solution:**
Suppose we replace the parallel resistors $R_1$ and $R_2$ by an equivalent resistor of resistance, $R_{p1}$. Similarly we replace the parallel resistors $R_3, R_4$ and $R_5$ by an equivalent resistor of resistance $R_{p2}$. 
Then $\frac{1}{R_{p1}} = \frac{1}{10} + \frac{1}{40} = \frac{5}{40}$; i.e., $R_{p1} = 8\text{ }\Omega$.
Similarly, $\frac{1}{R_{p2}} = \frac{1}{30} + \frac{1}{20} + \frac{1}{60} = \frac{6}{60}$; i.e., $R_{p2} = 10\text{ }\Omega$.
(a) Total resistance, $R = R_{p1} + R_{p2} = 8\text{ }\Omega + 10\text{ }\Omega = 18\text{ }\Omega$.
(b) Total current, $I = V/R = 12\text{ V} / 18\text{ }\Omega = 0.67\text{ A}$.

**❓ QUESTIONS**
**1. Draw a schematic diagram of a circuit consisting of a battery of three cells of 2 V each, a 5 $\Omega$ resistor, an 8 $\Omega$ resistor, and a 12 $\Omega$ resistor, and a plug key, all connected in series.**
*Answer:* A battery of 6V connected in series with a key and three resistors (5 $\Omega$, 8 $\Omega$, 12 $\Omega$) placed end-to-end.

**2. Redraw the circuit of Question 1, putting in an ammeter to measure the current through the resistors and a voltmeter to measure the potential difference across the 12 $\Omega$ resistor. What would be the readings in the ammeter and the voltmeter?**
*Answer:* 
- Total Resistance $R = 5+8+12 = 25\text{ }\Omega$.
- Current $I = V/R = 6/25 = 0.24\text{ A}$ (Ammeter reading).
- Voltage across 12 $\Omega$: $V = IR = 0.24 \times 12 = 2.88\text{ V}$ (Voltmeter reading).

**3. Judge the equivalent resistance when the following are connected in parallel – (a) $1\text{ }\Omega$ and $10^6\text{ }\Omega$, (b) $1\text{ }\Omega$ and $10^3\text{ }\Omega$, and $10^6\text{ }\Omega$.**
*Answer:* In parallel, the equivalent resistance is slightly less than the smallest resistor. So for both (a) and (b), it is approximately $1\text{ }\Omega$.

**4. An electric lamp of 100 $\Omega$, a toaster of resistance 50 $\Omega$, and a water filter of resistance 500 $\Omega$ are connected in parallel to a 220 V source. What is the resistance of an electric iron connected to the same source that takes as much current as all three appliances, and what is the current through it?**
*Answer:*
- Equivalent resistance $R_p$: $1/R_p = 1/100 + 1/50 + 1/500 = 16/500$. So $R_p = 500/16 = 31.25\text{ }\Omega$ (Resistance of the iron).
- Current $I = V/R_p = 220 / 31.25 = 7.04\text{ A}$.

**5. What are the advantages of connecting electrical devices in parallel with the battery instead of connecting them in series?**
*Answer:* In parallel: (1) If one device fails, the others keep working. (2) Each device gets the full voltage. (3) The overall resistance of the circuit is reduced.

---

## 11.7 HEATING EFFECT OF ELECTRIC CURRENT

When current flows through a purely resistive circuit, the source energy continually gets dissipated entirely in the form of heat. This is known as the heating effect of electric current.

The heat ($H$) produced in a resistor of resistance $R$ carrying a current $I$ for time $t$ is:
$$H = I^2 R t$$
This is known as **Joule’s law of heating**.

**Example 11.10**
An electric iron consumes energy at a rate of 840 W when heating is at the maximum rate and 360 W when the heating is at the minimum. The voltage is 220 V. What are the current and the resistance in each case?

**Solution:**
From Eq. (11.19), we know that the power input is $P = V I$. Thus the current $I = P/V$.
(a) When heating is at the maximum rate, $I = 840\text{ W} / 220\text{ V} = 3.82\text{ A}$; and the resistance of the electric iron is $R = V/I = 220\text{ V} / 3.82\text{ A} = 57.60\text{ }\Omega$.
(b) When heating is at the minimum rate, $I = 360\text{ W} / 220\text{ V} = 1.64\text{ A}$; and the resistance of the electric iron is $R = V/I = 220\text{ V} / 1.64\text{ A} = 134.15\text{ }\Omega$.

**Example 11.11**
100 J of heat is produced each second in a 4 $\Omega$ resistance. Find the potential difference across the resistor.

**Solution:**
$H = 100\text{ J}$, $R = 4\text{ }\Omega$, $t = 1\text{ s}$, $V = ?$
From Eq. (11.21) we have the current through the resistor as $I = \sqrt{H / (Rt)} = \sqrt{100\text{ J} / (4\text{ }\Omega \times 1\text{ s})} = 5\text{ A}$.
Thus the potential difference across the resistor, $V$ (from Ohm’s law) is $V = IR = 5\text{ A} \times 4\text{ }\Omega = 20\text{ V}$.

### 11.7.1 Practical Applications of Heating Effect of Electric Current
1. **Electric Laundry Iron & Toaster:** Use the heating effect directly to operate.
2. **Electric Bulb:** The filament must retain as much heat as possible so that it gets very hot and emits light. Usually made of tungsten (melting point $3380^\circ C$).
3. **Electric Fuse:** Protects circuits by stopping the flow of any unduly high electric current. If a current larger than the specified value flows, the fuse wire melts and breaks the circuit.

**❓ QUESTIONS**
**1. Why does the cord of an electric heater not glow while the heating element does?**
*Answer:* The cord is made of copper (low resistance), so it produces very little heat. The heating element is an alloy (high resistance), so it produces intense heat and glows.

**2. Compute the heat generated while transferring 96000 coulomb of charge in one hour through a potential difference of 50 V.**
*Answer:* Heat $H = V \times Q = 50\text{ V} \times 96000\text{ C} = 4,800,000\text{ J}$ or $4.8 \times 10^6\text{ J}$.

**3. An electric iron of resistance 20 $\Omega$ takes a current of 5 A. Calculate the heat developed in 30 s.**
*Answer:* Heat $H = I^2Rt = (5)^2 \times 20 \times 30 = 25 \times 20 \times 30 = 15,000\text{ J}$ or $15\text{ kJ}$.

---

## 11.8 ELECTRIC POWER

The rate at which electric energy is dissipated or consumed in an electric circuit is called electric power.
$$P = V I$$
$$P = I^2 R = \frac{V^2}{R}$$

The SI unit of electric power is watt (W). 
The commercial unit of electric energy is kilowatt hour (kWh), commonly known as a "unit".
$$1 \text{ kWh} = 3.6 \times 10^6 \text{ Joules}$$

**Example 11.12**
An electric bulb is connected to a 220 V generator. The current is 0.50 A. What is the power of the bulb?

**Solution:**
$P = VI = 220\text{ V} \times 0.50\text{ A} = 110\text{ W}$.

**Example 11.13**
An electric refrigerator rated 400 W operates 8 hour/day. What is the cost of the energy to operate it for 30 days at Rs 3.00 per kW h?

**Solution:**
The total energy consumed by the refrigerator in 30 days would be $400\text{ W} \times 8.0\text{ hour/day} \times 30\text{ days} = 96000\text{ W h} = 96\text{ kW h}$.
Thus the cost of energy to operate the refrigerator for 30 days is $96\text{ kW h} \times \text{Rs } 3.00\text{ per kW h} = \text{Rs } 288.00$.

**❓ QUESTIONS**
**1. What determines the rate at which energy is delivered by a current?**
*Answer:* Electric Power ($P = VI$).

**2. An electric motor takes 5 A from a 220 V line. Determine the power of the motor and the energy consumed in 2 h.**
*Answer:*
- Power $P = VI = 220 \times 5 = 1100\text{ W}$.
- Energy $E = P \times t = 1100\text{ W} \times 2\text{ h} = 2200\text{ Wh} = 2.2\text{ kWh}$.

---

## 🎭 COMIC STYLE RECAP: A CHAT IN THE CIRCUIT

👦 **Student:** Phew, that was a lot of formulas!
🔋 **Battery:** Don''t sweat it! Just remember, I''m the boss. I provide the **Potential Difference (Voltage)**. Without me, nobody moves!
⚡ **Electron:** Yep! When the boss pushes us, we form the **Electric Current ($I$)**. We march from negative to positive!
🛑 **Resistor:** Hey, slow down! I''m the **Resistance ($R$)**. My job is to make your path harder and slow you guys down!
👮‍♂️ **Officer Ohm:** And my law ($V = I \times R$) keeps you all in check. If you push harder (more Voltage), they move faster (more Current) unless the Resistance steps up!
🔥 **Heater:** Oh, and when they bump into Resistance a lot? They get mad and generate **Heat ($H = I^2Rt$)**. We use that to iron your clothes!

', TRUE, 4);
