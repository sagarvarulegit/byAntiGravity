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
