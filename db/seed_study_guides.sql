INSERT INTO lessons (id, chapter_id, title, type, note_content, is_free, sequence_number) VALUES
('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380122', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', 'Self-Study Guide: Electricity (Foundations)', 'study_guide',
'# Self-Study Guide: Electricity (Foundations)

## Introduction
Welcome to the Free Foundations Self-Study Guide for Chapter 11: Electricity! This part covers the core concepts you need to get started with CBSE Class 10 Electricity. Before jumping into current, we must understand where it comes from.

---

## 0. Pre-Requisites: Charges & Electrostatics

Everything around us is made of atoms, which contain **positive charges (protons)** and **negative charges (electrons)**.

1. **Fundamental Law:** Like charges repel each other, while unlike charges attract each other.
2. **Conservation of Charge:** Charges can neither be created nor destroyed; they can only be transferred from one body to another (e.g., rubbing an ebonite rod with fur transfers electrons).
3. **Coulomb''s Law:** The electrostatic force between two point charges is directly proportional to the product of their magnitudes and inversely proportional to the square of the distance between them.
$$F = K \frac{q_1 q_2}{r^2}$$
*(Note: $K = 9 \times 10^9 Nm^2/C^2$. This is a foundational concept useful for NTSE/competitive exams!)*

**Conductors vs. Insulators:**
- **[JARGON: Conductors | Materials that allow electric charge to flow freely through them | e.g. Copper, Silver]**: They have many free electrons.
- **[JARGON: Insulators | Materials that strongly resist the flow of electric charge | e.g. Rubber, Glass]**: Their electrons are tightly bound to the atoms.

---

## 1. Electric Current and Circuit

Imagine water flowing through a river. The rate at which water flows is the "water current". Similarly, when electric charges (electrons) flow through a conductor (like a copper wire), we call it an **[JARGON: Electric Current | The rate of flow of electric charge through a conductor]**.

**Formula:**
If a net charge $Q$ flows across any cross-section of a conductor in time $t$, then the current $I$ is:
$$I = \frac{Q}{t}$$

**Units:**
- Charge ($Q$) is measured in **Coulombs (C)**.
- Time ($t$) is measured in **seconds (s)**.
- Therefore, Current ($I$) is measured in **Coulombs per second**, which is called an **Ampere (A)**.

**1 Ampere Definition:** 1 A is constituted by the flow of one coulomb of charge per second. ($1A = 1C / 1s$).

*Caution: Always remember to convert time given in minutes or hours to SECONDS (s) before using the formula $I = Q/t$.*

**Measuring Current:**
Current is measured by an instrument called an **Ammeter**.
- An ammeter has very low resistance.
- It is ALWAYS connected in **series** in a circuit so that the entire current passes through it.

---

## 2. Electric Potential and Potential Difference

Water in a perfectly horizontal pipe does not flow on its own. It needs a pressure difference (like from a pump). Similarly, electrons only move if there is a difference in electric pressure. This pressure difference is provided by a battery or a cell, and is called **Potential Difference**. 

**Electric Potential Energy** is the work required to transport charges to their proper places against the electric field using a source of energy.

**Formula:**
The potential difference ($V$) between two points is the work done ($W$) to move a unit charge ($Q$) from one point to the other.
$$V = \frac{W}{Q}$$

**Units:**
- Work ($W$) is measured in **Joules (J)**.
- Charge ($Q$) is measured in **Coulombs (C)**.
- Therefore, Potential Difference ($V$) is measured in **Volts (V)**.

**Measuring Voltage:**
Voltage is measured by an instrument called a **Voltmeter**.
- A voltmeter has very high resistance.
- It is ALWAYS connected in **parallel** across the points where you want to measure the voltage drop.

### 📝 Solved Example 1 (NCERT)
**Question:** How much work is done in moving a charge of 2 C across two points having a potential difference 12 V?

**Given:** 
- Charge $Q = 2\text{ C}$
- Potential Difference $V = 12\text{ V}$

**Formula used:**
$$V = \frac{W}{Q} \implies W = V \times Q$$

**Substitution:**
$$W = 12\text{ V} \times 2\text{ C}$$

**Final Answer:**
$$W = 24\text{ J}$$
24 Joules of work is done.

---

## 3. Circuit Diagram Symbols

To draw circuits quickly, we use standard symbols:
- **Electric Cell:** A long line (positive) and a short thick line (negative).
- **Battery:** A combination of cells connected in series.
- **Plug Key:** `( )` for open (broken circuit), `( . )` for closed (current flows).
- **Ammeter:** A circle with an "A".
- **Voltmeter:** A circle with a "V".
- **Resistor:** A zigzag line.
- **Rheostat (Variable Resistor):** A zigzag line with an arrow striking through it. Used to change resistance and regulate current without changing the voltage source.
- **Electric Bulb:** A loop or M-shaped filament inside a circle.
- **Crossing Wires:** A line with a semi-circle loop over another line, meaning they aren''t electrically connected.

[FIGURE: circuit_symbols]

---

## 4. Ohm''s Law

In 1827, German physicist Georg Simon Ohm found a relationship between current ($I$) and potential difference ($V$). 

**Statement:** Ohm''s Law states that the potential difference, $V$, across the ends of a given metallic wire in an electric circuit is directly proportional to the current flowing through it, provided its physical conditions like temperature remains the same.
$$V \propto I$$
$$V = I \times R$$

[FIGURE: ohms_law_circuit]

Here, $R$ is a constant called **[JARGON: Resistance | The property of a conductor to resist the flow of charges]**.
- SI unit is **Ohm ($\Omega$)**.
- **1 Ohm Definition:** If $V = 1\text{ V}$ and $I = 1\text{ A}$, then $R = 1\text{ }\Omega$.

*Caution: Ohm''s law is only valid if the temperature of the conductor remains constant. The V-I graph for a metallic wire is a straight line passing through the origin.*

---

## 5. Factors on which Resistance Depends

The resistance of a conductor depends on:
1. **Length ($l$):** Longer wire = More resistance. ($R \propto l$)
2. **Area of Cross-Section ($A$):** Thicker wire = Less resistance. ($R \propto 1/A$)
3. **Nature of the Material.**

Combining these:
$$R \propto \frac{l}{A} \implies R = \rho \frac{l}{A}$$

Here, $\rho$ (rho) is the constant of proportionality called **[JARGON: Electrical Resistivity | The resistance offered by a wire of unit length and unit cross-sectional area]**.
- Its SI unit is **Ohm-meter ($\Omega \cdot m$)**.
- The reciprocal of resistivity is called **Conductivity**. Its SI unit is $ohm^{-1}m^{-1}$ or $mho/m$.

**Effect of Temperature:**
- **Conductors:** Resistance increases linearly as temperature rises.
- **Insulators:** Resistance increases as temperature rises.
- **Semiconductors:** Materials whose resistivity falls between conductors and insulators. Their resistivity *falls* as temperature rises.
- **Superconductors:** Materials which completely lose their resistivity at very low temperatures.

### 📝 Solved Example 2 (PYQ - 2019)
**Question:** A wire of given material having length $l$ and area of cross-section $A$ has a resistance of 4 $\Omega$. What would be the resistance of another wire of the same material having length $l/2$ and area of cross-section $2A$?

**Given:**
- Initial resistance $R_1 = 4\text{ }\Omega$
- Initial length = $l$, Area = $A$
- New length $l_2 = l/2$
- New Area $A_2 = 2A$

**Formula used:**
$$R = \rho \frac{l}{A}$$

**Substitution:**
$$R_1 = \rho \frac{l}{A} = 4\text{ }\Omega$$
$$R_2 = \rho \frac{l/2}{2A} = \frac{1}{4} \left(\rho \frac{l}{A}\right)$$

**Final Answer:**
$$R_2 = \frac{1}{4} \times 4\text{ }\Omega = 1\text{ }\Omega$$
The new resistance is 1 $\Omega$.
', TRUE, 4),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380133', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', 'Self-Study Guide: Electricity (Advanced & PYQs)', 'study_guide',
'# Self-Study Guide: Electricity (Advanced & PYQs)

Welcome to the Premium Advanced Self-Study Guide for Chapter 11: Electricity! Here we dive deep into complex resistor networks, the heating effect of current, electric power, and tackle heavy subjective board questions.

---

## 1. Resistors in Series and Parallel

### Resistors in Series
When resistors are connected end-to-end.
- **Current ($I$) is the same** across all resistors.
- **Voltage ($V$) splits:** $V = V_1 + V_2 + V_3$

**Derivation:**
Applying Ohm''s law to the entire circuit:
$$V = I R_s$$
Applying Ohm''s law to individual resistors:
$$V_1 = I R_1, \quad V_2 = I R_2, \quad V_3 = I R_3$$
Since $V = V_1 + V_2 + V_3$:
$$I R_s = I R_1 + I R_2 + I R_3$$
$$R_s = R_1 + R_2 + R_3$$

*Result:* The total resistance is greater than the highest individual resistor.

### Resistors in Parallel
When resistors are connected between the same two points.
- **Voltage ($V$) is the same** across all resistors.
- **Current ($I$) splits:** $I = I_1 + I_2 + I_3$

**Derivation:**
Applying Ohm''s law to the entire circuit:
$$I = \frac{V}{R_p}$$
Applying Ohm''s law to individual resistors:
$$I_1 = \frac{V}{R_1}, \quad I_2 = \frac{V}{R_2}, \quad I_3 = \frac{V}{R_3}$$
Since $I = I_1 + I_2 + I_3$:
$$\frac{V}{R_p} = \frac{V}{R_1} + \frac{V}{R_2} + \frac{V}{R_3}$$
$$\frac{1}{R_p} = \frac{1}{R_1} + \frac{1}{R_2} + \frac{1}{R_3}$$

*Caution: In parallel calculations, students often find $1/R_p$ and forget to take the reciprocal at the end. Always flip your final fraction to get $R_p$!*

### Disadvantages of Series Circuits in Domestic Wiring
1. If one component fails (e.g. a bulb burns out), the circuit is broken and none of the other components work.
2. In a series circuit, the current is constant throughout. Connecting an electric lamp and an electric heater in series is impractical, as they require vastly different amounts of current to function.

This is why domestic wiring is always done in **parallel**, so each appliance gets the full voltage and operates independently!

---

## 2. Heating Effect of Electric Current

When an electric current is passed through a high-resistance wire (like nichrome), the wire becomes very hot and produces heat. This happens because useful electrical energy is dissipated entirely in the form of heat in purely resistive circuits.

**Joule''s Law of Heating:** The heat ($H$) produced in a resistor is:
1. Directly proportional to the square of current for a given resistance ($I^2$).
2. Directly proportional to resistance for a given current ($R$).
3. Directly proportional to the time for which the current flows ($t$).

**Formula:**
$$H = I^2 R t$$

### Practical Applications
1. **Electric Heating Appliances:** Electric irons, toasters, ovens, kettles, and heaters use alloys (like nichrome) because their resistivity is higher than constituent metals, and they do not oxidize (burn) at high temperatures.
2. **Electric Bulb:** The filament is made of **Tungsten**. Why? Because it has a very high melting point (3380°C) and emits light when heated to a very high temperature without melting.
3. **Electric Fuse:** It is a safety device connected in series to protect appliances from too-high currents. It melts (due to $I^2Rt$ heating) and breaks the circuit if current exceeds the safe limit. Fuse wires are made of alloys of aluminium, copper, iron, or lead.

---

## 3. Electric Power

The rate at which electrical energy is consumed in an electric circuit is called **[JARGON: Electric Power | The rate at which electrical energy is dissipated or consumed in an electric circuit]**.
**Formulas:**
$$P = V I$$
$$P = I^2 R$$
$$P = \frac{V^2}{R}$$

The SI unit of power is the **Watt (W)**.
Commercial unit of electrical energy is **kilowatt-hour (kWh)**.
$$1\text{ kWh} = 3.6 \times 10^6\text{ J}$$

*Caution: Always remember to convert milliamperes (mA) to amperes (A) and kilowatts (kW) to watts (W) before calculating Power!*

### 📝 Solved Example 3 (NCERT)
**Question:** An electric refrigerator rated 400 W operates 8 hours/day. What is the cost of the energy to operate it for 30 days at Rs 3.00 per kWh?

**Given:**
- Power $P = 400\text{ W} = 0.4\text{ kW}$
- Time $t = 8\text{ h/day} \times 30\text{ days} = 240\text{ h}$
- Rate = Rs $3.00\text{ per kWh}$

**Formula used:**
$$\text{Energy } (E) = P \times t$$
$$\text{Cost} = E \times \text{Rate}$$

**Substitution:**
$$E = 0.4\text{ kW} \times 240\text{ h}$$
$$E = 96\text{ kWh}$$
$$\text{Cost} = 96 \times 3.00$$

**Final Answer:**
$$\text{Total Cost} = \text{Rs } 288$$

---

## 4. Final Revision: Formula Cheat Sheet & FAQs

### Formula Cheat Sheet
1. **Electric Current:** $I = \frac{Q}{t}$
2. **Potential Difference:** $V = \frac{W}{Q}$
3. **Ohm''s Law:** $V = I \times R$
4. **Resistance:** $R = \rho \frac{l}{A}$
5. **Series Resistance:** $R_s = R_1 + R_2 + R_3 + \dots$
6. **Parallel Resistance:** $\frac{1}{R_p} = \frac{1}{R_1} + \frac{1}{R_2} + \frac{1}{R_3} + \dots$
7. **Electric Power:** $P = V \times I = I^2 R = \frac{V^2}{R}$
8. **Joule''s Law of Heating:** $H = I^2 R t$

### Common Student Misconceptions (FAQs)
**Q: What is the difference between Resistance and Resistivity?**
A: *Resistance* is a property of the specific object (the wire itself), and it changes if you cut the wire in half or stretch it. *Resistivity* is a property of the *material* (e.g. copper vs. iron) and is totally independent of length or area!

**Q: Do electrons get used up in a circuit?**
A: No! The battery provides *energy* to push the electrons around. The number of electrons remains exactly the same. They just transfer the energy.

**Q: In series and parallel, what remains constant?**
A: In **series**, current ($I$) stays constant because there is only one path. In **parallel**, voltage ($V$) stays constant across each branch because they are connected between the same two nodes.

---

## 5. Subjective PYQ Worksheet (3-5 Markers)

1. **(3 Marks) [CBSE 2020]** Why are coils of electric toasters and electric irons made of an alloy rather than a pure metal? 
   *Answer Hint:* Alloys have higher resistivity than pure metals and they do not oxidize (burn) readily at high temperatures.
2. **(5 Marks) [CBSE 2018]** (a) State Ohm''s law. (b) Draw a schematic diagram of a circuit consisting of a battery of three cells of 2 V each, a 5 $\Omega$ resistor, an 8 $\Omega$ resistor, and a 12 $\Omega$ resistor, and a plug key, all connected in series.
   *Answer Hint:* State $V = IR$ at constant temperature. Total voltage = 6V, total resistance = 25 $\Omega$. Connect all components in a single unbroken loop with an ammeter in series and a voltmeter across the entire combination or specific resistor as required.
', FALSE, 5)
ON CONFLICT (id) DO UPDATE SET note_content = EXCLUDED.note_content, title = EXCLUDED.title, is_free = EXCLUDED.is_free;
