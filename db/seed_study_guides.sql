DELETE FROM lessons WHERE type='study_guide' AND chapter_id = 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222';

INSERT INTO lessons (id, chapter_id, title, type, note_content, is_free, sequence_number) VALUES
('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380122', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', 'Chapter 11: Electricity (NCERT Simplified)', 'study_guide',
'# Chapter 11: Electricity (NCERT Simplified)

Welcome to the simplified, easy-to-grasp version of your NCERT Electricity chapter! We will follow the exact textbook structure, but explain everything simply and beautifully.

---

## 11.1 ELECTRIC CURRENT AND CIRCUIT

If a net charge $Q$ flows across any cross-section of a conductor in time $t$, then the **Electric Current ($I$)** is:
$$I = \frac{Q}{t}$$

The SI unit of electric charge is coulomb (C), which is equivalent to the charge contained in nearly $6 \times 10^{18}$ electrons. 
The electric current is expressed by a unit called [JARGON: ampere | Ampere (A) is named after the French scientist Andre-Marie Ampere. One ampere is constituted by the flow of one coulomb of charge per second.].

An **Electric Circuit** is a continuous and closed path of an electric current. If the circuit is broken anywhere (or the switch of the torch is turned off), the current stops flowing and the bulb does not glow.

[FIGURE: basic_circuit]

> **💡 TIPS & TRICKS**
> Remember: Current is measured by an **Ammeter**, which is always connected in **series** in a circuit!

**Example 11.1**
A current of 0.5 A is drawn by a filament of an electric bulb for 10 minutes. Find the amount of electric charge that flows through the circuit.

**Solution:**
We are given, $I = 0.5\text{ A}$; $t = 10\text{ min} = 600\text{ s}$.
From $I = Q/t$, we have $Q = It$
$$Q = 0.5\text{ A} \times 600\text{ s} = 300\text{ C}$$

**❓ QUESTIONS**
**1. What does an electric circuit mean?**
*Answer:* A continuous and closed path of an electric current.

**2. Define the unit of current.**
*Answer:* The unit of current is Ampere (A). 1 Ampere is the flow of 1 Coulomb of charge per second.

**3. Calculate the number of electrons constituting one coulomb of charge.**
*Answer:* 1 Coulomb contains $6.25 \times 10^{18}$ electrons. (Since $1\text{ e} = 1.6 \times 10^{-19}\text{ C}$, $1\text{ C} = 1 / (1.6 \times 10^{-19}) = 6.25 \times 10^{18}$).

---

## 11.2 ELECTRIC POTENTIAL AND POTENTIAL DIFFERENCE

What makes the electric charge to flow? Charges do not flow in a copper wire by themselves. For flow of charges in a conducting metallic wire, the electrons move only if there is a difference of electric pressure – called the **potential difference** along the conductor. This difference of potential may be produced by a battery.

We define the electric potential difference between two points in an electric circuit carrying some current as the work done to move a unit charge from one point to the other:
$$V = \frac{W}{Q}$$

The SI unit of electric potential difference is [JARGON: volt | Volt (V) is named after Alessandro Volta. 1 Volt = 1 Joule / 1 Coulomb.].

> **🧠 THINGS TO REMEMBER**
> Potential difference is measured by a **Voltmeter**. It is always connected in **parallel** across the points where potential difference is to be measured.

**Example 11.2**
How much work is done in moving a charge of 2 C across two points having a potential difference 12 V?

**Solution:**
The amount of charge $Q$, that flows between two points at potential difference $V = 12\text{ V}$ is $2\text{ C}$.
Thus, the amount of work $W$, done in moving the charge is:
$$W = VQ = 12\text{ V} \times 2\text{ C} = 24\text{ J}.$$

**❓ QUESTIONS**
**1. Name a device that helps to maintain a potential difference across a conductor.**
*Answer:* A battery or a cell.

**2. What is meant by saying that the potential difference between two points is 1 V?**
*Answer:* It means 1 Joule of work is done in moving 1 Coulomb of charge from one point to the other.

**3. How much energy is given to each coulomb of charge passing through a 6 V battery?**
*Answer:* 6 Joules (Since $W = V \times Q = 6 \text{ V} \times 1 \text{ C} = 6 \text{ J}$).

---

## 11.3 CIRCUIT DIAGRAM

To draw electric circuits conveniently, we use standard symbols for components.

[FIGURE: circuit_symbols]

---

## 11.4 OHM’S LAW

Is there a relationship between the potential difference across a conductor and the current through it? Yes! 
The German physicist Georg Simon Ohm found out that the potential difference, $V$, across the ends of a given metallic wire in an electric circuit is directly proportional to the current flowing through it, provided its temperature remains the same. This is called **Ohm’s law**.

$$V \propto I$$
$$V = I \times R$$

Here, $R$ is a constant for the given metallic wire at a given temperature and is called its **resistance**. It is the property of a conductor to resist the flow of charges through it. Its SI unit is [JARGON: ohm | Ohm ($\Omega$). If the potential difference across the two ends of a conductor is 1 V and the current through it is 1 A, then the resistance R is 1 $\Omega$.].

[FIGURE: ohms_law_circuit]

---

## 11.5 FACTORS ON WHICH THE RESISTANCE OF A CONDUCTOR DEPENDS

The resistance of a conductor depends:
1. On its length ($l$)
2. On its area of cross-section ($A$)
3. On the nature of its material

Mathematically:
$$R \propto \frac{l}{A}$$
$$R = \rho \frac{l}{A}$$

Where $\rho$ (rho) is a constant of proportionality and is called the **electrical resistivity** of the material of the conductor. The SI unit of resistivity is $\Omega$ m.

> **💡 TIPS & TRICKS**
> If you stretch a wire to double its length, its area becomes half, so its new resistance becomes 4 times the original!

**Example 11.3**
(a) How much current will an electric bulb draw from a 220 V source, if the resistance of the bulb filament is 1200 $\Omega$?
(b) How much current will an electric heater coil draw from a 220 V source, if the resistance of the heater coil is 100 $\Omega$?

**Solution:**
(a) We are given $V = 220\text{ V}$; $R = 1200\text{ }\Omega$.
From Eq. (11.6), we have the current $I = V/R = 220\text{ V}/1200\text{ }\Omega = 0.18\text{ A}$.
(b) We are given, $V = 220\text{ V}$, $R = 100\text{ }\Omega$.
From Eq. (11.6), we have the current $I = V/R = 220\text{ V}/100\text{ }\Omega = 2.2\text{ A}$.
*Note the difference of current drawn by an electric bulb and electric heater from the same 220 V source!*

**Example 11.4**
The potential difference between the terminals of an electric heater is 60 V when it draws a current of 4 A from the source. What current will the heater draw if the potential difference is increased to 120 V?

**Solution:**
We are given, potential difference $V = 60\text{ V}$, current $I = 4\text{ A}$.
According to Ohm’s law, $R = \frac{V}{I} = \frac{60\text{ V}}{4\text{ A}} = 15\text{ }\Omega$.
When the potential difference is increased to 120 V the current is given by:
$I = \frac{V}{R} = \frac{120\text{ V}}{15\text{ }\Omega} = 8\text{ A}$.
The current through the heater becomes 8 A.

**Example 11.5**
Resistance of a metal wire of length 1 m is 26 $\Omega$ at 20°C. If the diameter of the wire is 0.3 mm, what will be the resistivity of the metal at that temperature?

**Solution:**
We are given the resistance $R = 26\text{ }\Omega$, the diameter $d = 0.3\text{ mm} = 3 \times 10^{-4}\text{ m}$, and the length $l = 1\text{ m}$.
Therefore, from Eq. (11.10), the resistivity of the given metallic wire is $\rho = (R \times \pi d^2) / 4l$
Substitution of values gives $\rho = 1.84 \times 10^{-6}\text{ }\Omega\text{ m}$.

**Example 11.6**
A wire of given material having length $l$ and area of cross-section $A$ has a resistance of 4 $\Omega$. What would be the resistance of another wire of the same material having length $l/2$ and area of cross-section $2A$?

**Solution:**
For first wire: $R_1 = \rho \frac{l}{A} = 4\text{ }\Omega$
For second wire: $R_2 = \rho \frac{(l/2)}{2A} = \frac{1}{4} \rho \frac{l}{A}$
$R_2 = \frac{1}{4} R_1 = 1\text{ }\Omega$.
The resistance of the new wire is $1\text{ }\Omega$.

**❓ QUESTIONS**
**1. On what factors does the resistance of a conductor depend?**
*Answer:* Its length ($l$), area of cross-section ($A$), and the nature of its material.

**2. Will current flow more easily through a thick wire or a thin wire of the same material, when connected to the same source? Why?**
*Answer:* A thick wire. Because resistance is inversely proportional to the area of cross-section ($R \propto 1/A$). A thicker wire has more area, hence less resistance.

**3. Let the resistance of an electrical component remains constant while the potential difference across the two ends of the component decreases to half of its former value. What change will occur in the current through it?**
*Answer:* The current will also become half. (Because $I \propto V$ according to Ohm''s Law).

**4. Why are coils of electric toasters and electric irons made of an alloy rather than a pure metal?**
*Answer:* Alloys have higher resistivity than pure metals and do not melt or oxidize easily at high temperatures.

**5. Use the data in Table 11.2 to answer the following: (a) Which among iron and mercury is a better conductor? (b) Which material is the best conductor?**
*Answer:* (a) Iron is a better conductor (it has lower resistivity than mercury). (b) Silver is the best conductor (lowest resistivity).

---

## 11.6 RESISTANCE OF A SYSTEM OF RESISTORS

There are two methods of joining the resistors together: Series and Parallel.

### 11.6.1 Resistors in Series

When resistors are joined from end to end, they are said to be in series. 
In a series circuit, the current ($I$) is constant throughout the electric circuit. The total potential difference ($V$) is the sum of potential differences across individual resistors.

[FIGURE: series_circuit]

**Derivation:**
$$V = V_1 + V_2 + V_3$$
Using Ohm''s law ($V=IR$):
$$I R_s = I R_1 + I R_2 + I R_3$$
$$R_s = R_1 + R_2 + R_3$$

**Example 11.7**
An electric lamp, whose resistance is 20 $\Omega$, and a conductor of 4 $\Omega$ resistance are connected to a 6 V battery. Calculate (a) the total resistance of the circuit, (b) the current through the circuit, and (c) the potential difference across the electric lamp and conductor.

**Solution:**
(a) The resistance of electric lamp, $R_1 = 20\text{ }\Omega$. The resistance of the conductor connected in series, $R_2 = 4\text{ }\Omega$.
Total resistance, $R_s = R_1 + R_2 = 20\text{ }\Omega + 4\text{ }\Omega = 24\text{ }\Omega$.
(b) The total potential difference, $V = 6\text{ V}$.
By Ohm’s law, the current $I = V / R_s = 6\text{ V} / 24\text{ }\Omega = 0.25\text{ A}$.
(c) Potential difference across the electric lamp, $V_1 = I R_1 = 0.25\text{ A} \times 20\text{ }\Omega = 5\text{ V}$.
Potential difference across the conductor, $V_2 = I R_2 = 0.25\text{ A} \times 4\text{ }\Omega = 1\text{ V}$.

### 11.6.2 Resistors in Parallel

When resistors are connected together between the same two points, they are said to be in parallel.
In a parallel circuit, the potential difference ($V$) is constant across each resistor. The total current ($I$) is the sum of separate currents.

[FIGURE: parallel_circuit]

**Derivation:**
$$I = I_1 + I_2 + I_3$$
Using Ohm''s law ($I = V/R$):
$$\frac{V}{R_p} = \frac{V}{R_1} + \frac{V}{R_2} + \frac{V}{R_3}$$
$$\frac{1}{R_p} = \frac{1}{R_1} + \frac{1}{R_2} + \frac{1}{R_3}$$

**Example 11.8**
In the circuit diagram given in Fig. 11.3, suppose the resistors $R_1$, $R_2$ and $R_3$ have the values 5 $\Omega$, 10 $\Omega$, 30 $\Omega$, which have been connected to a battery of 12 V. Calculate (a) the current through each resistor, (b) the total current in the circuit, and (c) the total circuit resistance.

**Solution:**
$R_1 = 5\text{ }\Omega$, $R_2 = 10\text{ }\Omega$, $R_3 = 30\text{ }\Omega$, and $V = 12\text{ V}$.
(a) Current $I_1$ through $R_1 = V / R_1 = 12\text{ V} / 5\text{ }\Omega = 2.4\text{ A}$.
Current $I_2$ through $R_2 = V / R_2 = 12\text{ V} / 10\text{ }\Omega = 1.2\text{ A}$.
Current $I_3$ through $R_3 = V / R_3 = 12\text{ V} / 30\text{ }\Omega = 0.4\text{ A}$.
(b) Total current $I = I_1 + I_2 + I_3 = 2.4 + 1.2 + 0.4 = 4\text{ A}$.
(c) Total resistance $R_p$: $\frac{1}{R_p} = \frac{1}{5} + \frac{1}{10} + \frac{1}{30} = \frac{10}{30}$.
Thus, $R_p = 3\text{ }\Omega$.

**Example 11.9**
If in Fig. 11.4, $R_1 = 10\text{ }\Omega$, $R_2 = 40\text{ }\Omega$, $R_3 = 30\text{ }\Omega$, $R_4 = 20\text{ }\Omega$, $R_5 = 60\text{ }\Omega$, and a 12 V battery is connected to the arrangement. Calculate (a) the total resistance in the circuit, and (b) the total current flowing in the circuit.

**Solution:**
Suppose we replace the parallel resistors $R_1$ and $R_2$ by an equivalent resistor of resistance, $R_{p1}$. Similarly we replace the parallel resistors $R_3, R_4$ and $R_5$ by an equivalent resistor of resistance $R_{p2}$. 
Then $\frac{1}{R_{p1}} = \frac{1}{10} + \frac{1}{40} = \frac{5}{40}$; i.e., $R_{p1} = 8\text{ }\Omega$.
Similarly, $\frac{1}{R_{p2}} = \frac{1}{30} + \frac{1}{20} + \frac{1}{60} = \frac{6}{60}$; i.e., $R_{p2} = 10\text{ }\Omega$.
(a) Total resistance, $R = R_{p1} + R_{p2} = 8\text{ }\Omega + 10\text{ }\Omega = 18\text{ }\Omega$.
(b) Total current, $I = V/R = 12\text{ V} / 18\text{ }\Omega = 0.67\text{ A}$.

**❓ QUESTIONS**
**1. Draw a schematic diagram of a circuit consisting of a battery of three cells of 2 V each, a 5 $\Omega$ resistor, an 8 $\Omega$ resistor, and a 12 $\Omega$ resistor, and a plug key, all connected in series.**
*Answer:* A battery of 6V connected in series with a key and three resistors (5 $\Omega$, 8 $\Omega$, 12 $\Omega$) placed end-to-end.

**2. Redraw the circuit of Question 1, putting in an ammeter to measure the current through the resistors and a voltmeter to measure the potential difference across the 12 $\Omega$ resistor. What would be the readings in the ammeter and the voltmeter?**
*Answer:* 
- Total Resistance $R = 5+8+12 = 25\text{ }\Omega$.
- Current $I = V/R = 6/25 = 0.24\text{ A}$ (Ammeter reading).
- Voltage across 12 $\Omega$: $V = IR = 0.24 \times 12 = 2.88\text{ V}$ (Voltmeter reading).

**3. Judge the equivalent resistance when the following are connected in parallel – (a) $1\text{ }\Omega$ and $10^6\text{ }\Omega$, (b) $1\text{ }\Omega$ and $10^3\text{ }\Omega$, and $10^6\text{ }\Omega$.**
*Answer:* In parallel, the equivalent resistance is slightly less than the smallest resistor. So for both (a) and (b), it is approximately $1\text{ }\Omega$.

**4. An electric lamp of 100 $\Omega$, a toaster of resistance 50 $\Omega$, and a water filter of resistance 500 $\Omega$ are connected in parallel to a 220 V source. What is the resistance of an electric iron connected to the same source that takes as much current as all three appliances, and what is the current through it?**
*Answer:*
- Equivalent resistance $R_p$: $1/R_p = 1/100 + 1/50 + 1/500 = 16/500$. So $R_p = 500/16 = 31.25\text{ }\Omega$ (Resistance of the iron).
- Current $I = V/R_p = 220 / 31.25 = 7.04\text{ A}$.

**5. What are the advantages of connecting electrical devices in parallel with the battery instead of connecting them in series?**
*Answer:* In parallel: (1) If one device fails, the others keep working. (2) Each device gets the full voltage. (3) The overall resistance of the circuit is reduced.

---

## 11.7 HEATING EFFECT OF ELECTRIC CURRENT

When current flows through a purely resistive circuit, the source energy continually gets dissipated entirely in the form of heat. This is known as the heating effect of electric current.

The heat ($H$) produced in a resistor of resistance $R$ carrying a current $I$ for time $t$ is:
$$H = I^2 R t$$
This is known as **Joule’s law of heating**.

**Example 11.10**
An electric iron consumes energy at a rate of 840 W when heating is at the maximum rate and 360 W when the heating is at the minimum. The voltage is 220 V. What are the current and the resistance in each case?

**Solution:**
From Eq. (11.19), we know that the power input is $P = V I$. Thus the current $I = P/V$.
(a) When heating is at the maximum rate, $I = 840\text{ W} / 220\text{ V} = 3.82\text{ A}$; and the resistance of the electric iron is $R = V/I = 220\text{ V} / 3.82\text{ A} = 57.60\text{ }\Omega$.
(b) When heating is at the minimum rate, $I = 360\text{ W} / 220\text{ V} = 1.64\text{ A}$; and the resistance of the electric iron is $R = V/I = 220\text{ V} / 1.64\text{ A} = 134.15\text{ }\Omega$.

**Example 11.11**
100 J of heat is produced each second in a 4 $\Omega$ resistance. Find the potential difference across the resistor.

**Solution:**
$H = 100\text{ J}$, $R = 4\text{ }\Omega$, $t = 1\text{ s}$, $V = ?$
From Eq. (11.21) we have the current through the resistor as $I = \sqrt{H / (Rt)} = \sqrt{100\text{ J} / (4\text{ }\Omega \times 1\text{ s})} = 5\text{ A}$.
Thus the potential difference across the resistor, $V$ (from Ohm’s law) is $V = IR = 5\text{ A} \times 4\text{ }\Omega = 20\text{ V}$.

### 11.7.1 Practical Applications of Heating Effect of Electric Current
1. **Electric Laundry Iron & Toaster:** Use the heating effect directly to operate.
2. **Electric Bulb:** The filament must retain as much heat as possible so that it gets very hot and emits light. Usually made of tungsten (melting point $3380^\circ C$).
3. **Electric Fuse:** Protects circuits by stopping the flow of any unduly high electric current. If a current larger than the specified value flows, the fuse wire melts and breaks the circuit.

**❓ QUESTIONS**
**1. Why does the cord of an electric heater not glow while the heating element does?**
*Answer:* The cord is made of copper (low resistance), so it produces very little heat. The heating element is an alloy (high resistance), so it produces intense heat and glows.

**2. Compute the heat generated while transferring 96000 coulomb of charge in one hour through a potential difference of 50 V.**
*Answer:* Heat $H = V \times Q = 50\text{ V} \times 96000\text{ C} = 4,800,000\text{ J}$ or $4.8 \times 10^6\text{ J}$.

**3. An electric iron of resistance 20 $\Omega$ takes a current of 5 A. Calculate the heat developed in 30 s.**
*Answer:* Heat $H = I^2Rt = (5)^2 \times 20 \times 30 = 25 \times 20 \times 30 = 15,000\text{ J}$ or $15\text{ kJ}$.

---

## 11.8 ELECTRIC POWER

The rate at which electric energy is dissipated or consumed in an electric circuit is called electric power.
$$P = V I$$
$$P = I^2 R = \frac{V^2}{R}$$

The SI unit of electric power is watt (W). 
The commercial unit of electric energy is kilowatt hour (kWh), commonly known as a "unit".
$$1 \text{ kWh} = 3.6 \times 10^6 \text{ Joules}$$

**Example 11.12**
An electric bulb is connected to a 220 V generator. The current is 0.50 A. What is the power of the bulb?

**Solution:**
$P = VI = 220\text{ V} \times 0.50\text{ A} = 110\text{ W}$.

**Example 11.13**
An electric refrigerator rated 400 W operates 8 hour/day. What is the cost of the energy to operate it for 30 days at Rs 3.00 per kW h?

**Solution:**
The total energy consumed by the refrigerator in 30 days would be $400\text{ W} \times 8.0\text{ hour/day} \times 30\text{ days} = 96000\text{ W h} = 96\text{ kW h}$.
Thus the cost of energy to operate the refrigerator for 30 days is $96\text{ kW h} \times \text{Rs } 3.00\text{ per kW h} = \text{Rs } 288.00$.

**❓ QUESTIONS**
**1. What determines the rate at which energy is delivered by a current?**
*Answer:* Electric Power ($P = VI$).

**2. An electric motor takes 5 A from a 220 V line. Determine the power of the motor and the energy consumed in 2 h.**
*Answer:*
- Power $P = VI = 220 \times 5 = 1100\text{ W}$.
- Energy $E = P \times t = 1100\text{ W} \times 2\text{ h} = 2200\text{ Wh} = 2.2\text{ kWh}$.

---

## 🎭 COMIC STYLE RECAP: A CHAT IN THE CIRCUIT

👦 **Student:** Phew, that was a lot of formulas!
🔋 **Battery:** Don''t sweat it! Just remember, I''m the boss. I provide the **Potential Difference (Voltage)**. Without me, nobody moves!
⚡ **Electron:** Yep! When the boss pushes us, we form the **Electric Current ($I$)**. We march from negative to positive!
🛑 **Resistor:** Hey, slow down! I''m the **Resistance ($R$)**. My job is to make your path harder and slow you guys down!
👮‍♂️ **Officer Ohm:** And my law ($V = I \times R$) keeps you all in check. If you push harder (more Voltage), they move faster (more Current) unless the Resistance steps up!
🔥 **Heater:** Oh, and when they bump into Resistance a lot? They get mad and generate **Heat ($H = I^2Rt$)**. We use that to iron your clothes!

', TRUE, 4);

DELETE FROM lessons WHERE type='study_guide' AND chapter_id = 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380221';

INSERT INTO lessons (id, chapter_id, title, type, note_content, is_free, sequence_number) VALUES
('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380221', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380221', 'Chapter 1: Chemical Reactions (NCERT Simplified)', 'study_guide',
'# Chapter 1: Chemical Reactions and Equations (NCERT Simplified)

Welcome to the simplified, easy-to-grasp version of your NCERT Chemical Reactions and Equations chapter! We will follow the exact textbook structure, but explain everything simply and beautifully.

Let''s consider a few situations of daily life and think about what happens:
* **Milk is left at room temperature during summers:** It gets sour/spoiled due to lactic acid fermentation.
* **An iron tawa/pan/nail is left exposed to humid atmosphere:** It gets rusted (a reddish-brown coating forms).
* **Grapes get fermented:** Yeast converts sugars into alcohol.
* **Food is cooked:** The chemical structure of raw food materials changes.
* **Food gets digested in our body:** Complex food particles break down into simpler substances.
* **We respire:** Oxygen reacts with glucose inside our cells to release carbon dioxide and energy.

In all the above situations, the nature and identity of the initial substance have changed. We call these **chemical changes**, and whenever a chemical change occurs, we say that a **chemical reaction** has taken place!

### How do we determine if a chemical reaction has occurred?
The NCERT textbook outlines three introductory activities to help us find out:

* **Activity 1.1 (Burning of Magnesium Ribbon):** 
  * Clean a 3-4 cm magnesium ribbon with sandpaper (to remove the protective layer of basic magnesium carbonate). Hold it with tongs and burn it.
  * **Observation:** The magnesium ribbon burns with a dazzling white flame and changes into a white powder, which is magnesium oxide ($MgO$).
  [FIGURE: magnesium_burner]

* **Activity 1.2 (Lead Nitrate + Potassium Iodide):**
  * Mix lead nitrate solution and potassium iodide solution in a test tube.
  * **Observation:** A yellow precipitate of lead iodide ($PbI_2$) is immediately formed.

* **Activity 1.3 (Zinc Granules + Acid):**
  * Add dilute hydrochloric acid or sulphuric acid to zinc granules in a flask.
  * **Observation:** Gas bubbles (Hydrogen, $H_2$) form around the zinc granules, and the temperature of the flask increases (it feels warm/exothermic).

Based on these activities, any of the following **four observations** helps us determine that a chemical reaction has taken place:
1. **Change in state**
2. **Change in colour**
3. **Evolution of a gas**
4. **Change in temperature**

---

## 1.1 CHEMICAL EQUATIONS

A chemical reaction can be written in a sentence form, but that is quite long. The simplest way to write it is in the form of a **word-equation**:

$$\text{Magnesium} + \text{Oxygen} \rightarrow \text{Magnesium oxide}$$
$$\text{(Reactants)} \rightarrow \text{(Product)}$$

* **Reactants:** The substances that undergo chemical change ($Magnesium$ and $Oxygen$). They are written on the Left-Hand Side (LHS) with a plus sign ($+$) between them.
* **Products:** The new substances formed ($Magnesium\ oxide$). They are written on the Right-Hand Side (RHS) with a plus sign ($+$) between them.
* **Arrowhead:** Points towards the products, showing the direction of the reaction.

### 1.1.1 Writing a Chemical Equation

To make chemical equations even more concise, we use chemical formulae instead of words:

$$Mg + O_2 \rightarrow MgO$$

This is a **skeletal chemical equation** because the number of atoms of each element is not the same on both sides of the arrow (it is unbalanced).

### 1.1.2 Balanced Chemical Equations

According to the [JARGON: Law of Conservation of Mass | Mass can neither be created nor destroyed in a chemical reaction.], the total mass of the elements present in the products must equal the total mass of the elements present in the reactants. In other words, the number of atoms of each element must remain the same before and after the reaction.

---

### 🎯 The Core Goal of Balancing
Our target is simple: **Make LHS (Reactant Side) atoms equal RHS (Product Side) atoms** for every element in the reaction.

**Case Study: An already Balanced Equation:**
$$Zn + H_2SO_4 \rightarrow ZnSO_4 + H_2$$

Let''s check the atom counts:
↳ **LHS (Reactants):** Zinc ($Zn$) = 1, Hydrogen ($H$) = 2, Sulfur ($S$) = 1, Oxygen ($O$) = 4
↳ **RHS (Products):** Zinc ($Zn$) = 1, Hydrogen ($H$) = 2, Sulfur ($S$) = 1, Oxygen ($O$) = 4
↳ *Status: Since LHS equals RHS for all elements, the equation is balanced.*

---

### 🛠️ Step-by-Step Balancing (Hit-and-Trial Method)
Let''s balance this unbalanced (**skeletal**) equation:
$$Fe + H_2O \rightarrow Fe_3O_4 + H_2$$

* **Step I: Count the Atoms (Identify the imbalance)**
  ↳ **LHS (Reactant Side):** Iron ($Fe$) = 1, Hydrogen ($H$) = 2, Oxygen ($O$) = 1
  ↳ **RHS (Product Side):** Iron ($Fe$) = 3, Hydrogen ($H$) = 2, Oxygen ($O$) = 4
  ↳ **Goal:** Increase $Fe$ and $O$ on the LHS to match the RHS, while keeping $H$ balanced.

* **Step II: Balance Oxygen ($O$)**
  ↳ **Action:** Multiply $H_2O$ on the LHS by **4** (putting coefficient `4` *in front* of the formula: $4H_2O$).
  ↳ **Rule:** Never change the subscripts (do not write $H_2O_4$).
  ↳ **Equation so far:** $$Fe + 4H_2O \rightarrow Fe_3O_4 + H_2$$
  ↳ **New Counts:** LHS has $Fe$ = 1, $H$ = 8, $O$ = 4 | RHS has $Fe$ = 3, $H$ = 2, $O$ = 4.

* **Step III: Balance Hydrogen ($H$)**
  ↳ **Action:** Multiply $H_2$ on the RHS by **4** ($4 \times 2 = 8$).
  ↳ **Equation so far:** $$Fe + 4H_2O \rightarrow Fe_3O_4 + 4H_2$$
  ↳ **New Counts:** LHS has $Fe$ = 1, $H$ = 8, $O$ = 4 | RHS has $Fe$ = 3, $H$ = 8, $O$ = 4.

* **Step IV: Balance Iron ($Fe$)**
  ↳ **Action:** Multiply $Fe$ on the LHS by **3**.
  ↳ **Equation so far:** $$3Fe + 4H_2O \rightarrow Fe_3O_4 + 4H_2$$
  ↳ **New Counts:** LHS has $Fe$ = 3, $H$ = 8, $O$ = 4 | RHS has $Fe$ = 3, $H$ = 8, $O$ = 4.
  ↳ *Status: All elements are now perfectly balanced!*

* **Step V: Write the Physical States (Final Touch)**
  ↳ **Action:** Add state symbols to make the equation fully informative: solid ($s$), liquid ($l$), aqueous solution ($aq$), and gaseous ($g$).
  ↳ **Final Balanced Equation:**
    $$\mathbf{3Fe(s) + 4H_2O(g) \rightarrow Fe_3O_4(s) + 4H_2(g)}$$
  ↳ *(Note: The symbol (g) with $H_2O$ indicates that water is used in the form of steam).*

Sometimes, **reaction conditions** like temperature, pressure, or catalyst are written above and/or below the arrow:
* **Methanol formation:**
  $$CO(g) + 2H_2(g) \xrightarrow{340\text{ atm}} CH_3OH(l)$$
* **Photosynthesis:**
  $$6CO_2(aq) + 12H_2O(l) \xrightarrow{\text{Sunlight, Chlorophyll}} C_6H_{12}O_6(aq) + 6O_2(aq) + 6H_2O(l)$$

> **❓ IN-TEXT QUESTIONS**
> **1. Why should a magnesium ribbon be cleaned before burning in air?**
> *Answer:* To remove the protective layer of basic magnesium carbonate that forms on its surface, allowing it to burn readily in oxygen.
> 
> **2. Write the balanced equation for:**
> * (i) Hydrogen + Chlorine $\rightarrow$ Hydrogen chloride
>   *Answer:* $H_2 + Cl_2 \rightarrow 2HCl$
> * (ii) Barium chloride + Aluminium sulphate $\rightarrow$ Barium sulphate + Aluminium chloride
>   *Answer:* $3BaCl_2 + Al_2(SO_4)_3 \rightarrow 3BaSO_4 + 2AlCl_3$
> * (iii) Sodium + Water $\rightarrow$ Sodium hydroxide + Hydrogen
>   *Answer:* $2Na + 2H_2O \rightarrow 2NaOH + H_2$
> 
> **3. Write a balanced chemical equation with state symbols for:**
> * (i) Solutions of barium chloride and sodium sulphate in water react to give insoluble barium sulphate and the solution of sodium chloride.
>   *Answer:* $BaCl_2(aq) + Na_2SO_4(aq) \rightarrow BaSO_4(s) + 2NaCl(aq)$
> * (ii) Sodium hydroxide solution (in water) reacts with hydrochloric acid solution (in water) to produce sodium chloride solution and water.
>   *Answer:* $NaOH(aq) + HCl(aq) \rightarrow NaCl(aq) + H_2O(l)$

---

## 1.2 TYPES OF CHEMICAL REACTIONS

Chemical reactions involve the breaking and making of bonds between atoms to produce new substances.

### 1.2.1 Combination Reaction

A reaction in which a single product is formed from two or more reactants is known as a **combination reaction**.

* **Activity 1.4 (Quicklime + Water):** 
  * Add water slowly to a small amount of calcium oxide (quicklime) in a beaker. Touch the beaker.
  * **Observation:** The reaction is highly vigorous, produces slaked lime, and the beaker becomes very hot.
  * **Chemical Equation:**
    $$CaO(s) + H_2O(l) \rightarrow Ca(OH)_2(aq) + \text{Heat}$$

  [FIGURE: combination_reaction]

> **💡 DO YOU KNOW? (Whitewashing Walls)**
> Slaked lime ($Ca(OH)_2$) is used for whitewashing walls. It reacts slowly with carbon dioxide in the air over 2-3 days to form a thin, shiny layer of calcium carbonate ($CaCO_3$, marble):
> $$Ca(OH)_2(aq) + CO_2(g) \rightarrow CaCO_3(s) + H_2O(l)$$

#### More Examples of Combination Reactions:
* **Burning of coal:**
  $$C(s) + O_2(g) \rightarrow CO_2(g)$$
* **Formation of water:**
  $$2H_2(g) + O_2(g) \rightarrow 2H_2O(l)$$

#### Exothermic Chemical Reactions
Reactions in which heat/energy is released along with the formation of products are called **exothermic chemical reactions**.
* **Burning of natural gas:**
  $$CH_4(g) + 2O_2(g) \rightarrow CO_2(g) + 2H_2O(g)$$
* **Respiration:** Respiration is an exothermic process because the glucose from digested carbohydrates reacts with oxygen in our cells to supply energy:
  $$C_6H_{12}O_6(aq) + 6O_2(aq) \rightarrow 6CO_2(aq) + 6H_2O(l) + \text{Energy}$$
* **Decomposition of vegetable matter** into compost is also exothermic.

---

### 1.2.2 Decomposition Reaction

In a decomposition reaction, a single reactant breaks down to give two or more simpler products (opposite of combination reactions).

#### A. Thermal Decomposition (Using Heat)

1. **Activity 1.5 (Decomposition of Ferrous Sulphate):**
   * Heat green ferrous sulphate crystals ($FeSO_4 \cdot 7H_2O$) in a dry boiling tube.
   * **Observation:** The green crystals lose water of crystallisation and decompose into solid brown ferric oxide ($Fe_2O_3$) and choking gases $SO_2$ (sulphur dioxide) and $SO_3$ (sulphur trioxide).
   * **Chemical Equation:**
     $$2FeSO_4(s) \xrightarrow{\text{Heat}} Fe_2O_3(s) + SO_2(g) + SO_3(g)$$
   [FIGURE: ferrous_sulphate_decomposition]

2. **Activity 1.6 (Decomposition of Lead Nitrate):**
   * Heat lead nitrate powder in a boiling tube.
   * **Observation:** Brown fumes of nitrogen dioxide ($NO_2$) gas are emitted, leaving behind a yellow residue of lead oxide ($PbO$).
   * **Chemical Equation:**
     $$2Pb(NO_3)_2(s) \xrightarrow{\text{Heat}} 2PbO(s) + 4NO_2(g) + O_2(g)$$
   [FIGURE: lead_nitrate_decomposition]

3. **Heating of Limestone (Industrial Application):**
   * Calcium carbonate decomposes into quicklime (calcium oxide, used in cement manufacture) and carbon dioxide.
   * **Chemical Equation:**
     $$CaCO_3(s) \xrightarrow{\text{Heat}} CaO(s) + CO_2(g)$$
   [FIGURE: decomposition_reaction]

#### B. Electrolytic Decomposition (Using Electricity)

4. **Activity 1.7 (Electrolysis of Water):**
   * Pass an electric current through acidified water using carbon electrodes.
   * **Observation:** Gas bubbles form at both electrodes. The volume of gas collected at the cathode (Hydrogen, $H_2$) is **double** that collected at the anode (Oxygen, $O_2$).
   * **Chemical Equation:**
     $$2H_2O(l) \xrightarrow{\text{Electricity}} 2H_2(g) + O_2(g)$$
   [FIGURE: electrolysis_of_water]

#### C. Photolytic Decomposition / Photolysis (Using Light)

5. **Activity 1.8 (Silver Chloride / Bromide in Sunlight):**
   * Place white silver chloride ($AgCl$) in a china dish in sunlight.
   * **Observation:** The white powder turns grey due to decomposition into silver metal and chlorine gas.
   * **Chemical Equations:**
     $$2AgCl(s) \xrightarrow{\text{Sunlight}} 2Ag(s) + Cl_2(g)$$
     $$2AgBr(s) \xrightarrow{\text{Sunlight}} 2Ag(s) + Br_2(g)$$
     *(These reactions are used in black and white photography).*
   [FIGURE: silver_chloride_sunlight]

#### Endothermic Reactions
Reactions in which energy is absorbed (as heat, light, or electricity) to break chemical bonds are called [JARGON: Endothermic reactions | Reactions that absorb energy from their surroundings, making the reaction mixture cold unless heat is continuously supplied.].
* **Example (Barium Hydroxide + Ammonium Chloride):** Mixing barium hydroxide and ammonium chloride in a test tube makes the bottom of the tube very cold (absorbs heat, endothermic).

> **❓ IN-TEXT QUESTIONS**
> **1. A solution of a substance ‘X’ is used for whitewashing.**
> * (i) Name the substance ‘X’ and write its formula.
>   *Answer:* Substance ''X'' is Calcium oxide (quicklime). Its formula is $CaO$.
> * (ii) Write the reaction of the substance ‘X’ with water.
>   *Answer:* $CaO(s) + H_2O(l) \rightarrow Ca(OH)_2(aq) + \text{Heat}$
> 
> **2. Why is the amount of gas collected in one of the test tubes in Activity 1.7 double of the amount collected in the other? Name this gas.**
> *Answer:* Water ($H_2O$) consists of two atoms of Hydrogen and one atom of Oxygen (2:1 ratio). During electrolysis, water decomposes to release 2 volumes of Hydrogen gas at the cathode for every 1 volume of Oxygen gas at the anode. The double-volume gas is Hydrogen.

---

### 1.2.3 Displacement Reaction

A chemical reaction in which a more reactive element displaces a less reactive element from its salt solution is a **displacement reaction**.

* **Activity 1.9 (Iron Nails in Copper Sulphate):**
   * Immerse two clean iron nails in 10 mL copper sulphate solution for 20 minutes.
   * **Observation:** The shiny grey iron nails become coated with a brownish layer of copper metal, and the blue colour of the copper sulphate solution fades to a light green (due to the formation of iron sulphate).
   * **Chemical Equation:**
     $$Fe(s) + CuSO_4(aq) \rightarrow FeSO_4(aq) + Cu(s)$$
     *(Iron is more reactive than copper and displaces it).*
   [FIGURE: displacement_reaction]

#### More Examples:
* **Zinc displacing copper:**
  $$Zn(s) + CuSO_4(aq) \rightarrow ZnSO_4(aq) + Cu(s)$$
* **Lead displacing copper:**
  $$Pb(s) + CuCl_2(aq) \rightarrow PbCl_2(aq) + Cu(s)$$
  *(Zinc and lead are more reactive than copper and displace it).*

---

### 1.2.4 Double Displacement Reaction

Reactions in which there is an exchange of ions between the reactants to form new compounds are called **double displacement reactions**.

* **Activity 1.10 (Sodium Sulphate + Barium Chloride):**
  * Mix 3 mL of sodium sulphate solution with 3 mL of barium chloride solution.
  * **Observation:** A white insoluble substance forms immediately. Any insoluble solid that falls out of a liquid solution is called a [JARGON: Precipitate | An insoluble solid substance that forms and separates from a liquid solution during a chemical reaction.]. A reaction that produces a precipitate is a **precipitation reaction**.
  * **Chemical Equation:**
    $$Na_2SO_4(aq) + BaCl_2(aq) \rightarrow BaSO_4(s) + 2NaCl(aq)$$
    *(The white precipitate is formed by the reaction of $Ba^{2+}$ and $SO_4^{2-}$ ions).*

#### Recall Activity 1.2 (Lead Nitrate + Potassium Iodide)
When mixing lead nitrate and potassium iodide, we get a yellow precipitate of lead iodide:
$$Pb(NO_3)_2(aq) + 2KI(aq) \rightarrow PbI_2(s) + 2KNO_3(aq)$$
*(This is also a double displacement and a precipitation reaction).*

---

### 1.2.5 Oxidation and Reduction

* **Oxidation:** The gain of oxygen or the loss of hydrogen.
* **Reduction:** The loss of oxygen or the gain of hydrogen.
* **Redox Reaction (Oxidation-Reduction):** A reaction where one reactant gets oxidised while another gets reduced.

* **Activity 1.11 (Heating Copper Powder):**
  * Heat 1 g of brown copper powder in a china dish.
  * **Observation:** The surface of the copper powder becomes coated with black copper(II) oxide ($CuO$).
  * **Chemical Equation:**
    $$2Cu + O_2 \xrightarrow{\text{Heat}} 2CuO$$
  
  If hydrogen gas is passed over this hot black $CuO$, it turns brown again (reverse reaction):
  $$CuO + H_2 \xrightarrow{\text{Heat}} Cu + H_2O$$
  *(Here, $CuO$ loses oxygen and is reduced to $Cu$. $H_2$ gains oxygen and is oxidised to $H_2O$).*

#### More Examples of Redox Reactions:
* **Reduction of Zinc Oxide:**
  $$ZnO + C \rightarrow Zn + CO$$
  *(Carbon is oxidised to $CO$, and $ZnO$ is reduced to $Zn$).*
* **Reduction of Manganese Dioxide:**
  $$MnO_2 + 4HCl \rightarrow MnCl_2 + 2H_2O + Cl_2$$
  *(HCl is oxidised to $Cl_2$, and $MnO_2$ is reduced to $MnCl_2$).*

#### Recall Activity 1.1 (Magnesium ribbon burning):
$$2Mg + O_2 \rightarrow 2MgO$$
*(Magnesium gains oxygen, so it is oxidised).*

---

## 1.3 EFFECTS OF OXIDATION REACTIONS IN EVERYDAY LIFE

### 1.3.1 Corrosion

When a metal is attacked by substances around it such as moisture, air, acids, etc., it is said to corrode, and the process is called **corrosion**.
* **Examples:**
  * Reddish-brown coating on iron (rusting).
  * Black coating on silver.
  * Green coating on copper.
* **Impact:** Corrosion causes massive damage to car bodies, bridges, iron railings, ships, and other metal objects (especially iron). It is a serious economic problem, requiring huge expenditures yearly for replacement.

### 1.3.2 Rancidity

When fats and oils are oxidised, they become rancid. Their smell and taste change, making food unpleasant to eat.
* **Prevention:**
  * Add [JARGON: Antioxidants | Chemical substances added to fatty/oily foods to prevent oxidation and spoilage.] (like BHA, BHT).
  * Keep food in airtight containers to slow down oxidation.
  * Flush food packaging (like potato chips bags) with an inert gas like **nitrogen** to prevent oxygen exposure.

> **❓ IN-TEXT QUESTIONS**
> **1. Why does the colour of copper sulphate solution change when an iron nail is dipped in it?**
> *Answer:* Iron is more reactive than copper. It displaces copper from the blue copper sulphate ($CuSO_4$) solution to form light green iron sulphate ($FeSO_4$) and deposits metallic copper on the iron nail.
> 
> **2. Give an example of a double displacement reaction other than the one given in Activity 1.10.**
> *Answer:* Reaction between lead nitrate and potassium iodide:
> $Pb(NO_3)_2(aq) + 2KI(aq) \rightarrow PbI_2(s) + 2KNO_3(aq)$
> 
> **3. Identify the substances that are oxidised and the substances that are reduced in the following reactions:**
> * (i) $4Na(s) + O_2(g) \rightarrow 2Na_2O(s)$
>   *Answer:* Sodium ($Na$) gains oxygen, so it is oxidised. Oxygen ($O_2$) is reduced.
> * (ii) $CuO(s) + H_2(g) \rightarrow Cu(s) + H_2O(l)$
>   *Answer:* Hydrogen ($H_2$) gains oxygen, so it is oxidised to $H_2O$. Copper oxide ($CuO$) loses oxygen, so it is reduced to $Cu$.

---

## 🎭 COMIC STYLE RECAP: A CHAT IN THE BEAKER

👦 **Rahul:** I still don''t get it. Why do equations need to be balanced?
👩‍🔬 **Scientist Priya:** Because you can''t create or destroy atoms, Rahul! If you put 5 Lego blocks in, you must get exactly 5 Lego blocks out!
🔥 **Oxygen Atom:** That''s right! And when I jump onto a molecule, we call it **Oxidation**!
💧 **Hydrogen Atom:** And when Oxygen leaves, it''s **Reduction**. We like to do it together, creating a **Redox Reaction**!
👦 **Rahul:** What if two molecules just swap parts like dancers changing partners?
👩‍🔬 **Scientist Priya:** That''s exactly what a **Double Displacement Reaction** is! You''re getting the hang of this!

', TRUE, 10);
