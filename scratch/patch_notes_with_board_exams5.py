import os

def patch_file_by_substring(filepath, target_sub, insert_after_line_of_sub, insert_text):
    print(f"Patching file: {os.path.basename(filepath)}")
    if not os.path.exists(filepath):
        print(f"  Error: file does not exist!")
        return False
        
    with open(filepath, "rb") as f:
        content_bytes = f.read()
        
    content = content_bytes.decode('utf-8', errors='replace').replace("\r\n", "\n")
    original_len = len(content)
    
    pos = content.find(target_sub)
    if pos != -1:
        # Check if we already inserted it
        clean_insert = insert_text.strip()
        if clean_insert in content:
            print(f"  Already patched for: '{target_sub[:40]}'")
            return True
            
        # Find the end of the line containing the target_sub (or the line specified by insert_after_line_of_sub)
        end_line_pos = content.find("\n", pos)
        if end_line_pos != -1:
            content = content[:end_line_pos] + "\n\n" + clean_insert + content[end_line_pos:]
            content_to_write = content.replace("\n", "\r\n")
            with open(filepath, "wb") as f:
                f.write(content_to_write.encode('utf-8', errors='replace'))
            print(f"  Successfully patched target: '{target_sub[:40]}'")
            return True
        else:
            print(f"  Error: Could not find end of line for: '{target_sub[:40]}'")
            return False
    else:
        print(f"  Warning: Target substring not found: '{target_sub[:40]}'")
        return False

def main():
    base_dir = r"c:\Sagar\Projects\CBSE\byAntiGravity"
    
    # Restore first to get a clean slate
    os.system("git checkout db/seed_science_ch2_notes.sql db/seed_notes_v2.sql db/seed_study_guides.sql")
    print("Restored original SQL seed files from git for a clean patch run.")
    
    # 1. Patch db/seed_science_ch2_notes.sql
    ch2_path = os.path.join(base_dir, "db", "seed_science_ch2_notes.sql")
    
    patch_file_by_substring(
        ch2_path,
        "$$NaOH(aq) + HCl(aq)",
        True,
        """> [!IMPORTANT]
> **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 5x (2025, 2026)**  
> *Key Concept:* Reaction of acids with bases (neutralisation), basic metallic oxides with acids, and acidic non-metallic oxides with bases all yield salt and water."""
    )
    
    patch_file_by_substring(
        ch2_path,
        "[INFO: Compounds like glucose and alcohol contain hydrogen but do NOT ionise in water, so they do not produce $H^+$ ions and are not classified as acids.]",
        True,
        """> [!IMPORTANT]
> **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 3x (2024)**  
> *Key Concept:* Solutions of glucose and alcohol do not conduct electricity (bulb does not glow) because they do not dissociate into ions in water, unlike HCl and $H_2SO_4$."""
    )
    
    patch_file_by_substring(
        ch2_path,
        "called the [JARGON: Chlor-alkali process | An industrial process where electricity is passed through brine",
        True,
        """> [!IMPORTANT]
> **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 3x (2025)**  
> *Key Concept:* In the Chlor-alkali process, electrolysis of brine yields $Cl_2$ gas at the anode, $H_2$ gas at the cathode, and sodium hydroxide ($NaOH$) near the cathode."""
    )
    
    patch_file_by_substring(
        ch2_path,
        "**The Chlor-alkali Process:**",
        True,
        """> [!IMPORTANT]
> **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 3x (2025)**  
> *Key Concept:* Common salt ($NaCl$) separated from seawater contains impurities that make it brown, known as rock salt. It is a vital raw material for making daily-use chemicals like sodium hydroxide ($NaOH$) and baking soda ($NaHCO_3$)."""
    )
    
    # 2. Patch db/seed_notes_v2.sql
    notes_v2_path = os.path.join(base_dir, "db", "seed_notes_v2.sql")
    
    patch_file_by_substring(
        notes_v2_path,
        "Iron nail in copper sulfate solution]** (pushing out):",
        True,
        """  > [!IMPORTANT]
  > **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 4x (2026)**  
  > *Key Concept:* In a displacement reaction, a more reactive metal (e.g. Iron, Zinc) displaces a less reactive metal (e.g. Copper) from its salt solution."""
    )
    
    patch_file_by_substring(
        notes_v2_path,
        "Concept 4: Ohm''s Law",
        True,
        """> [!IMPORTANT]
> **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 6x (2025, 2026)**  
> *Key Concept:* Circuit numericals that require calculating equivalent resistance, total current, and potential differences using Ohm's Law ($V = IR$) are highly repeated."""
    )
    
    patch_file_by_substring(
        notes_v2_path,
        "By Ohm''s Law: $\\frac{V}{R_p}",
        True,
        """> [!IMPORTANT]
> **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 3x (2025)**  
> *Key Concept:* If a wire of resistance $R$ is cut into $n$ equal parts, the resistance of each part becomes $R/n$. When these $n$ parts are connected in parallel, the equivalent resistance $R_p$ is $R/n^2$."""
    )

    # 3. Patch db/seed_study_guides.sql
    study_guides_path = os.path.join(base_dir, "db", "seed_study_guides.sql")
    
    patch_file_by_substring(
        study_guides_path,
        "[FIGURE: electrolysis_of_water]",
        True,
        """   > [!IMPORTANT]
   > **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 3x (2025)**  
   > *Key Concept:* During the electrolysis of water, the mole ratio (volume ratio) of hydrogen to oxygen gases released is $2:1$, while the mass ratio ($M_H : M_O$) of hydrogen to oxygen gases is $1:8$."""
    )
    
    patch_file_by_substring(
        study_guides_path,
        "displaces a less reactive element from its salt solution is a **displacement reaction**.",
        True,
        """\n> [!IMPORTANT]
> **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 4x (2026)**  
> *Key Concept:* Iron reacting with copper sulfate solution is a displacement reaction. The blue solution turns green (formation of $FeSO_4$) and a reddish-brown coating of copper deposits on the iron nail."""
    )
    
    patch_file_by_substring(
        study_guides_path,
        "### 11.6.2 Resistors in Parallel",
        True,
        """\n> [!IMPORTANT]
> **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 6x (2025, 2026)**  
> *Key Concept:* Practice calculating the equivalent resistance of combined series and parallel resistors and finding the current/potential difference across specific components."""
    )

if __name__ == "__main__":
    main()
