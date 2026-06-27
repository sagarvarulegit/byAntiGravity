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
ON CONFLICT (id) DO NOTHING;


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
ON CONFLICT (id) DO NOTHING;

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
ON CONFLICT (id) DO NOTHING;

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
ON CONFLICT (id) DO NOTHING;

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
ON CONFLICT (id) DO NOTHING;

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
ON CONFLICT (id) DO NOTHING;

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
ON CONFLICT (id) DO NOTHING;

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
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd383012', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'Chapter 12: Magnetic Effects of Electric Current', 12, 'Explore magnetic fields, field lines, field due to current-carrying conductors, electromagnetism, force on conductors, and domestic safety circuits.'),
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
ON CONFLICT (id) DO NOTHING;

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
