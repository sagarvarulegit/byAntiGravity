-- Seed data for Science Chapter 1 Quiz Questions
-- Quiz: Science Chapter 1 Assessment (ID: d0eebc99-9c0b-4ef8-bb6d-6bb9bd380099)
-- Reference: science_1.txt (CBSE Class 10 Science Chapter 1)

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty) VALUES
(
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd385551',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099',
    'When lead nitrate powder is heated in a boiling tube, brown fumes are emitted. These brown fumes consist of which gas?',
    'multiple_choice',
    '["A. Nitrogen monoxide (NO)", "B. Nitrogen dioxide (NO2)", "C. Dinitrogen oxide (N2O)", "D. Nitrogen pentoxide (N2O5)"]',
    1,
    NULL,
    1,
    'Heating lead nitrate produces lead oxide, oxygen gas, and nitrogen dioxide (NO2) gas, which emits characteristic brown fumes.',
    'standard'
),
(
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd385552',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099',
    'During the whitewashing of walls, slaked lime reacts slowly with carbon dioxide in the air to form a thin, shiny layer of which substance?',
    'multiple_choice',
    '["A. Calcium oxide", "B. Calcium sulphate", "C. Calcium carbonate", "D. Calcium chloride"]',
    2,
    NULL,
    1,
    'Slaked lime (Ca(OH)2) reacts with CO2 in the air to form Calcium carbonate (CaCO3), giving the walls a shiny finish.',
    'standard'
),
(
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd385553',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099',
    'White silver chloride turns grey when exposed to sunlight. This colour change is due to the decomposition of silver chloride into:',
    'multiple_choice',
    '["A. Silver metal and chlorine gas", "B. Silver oxide and chlorine gas", "C. Silver metal and oxygen gas", "D. Silver nitrate and chlorine gas"]',
    0,
    NULL,
    1,
    'This is a photolytic decomposition reaction. AgCl breaks down into grey silver metal (Ag) and chlorine gas (Cl2).',
    'basic'
),
(
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd385554',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099',
    'Which of the following is NOT a typically observed change that helps us determine whether a chemical reaction has taken place?',
    'multiple_choice',
    '["A. Evolution of a gas", "B. Change in physical state", "C. Increase in the total mass of substances", "D. Change in temperature"]',
    2,
    NULL,
    1,
    'According to the Law of Conservation of Mass, the total mass of substances remains constant during a chemical reaction, it does not increase.',
    'basic'
),
(
    'f0eebc99-9c0b-4ef8-bb6d-6bb9bd385555',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099',
    'What happens when iron nails are kept in a copper sulphate solution for some time?',
    'multiple_choice',
    '["A. The blue colour of the solution intensifies and the nail remains grey", "B. The blue colour of the solution fades and the nail becomes brownish", "C. The solution turns yellow and the nail dissolves completely", "D. There is no change in colour or state of either the solution or nail"]',
    1,
    NULL,
    1,
    'Iron is more reactive than copper. It displaces copper from CuSO4, fading the blue color (as FeSO4 forms) and depositing brown copper on the nail.',
    'standard'
),
(
    '61d18190-5b75-433c-806a-1a2f6e364524',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099',
    'What is the correct balanced equation for the reaction of Iron with steam?',
    'multiple_choice',
    '["A. 3Fe + 4H2O -> Fe3O4 + 4H2", "B. 3Fe + H2O -> Fe3O4 + H2", "C. Fe + H2O -> FeO + H2", "D. 2Fe + 3H2O -> Fe2O3 + 3H2"]',
    0,
    NULL,
    1,
    'According to the Law of Conservation of Mass, the number of atoms on the LHS must equal the RHS. In 3Fe + 4H2O -> Fe3O4 + 4H2, we have 3 Fe, 8 H, and 4 O on both sides.',
    'medium'
),
(
    'f1a72a34-615a-4363-a55d-17df5c977728',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099',
    'When Magnesium burns in oxygen, what gets oxidized?',
    'multiple_choice',
    '["A. Oxygen", "B. Magnesium oxide", "C. Magnesium", "D. Both Magnesium and Oxygen"]',
    2,
    NULL,
    1,
    'Applying the LHS Rule: The answer must be a reactant. Magnesium (Mg) gains oxygen to form MgO. The substance that gains oxygen is oxidized.',
    'basic'
),
(
    '7d70e9eb-5ae7-4b1c-ad66-f88b7d5509ec',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099',
    'A student mixes Lead Nitrate and Potassium Iodide solutions. What will be the observation?',
    'multiple_choice',
    '["A. A white precipitate of Lead Sulphate forms", "B. A yellow precipitate of Lead Iodide forms", "C. A green solution is produced", "D. Brown fumes of NO2 gas are released"]',
    1,
    NULL,
    1,
    'This is a double displacement reaction. Pb(NO3)2 + 2KI -> PbI2 (yellow ppt) + 2KNO3.',
    'standard'
),
(
    'eb92c4bb-861a-4416-bca9-c4ae44f83149',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099',
    'In the reaction: CuO + H2 -> Cu + H2O, identify the oxidizing agent.',
    'multiple_choice',
    '["A. H2", "B. Cu", "C. H2O", "D. CuO"]',
    3,
    NULL,
    1,
    'Using the LHS rule: CuO loses oxygen to become Cu, meaning it is reduced. The substance that gets reduced acts as the oxidizing agent. So, CuO is the oxidizing agent.',
    'hard'
),
(
    'e4253ee1-909a-44d5-984e-82fe1aba0514',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099',
    'Assertion (A): Respiration is an exothermic reaction. Reason (R): Respiration involves the breakdown of glucose with oxygen to release energy.',
    'multiple_choice',
    '["A. Both A and R are true and R is the correct explanation of A", "B. Both A and R are true but R is NOT the correct explanation of A", "C. A is true but R is false", "D. A is false but R is true"]',
    0,
    NULL,
    1,
    'An exothermic reaction is one that releases energy. Since respiration releases energy (ATP) by breaking down glucose with oxygen, the reason correctly explains the assertion.',
    'hard'
),
(
    '0d7f8ee9-579e-4d09-be72-c8f73e9b3614',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099',
    'A shiny brown metal X turns black on heating in air. Which of the following statements is correct?',
    'multiple_choice',
    '["A. X is iron and the black compound is Fe3O4", "B. X is copper and the reaction is a reduction", "C. X is copper and the black compound is CuO", "D. X is silver and the black compound is Ag2S"]',
    2,
    NULL,
    1,
    'Copper (Cu) is a shiny brown metal. On heating in air, it undergoes oxidation to form black Copper(II) oxide (CuO).',
    'standard'
),
(
    'af86cff0-e56f-4581-b934-c22b4e4092d3',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099',
    'Which method is used to balance a chemical equation?',
    'multiple_choice',
    '["A. Hit and trial method", "B. Criss-cross method", "C. Substitution method", "D. Oxidation state method"]',
    0,
    NULL,
    1,
    'The hit and trial method is used to balance chemical equations by equating the number of atoms of each element on LHS and RHS.',
    'basic'
),
(
    '3c63e94f-0980-42f6-b674-ded13a81ee9e',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099',
    'To protect iron articles from rusting, they are painted. Why?',
    'multiple_choice',
    '["A. It makes the iron look shiny", "B. It increases the reactivity of iron", "C. It prevents iron from coming into contact with oxygen and moisture", "D. It converts iron into iron oxide"]',
    2,
    NULL,
    1,
    'Rusting requires both oxygen and moisture. Paint acts as a physical barrier, preventing these from reaching the iron surface.',
    'standard'
),
(
    '4fdc5b46-be3a-4dfb-9ce5-bb29b02a5734',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099',
    'Why are chips packets flushed with nitrogen gas?',
    'multiple_choice',
    '["A. To prevent corrosion", "B. To make the chips crispier", "C. To prevent rancidity of fats and oils", "D. To increase the weight of the packet"]',
    2,
    NULL,
    1,
    'Nitrogen is an inert gas. It replaces oxygen in the packet, preventing the oxidation (rancidity) of the oils and fats present in the chips.',
    'basic'
),
(
    'c190c705-2ec5-407b-a82d-ac518bc0ee53',
    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099',
    'Which of the following is an endothermic reaction?',
    'multiple_choice',
    '["A. Burning of natural gas", "B. Dilution of sulphuric acid", "C. Respiration", "D. Decomposition of silver chloride"]',
    3,
    NULL,
    1,
    'Decomposition of silver chloride requires energy in the form of sunlight (photolytic decomposition). Reactions that absorb energy are endothermic.',
    'medium'
)
ON CONFLICT (id) DO NOTHING;
