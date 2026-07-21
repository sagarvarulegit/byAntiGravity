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
Learn how to write and balance chemical equations. Learn the different types of chemical reactions, including redox, and understand corrosion and rancidity in daily life.

## 2. 🪝 Hook
Leave a shiny iron nail outside in the rain. In a few days, it turns brown and flaky. Why does this happen? The iron reacted with air and water. Let''s explore how substances change!

## 3. 📖 Concept 1: What is a Chemical Reaction?
A **[JARGON: Chemical Reaction | A process where chemical bonds break and form to make new substances | Iron rusting is a chemical reaction]** (a process that changes one set of chemicals into another) turns starting materials into new materials.

We call the starting substances **[JARGON: Reactants | The starting substances in a chemical reaction that change into new substances | In making water, hydrogen and oxygen are the reactants]** (the starting chemicals). We call the new substances **[JARGON: Products | The new substances formed during a chemical reaction | In making water, water is the product]** (the end chemicals).

We can spot a reaction by:
- Change in state (e.g., liquid to gas).
- Change in color.
- Gas release (evolution of gas).
- Temperature change.

## 4. 📖 Concept 2: Balancing Chemical Equations
A chemical equation shows the reactants and products. We must balance it. This satisfies the **[JARGON: Law of Conservation of Mass | Mass cannot be created or destroyed in a chemical reaction | Total mass of reactants must equal total mass of products]** (the rule that total mass does not change). The total atoms on both sides must match.

To balance an equation using the hit-and-trial method:
1. Write the raw (skeletal) equation: $Mg + O_2 \rightarrow MgO$.
2. Count the atoms of each element on both sides.
3. Put numbers (coefficients) in front of formulas, not inside them.
4. Balanced: $2Mg + O_2 \rightarrow 2MgO$.
Magnesium burns with a dazzling white flame to form white magnesium oxide powder.

## 5. 📖 Concept 3: Types of Chemical Reactions
Reactions happen in different ways:
- **[JARGON: Combination Reaction | A reaction where two or more reactants join to form one single product | Burning magnesium to form magnesium oxide]** (joining together): Two reactants join into one product. $2Mg + O_2 \rightarrow 2MgO$.
  - *Example:* Quicklime reacts vigorously with water to form slaked lime, releasing heat:
    $$CaO(s) + H_2O(l) \rightarrow Ca(OH)_2(aq) + \text{Heat}$$
  [FIGURE: combination_reaction]
- **[JARGON: Decomposition Reaction | A reaction where a single reactant breaks down into two or more products | Heating calcium carbonate to get calcium oxide and carbon dioxide]** (breaking apart): One reactant splits into two or more products.
  There are three main subtypes based on energy source:
  1. **Thermal Decomposition** (using heat):
     - Limestone breakdown: $CaCO_3(s) \xrightarrow{\text{Heat}} CaO(s) + CO_2(g)$
     - Ferrous sulphate crystals heated: Green crystals first lose water to become white anhydrous salt $FeSO_4 \cdot 7H_2O \xrightarrow{\text{Heat}} FeSO_4 + 7H_2O$, then decompose $2FeSO_4(s) \xrightarrow{\text{Heat}} Fe_2O_3(s) + SO_2(g) + SO_3(g)$ (turns brown, choking sulphur smell).
     - Lead nitrate heating: $2Pb(NO_3)_2(s) \xrightarrow{\text{Heat}} 2PbO(s) + 4NO_2(g) + O_2(g)$ (yellow residue, brown nitrogen dioxide fumes).
  2. **Electrolytic Decomposition** (using electricity):
     - Water electrolysis: $2H_2O(l) \xrightarrow{\text{Electricity}} 2H_2(g) + O_2(g)$ (Hydrogen volume is double that of oxygen. The mass ratio of hydrogen to oxygen is $1:8$).
  3. **Photolytic Decomposition** (using light):
     - Silver chloride in sunlight: $2AgCl(s) \xrightarrow{\text{Sunlight}} 2Ag(s) + Cl_2(g)$ (white powder turns grey).
     - Silver bromide in sunlight: $2AgBr(s) \xrightarrow{\text{Sunlight}} 2Ag(s) + Br_2(g)$ (used in black-and-white photography).
  [FIGURE: decomposition_reaction]
- **[JARGON: Displacement Reaction | A reaction where a more reactive element pushes out a less reactive element | Iron nail in copper sulfate solution]** (pushing out): A stronger element replaces a weaker one. $Fe + CuSO_4 \rightarrow FeSO_4 + Cu$. The blue copper solution turns green, and brown copper deposits on the iron nail!
  > [!IMPORTANT]
  > **🔥 Board Exam Hot Topic — Repeated 4x (2026)**  
  > *Key Concept:* In a displacement reaction, a more reactive metal (e.g. Iron, Zinc) displaces a less reactive metal (e.g. Copper) from its salt solution.
  [FIGURE: displacement_reaction]
- **[JARGON: Double Displacement Reaction | A reaction where two compounds swap ions to form new compounds | Barium chloride reacting with sodium sulfate]** (swapping partners): Reactants swap ions. $Na_2SO_4(aq) + BaCl_2(aq) \rightarrow BaSO_4(s) + 2NaCl(aq)$. The insoluble white solid $BaSO_4$ is a precipitate.
- **[JARGON: Exothermic Reaction | A reaction that releases heat energy into the surroundings | Respiration inside our cells]** (heat releasing): Releases heat. Examples: respiration, burning natural gas, quicklime in water.
- **[JARGON: Endothermic Reaction | A reaction that absorbs heat energy from the surroundings | Photosynthesis in plants]** (heat absorbing): Absorbs heat. Examples: photosynthesis, generally decomposition reactions (though decomposition of vegetable matter into compost is exothermic), barium hydroxide + ammonium chloride.

## 6. 📖 Concept 4: Oxidation-Reduction (Redox) Reactions
- **Oxidation**: Gain of oxygen or loss of hydrogen by a substance during a reaction.
- **Reduction**: Loss of oxygen or gain of hydrogen by a substance during a reaction.
- **Oxidising agent**: The substance that causes oxidation and is itself reduced.
- **Reducing agent**: The substance that causes reduction and is itself oxidised.
- **Redox Reaction**: A reaction where oxidation and reduction occur simultaneously.
  - *Example 1:* Heating copper powder in air forms black copper oxide:
    $$2Cu + O_2 \xrightarrow{\text{Heat}} 2CuO$$ (Copper is oxidised).
  - *Example 2:* Passing hydrogen gas over hot copper oxide:
    $$CuO + H_2 \xrightarrow{\text{Heat}} Cu + H_2O$$
    Here, copper oxide loses oxygen and is **reduced** to copper. Hydrogen gains oxygen and is **oxidised** to water.
  - *Example 3:* $$ZnO + C \rightarrow Zn + CO$$ (Zinc oxide is reduced to Zn; carbon is oxidised to carbon monoxide).

## 7. 📖 Concept 5: Everyday Effects of Oxidation
- **[JARGON: Corrosion | The gradual destruction of metals when exposed to moisture, air, and chemicals | Rusting of iron is corrosion]**: A metal surface is eaten away by air, water, or acids.
  - *Examples:* Reddish-brown coating on iron (rust), black coating on silver, green coating on copper (basic copper carbonate, $CuCO_3 \cdot Cu(OH)_2$).
  - *Prevention:* Painting, galvanisation (coating with zinc), oiling/greasing, electroplating.
- **[JARGON: Rancidity | The spoilage of fats and oils in food due to oxidation, leading to bad smell and taste | Potato chips becoming stale]**: Fats and oils in food get oxidised when exposed to air.
  - *Prevention:* Flushing packaging bags with inert nitrogen gas, storing food in airtight containers, adding antioxidants (like BHT).

## 8. 🧪 NCERT Activities Cheat Sheet
- **Activity 1.1:** Clean magnesium ribbon with sandpaper and burn. *Observation:* Burns with dazzling white flame, forming white magnesium oxide ($MgO$) powder.
- **Activity 1.2:** Mix lead nitrate and potassium iodide solutions. *Observation:* Yellow precipitate of lead iodide ($PbI_2$) forms.
- **Activity 1.3:** Add zinc granules to dilute acid. *Observation:* Hydrogen gas bubbles evolve, temperature rises (exothermic).
- **Activity 1.4:** Add water to quicklime ($CaO$). *Observation:* Vigorous reaction, beaker becomes hot (exothermic combination), slaked lime ($Ca(OH)_2$) formed.
- **Activity 1.5:** Heat green ferrous sulphate crystals. *Observation:* Crystals first turn white (water droplets appear as water of crystallisation is lost), then turn brown with a choking smell of sulphur dioxide ($SO_2$) and sulphur trioxide ($SO_3$).
- **Activity 1.6:** Heat lead nitrate powder. *Observation:* Brown nitrogen dioxide ($NO_2$) fumes and yellow lead oxide residue.
- **Activity 1.7:** Electrolysis of water. *Observation:* Hydrogen gas collected at cathode is double the volume of oxygen gas at anode. The mass ratio of $H_2$ to $O_2$ is $1:8$.
- **Activity 1.8:** Place silver chloride in sunlight. *Observation:* White powder turns grey (decomposes into silver metal and chlorine).
- **Activity 1.9:** Immerse iron nails in blue copper sulphate solution. *Observation:* Nails turn brown, blue solution turns light green (displacement).
- **Activity 1.10:** Mix sodium sulphate and barium chloride solutions. *Observation:* White precipitate of barium sulphate ($BaSO_4$) forms.
- **Activity 1.11:** Heat copper powder in china dish. *Observation:* Reddish-brown copper turns black (oxidises to copper oxide, $CuO$).

## 9. ⚠️ Common Mistakes
- Balancing by changing chemical formulas (e.g., writing $H_2O_2$ instead of $2H_2O$).
- Forgetting to write physical states like solid (s), liquid (l), gas (g), and aqueous (aq).
- Confusing single displacement (one element swaps) with double displacement (two compounds swap ions).
- Identifying lead and carbon dioxide as oxidised/reduced instead of the reactants (always look at LHS reactants for what is oxidised/reduced).

## 10. 💡 Memory Tricks
- **Combination**: Two friends join hands to form a team.
- **Decomposition**: A team splits into separate friends.
- **Displacement**: A stronger kid takes a seat from a weaker kid.
- **Double Displacement**: Two couples swap partners to dance.
- **OIL RIG**: **O**xidation **I**s **L**oss (of hydrogen/electrons), **R**eduction **I**s **G**ain (of hydrogen/electrons).

## 11. 📝 Quick Practice
- **Question 1**: What type of reaction is $2H_2 + O_2 \rightarrow 2H_2O$?
  - *Answer*: Combination reaction. Two reactants join to form one product.
- **Question 2**: Balance this equation: $H_2 + Cl_2 \rightarrow HCl$.
  - *Answer*: $H_2 + Cl_2 \rightarrow 2HCl$.
- **Question 3**: In $CuO + H_2 \rightarrow Cu + H_2O$, identify the oxidising and reducing agents.
  - *Answer:* $CuO$ is the oxidising agent (supplies oxygen/gets reduced). $H_2$ is the reducing agent (takes oxygen/gets oxidised).

## 12. 🎓 Board Tips
- Always clean the magnesium ribbon with sandpaper before burning it. This removes the protective magnesium oxide layer.
- Remember color changes: iron in copper sulphate turns blue solution pale green.
- Respiration is exothermic; decomposition reactions are endothermic.

## 13. 🔄 One-Minute Revision
- Chemical reactions turn reactants into products.
- You must balance equations to show that mass is conserved.
- Combination joins elements; decomposition breaks them down.
- Displacement swaps elements based on how reactive they are.
- Exothermic reactions release heat; endothermic reactions absorb heat.
- Oxidation is gain of oxygen; reduction is loss of oxygen.
- Corrosion degrades metals; rancidity spoils fats/oils.

## 14. 🎬 Comic Recap
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
```', TRUE, 11)
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

> [!IMPORTANT]
> **🔥 Board Exam Hot Topic — Repeated 6x (2025, 2026)**  
> *Key Concept:* Circuit numericals that require calculating equivalent resistance, total current, and potential differences using Ohm''s Law ($V = IR$) are highly repeated.
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

> [!IMPORTANT]
> **🔥 Board Exam Hot Topic — Repeated 3x (2025)**  
> *Key Concept:* If a wire of resistance $R$ is cut into $n$ equal parts, the resistance of each part becomes $R/n$. When these $n$ parts are connected in parallel, the equivalent resistance $R_p$ is $R/n^2$.
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
