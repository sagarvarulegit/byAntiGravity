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
