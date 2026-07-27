import uuid

header = """-- Seed data for Science Chapter 1 Quiz Questions
-- Quiz: Science Chapter 1 Assessment (ID: d0eebc99-9c0b-4ef8-bb6d-6bb9bd380099)
-- Reference: science_1.txt (CBSE Class 10 Science Chapter 1)

INSERT INTO quiz_questions (id, quiz_id, question_text, type, options, correct_option_index, correct_answer_text, marks, explanation, difficulty) VALUES
"""

questions = [
    # Original 5 questions
    {
        "id": "f0eebc99-9c0b-4ef8-bb6d-6bb9bd385551",
        "q": "When lead nitrate powder is heated in a boiling tube, brown fumes are emitted. These brown fumes consist of which gas?",
        "options": '["A. Nitrogen monoxide (NO)", "B. Nitrogen dioxide (NO2)", "C. Dinitrogen oxide (N2O)", "D. Nitrogen pentoxide (N2O5)"]',
        "correct": 1,
        "expl": "Heating lead nitrate produces lead oxide, oxygen gas, and nitrogen dioxide (NO2) gas, which emits characteristic brown fumes.",
        "diff": "standard"
    },
    {
        "id": "f0eebc99-9c0b-4ef8-bb6d-6bb9bd385552",
        "q": "During the whitewashing of walls, slaked lime reacts slowly with carbon dioxide in the air to form a thin, shiny layer of which substance?",
        "options": '["A. Calcium oxide", "B. Calcium sulphate", "C. Calcium carbonate", "D. Calcium chloride"]',
        "correct": 2,
        "expl": "Slaked lime (Ca(OH)2) reacts with CO2 in the air to form Calcium carbonate (CaCO3), giving the walls a shiny finish.",
        "diff": "standard"
    },
    {
        "id": "f0eebc99-9c0b-4ef8-bb6d-6bb9bd385553",
        "q": "White silver chloride turns grey when exposed to sunlight. This colour change is due to the decomposition of silver chloride into:",
        "options": '["A. Silver metal and chlorine gas", "B. Silver oxide and chlorine gas", "C. Silver metal and oxygen gas", "D. Silver nitrate and chlorine gas"]',
        "correct": 0,
        "expl": "This is a photolytic decomposition reaction. AgCl breaks down into grey silver metal (Ag) and chlorine gas (Cl2).",
        "diff": "basic"
    },
    {
        "id": "f0eebc99-9c0b-4ef8-bb6d-6bb9bd385554",
        "q": "Which of the following is NOT a typically observed change that helps us determine whether a chemical reaction has taken place?",
        "options": '["A. Evolution of a gas", "B. Change in physical state", "C. Increase in the total mass of substances", "D. Change in temperature"]',
        "correct": 2,
        "expl": "According to the Law of Conservation of Mass, the total mass of substances remains constant during a chemical reaction, it does not increase.",
        "diff": "basic"
    },
    {
        "id": "f0eebc99-9c0b-4ef8-bb6d-6bb9bd385555",
        "q": "What happens when iron nails are kept in a copper sulphate solution for some time?",
        "options": '["A. The blue colour of the solution intensifies and the nail remains grey", "B. The blue colour of the solution fades and the nail becomes brownish", "C. The solution turns yellow and the nail dissolves completely", "D. There is no change in colour or state of either the solution or nail"]',
        "correct": 1,
        "expl": "Iron is more reactive than copper. It displaces copper from CuSO4, fading the blue color (as FeSO4 forms) and depositing brown copper on the nail.",
        "diff": "standard"
    },
    # New 10 questions
    {
        "id": str(uuid.uuid4()),
        "q": "What is the correct balanced equation for the reaction of Iron with steam?",
        "options": '["A. 3Fe + 4H2O -> Fe3O4 + 4H2", "B. 3Fe + H2O -> Fe3O4 + H2", "C. Fe + H2O -> FeO + H2", "D. 2Fe + 3H2O -> Fe2O3 + 3H2"]',
        "correct": 0,
        "expl": "According to the Law of Conservation of Mass, the number of atoms on the LHS must equal the RHS. In 3Fe + 4H2O -> Fe3O4 + 4H2, we have 3 Fe, 8 H, and 4 O on both sides.",
        "diff": "medium"
    },
    {
        "id": str(uuid.uuid4()),
        "q": "When Magnesium burns in oxygen, what gets oxidized?",
        "options": '["A. Oxygen", "B. Magnesium oxide", "C. Magnesium", "D. Both Magnesium and Oxygen"]',
        "correct": 2,
        "expl": "Applying the LHS Rule: The answer must be a reactant. Magnesium (Mg) gains oxygen to form MgO. The substance that gains oxygen is oxidized.",
        "diff": "basic"
    },
    {
        "id": str(uuid.uuid4()),
        "q": "A student mixes Lead Nitrate and Potassium Iodide solutions. What will be the observation?",
        "options": '["A. A white precipitate of Lead Sulphate forms", "B. A yellow precipitate of Lead Iodide forms", "C. A green solution is produced", "D. Brown fumes of NO2 gas are released"]',
        "correct": 1,
        "expl": "This is a double displacement reaction. Pb(NO3)2 + 2KI -> PbI2 (yellow ppt) + 2KNO3.",
        "diff": "standard"
    },
    {
        "id": str(uuid.uuid4()),
        "q": "In the reaction: CuO + H2 -> Cu + H2O, identify the oxidizing agent.",
        "options": '["A. H2", "B. Cu", "C. H2O", "D. CuO"]',
        "correct": 3,
        "expl": "Using the LHS rule: CuO loses oxygen to become Cu, meaning it is reduced. The substance that gets reduced acts as the oxidizing agent. So, CuO is the oxidizing agent.",
        "diff": "hard"
    },
    {
        "id": str(uuid.uuid4()),
        "q": "Assertion (A): Respiration is an exothermic reaction. Reason (R): Respiration involves the breakdown of glucose with oxygen to release energy.",
        "options": '["A. Both A and R are true and R is the correct explanation of A", "B. Both A and R are true but R is NOT the correct explanation of A", "C. A is true but R is false", "D. A is false but R is true"]',
        "correct": 0,
        "expl": "An exothermic reaction is one that releases energy. Since respiration releases energy (ATP) by breaking down glucose with oxygen, the reason correctly explains the assertion.",
        "diff": "hard"
    },
    {
        "id": str(uuid.uuid4()),
        "q": "A shiny brown metal X turns black on heating in air. Which of the following statements is correct?",
        "options": '["A. X is iron and the black compound is Fe3O4", "B. X is copper and the reaction is a reduction", "C. X is copper and the black compound is CuO", "D. X is silver and the black compound is Ag2S"]',
        "correct": 2,
        "expl": "Copper (Cu) is a shiny brown metal. On heating in air, it undergoes oxidation to form black Copper(II) oxide (CuO).",
        "diff": "standard"
    },
    {
        "id": str(uuid.uuid4()),
        "q": "Which method is used to balance a chemical equation?",
        "options": '["A. Hit and trial method", "B. Criss-cross method", "C. Substitution method", "D. Oxidation state method"]',
        "correct": 0,
        "expl": "The hit and trial method is used to balance chemical equations by equating the number of atoms of each element on LHS and RHS.",
        "diff": "basic"
    },
    {
        "id": str(uuid.uuid4()),
        "q": "To protect iron articles from rusting, they are painted. Why?",
        "options": '["A. It makes the iron look shiny", "B. It increases the reactivity of iron", "C. It prevents iron from coming into contact with oxygen and moisture", "D. It converts iron into iron oxide"]',
        "correct": 2,
        "expl": "Rusting requires both oxygen and moisture. Paint acts as a physical barrier, preventing these from reaching the iron surface.",
        "diff": "standard"
    },
    {
        "id": str(uuid.uuid4()),
        "q": "Why are chips packets flushed with nitrogen gas?",
        "options": '["A. To prevent corrosion", "B. To make the chips crispier", "C. To prevent rancidity of fats and oils", "D. To increase the weight of the packet"]',
        "correct": 2,
        "expl": "Nitrogen is an inert gas. It replaces oxygen in the packet, preventing the oxidation (rancidity) of the oils and fats present in the chips.",
        "diff": "basic"
    },
    {
        "id": str(uuid.uuid4()),
        "q": "Which of the following is an endothermic reaction?",
        "options": '["A. Burning of natural gas", "B. Dilution of sulphuric acid", "C. Respiration", "D. Decomposition of silver chloride"]',
        "correct": 3,
        "expl": "Decomposition of silver chloride requires energy in the form of sunlight (photolytic decomposition). Reactions that absorb energy are endothermic.",
        "diff": "medium"
    }
]

rows = []
for q in questions:
    row = f"(\n    '{q['id']}',\n    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099',\n    '{q['q']}',\n    'multiple_choice',\n    '{q['options']}',\n    {q['correct']},\n    NULL,\n    1,\n    '{q['expl']}',\n    '{q['diff']}'\n)"
    rows.append(row)

sql_content = header + ",\n".join(rows) + "\nON CONFLICT (id) DO NOTHING;\n"

with open(r"C:\Sagar\Projects\CBSE\byAntiGravity\db\seed_science_ch1_quizzes.sql", "w", encoding="utf-8") as f:
    f.write(sql_content)

print("seed_science_ch1_quizzes.sql updated successfully.")
