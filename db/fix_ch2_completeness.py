import os

file_path = 'C:/Sagar/Projects/CBSE/byAntiGravity/db/seed_science_ch2_notes.sql'
with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Add NCERT Activities Cheat Sheet to Revision Notes (Lesson 1)
# Find the line "## 🔄 One-Minute Revision"
cheat_sheet_str = """## 🧪 NCERT Activities Cheat Sheet
- **Activity 2.1:** Test indicators on acids/bases. *Observation:* Red litmus turns blue in base, blue turns red in acid. Phenolphthalein is pink in base, colourless in acid.
- **Activity 2.2:** Olfactory indicators. *Observation:* Vanilla, onion, and clove lose their smell in basic solutions (NaOH) but retain it in acidic solutions (HCl).
- **Activity 2.3:** Zinc granules + dilute $H_2SO_4$. *Observation:* Hydrogen gas bubbles evolve, burns with a 'pop' sound. Exothermic.
- **Activity 2.4:** Zinc granules + NaOH. *Observation:* Sodium zincate forms, hydrogen gas is evolved. Needs heating.
- **Activity 2.5:** Metal carbonates/bicarbonates + HCl. *Observation:* Brisk effervescence of $CO_2$ gas. Turns lime water milky.
- **Activity 2.6:** Neutralisation (NaOH + HCl). *Observation:* Phenolphthalein turns pink in NaOH, becomes colourless when HCl is added.
- **Activity 2.7:** Copper oxide + dilute HCl. *Observation:* Black $CuO$ dissolves, solution turns blue-green due to $CuCl_2$ formation.
- **Activity 2.8:** Electricity through acid/glucose/alcohol. *Observation:* Bulb glows in acid (conducts electricity due to $H^+$), but not in glucose or alcohol (no ionisation).
- **Activity 2.9:** Dry HCl gas vs moist litmus. *Observation:* Dry HCl gas does not change dry blue litmus paper. Only moist blue litmus turns red, proving $H^+$ needs water to form.
- **Activity 2.10:** Mixing concentrated acid and water. *Observation:* Highly exothermic. Never add water to acid; always add acid to water slowly with stirring.
- **Activity 2.15:** Heating copper sulphate crystals. *Observation:* Blue crystals turn into a white powder ($CuSO_4$) as they lose 5 water of crystallisation molecules. Turns blue again on adding water.

## 🔄 One-Minute Revision"""

content = content.replace("## 🔄 One-Minute Revision", cheat_sheet_str)

# 2. Add Exercises and Group Activity at the end of Study Guide (Lesson 2)
# Find the comic recap at the end of the file.
end_marker = "## 🎭 COMIC STYLE RECAP: A CHAT IN THE CHEMISTRY LAB"

exercises_str = """---

## 📝 NCERT End-of-Chapter Exercises

**1. A solution turns red litmus blue, its pH is likely to be**
(a) 1 (b) 4 (c) 5 (d) 10
*Answer:* (d) 10. (Bases turn red litmus blue and have a pH greater than 7.)

**2. A solution reacts with crushed egg-shells to give a gas that turns lime-water milky. The solution contains**
(a) NaCl (b) HCl (c) LiCl (d) KCl
*Answer:* (b) HCl. (Egg shells contain calcium carbonate, which reacts with acid like HCl to produce $CO_2$ gas.)

**3. 10 mL of a solution of NaOH is found to be completely neutralised by 8 mL of a given solution of HCl. If we take 20 mL of the same solution of NaOH, the amount HCl solution (the same solution as before) required to neutralise it will be**
(a) 4 mL (b) 8 mL (c) 12 mL (d) 16 mL
*Answer:* (d) 16 mL. (Double the base requires double the acid.)

**4. Which one of the following types of medicines is used for treating indigestion?**
(a) Antibiotic (b) Analgesic (c) Antacid (d) Antiseptic
*Answer:* (c) Antacid. (Antacids are mild bases that neutralise excess stomach acid.)

**5. Write word equations and then balanced equations for the reaction taking place when:**
**(a) dilute sulphuric acid reacts with zinc granules.**
*Answer:* Zinc + Sulphuric acid → Zinc sulphate + Hydrogen gas
$Zn(s) + H_2SO_4(aq) \rightarrow ZnSO_4(aq) + H_2(g)$
**(b) dilute hydrochloric acid reacts with magnesium ribbon.**
*Answer:* Magnesium + Hydrochloric acid → Magnesium chloride + Hydrogen gas
$Mg(s) + 2HCl(aq) \rightarrow MgCl_2(aq) + H_2(g)$
**(c) dilute sulphuric acid reacts with aluminium powder.**
*Answer:* Aluminium + Sulphuric acid → Aluminium sulphate + Hydrogen gas
$2Al(s) + 3H_2SO_4(aq) \rightarrow Al_2(SO_4)_3(aq) + 3H_2(g)$
**(d) dilute hydrochloric acid reacts with iron filings.**
*Answer:* Iron + Hydrochloric acid → Iron(II) chloride + Hydrogen gas
$Fe(s) + 2HCl(aq) \rightarrow FeCl_2(aq) + H_2(g)$

**6. Compounds such as alcohols and glucose also contain hydrogen but are not categorised as acids. Describe an Activity to prove it.**
*Answer:* Set up an electrical circuit using a beaker, two nails on a rubber cork, a 6-volt battery, a bulb, and a switch. Pour glucose or alcohol solution into the beaker and switch on the current. The bulb does not glow. This proves that glucose and alcohol do not ionise in water to produce $H^+$ ions, and therefore do not conduct electricity. Thus, they are not acids.

**7. Why does distilled water not conduct electricity, whereas rain water does?**
*Answer:* Distilled water is pure and does not contain any dissolved ions. Rain water contains dissolved gases from the atmosphere (like $CO_2$, $SO_2$) which form acids (like carbonic acid) that dissociate into ions ($H^+$ and anions). These ions conduct electricity.

**8. Why do acids not show acidic behaviour in the absence of water?**
*Answer:* Acids exhibit acidic behaviour only when they dissociate to produce $H^+$ (or hydronium, $H_3O^+$) ions. This dissociation can only happen in the presence of water.

**9. Five solutions A,B,C,D and E when tested with universal indicator showed pH as 4,1,11,7 and 9, respectively. Which solution is:**
(a) neutral? (b) strongly alkaline? (c) strongly acidic? (d) weakly acidic? (e) weakly alkaline? Arrange the pH in increasing order of hydrogen-ion concentration.
*Answer:* (a) Neutral: D (pH 7) (b) Strongly alkaline: C (pH 11) (c) Strongly acidic: B (pH 1) (d) Weakly acidic: A (pH 4) (e) Weakly alkaline: E (pH 9).
Increasing order of $H^+$ concentration (i.e., decreasing order of pH): C (11) < E (9) < D (7) < A (4) < B (1).

**10. Equal lengths of magnesium ribbons are taken in test tubes A and B. Hydrochloric acid (HCl) is added to test tube A, while acetic acid ($CH_3COOH$) is added to test tube B. In which test tube will the fizzing occur more vigorously and why?**
*Answer:* Fizzing will occur more vigorously in test tube A. HCl is a strong acid and completely dissociates to produce a high concentration of $H^+$ ions, leading to a faster reaction (more rapid evolution of $H_2$ gas). Acetic acid is a weak acid.

**11. Fresh milk has a pH of 6. How do you think the pH will change as it turns into curd? Explain your answer.**
*Answer:* The pH will decrease (become less than 6). As milk turns into curd, bacteria (Lactobacillus) convert lactose into lactic acid. The increase in acid concentration lowers the pH.

**12. A milkman adds a very small amount of baking soda to fresh milk.**
**(a) Why does he shift the pH of the fresh milk from 6 to slightly alkaline?**
**(b) Why does this milk take a long time to set as curd?**
*Answer:* (a) He shifts the pH to slightly alkaline to prevent the milk from spoiling quickly. In alkaline conditions, it takes longer for the bacteria to produce enough lactic acid to sour the milk.
(b) It takes a long time to set as curd because the lactic acid produced by bacteria must first neutralise the added alkali (baking soda) before the pH can fall enough to coagulate the milk.

**13. Plaster of Paris should be stored in a moisture-proof container. Explain why?**
*Answer:* Plaster of Paris ($CaSO_4 \cdot \\frac{1}{2}H_2O$) readily absorbs moisture (water) from the air and reacts to form a hard, solid mass called gypsum ($CaSO_4 \\cdot 2H_2O$). This makes it useless for plastering.
Equation: $CaSO_4 \cdot \\frac{1}{2}H_2O + 1\\frac{1}{2}H_2O \\rightarrow CaSO_4 \\cdot 2H_2O$

**14. What is a neutralisation reaction? Give two examples.**
*Answer:* A reaction in which an acid reacts with a base to form salt and water is called a neutralisation reaction.
Examples:
1. $NaOH(aq) + HCl(aq) \\rightarrow NaCl(aq) + H_2O(l)$
2. $Mg(OH)_2(s) + 2HCl(aq) \\rightarrow MgCl_2(aq) + 2H_2O(l)$

**15. Give two important uses of washing soda and baking soda.**
*Answer:*
**Washing Soda ($Na_2CO_3 \cdot 10H_2O$):**
1. Used in glass, soap, and paper industries.
2. Used for removing permanent hardness of water.
**Baking Soda ($NaHCO_3$):**
1. Used in making baking powder (for baking cakes, bread).
2. Used as an antacid to treat indigestion.

---

## 👥 NCERT Group Activity

**Prepare your own indicator:**
1. Crush beetroot in a mortar.
2. Add sufficient water to obtain the extract.
3. Filter the extract by the procedure learnt by you in earlier classes.
4. Collect the filtrate to test the substances you may have tasted earlier.
5. Arrange four test tubes in a test tube stand. Label them as A, B, C and D. Pour 2 mL each of lemon juice solution, soda-water, vinegar and baking soda solution in them respectively.
6. Put 2-3 drops of the beetroot extract in each test tube and note the colour change if any. Write your observation in a Table.
*Observation:* Beetroot is a natural indicator. It remains red/purple in acidic solutions (lemon juice, soda-water, vinegar) and turns yellow/green in basic solutions (baking soda).

## 🎭 COMIC STYLE RECAP: A CHAT IN THE CHEMISTRY LAB"""

content = content.replace(end_marker, exercises_str)

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Injected NCERT Exercises, Group Activity, and Activities Cheat Sheet!")
