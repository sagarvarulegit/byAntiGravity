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
