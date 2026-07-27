import uuid

questions = [
    {
        "q": "What is the correct balanced equation for the reaction of Iron with steam?",
        "options": '["A. 3Fe + 4H2O -> Fe3O4 + 4H2", "B. 3Fe + H2O -> Fe3O4 + H2", "C. Fe + H2O -> FeO + H2", "D. 2Fe + 3H2O -> Fe2O3 + 3H2"]',
        "correct": 0,
        "expl": "According to the Law of Conservation of Mass, the number of atoms on the LHS must equal the RHS. In 3Fe + 4H2O -> Fe3O4 + 4H2, we have 3 Fe, 8 H, and 4 O on both sides.",
        "diff": "medium"
    },
    {
        "q": "When Magnesium burns in oxygen, what gets oxidized?",
        "options": '["A. Oxygen", "B. Magnesium oxide", "C. Magnesium", "D. Both Magnesium and Oxygen"]',
        "correct": 2,
        "expl": "Applying the LHS Rule: The answer must be a reactant. Magnesium (Mg) gains oxygen to form MgO. The substance that gains oxygen is oxidized.",
        "diff": "basic"
    },
    {
        "q": "A student mixes Lead Nitrate and Potassium Iodide solutions. What will be the observation?",
        "options": '["A. A white precipitate of Lead Sulphate forms", "B. A yellow precipitate of Lead Iodide forms", "C. A green solution is produced", "D. Brown fumes of NO2 gas are released"]',
        "correct": 1,
        "expl": "This is a double displacement reaction. Pb(NO3)2 + 2KI -> PbI2 (yellow ppt) + 2KNO3.",
        "diff": "standard"
    },
    {
        "q": "In the reaction: CuO + H2 -> Cu + H2O, identify the oxidizing agent.",
        "options": '["A. H2", "B. Cu", "C. H2O", "D. CuO"]',
        "correct": 3,
        "expl": "Using the LHS rule: CuO loses oxygen to become Cu, meaning it is reduced. The substance that gets reduced acts as the oxidizing agent. So, CuO is the oxidizing agent.",
        "diff": "hard"
    },
    {
        "q": "Assertion (A): Respiration is an exothermic reaction. Reason (R): Respiration involves the breakdown of glucose with oxygen to release energy.",
        "options": '["A. Both A and R are true and R is the correct explanation of A", "B. Both A and R are true but R is NOT the correct explanation of A", "C. A is true but R is false", "D. A is false but R is true"]',
        "correct": 0,
        "expl": "An exothermic reaction is one that releases energy. Since respiration releases energy (ATP) by breaking down glucose with oxygen, the reason correctly explains the assertion.",
        "diff": "hard"
    },
    {
        "q": "A shiny brown metal X turns black on heating in air. Which of the following statements is correct?",
        "options": '["A. X is iron and the black compound is Fe3O4", "B. X is copper and the reaction is a reduction", "C. X is copper and the black compound is CuO", "D. X is silver and the black compound is Ag2S"]',
        "correct": 2,
        "expl": "Copper (Cu) is a shiny brown metal. On heating in air, it undergoes oxidation to form black Copper(II) oxide (CuO).",
        "diff": "standard"
    },
    {
        "q": "Which method is used to balance a chemical equation?",
        "options": '["A. Hit and trial method", "B. Criss-cross method", "C. Substitution method", "D. Oxidation state method"]',
        "correct": 0,
        "expl": "The hit and trial method is used to balance chemical equations by equating the number of atoms of each element on LHS and RHS.",
        "diff": "basic"
    },
    {
        "q": "To protect iron articles from rusting, they are painted. Why?",
        "options": '["A. It makes the iron look shiny", "B. It increases the reactivity of iron", "C. It prevents iron from coming into contact with oxygen and moisture", "D. It converts iron into iron oxide"]',
        "correct": 2,
        "expl": "Rusting requires both oxygen and moisture. Paint acts as a physical barrier, preventing these from reaching the iron surface.",
        "diff": "standard"
    },
    {
        "q": "Why are chips packets flushed with nitrogen gas?",
        "options": '["A. To prevent corrosion", "B. To make the chips crispier", "C. To prevent rancidity of fats and oils", "D. To increase the weight of the packet"]',
        "correct": 2,
        "expl": "Nitrogen is an inert gas. It replaces oxygen in the packet, preventing the oxidation (rancidity) of the oils and fats present in the chips.",
        "diff": "basic"
    },
    {
        "q": "Which of the following is an endothermic reaction?",
        "options": '["A. Burning of natural gas", "B. Dilution of sulphuric acid", "C. Respiration", "D. Decomposition of silver chloride"]',
        "correct": 3,
        "expl": "Decomposition of silver chloride requires energy in the form of sunlight (photolytic decomposition). Reactions that absorb energy are endothermic.",
        "diff": "medium"
    }
]

with open(r"C:\Sagar\Projects\CBSE\byAntiGravity\db\seed_science_ch1_quizzes.sql", "r", encoding="utf-8") as f:
    content = f.read()

# Remove the ON CONFLICT line at the end
content = content.replace("ON CONFLICT (id) DO NOTHING;", "").strip()

# Check if the last character is a closing parenthesis or something, actually it is a tuple.
if content.endswith(")"):
    content += ",\n"

new_rows = []
for q in questions:
    q_id = str(uuid.uuid4())
    row = f"(\n    '{q_id}',\n    'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380099',\n    '{q['q']}',\n    'multiple_choice',\n    '{q['options']}',\n    {q['correct']},\n    NULL,\n    1,\n    '{q['expl']}',\n    '{q['diff']}'\n)"
    new_rows.append(row)

# The original insert might not have explanation and difficulty columns specified in the INSERT INTO clause.
# Let's check the INSERT INTO clause.
import re
insert_match = re.search(r"INSERT INTO quiz_questions \((.*?)\) VALUES", content)
if insert_match:
    cols = insert_match.group(1).replace(" ", "").split(",")
    if "explanation" not in cols:
        new_cols = insert_match.group(1) + ", explanation, difficulty"
        content = content.replace(insert_match.group(1), new_cols)

    # Now we need to append the existing rows with NULL for the new columns if they didn't have them.
    # Actually, it's easier to just rebuild the file.

    # Let's rewrite the file completely.
