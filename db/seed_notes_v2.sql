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
'# Chapter 12: Electricity

## 1. 🎯 Chapter Goal
Understand how electric current and voltage work. Learn how to calculate resistance, power, and heating effects.

## 2. 🪝 Hook
You flip a switch and a bulb glows. But what is moving inside the wire? How does a tiny filament produce light? Let''s discover how electrons flow!

## 3. 📖 Concept 1: Electric Current and Voltage
An **[JARGON: Electric Current | The rate of flow of electric charge through a conductor | Current flowing through a copper wire]** (the speed of charge flow) is the flow of charge.
Formula:
$$I = \frac{Q}{t}$$
- $I$ is current. Its unit is **[JARGON: Ampere | The SI unit of electric current, equal to one Coulomb per second | A typical phone charger uses 2 Amperes]** (the unit for measuring current flow).
- $Q$ is charge. Its unit is Coulomb (C).
- $t$ is time in seconds.

We measure current using an **[JARGON: Ammeter | A device used to measure electric current in a circuit | An ammeter connected in series with a bulb]** (current meter connected in series). We connect it in series.

To push charges, we need **[JARGON: Potential Difference | The work done to move a unit charge between two points | A 1.5 Volt battery has a potential difference between its ends]** (voltage push). This is the work done to move a charge.
Formula:
$$V = \frac{W}{Q}$$
- $V$ is voltage. Its unit is **[JARGON: Volt | The SI unit of potential difference, equal to one Joule per Coulomb | A wall outlet has 220 Volts]** (the unit of voltage).
- $W$ is work in Joules.

We measure voltage using a **[JARGON: Voltmeter | A device used to measure potential difference between two points | A voltmeter connected in parallel across a bulb]** (voltage meter connected in parallel). We connect it in parallel.

## 4. 📖 Concept 2: Ohm''s Law and Resistivity
Ohm''s Law states that voltage is proportional to current at a constant temperature.
Formula:
$$V = IR$$

Here, $R$ is **[JARGON: Resistance | The property of a conductor to oppose the flow of electric current | A thin wire has higher resistance than a thick wire]** (the fight against current). Its unit is **[JARGON: Ohm | The SI unit of electrical resistance | A copper wire has a resistance of 0.1 Ohm]** (the unit of resistance).

Resistance depends on:
1. Length ($l$): Longer wires have more resistance ($R \propto l$).
2. Area ($A$): Thicker wires have less resistance ($R \propto 1/A$).
3. Material: We measure this with **[JARGON: Resistivity | A measure of how strongly a material opposes the flow of electric current, regardless of its shape | Copper has very low resistivity, while rubber has high resistivity]** (the material''s resistance power).

Formula:
$$R = \rho \frac{l}{A}$$
$\rho$ is the resistivity. Its unit is Ohm-meter ($\Omega\cdot m$).

## 5. 📖 Concept 3: Resistors and Heating Effect
We can connect resistors in two ways:
- Series: $R_s = R_1 + R_2 + R_3$. Current stays the same.
- Parallel: $\frac{1}{R_p} = \frac{1}{R_1} + \frac{1}{R_2} + \frac{1}{R_3}$. Voltage stays the same.

When current flows, it makes heat. This is **[JARGON: Joule Heating | The process where electrical energy is turned into heat as current flows through a resistor | An electric iron heating up when turned on]** (heat from electricity).
Formula:
$$H = I^2 R t$$

**[JARGON: Electric Power | The rate at which electrical energy is consumed in a circuit | A 60 Watt light bulb uses 60 Joules of energy per second]** (energy use speed) is the rate of using energy.
Formula:
$$P = VI = I^2 R = \frac{V^2}{R}$$
The unit is Watt (W). The commercial unit is Kilowatt-hour ($kWh$).
$$1\text{ }kWh = 3.6 \times 10^6\text{ Joules}$$

## 6. ⚠️ Common Mistakes
- Connecting ammeters in parallel or voltmeters in series.
- Thinking resistivity changes when a wire is cut. Resistivity only depends on the material type and temperature!
- Forgetting to convert time to seconds when calculating Joule heat.

## 7. 💡 Memory Tricks
- **VIP**: Power is Voltage times Current ($P = VI$).
- **Series is Single**: One single path for current to flow.
- **Parallel is Paths**: Multiple paths for current to split.

## 8. 📝 Quick Practice
- **Question 1**: A bulb uses 0.5 Amperes from a 220 Volt line. Find its resistance.
  - *Answer*: $R = V/I = 220/0.5 = 440$ Ohms.
- **Question 2**: Find the total resistance of two 4 Ohm resistors connected in parallel.
  - *Answer*: $1/R_p = 1/4 + 1/4 = 2/4 = 1/2 \implies R_p = 2$ Ohms.

## 9. 🎓 Board Tips
- Always check the units. Convert minutes to seconds and Kilowatts to Watts.
- Alloys (like Nichrome) have high resistivity and high melting points. We use them for heaters because they do not melt or burn easily.

## 10. 🔄 One-Minute Revision
- Current ($I=Q/t$) is charge speed. Voltage ($V=W/Q$) is charge push.
- Ohm''s law is $V=IR$.
- Resistance increases with length and decreases with thickness.
- Series adds resistances. Parallel reduces total resistance.
- Power ($P=VI$) is measured in Watts.

## 11. 🎬 Comic Recap
```
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "Priya: Voltage pushes the current, │
│         and resistance fights back?"       │
│ Rahul: "Rahul: Exactly! Think of it like   │
│         water in a pipe. More pressure =   │
│         more flow."                        │
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "Priya: Why are house appliances    │
│         connected in parallel?"            │
│ Rahul: "Rahul: So if one light breaks, the │
│         others still work! And they all    │
│         get 220 Volts."                    │
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "Priya: What makes the toaster heat │
│         up so fast?"                       │
│ Rahul: "Rahul: It uses alloys with high    │
│         resistance! That creates Joule     │
│         heating."                          │
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ Current flows, voltage pushes,             │
│ resistance resists.                        │
│ V = I * R.                                 │
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
