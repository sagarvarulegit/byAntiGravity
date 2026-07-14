import os

def patch_file(filepath, replacements):
    print(f"Patching file: {filepath}")
    if not os.path.exists(filepath):
        print(f"  Error: file does not exist!")
        return False
        
    with open(filepath, "r", encoding="utf-8", errors="surrogateescape") as f:
        content = f.read()
        
    original_len = len(content)
    patched_count = 0
    
    for target, replacement in replacements:
        if target in content:
            content = content.replace(target, replacement)
            patched_count += 1
        else:
            print(f"  Warning: Target content not found in file!")
            print(f"    Target search: {target[:100]}...")
            
    if patched_count > 0:
        with open(filepath, "w", encoding="utf-8", errors="surrogateescape") as f:
            f.write(content)
        print(f"  Successfully applied {patched_count} of {len(replacements)} patches. Length: {original_len} -> {len(content)}")
        return True
    else:
        print(f"  No patches applied.")
        return False

def main():
    base_dir = r"c:\Sagar\Projects\CBSE\byAntiGravity"
    
    # 1. Patch db/seed_science_ch2_notes.sql
    ch2_path = os.path.join(base_dir, "db", "seed_science_ch2_notes.sql")
    ch2_replacements = [
        # Patch 1: Neutralisation
        (
            "$$NaOH(aq) + HCl(aq) \\rightarrow NaCl(aq) + H_2O(l)$$\n\n---",
            "$$NaOH(aq) + HCl(aq) \\rightarrow NaCl(aq) + H_2O(l)$$\n\n> [!IMPORTANT]\n> **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 5x (2025, 2026)**  \n> *Key Concept:* Reaction of acids with bases (neutralisation), basic metallic oxides with acids, and acidic non-metallic oxides with bases all yield salt and water.\n\n---"
        ),
        # Patch 2: Glucose & Alcohol conductivity
        (
            "[INFO: Compounds like glucose and alcohol contain hydrogen but do NOT ionise in water, so they do not produce $H^+$ ions and are not classified as acids.]",
            "[INFO: Compounds like glucose and alcohol contain hydrogen but do NOT ionise in water, so they do not produce $H^+$ ions and are not classified as acids.]\n\n> [!IMPORTANT]\n> **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 3x (2024)**  \n> *Key Concept:* Solutions of glucose and alcohol do not conduct electricity (bulb does not glow) because they do not dissociate into ions in water, unlike HCl and $H_2SO_4$."
        ),
        # Patch 3: Chlor-alkali process
        (
            "When electricity is passed through brine (aqueous $NaCl$ solution), this is called the [JARGON: Chlor-alkali process | An industrial process where electricity is passed through brine (salt water) to produce chlorine gas, hydrogen gas, and sodium hydroxide | Used to manufacture chlorine for bleaching and NaOH for soap making]:",
            "When electricity is passed through brine (aqueous $NaCl$ solution), this is called the [JARGON: Chlor-alkali process | An industrial process where electricity is passed through brine (salt water) to produce chlorine gas, hydrogen gas, and sodium hydroxide | Used to manufacture chlorine for bleaching and NaOH for soap making]:\n\n> [!IMPORTANT]\n> **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 3x (2025)**  \n> *Key Concept:* In the Chlor-alkali process, electrolysis of brine yields $Cl_2$ gas at the anode, $H_2$ gas at the cathode, and sodium hydroxide ($NaOH$) near the cathode."
        ),
        # Patch 4: Common Salt rock salt
        (
            "**The Chlor-alkali Process:**",
            "> [!IMPORTANT]\n> **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 3x (2025)**  \n> *Key Concept:* Common salt ($NaCl$) separated from seawater contains impurities that make it brown, known as rock salt. It is a vital raw material for making daily-use chemicals like sodium hydroxide ($NaOH$) and baking soda ($NaHCO_3$).\n\n**The Chlor-alkali Process:**"
        )
    ]
    patch_file(ch2_path, ch2_replacements)
    
    # 2. Patch db/seed_notes_v2.sql
    notes_v2_path = os.path.join(base_dir, "db", "seed_notes_v2.sql")
    notes_v2_replacements = [
        # Patch 1: Displacement reaction
        (
            "- **[JARGON: Displacement Reaction | A reaction where a more reactive element pushes out a less reactive element | Iron nail in copper sulfate solution]** (pushing out): A stronger element replaces a weaker one. $Fe + CuSO_4 \\rightarrow FeSO_4 + Cu$. The blue copper solution turns green!",
            "- **[JARGON: Displacement Reaction | A reaction where a more reactive element pushes out a less reactive element | Iron nail in copper sulfate solution]** (pushing out): A stronger element replaces a weaker one. $Fe + CuSO_4 \\rightarrow FeSO_4 + Cu$. The blue copper solution turns green!\n\n  > [!IMPORTANT]\n  > **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 4x (2026)**  \n  > *Key Concept:* In a displacement reaction, a more reactive metal (e.g. Iron, Zinc) displaces a less reactive metal (e.g. Copper) from its salt solution."
        ),
        # Patch 2: Ohm's law
        (
            "Ohm''s Law is the most important law in electricity! It states that the potential difference ($V$) across the ends of a given metallic wire in an electric circuit is directly proportional to the current ($I$) flowing through it, provided its temperature remains the same.",
            "Ohm''s Law is the most important law in electricity! It states that the potential difference ($V$) across the ends of a given metallic wire in an electric circuit is directly proportional to the current ($I$) flowing through it, provided its temperature remains the same.\n\n> [!IMPORTANT]\n> **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 6x (2025, 2026)**  \n> *Key Concept:* Circuit numericals that require calculating equivalent resistance, total current, and potential differences using Ohm's Law ($V = IR$) are highly repeated."
        ),
        # Patch 3: Resistor combinations wire cutting
        (
            "- By Ohm''s Law: $\\frac{V}{R_p} = \\frac{V}{R_1} + \\frac{V}{R_2} + \\frac{V}{R_3}$",
            "- By Ohm''s Law: $\\frac{V}{R_p} = \\frac{V}{R_1} + \\frac{V}{R_2} + \\frac{V}{R_3}$\n\n> [!IMPORTANT]\n> **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 3x (2025)**  \n> *Key Concept:* If a wire of resistance $R$ is cut into $n$ equal parts, the resistance of each part becomes $R/n$. When these $n$ parts are connected in parallel, the equivalent resistance $R_p$ is $R/n^2$."
        )
    ]
    patch_file(notes_v2_path, notes_v2_replacements)

    # 3. Patch db/seed_study_guides.sql
    study_guides_path = os.path.join(base_dir, "db", "seed_study_guides.sql")
    study_guides_replacements = [
        # Patch 1: Electrolysis of water
        (
            "    * **Observation:** Gas bubbles form at both electrodes. The volume of gas collected at the cathode (Hydrogen, $H_2$) is **double** that collected at the anode (Oxygen, $O_2$).\n    * **Chemical Equation:**\n      $$2H_2O(l) \\xrightarrow{\\text{Electricity}} 2H_2(g) + O_2(g)$$\n   [FIGURE: electrolysis_of_water]",
            "    * **Observation:** Gas bubbles form at both electrodes. The volume of gas collected at the cathode (Hydrogen, $H_2$) is **double** that collected at the anode (Oxygen, $O_2$).\n    * **Chemical Equation:**\n      $$2H_2O(l) \\xrightarrow{\\text{Electricity}} 2H_2(g) + O_2(g)$$\n   [FIGURE: electrolysis_of_water]\n\n   > [!IMPORTANT]\n   > **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 3x (2025)**  \n   > *Key Concept:* During the electrolysis of water, the mole ratio (volume ratio) of hydrogen to oxygen gases released is $2:1$, while the mass ratio ($M_H : M_O$) of hydrogen to oxygen gases is $1:8$."
        ),
        # Patch 2: Displacement Reaction
        (
            "### 1.2.3 Displacement Reaction\n\nA chemical reaction in which a more reactive element displaces a less reactive element from its salt solution is a **displacement reaction**.",
            "### 1.2.3 Displacement Reaction\n\nA chemical reaction in which a more reactive element displaces a less reactive element from its salt solution is a **displacement reaction**.\n\n> [!IMPORTANT]\n> **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 4x (2026)**  \n> *Key Concept:* Iron reacting with copper sulfate solution is a displacement reaction. The blue solution turns green (formation of $FeSO_4$) and a reddish-brown coating of copper deposits on the iron nail."
        ),
        # Patch 3: Parallel resistors
        (
            "### 11.6.2 Resistors in Parallel\n\nWhen resistors are connected together between the same two points, they are said to be in parallel.",
            "### 11.6.2 Resistors in Parallel\n\nWhen resistors are connected together between the same two points, they are said to be in parallel.\n\n> [!IMPORTANT]\n> **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 6x (2025, 2026)**  \n> *Key Concept:* Practice calculating the equivalent resistance of combined series and parallel resistors and finding the current/potential difference across specific components."
        )
    ]
    patch_file(study_guides_path, study_guides_replacements)

if __name__ == "__main__":
    main()
