import re

with open('db/seed_notes_v2.sql', 'r') as f:
    content = f.read()

new_electricity_note = """'# Chapter 12: Electricity

## 1. 🎯 Chapter Goal
Master the principles of electricity, from the fundamental flow of charges to the practical applications of heating effects. Understand circuit diagrams, Ohm''s law, and calculate resistance in series and parallel combinations.

## 2. 🪝 Hook
We are surrounded by electricity! Every time you turn on your TV, charge your phone, or use a toaster, invisible electrons are rushing through wires at incredible speeds. But how do we control this invisible river of energy?

## 3. 📖 Concept 1: Electric Current and Circuit
An **[JARGON: Electric Current | The rate of flow of electric charge through a conductor | Current flowing through a copper wire]** is the continuous flow of electric charges.
- **Direction:** By convention, electric current flows from the positive terminal to the negative terminal of a battery. This is opposite to the direction of flow of electrons (negative charges).
- **Formula:** $$I = \\frac{Q}{t}$$
  - $I$ = Current in Amperes (A)
  - $Q$ = Net charge in Coulombs (C)
  - $t$ = Time in seconds (s)

We measure current using an **[JARGON: Ammeter | A device with low resistance used to measure electric current | An ammeter is always connected in series]**. It is always connected in **series** in a circuit so that all the current passes through it.

## 4. 📖 Concept 2: Electric Potential and Potential Difference
Water only flows in a pipe if there is a pressure difference. Similarly, electrons only move in a wire if there is an "electric pressure" difference, called **[JARGON: Potential Difference | The work done to move a unit charge from one point to another | A 1.5 Volt cell provides potential difference]**.
- **Formula:** $$V = \\frac{W}{Q}$$
  - $V$ = Potential Difference in Volts (V)
  - $W$ = Work done in Joules (J)
  - $Q$ = Charge in Coulombs (C)

We measure voltage using a **[JARGON: Voltmeter | A device with high resistance used to measure potential difference | A voltmeter is always connected in parallel]**. It is always connected in **parallel** across the points where the potential difference is to be measured.

## 5. 📖 Concept 3: Circuit Diagram Symbols
To study electricity, we draw circuit diagrams using standard symbols:
- **Electric Cell:** A long line (positive) and a shorter, thicker line (negative).
- **Battery:** A combination of cells connected in series.
- **Plug Key or Switch (Open / Closed):** Represents whether the circuit is broken or complete.
- **A Wire Joint / Wires crossing without joining:** Shows connections.
- **Electric Bulb:** A loop or standard bulb icon.
- **Resistor:** A zigzag line.
- **Variable Resistor (Rheostat):** A zigzag line with an arrow pointing through or down on it. Used to change the resistance in the circuit.

## 6. 📖 Concept 4: Ohm''s Law
Ohm''s Law is the most important law in electricity! It states that the potential difference ($V$) across the ends of a given metallic wire in an electric circuit is directly proportional to the current ($I$) flowing through it, provided its temperature remains the same.

- **Formula:** $$V = IR$$

[FIGURE: ohms_law_circuit]

Here, $R$ is a constant called **[JARGON: Resistance | The property of a conductor to resist the flow of charges through it | A wire has a resistance of 10 Ohms]**. Its SI unit is the **Ohm ($\\Omega$)**.

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
1. **Length ($l$):** Resistance is directly proportional to length. ($R \\propto l$)
2. **Area of Cross-section ($A$):** Resistance is inversely proportional to the area (thickness). ($R \\propto 1/A$)
3. **Nature of Material:** Different materials have different resistances.

Combining these:
$$R = \\rho \\frac{l}{A}$$
Here, $\\rho$ (rho) is the constant of proportionality called **[JARGON: Electrical Resistivity | A fundamental property of a material measuring how strongly it resists electric current | Silver has a very low resistivity]**.
- SI Unit of resistivity: Ohm-meter ($\\Omega\\cdot m$).
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
- By Ohm''s Law: $\\frac{V}{R_p} = \\frac{V}{R_1} + \\frac{V}{R_2} + \\frac{V}{R_3}$
- **Equivalent Resistance Formula:** $$\\frac{1}{R_p} = \\frac{1}{R_1} + \\frac{1}{R_2} + \\frac{1}{R_3}$$
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
  $$P = \\frac{V^2}{R}$$
- **SI Unit:** Watt (W). 1 Watt = 1 Volt × 1 Ampere.

**Commercial Unit of Energy:**
Since the Watt is very small, we use **kilowatt-hour (kWh)** for commercial purposes (like your electricity bill). 1 kWh is the energy consumed when 1000 Watts of power is used for 1 hour.
- **1 kWh = 1 Unit of electricity**
- **Value in Joules:** $$1\\text{ kWh} = 3.6 \\times 10^6\\text{ J}$$

## 11. ⚠️ Common Mistakes
- **Confusing Series/Parallel ammeters and voltmeters:** Remember, Ammeter is always in Series (A-S), Voltmeter is always in Parallel (V-P).
- **Adding parallel resistors incorrectly:** You must sum their reciprocals ($1/R_p = 1/R_1 + 1/R_2$), and then **invert the final answer** to get $R_p$. Many students forget the final inversion step!
- **Changing resistivity:** Resistivity ($\\rho$) does NOT change if you cut or stretch a wire. It only changes if you change the material or the temperature.

## 12. 🔄 One-Minute Revision
- Current ($I=Q/t$) is measured by an ammeter (in series). Voltage ($V=W/Q$) is measured by a voltmeter (in parallel).
- Ohm''s law: $V=IR$. The V-I graph is a straight line.
- Resistance $R = \\rho(l/A)$. Alloys have high resistivity and don''t burn easily.
- Series Resistance: $R_s = R_1 + R_2$. Current is constant.
- Parallel Resistance: $1/R_p = 1/R_1 + 1/R_2$. Voltage is constant. Home wiring uses parallel.
- Joule''s Heating: $H = I^2Rt$. Used in bulbs (Tungsten) and fuses.
- Electric Power: $P = VI = I^2R = V^2/R$. Commercial unit is kWh ($3.6 \\times 10^6$ Joules).

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
```', TRUE, 3)"""

# The existing note starts with "'# Chapter 12: Electricity" and ends with "', TRUE, 3)"
start_pattern = "'# Chapter 12: Electricity"
end_pattern = "', TRUE, 3)"
start_idx = content.find(start_pattern)

if start_idx != -1:
    end_idx = content.find(end_pattern, start_idx)
    if end_idx != -1:
        end_idx += len(end_pattern)
        new_content = content[:start_idx] + new_electricity_note + content[end_idx:]
        with open('db/seed_notes_v2.sql', 'w') as f:
            f.write(new_content)
        print("Patched successfully")
    else:
        print("End pattern not found")
else:
    print("Start pattern not found")
