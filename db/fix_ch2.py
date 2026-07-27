import sys

file_path = 'C:/Sagar/Projects/CBSE/byAntiGravity/db/seed_pyq_questions.sql'
with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

start_str = '-- Chapter: Acids, Bases and Salts (Seq: 2)'
end_str = '-- Chapter: Metals and Non-metals (Seq: 3)'

start_idx = content.find(start_str)
end_idx = content.find(end_str)

if start_idx == -1 or end_idx == -1:
    print('Error: Could not find block boundaries.')
    sys.exit(1)

pre_content = content[:start_idx]
post_content = content[end_idx:]

new_block = """-- Chapter: Acids, Bases and Salts (Seq: 2)
    SELECT id INTO v_chapter_id FROM chapters WHERE subject_id = v_subject_id AND sequence_number = 2 LIMIT 1;
    IF v_chapter_id IS NOT NULL THEN
        DELETE FROM quizzes WHERE chapter_id = v_chapter_id AND quiz_kind = 'pyq_practice';
        INSERT INTO quizzes (chapter_id, title, quiz_kind, total_marks)
        VALUES (v_chapter_id, 'Previous Years Board Questions', 'pyq_practice', 0)
        RETURNING id INTO v_quiz_id;

        INSERT INTO quiz_questions (quiz_id, question_text, type, marks, source_year, difficulty, model_answer, marking_scheme)
        VALUES (v_quiz_id, 'Consider the following reactions: (i) Dilute hydrochloric acid reacts with sodium hydroxide. (ii) Magnesium oxide reacts with dilute hydrochloric acid. (iii) Carbon dioxide reacts with sodium hydroxide. It is found that in each case : (A) Salt and water is formed. (B) Neutral salts are formed. (C) Hydrogen gas is formed. (D) Acidic salts are formed.', 'multiple_choice', 1, '2025, 2026', 'medium', 'Option (A)', '1 mark for correct option (A). In all cases, neutralisation (or reaction of basic/acidic oxides) yields salt and water.');

        INSERT INTO quiz_questions (quiz_id, question_text, type, marks, source_year, difficulty, model_answer, marking_scheme)
        VALUES (v_quiz_id, 'Acid-base indicators can be used to distinguish between an acid and a base. Universal indicator, a mixture of several indicators, shows different colours at different concentrations of acids and bases, thereby indicating their pH on the pH scale of 0 – 14. The pH of a solution is measured by pH paper, which is a paper impregnated with a universal indicator.
Answer the following questions :
(a) Solution P is a strong acid while solution Q is a strong base. On the pH scale, where would you place the solutions P and Q?
(b) A solution has a pH of 7. Name a compound you would use to (i) increase its pH, and (ii) decrease its pH.
(c) (i) When the pH of a solution is decreased from 4 to 2, what effect does it produce on its hydronium ion concentration? State the colour change shown by the pH paper.
OR
(c) (ii) A person is feeling pain and irritation in the stomach due to indigestion. What could be the pH of the fluid in the stomach? Write the common name of the medicines people use for remedy. Give the chemical name of "milk of magnesia" often used for this purpose.', 'short_answer', 4, '2025', 'medium', '(a) Solution P (strong acid) is placed between 0-2. Solution Q (strong base) is placed between 12-14.
(b) (i) To increase pH, add a base like Sodium Hydroxide ($NaOH$). (ii) To decrease pH, add an acid like Hydrochloric acid ($HCl$).
(c) (i) The hydronium ion ($H_3O^+$) concentration increases (it becomes 100 times more concentrated). The colour of pH paper changes from orange (pH 4) to red (pH 2).
OR
(c) (ii) The pH could be around 1 to 3 (highly acidic due to excess HCl). The medicines used are called Antacids. The chemical name of milk of magnesia is Magnesium hydroxide ($Mg(OH)_2$).', '(a) 1 mark for correct positions (b) 1 mark for correct examples (c) (i) 1 mark for concentration effect, 1 mark for colour OR (c) (ii) 1 mark for pH/Antacid, 1 mark for Magnesium hydroxide.');

        INSERT INTO quiz_questions (quiz_id, question_text, type, marks, source_year, difficulty, model_answer, marking_scheme)
        VALUES (v_quiz_id, 'Seawater contains many salts dissolved in it. Common salt is separated from these salts.
(a) Write balanced chemical equations to show the products formed during electrolysis of brine.
(b) List two uses of any one product obtained during electrolysis of brine.
(c) (i) A mild non-corrosive basic salt A, used for faster cooking, is strongly heated to produce a compound B, that is used for removing permanent hardness of water. Identify A and B and also write the equation for the reaction that occurs when A is heated.
OR
(c) (ii) Define water of crystallisation. Give two examples of salts that have water of crystallisation.', 'short_answer', 4, '2025', 'medium', '(a) $2NaCl(aq) + 2H_2O(l) \\rightarrow 2NaOH(aq) + Cl_2(g) + H_2(g)$
(b) Uses of $Cl_2$: Water treatment, manufacturing PVC. (Or uses of $H_2$ or $NaOH$).
(c) (i) A is Sodium hydrogencarbonate (Baking soda, $NaHCO_3$). B is Sodium carbonate (Washing soda, $Na_2CO_3$). Equation: $2NaHCO_3 \\rightarrow Na_2CO_3 + H_2O + CO_2$.
OR
(c) (ii) Water of crystallisation is the fixed number of water molecules present in one formula unit of a salt. Examples: Copper sulphate ($CuSO_4 \\cdot 5H_2O$), Washing soda ($Na_2CO_3 \\cdot 10H_2O$).', '(a) 1 mark for balanced equation (b) 1 mark for uses (c) (i) 1 mark for identifying A & B, 1 mark for equation OR (c) (ii) 1 mark for definition, 1 mark for examples.');

        INSERT INTO quiz_questions (quiz_id, question_text, type, marks, source_year, difficulty, model_answer, marking_scheme)
        VALUES (v_quiz_id, 'Which of the given option represents a family of salts? (A) NaCl, Na2SO4, CaSO4 (B) K2SO4, Na2SO4, CaSO4 (C) NaNO3, CaCO3, Na2CO3 (D) MgSO4, CuSO4, MgCl2', 'multiple_choice', 1, '2025', 'medium', 'Option (B)', '1 mark for correct option (B). All salts in this option contain the sulphate ($SO_4^{2-}$) radical, hence belonging to the sulphate family.');

        INSERT INTO quiz_questions (quiz_id, question_text, type, marks, source_year, difficulty, model_answer, marking_scheme)
        VALUES (v_quiz_id, '(a) Common salt is an important raw material for various chemicals of daily use. State in brief the method of preparation of (i) Sodium hydroxide, and (ii) Sodium hydrogen carbonate from common salt. Write balanced chemical equations of the reactions that occur.
OR
(b) Design an experimental set-up to demonstrate that "Alcohol and glucose contain hydrogen but are not categorised as acids". Also give the reason to justify this fact.', 'short_answer', 3, '2025', 'medium', '(a) (i) Sodium hydroxide is prepared by the Chlor-alkali process. Electricity is passed through brine (aqueous NaCl). Eq: $2NaCl(aq) + 2H_2O(l) \\rightarrow 2NaOH(aq) + Cl_2(g) + H_2(g)$. (ii) Sodium hydrogen carbonate is prepared by reacting brine with $CO_2$ and $NH_3$ (Solvay process). Eq: $NaCl + H_2O + CO_2 + NH_3 \\rightarrow NH_4Cl + NaHCO_3$.
OR
(b) Experiment: Connect a battery, bulb, and switch to two iron nails in a beaker. Pour glucose or alcohol solution and switch on the current. Observation: The bulb does not glow. Reason: Glucose and alcohol do not ionise in water to produce $H^+$ ions, hence they do not conduct electricity and are not categorised as acids.', '(a) 1.5 marks for each preparation and equation OR (b) 1.5 marks for setup/observation, 1.5 marks for reason.');

        INSERT INTO quiz_questions (quiz_id, question_text, type, marks, source_year, difficulty, model_answer, marking_scheme)
        VALUES (v_quiz_id, 'An aqueous solution turns red litmus blue. Excess addition of which of the following solution would reverse the change? (A) Sodium hydroxide (B) Hydrochloric acid (C) Baking soda (D) Slaked lime', 'multiple_choice', 1, '2026', 'medium', 'Option (B)', '1 mark for correct option (B). The solution is basic. Adding excess acid (HCl) will neutralise it and make it acidic, turning blue litmus red.');

        INSERT INTO quiz_questions (quiz_id, question_text, type, marks, source_year, difficulty, model_answer, marking_scheme)
        VALUES (v_quiz_id, 'The pH plays an important role in our daily life. Strength of acids and bases depends on the number of H+ ions and OH– ions produced by these respectively. pH scale helps in predicting the strength of acids and bases by measuring hydrogen ion concentration in a solution. Answer the following :
(a) What type of indicator is used to predict how strong an acid or base is?
(b) Three solutions A, B and C showed pH as 3, 5 and 7. Which solution has the highest concentration of H+ ions?
(c) What are strong acids and weak acids?
OR
(c) (i) Under what condition is rainwater called acid rain? (ii) In the following acids, identify weak acids : Nitric acid, hydrochloric acid, acetic acid, sulphuric acid, formic acid.', 'short_answer', 4, '2026', 'medium', '(a) Universal indicator is used.
(b) Solution A (pH 3) has the highest concentration of $H^+$ ions.
(c) Strong acids completely ionise in water to produce high $H^+$ concentration (e.g. HCl). Weak acids partially ionise in water to produce low $H^+$ concentration (e.g. Acetic acid).
OR
(c) (i) Rainwater is called acid rain when its pH falls below 5.6. (ii) Weak acids: Acetic acid, formic acid.', '(a) 1 mark (b) 1 mark (c) 2 marks for definitions OR (c) (i) 1 mark (ii) 1 mark.');

        INSERT INTO quiz_questions (quiz_id, question_text, type, marks, source_year, difficulty, model_answer, marking_scheme)
        VALUES (v_quiz_id, 'Study the following table and select the correct option :
| Salt | Acid used | Base used | Nature of Salt |
|---|---|---|---|
| (A) NaCl | HCl | NaOH | Basic |
| (B) Na2CO3 | H2CO3 | NaOH | Neutral |
| (C) Na2SO4 | H2SO4 | NaOH | Acidic |
| (D) CH3COONa | CH3COOH | NaOH | Basic |', 'multiple_choice', 1, '2026', 'medium', 'Option (D)', '1 mark for correct option (D). $CH_3COOH$ is a weak acid and $NaOH$ is a strong base, so the resulting salt is basic.');

        INSERT INTO quiz_questions (quiz_id, question_text, type, marks, source_year, difficulty, model_answer, marking_scheme)
        VALUES (v_quiz_id, 'To a small amount of copper oxide in a beaker, when we add dilute hydrochloric acid slowly with stirring, the change in the colour of the solution is due to the formation of : (A) Copper(II) oxide (B) Copper(I) chloride (C) Copper(II) chloride (D) Copper(I) oxide', 'multiple_choice', 1, '2026', 'medium', 'Option (C)', '1 mark for correct option (C). The black copper oxide dissolves and forms copper(II) chloride, which is blue-green.');

        INSERT INTO quiz_questions (quiz_id, question_text, type, marks, source_year, difficulty, model_answer, marking_scheme)
        VALUES (v_quiz_id, 'The body of human beings works within the pH range of : (A) 6.1 to 6.8 (B) 6.5 to 7.3 (C) 7.0 to 7.8 (D) 7.5 to 8.1', 'multiple_choice', 1, '2025', 'medium', 'Option (C)', '1 mark for correct option (C).');

        INSERT INTO quiz_questions (quiz_id, question_text, type, marks, source_year, difficulty, model_answer, marking_scheme)
        VALUES (v_quiz_id, 'How will you protect yourself from the heat generated while diluting a concentrated acid? (A) By adding acid to water with constant stirring. (B) By adding water to acid with constant stirring. (C) By adding water to acid followed by base. (D) By adding base to acid with constant stirring.', 'multiple_choice', 1, '2026', 'medium', 'Option (A)', '1 mark for correct option (A). Dilution is highly exothermic, so acid must be added to a large volume of water slowly.');

        INSERT INTO quiz_questions (quiz_id, question_text, type, marks, source_year, difficulty, model_answer, marking_scheme)
        VALUES (v_quiz_id, '(A) (a) Give the chemical name and formula of Plaster of Paris. (b) Write the chemical equation of its preparation. (c) Give any two uses of it.
OR
(B) (a) Name the acid present in ant’s sting. (b) Give reason : (i) While diluting an acid, it is recommended that the acid should be added to water. (ii) Baking soda is used as an antacid.', 'short_answer', 3, '2026', 'medium', '(A) (a) Calcium sulphate hemihydrate, $CaSO_4 \\cdot \\frac{1}{2}H_2O$. (b) $CaSO_4 \\cdot 2H_2O \\xrightarrow{373 K} CaSO_4 \\cdot \\frac{1}{2}H_2O + 1\\frac{1}{2}H_2O$. (c) Uses: Supporting fractured bones, making toys.
OR
(B) (a) Methanoic acid (Formic acid). (b) (i) Dissolving acid in water is highly exothermic. Adding water to acid can cause sudden boiling and splashing. (ii) Baking soda is mildly basic, so it neutralises excess stomach acid.', '(A) 1 mark each OR (B) 1 mark for (a), 1 mark each for (b)(i) and (b)(ii).');

        INSERT INTO quiz_questions (quiz_id, question_text, type, marks, source_year, difficulty, model_answer, marking_scheme)
        VALUES (v_quiz_id, 'Tamarind is a natural source of which acid? (A) Acetic acid (B) Tartaric acid (C) Oxalic acid (D) Citric acid', 'multiple_choice', 1, '2026', 'medium', 'Option (B)', '1 mark for correct option (B).');

        INSERT INTO quiz_questions (quiz_id, question_text, type, marks, source_year, difficulty, model_answer, marking_scheme)
        VALUES (v_quiz_id, 'A colourless gas G is produced when egg-shells are treated with a solution S. The gas G turns lime water milky. S and G respectively are : (A) H2SO4 and SO2 (B) HCl and SO2 (C) NaCl and CO2 (D) HCl and CO2', 'multiple_choice', 1, '2024', 'medium', 'Option (D)', '1 mark for correct option (D). Egg shells are made of calcium carbonate. They react with an acid (HCl) to produce $CO_2$ gas.');

        INSERT INTO quiz_questions (quiz_id, question_text, type, marks, source_year, difficulty, model_answer, marking_scheme)
        VALUES (v_quiz_id, 'Solutions A, B, C and D have pH 1, 4, 7, and 14 respectively. The solutions are of a: (A) Strong acid, weak acid, neutral, strong base (B) Weak acid, neutral, weak base, strong base (C) Weak acid, neutral, strong base, weak base (D) Weak acid, neutral, strong base, strong acid', 'multiple_choice', 1, '2025', 'medium', 'Option (A)', '1 mark for correct option (A).');

        INSERT INTO quiz_questions (quiz_id, question_text, type, marks, source_year, difficulty, model_answer, marking_scheme)
        VALUES (v_quiz_id, 'In one formula unit of salt ‘X’, seven molecules of water of crystallisation are present. The salt ‘X’ is : (A) CuSO4 (B) Na2CO3 (C) FeSO4 (D) CaSO4', 'multiple_choice', 1, '2025', 'medium', 'Option (C)', '1 mark for correct option (C). Green vitriol is Ferrous sulphate heptahydrate ($FeSO_4 \\cdot 7H_2O$).');

        INSERT INTO quiz_questions (quiz_id, question_text, type, marks, source_year, difficulty, model_answer, marking_scheme)
        VALUES (v_quiz_id, 'Tooth enamel is made up of calcium hydroxyapatite (a crystalline form of calcium phosphate). This chemical starts corroding in the mouth when the pH is : (A) 7 (B) 5 (C) 10 (D) 14', 'multiple_choice', 1, '2025', 'medium', 'Option (B)', '1 mark for correct option (B). Tooth decay begins when mouth pH falls below 5.5.');

        INSERT INTO quiz_questions (quiz_id, question_text, type, marks, source_year, difficulty, model_answer, marking_scheme)
        VALUES (v_quiz_id, '(a) Write the formula of the ions which (i) acids, and (ii) bases generate in water solutions. (b) Dry HCl gas does not change the colour of dry litmus paper. Why ?', 'short_answer', 2, '2025', 'medium', '(a) (i) Acids generate $H^+(aq)$ or $H_3O^+$ (hydronium) ions. (ii) Bases generate $OH^-(aq)$ (hydroxide) ions.
(b) Dry HCl gas cannot ionise in the absence of water. Because no $H^+$ ions are produced, it shows no acidic properties and cannot change the colour of dry litmus.', '1 mark for (a), 1 mark for (b).');

        INSERT INTO quiz_questions (quiz_id, question_text, type, marks, source_year, difficulty, model_answer, marking_scheme)
        VALUES (v_quiz_id, 'Giving reason, state the advantage of using baking powder over baking soda for the preparation of bread or cakes.', 'short_answer', 2, '2025', 'medium', 'Baking soda ($NaHCO_3$) produces sodium carbonate ($Na_2CO_3$) upon heating, which gives a bitter taste to the cake. Baking powder contains a mild edible acid (like tartaric acid) which neutralises the bitter sodium carbonate, producing a pleasant-tasting sodium salt instead.', '1 mark for stating bitterness of sodium carbonate, 1 mark for stating neutralization by tartaric acid.');

        INSERT INTO quiz_questions (quiz_id, question_text, type, marks, source_year, difficulty, model_answer, marking_scheme)
        VALUES (v_quiz_id, '(a) A compound ‘A’ is used in soda-acid fire-extinguisher and decomposes on heating to form compound ‘B’. Compound ‘B’ is used for removing permanent hardness of water. Identify ‘A’ and ‘B’. (b) Write chemical formula of Plaster of Paris. At what temperature gypsum is heated to obtain Plaster of Paris ?', 'short_answer', 2, '2026', 'medium', '(a) Compound A is Sodium hydrogencarbonate (Baking soda, $NaHCO_3$). Compound B is Sodium carbonate (Washing soda, $Na_2CO_3 \\cdot 10H_2O$).
(b) The formula of Plaster of Paris is $CaSO_4 \\cdot \\frac{1}{2}H_2O$. Gypsum is heated at 373 K (or $100^{\\circ}C$) to obtain it.', '1 mark for (a), 1 mark for (b).');

        INSERT INTO quiz_questions (quiz_id, question_text, type, marks, source_year, difficulty, model_answer, marking_scheme)
        VALUES (v_quiz_id, 'Which one of the following chemicals is used in soda-acid fire- extinguishers ? (A) Sodium carbonate (B) Sodium hydrogen carbonate (C) Sodium hydroxide (D) Sodium acetate', 'multiple_choice', 1, '2026', 'medium', 'Option (B)', '1 mark for correct option (B).');
        
    END IF;

"""

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(pre_content + new_block + post_content)

print('Updated PYQs successfully.')
