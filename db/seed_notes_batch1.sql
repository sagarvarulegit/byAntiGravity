-- CBSE Class 10 Learning Portal Revision Notes - Batch 1
-- Generated on 2026-06-23
-- Format: Clean SQL with ON CONFLICT (id) DO NOTHING for safe re-runs.

INSERT INTO lessons (id, chapter_id, title, type, video_hls_url, video_duration_seconds, note_content, is_free, sequence_number) VALUES
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380122', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222', 'Revision Notes: Electricity', 'note', NULL, NULL,
'# Chapter 12: Electricity

## Chapter Goal
The goal of this chapter is to understand how electric current flows in a circuit, how potential difference drives this flow, what factors control or resist it (Ohm''s Law and Resistivity), how resistors work in different combinations (series and parallel), and how electric current is used to generate heat and power in everyday appliances.

---

## Key Concepts

### 1. Electric Current and Electric Circuit
*   **Electric Current ($I$)**: It is the rate of flow of electric charge through a cross-section of a conductor. In simple words, it is the amount of charge flowing per second.
    $$I = \frac{Q}{t}$$
    Where:
    *   $I$ = Electric Current (in Amperes, $\text{A}$)
    *   $Q$ = Net Charge (in Coulombs, $\text{C}$)
    *   $t$ = Time (in seconds, $\text{s}$)
*   **Unit of Current**: The SI unit of current is **Ampere (A)**. One Ampere is defined as the flow of one Coulomb of charge per second: $1\text{ A} = 1\text{ C/s}$.
*   **Measuring Current**: Current is measured using an **Ammeter**, which must always be connected in **series** in a circuit. It has very low resistance.
*   **Direction of Current**: By convention, the direction of electric current is taken as the direction of flow of positive charges, which is **opposite** to the direction of the flow of electrons (negative charges).

### 2. Electric Potential and Potential Difference
*   **Potential Difference ($V$)**: The electric potential difference between two points in an electric circuit carrying some current is the work done to move a unit charge from one point to the other.
    $$V = \frac{W}{Q}$$
    Where:
    *   $V$ = Potential Difference (in Volts, $\text{V}$)
    *   $W$ = Work Done (in Joules, $\text{J}$)
    *   $Q$ = Charge (in Coulombs, $\text{C}$)
*   **Unit of Potential Difference**: The SI unit is **Volt (V)**. One Volt is the potential difference between two points when 1 Joule of work is done to move a charge of 1 Coulomb: $1\text{ V} = 1\text{ J/C}$.
*   **Measuring Voltage**: It is measured using a **Voltmeter**, which is always connected in **parallel** across the points where potential difference is to be measured. It has very high resistance.

> [!NOTE]
> A cell or a battery is the source of potential difference in a circuit. Chemical reactions inside the cell maintain this potential difference, forcing charges to move.

### 3. Ohm''s Law and Resistance
*   **Ohm''s Law**: In 1827, Georg Simon Ohm stated that the potential difference ($V$) across the ends of a given metallic wire in an electric circuit is directly proportional to the current ($I$) flowing through it, provided its temperature remains constant.
    $$V \propto I \implies V = IR$$
*   **Resistance ($R$)**: It is the property of a conductor to resist the flow of charges through it. Its SI unit is **Ohm ($\Omega$)**.
    $$R = \frac{V}{I}$$
*   **One Ohm ($1\ \Omega$)**: If the potential difference across a conductor is $1\text{ V}$ and the current is $1\text{ A}$, the resistance is $1\ \Omega$: $1\ \Omega = 1\text{ V}/1\text{ A}$.
*   **Current and Resistance**: Current is inversely proportional to resistance ($I = V/R$). If resistance is doubled, current is halved. A component used to regulate current without changing the voltage is called a **variable resistance** or **rheostat**.

### 4. Factors on which the Resistance of a Conductor Depends
The resistance ($R$) of a uniform metallic conductor depends on:
1.  **Length ($l$)**: Resistance is directly proportional to length ($R \propto l$). Doubling the length doubles the resistance.
2.  **Area of Cross-section ($A$)**: Resistance is inversely proportional to cross-sectional area ($R \propto 1/A$). A thick wire has less resistance than a thin wire.
3.  **Nature of Material**: Different materials offer different resistances.
4.  **Temperature**: Resistance of metals increases with temperature.

Combining these factors:
$$R = \rho \frac{l}{A}$$
Where **$\rho$ (rho)** is the **electrical resistivity** of the material.
*   **SI Unit of Resistivity**: **Ohm-meter ($\Omega\text{ m}$)**.
*   Resistivity is a characteristic property of the material. Metals and alloys have low resistivity ($10^{-8}\ \Omega\text{ m}$ to $10^{-6}\ \Omega\text{ m}$), making them good conductors. Insulators like rubber and glass have high resistivity ($10^{12}\ \Omega\text{ m}$ to $10^{17}\ \Omega\text{ m}$).

> [!IMPORTANT]
> Alloys have higher resistivity than their constituent metals. They do not oxidise (burn) easily at high temperatures. Therefore, they are commonly used in heating elements of appliances like electric irons and toasters.

### 5. Combination of Resistors
*   **Resistors in Series**: When resistors are joined end-to-end:
    *   The **current ($I$) remains the same** through all resistors.
    *   The total potential difference ($V$) is the sum of individual potential differences: $V = V_1 + V_2 + V_3$.
    *   The equivalent resistance ($R_s$) is the sum of individual resistances:
        $$R_s = R_1 + R_2 + R_3$$
*   **Resistors in Parallel**: When resistors are connected across the same two points:
    *   The **potential difference ($V$) remains the same** across all resistors.
    *   The total current ($I$) is the sum of separate currents through each branch: $I = I_1 + I_2 + I_3$.
    *   The reciprocal of equivalent resistance ($R_p$) is the sum of reciprocals of individual resistances:
        $$\frac{1}{R_p} = \frac{1}{R_1} + \frac{1}{R_2} + \frac{1}{R_3}$$

> [!WARNING]
> In a series circuit, if one component fails, the circuit breaks and none of the components work. In a parallel circuit, each appliance has its own switch and gets the same voltage, which is why domestic wiring is always in parallel.

### 6. Heating Effect of Electric Current and Power
*   **Heating Effect**: When current flows through a purely resistive conductor, the electrical energy is entirely converted into heat energy.
*   **Joule''s Law of Heating**: The heat ($H$) produced in a resistor is:
    1.  Directly proportional to the square of current ($I^2$) for a given resistance.
    2.  Directly proportional to resistance ($R$) for a given current.
    3.  Directly proportional to the time ($t$) for which current flows.
    $$H = I^2 R t$$
*   **Applications of Heating Effect**:
    *   **Electric Bulb**: Uses a **tungsten** filament to produce light. Tungsten has a very high melting point ($3380^\circ\text{C}$), so it does not melt even when white-hot. Bulbs are filled with inactive nitrogen/argon to prolong filament life.
    *   **Electric Fuse**: A safety device placed in **series** with appliances. It has a low melting point. If current exceeds a safe limit, the fuse wire heats up, melts, and breaks the circuit, protecting appliances.
*   **Electric Power ($P$)**: The rate at which electrical energy is consumed in a circuit.
    $$P = VI = I^2R = \frac{V^2}{R}$$
    *   **Unit**: **Watt (W)**. $1\text{ W} = 1\text{ V} \times 1\text{ A}$.
    *   **Commercial Unit of Energy**: **Kilowatt-hour ($\text{kW h}$)**, also called a ''unit''.
        $$1\text{ kW h} = 1000\text{ W} \times 3600\text{ s} = 3.6 \times 10^6\text{ Joules (J)}$$

---

## Important Formulas

| Physical Quantity | Symbol | Formula | SI Unit |
| :--- | :--- | :--- | :--- |
| Electric Current | $I$ | $I = Q/t$ | Ampere ($\text{A}$) |
| Potential Difference | $V$ | $V = W/Q$ | Volt ($\text{V}$) |
| Ohm''s Law | $V$ | $V = IR$ | Volt ($\text{V}$) |
| Resistance | $R$ | $R = \rho (l/A)$ | Ohm ($\Omega$) |
| Series Resistance | $R_s$ | $R_s = R_1 + R_2 + R_3$ | Ohm ($\Omega$) |
| Parallel Resistance | $R_p$ | $1/R_p = 1/R_1 + 1/R_2 + 1/R_3$ | Ohm ($\Omega$) |
| Joule Heat | $H$ | $H = I^2 R t = V I t$ | Joule ($\text{J}$) |
| Electric Power | $P$ | $P = VI = I^2 R = V^2/R$ | Watt ($\text{W}$) |
| Electrical Energy | $E$ | $E = P \times t$ | Joule ($\text{J}$) or $\text{kW h}$ |

---

## Common Exam Mistakes

*   **Ammeter vs. Voltmeter Connections**: Students often reverse their connections. Remember: **Ammeter** is always in **series** (low resistance); **Voltmeter** is always in **parallel** (high resistance).
*   **Confusing Resistance and Resistivity**: Resistance changes when a wire is stretched or cut (since length and area change). However, **resistivity remains constant** because it depends only on the material type and temperature.
*   **Time Unit Errors**: In heating formulas ($H = I^2 R t$), time must always be in **seconds**. If the question gives time in minutes or hours, convert it first!
*   **Domestic Circuit Layout**: Students often write that domestic circuits are connected in series. They must be in **parallel** so that each appliance gets $220\text{ V}$ and can operate independently.

---

## Quick Revision Summary

*   Electric current is the flow of charge: $I = Q/t$ (measured in Amperes).
*   Potential difference is work done per unit charge: $V = W/Q$ (measured in Volts).
*   Ohm''s law states $V = IR$ at constant temperature.
*   Resistance depends on length, thickness, and material: $R = \rho l/A$. Resistivity ($\rho$) is constant for a material.
*   Series connection increases total resistance ($R_s = \sum R$). Parallel connection decreases it ($1/R_p = \sum 1/R$).
*   Joule''s heating formula is $H = I^2 R t$. Used in iron, heater, fuse, and bulbs (tungsten).
*   Electric power is rate of energy consumption: $P = VI = I^2R$.
*   Commercial energy unit is $1\text{ kW h} = 3.6 \times 10^6\text{ J}$.
', TRUE, 3),

('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380080', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380331', 'Revision Notes: Nationalism in India', 'note', NULL, NULL,
'# Chapter 1: Nationalism in India

## Chapter Goal
The goal of this chapter is to understand how the spirit of nationalism grew in India through the anti-colonial struggle. Students will learn about the impact of the First World War, the concept of Satyagraha, major movements led by Mahatma Gandhi (Non-Cooperation and Civil Disobedience), and the cultural symbols that helped create a sense of collective belonging among Indians.

---

## Key Concepts

### 1. First World War and its Impact
The First World War (1914–1918) created a new economic and political situation in India under British rule:
*   **Defense Expenditure**: British government increased defense spending, leading to war loans and higher taxes (customs duties were raised and income tax was introduced).
*   **Price Rise**: Prices of everyday goods doubled between 1913 and 1918, causing extreme hardship for common people.
*   **Forced Recruitment**: Villages were forced to supply young men as soldiers for the British army, leading to widespread anger.
*   **Famines and Epidemics**: In 1918-19 and 1920-21, crops failed in many parts of India, resulting in acute food shortages. This was followed by an influenza epidemic. About 12 to 13 million people died (Census of 1921).

### 2. The Idea of Satyagraha
*   Mahatma Gandhi returned to India from South Africa in **January 1915**, where he had successfully fought racist laws using a new method of mass struggle called **Satyagraha**.
*   **Satyagraha Philosophy**: It emphasized the power of truth and the need to search for truth. It suggested that if the cause is true and the struggle is against injustice, physical force is not needed. A satyagrahi can win through non-violence by appealing to the conscience of the oppressor.
*   **Early Local Satyagrahas in India**:
    1.  **1917 (Champaran, Bihar)**: To inspire peasants to struggle against the oppressive indigo plantation system.
    2.  **1918 (Kheda, Gujarat)**: To support peasants who could not pay revenue due to crop failure and plague. They demanded revenue collection relaxation.
    3.  **1918 (Ahmedabad, Gujarat)**: To support cotton mill workers striking for better wages.

### 3. Rowlatt Act and Jallianwala Bagh (1919)
*   **Rowlatt Act (1919)**: Hurriedly passed by the Imperial Legislative Council. It gave the government enormous power to repress political activity and allowed the detention of political prisoners without trial for up to two years.
*   **Rowlatt Satyagraha**: Gandhiji launched non-violent civil disobedience starting with a *hartal* (strike) on **6 April 1919**.
*   **Jallianwala Bagh Massacre (13 April 1919)**: A large crowd gathered in the enclosed ground of Jallianwala Bagh in Amritsar. Some protested the Rowlatt Act; others attended the Baisakhi fair. General Dyer blocked the exit gates and opened fire on the peaceful crowd, killing hundreds. He stated his goal was to "produce a moral effect" and fill satyagrahis with terror and awe.
*   Following widespread violence in response, Gandhiji called off the Rowlatt Satyagraha movement.

### 4. Non-Cooperation Movement (1921–1922)
*   **The Idea**: In his book *Hind Swaraj* (1909), Gandhiji wrote that British rule survived in India because of the cooperation of Indians. If Indians refused to cooperate, British rule would collapse and Swaraj would arrive.
*   **Khilafat Issue**: To bring Hindus and Muslims together, Gandhiji supported the Khilafat movement. The movement was started by brothers **Muhammad Ali and Shaukat Ali** to protect the spiritual head of the Islamic world (the Khalifa/Ottoman Emperor) from harsh treaty conditions after WWI.
*   **Adoption**: Adopted at the **Nagpur Congress session in December 1920**. The Non-Cooperation-Khilafat Movement began in January 1921.
*   **Phases and Strands**:
    *   **In Towns**: Middle-class students left government schools, lawyers gave up practice, and foreign goods were boycotted. Foreign cloth imports halved.
    *   **In Countryside**: Peasants in Awadh, led by **Baba Ramchandra**, rebelled against high rents of landlords. In Gudem Hills of Andhra Pradesh, tribals led by **Alluri Sitarama Raju** launched militant guerrilla warfare against forest laws.
    *   **In Plantations**: Assam plantation workers defied the Inland Emigration Act of 1859, which prevented them from leaving tea gardens without permission, and tried to head home.
*   **Withdrawal**: In **February 1922**, a peaceful crowd at **Chauri Chaura** (Gorakhpur) clashed with police and burned down a police station, killing 22 policemen. Hearing this, Gandhiji immediately withdrew the Non-Cooperation Movement because it was turning violent.

### 5. Towards Civil Disobedience (1930–1934)
*   **Swaraj Party**: Formed by **C. R. Das and Motilal Nehru** within the Congress to participate in council elections and oppose British policies from within.
*   **Simon Commission (1928)**: A British statutory commission led by Sir John Simon. It had **no Indian members**. It was greeted with protests and the slogan "Go back Simon". Lala Lajpat Rai was assaulted during a protest and later died.
*   **Purna Swaraj (December 1929)**: Under Jawaharlal Nehru''s presidency, the Lahore Congress session formalized the demand for ''Purna Swaraj'' (Complete Independence). **26 January 1930** was declared Independence Day.
*   **Salt March (Dandi March)**: Salt was chosen as a symbol of unity because it was consumed by rich and poor alike.
    *   On 31 January 1930, Gandhiji sent 11 demands to Viceroy Irwin, including the abolition of the salt tax.
    *   When Irwin refused, Gandhiji started the march on **12 March 1930** with **78 trusted volunteers**.
    *   They walked **240 miles** from Sabarmati Ashram to the coastal town of Dandi (Gujarat) in **24 days** (10 miles a day).
    *   On **6 April 1930**, Gandhiji reached Dandi, manufactured salt by boiling seawater, and broke the salt law. This launched the Civil Disobedience Movement.
*   **Gandhi-Irwin Pact (5 March 1931)**: Gandhiji called off the movement and agreed to attend the Second Round Table Conference in London. In return, the government agreed to release political prisoners.
*   **Failure and Relaunch**: The London conference failed. Gandhiji returned to find leaders like Jawaharlal Nehru and Abdul Ghaffar Khan in jail, and the Congress declared illegal. He relaunched the movement, but it lost momentum by 1934.
*   **Poona Pact (September 1932)**: Dr. B. R. Ambedkar, who organized Dalits into the **Depressed Classes Association (1930)**, clashed with Gandhiji at the Round Table Conference by demanding separate electorates. Gandhiji went on a fast unto death, arguing separate electorates would divide Hindu society. Ambedkar agreed to general electorates with reserved seats for Depressed Classes, signing the Poona Pact.

### 6. The Sense of Collective Belonging
Nationalism grew through shared struggles and cultural processes:
*   **Bharat Mata**: The visual image of the nation was first created by **Bankim Chandra Chattopadhyay** in the 1870s, who also wrote ''Vande Mataram'' (later included in his novel *Anandamath*). It was beautifully painted by **Abanindranath Tagore** in 1905 as a calm, ascetic, and spiritual mother figure.
*   **Folklore**: Nationalists collected folk songs and legends to preserve traditional culture. In Madras, **Natesa Sastri** published a massive four-volume collection of Tamil folktales, *The Folklore of Southern India*.
*   **National Flag**:
    *   *Swadeshi Flag (Bengal)*: Tricolour (red, green, yellow) with 8 lotuses (representing 8 provinces) and a crescent moon.
    *   *Swaraj Flag (1921)*: Designed by Gandhiji. Tricolour (red, green, white) with a spinning wheel in the center representing self-help.
*   **Reinterpretation of History**: Indians wrote about ancient times when art, science, mathematics, and trade flourished, to counter the British view of Indians as backward.

---

## Important Dates

| Year / Date | Event | Significance |
| :--- | :--- | :--- |
| **January 1915** | Gandhi Returns to India | Returns from South Africa with the technique of Satyagraha. |
| **1917** | Champaran Satyagraha | First local Satyagraha in Bihar against the indigo system. |
| **1918** | Kheda & Ahmedabad Satyagrahas | Peasants'' struggle in Kheda; mill workers'' strike in Ahmedabad. |
| **March 1919** | Khilafat Committee Formed | Formed in Bombay to defend the Khalifa''s temporal power. |
| **6 April 1919** | Rowlatt Satyagraha Launch | Nationwide hartal launched against the Rowlatt Act. |
| **13 April 1919** | Jallianwala Bagh Massacre | British General Dyer fires on peaceful gatherers in Amritsar. |
| **December 1920** | Nagpur Congress Session | Non-Cooperation program is formally adopted by the Congress. |
| **January 1921** | Non-Cooperation Started | Non-Cooperation-Khilafat movement begins. |
| **February 1922** | Chauri Chaura Incident | Violent clash leads to withdrawal of Non-Cooperation. |
| **1928** | Simon Commission Arrives | Boycotted by Indian parties with ''Go Back Simon'' slogan. |
| **December 1929** | Lahore Congress Session | Demand for ''Purna Swaraj'' (Complete Independence) is adopted. |
| **26 January 1930** | Independence Day Pledge | First celebrated as Independence Day under Lahore resolution. |
| **12 Mar - 6 Apr 1930** | Salt March (Dandi March) | Gandhi walks 240 miles to break salt law, starting Civil Disobedience. |
| **5 March 1931** | Gandhi-Irwin Pact | Civil Disobedience called off; Gandhi agrees to London conference. |
| **September 1932** | Poona Pact Signed | Reserved seats for Dalits (Depressed Classes) in general electorate. |
| **1934** | Movement Lost Momentum | Civil Disobedience Movement completely loses steam. |

---

## Common Exam Mistakes

*   **Non-Cooperation vs. Civil Disobedience**: Students often mix them up. Remember: **Non-Cooperation** (1921) was about refusing to cooperate with the government (boycotting schools, courts, goods). **Civil Disobedience** (1930) went a step further, where people actively broke colonial laws (like making salt, refusing to pay tax).
*   **Who formed the Swaraj Party?**: Students often think it was Jawaharlal Nehru. It was actually formed by **Motilal Nehru** (his father) and **C. R. Das**. Jawaharlal Nehru wanted more radical mass struggle and did not support returning to council politics.
*   **The Colors of the Flags**: Do not confuse the two tricolour flags. The Bengal Swadeshi flag had **red, green, and yellow**. Gandhiji''s 1921 Swaraj flag had **red, green, and white** with a spinning wheel.
*   **Poona Pact Parties**: Students often write that it was signed between British and Ambedkar. It was actually signed between **Ambedkar** (on behalf of Depressed Classes) and **Congress/Mahatma Gandhi** (representing general Hindus).

---

## Quick Revision Summary

*   WWI created extreme economic distress in India, setting the stage for national movements.
*   Gandhian Satyagraha is based on truth and non-violence. Early successes were Champaran, Kheda, and Ahmedabad.
*   Rowlatt Act (detention without trial) led to Satyagraha and the tragic Jallianwala Bagh Massacre on 13 April 1919.
*   The Non-Cooperation-Khilafat movement united Hindus and Muslims (1921-22). It was stopped after the Chauri Chaura violence in 1922.
*   Simon Commission (1928) had no Indian members, uniting all political parties in opposition.
*   Lahore Congress (1929) demanded Purna Swaraj. Independence Day was set as 26 January 1930.
*   Dandi Salt March (12 March to 6 April 1930) started the Civil Disobedience Movement.
*   Gandhi-Irwin Pact led to Gandhi attending the 2nd Round Table Conference, but negotiations failed.
*   Poona Pact (Sept 1932) resolved separate electorate disputes by granting reserved seats to Depressed Classes.
*   Nationalism spread through cultural identity: the image of Bharat Mata, folklore revival (like Natesa Sastri''s work), tricolour flags, and pride in ancient Indian history.
', TRUE, 2)
ON CONFLICT (id) DO NOTHING;
