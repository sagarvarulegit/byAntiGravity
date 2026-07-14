import os

def patch_file_by_anchors(filepath, anchors):
    print(f"Patching file: {os.path.basename(filepath)}")
    if not os.path.exists(filepath):
        print(f"  Error: file does not exist!")
        return False
        
    with open(filepath, "rb") as f:
        content_bytes = f.read()
        
    content = content_bytes.decode('utf-8', errors='replace').replace("\r\n", "\n")
    original_len = len(content)
    patched_count = 0
    
    for anchor, insert_text in anchors:
        pos = content.find(anchor)
        if pos != -1:
            # We want to find the end of the line containing the anchor
            end_line_pos = content.find("\n", pos)
            if end_line_pos != -1:
                # Check if we already inserted it
                clean_insert = insert_text.strip()
                if clean_insert in content:
                    print(f"  Already patched for anchor: '{anchor[:40]}'")
                    continue
                    
                # Insert the text after the newline
                content = content[:end_line_pos] + "\n\n" + clean_insert + content[end_line_pos:]
                patched_count += 1
                print(f"  Successfully patched anchor: '{anchor[:40]}'")
            else:
                print(f"  Error: Could not find end of line for anchor: '{anchor[:40]}'")
        else:
            print(f"  Warning: Anchor not found: '{anchor[:40]}'")
            
    if patched_count > 0:
        content_to_write = content.replace("\n", "\r\n")
        with open(filepath, "wb") as f:
            f.write(content_to_write.encode('utf-8', errors='replace'))
        print(f"  Saved file. Applied {patched_count} patches.")
        return True
    else:
        print(f"  No new patches applied.")
        return False

def main():
    base_dir = r"c:\Sagar\Projects\CBSE\byAntiGravity"
    
    # 1. Patch db/seed_science_ch2_notes.sql
    ch2_path = os.path.join(base_dir, "db", "seed_science_ch2_notes.sql")
    # For Chapter 2, we already successfully patched 3 out of 4 using the previous script.
    # Let's restore the file first to ensure we apply clean patches, or just apply the missing one.
    # Actually, let's restore all files using git checkout first to make sure we have a clean slate!
    os.system("git checkout db/seed_science_ch2_notes.sql db/seed_notes_v2.sql db/seed_study_guides.sql")
    print("Restored original SQL seed files from git for a clean patch run.")
    
    ch2_anchors = [
        (
            "$$NaOH(aq) + HCl(aq) \\\\rightarrow NaCl(aq) + H_2O(l)$$",
            """> [!IMPORTANT]
> **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 5x (2025, 2026)**  
> *Key Concept:* Reaction of acids with bases (neutralisation), basic metallic oxides with acids, and acidic non-metallic oxides with bases all yield salt and water."""
        ),
        (
            "[INFO: Compounds like glucose and alcohol contain hydrogen but do NOT ionise in water, so they do not produce $H^+$ ions and are not classified as acids.]",
            """> [!IMPORTANT]
> **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 3x (2024)**  
> *Key Concept:* Solutions of glucose and alcohol do not conduct electricity (bulb does not glow) because they do not dissociate into ions in water, unlike HCl and $H_2SO_4$."""
        ),
        (
            "called the [JARGON: Chlor-alkali process | An industrial process where electricity is passed through brine (salt water) to produce chlorine gas, hydrogen gas, and sodium hydroxide | Used to manufacture chlorine for bleaching and NaOH for soap making]:",
            """> [!IMPORTANT]
> **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 3x (2025)**  \n> *Key Concept:* In the Chlor-alkali process, electrolysis of brine yields $Cl_2$ gas at the anode, $H_2$ gas at the cathode, and sodium hydroxide ($NaOH$) near the cathode."""
        ),
        (
            "**The Chlor-alkali Process:**",
            """> [!IMPORTANT]
> **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 3x (2025)**  
> *Key Concept:* Common salt ($NaCl$) separated from seawater contains impurities that make it brown, known as rock salt. It is a vital raw material for making daily-use chemicals like sodium hydroxide ($NaOH$) and baking soda ($NaHCO_3$)."""
        )
    ]
    patch_file_by_anchors(ch2_path, ch2_anchors)
    
    # 2. Patch db/seed_notes_v2.sql
    notes_v2_path = os.path.join(base_dir, "db", "seed_notes_v2.sql")
    notes_v2_anchors = [
        (
            "Iron nail in copper sulfate solution]** (pushing out): A stronger element replaces a weaker one. $Fe + CuSO_4 \\\\rightarrow FeSO_4 + Cu$. The blue copper solution turns green!",
            """  > [!IMPORTANT]
  > **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 4x (2026)**  
  > *Key Concept:* In a displacement reaction, a more reactive metal (e.g. Iron, Zinc) displaces a less reactive metal (e.g. Copper) from its salt solution."""
        ),
        (
            "Concept 4: Ohm''s Law",
            """> [!IMPORTANT]
> **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 6x (2025, 2026)**  
> *Key Concept:* Circuit numericals that require calculating equivalent resistance, total current, and potential differences using Ohm's Law ($V = IR$) are highly repeated."""
        ),
        (
            "- By Ohm''s Law: $\\\\frac{V}{R_p} = \\\\frac{V}{R_1} + \\\\frac{V}{R_2} + \\\\frac{V}{R_3}$",
            """> [!IMPORTANT]
> **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 3x (2025)**  
> *Key Concept:* If a wire of resistance $R$ is cut into $n$ equal parts, the resistance of each part becomes $R/n$. When these $n$ parts are connected in parallel, the equivalent resistance $R_p$ is $R/n^2$."""
        )
    ]
    patch_file_by_anchors(notes_v2_path, notes_v2_anchors)

    # 3. Patch db/seed_study_guides.sql
    study_guides_path = os.path.join(base_dir, "db", "seed_study_guides.sql")
    study_guides_anchors = [
        (
            "[FIGURE: electrolysis_of_water]",
            """   > [!IMPORTANT]
   > **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 3x (2025)**  
   > *Key Concept:* During the electrolysis of water, the mole ratio (volume ratio) of hydrogen to oxygen gases released is $2:1$, while the mass ratio ($M_H : M_O$) of hydrogen to oxygen gases is $1:8$."""
        ),
        (
            "displaces a less reactive element from its salt solution is a **displacement reaction**.",
            """\n> [!IMPORTANT]
> **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 4x (2026)**  
> *Key Concept:* Iron reacting with copper sulfate solution is a displacement reaction. The blue solution turns green (formation of $FeSO_4$) and a reddish-brown coating of copper deposits on the iron nail."""
        ),
        (
            "### 11.6.2 Resistors in Parallel",
            """\n> [!IMPORTANT]
> **\ud83d\udd25 Board Exam Hot Topic \u2014 Repeated 6x (2025, 2026)**  
> *Key Concept:* Practice calculating the equivalent resistance of combined series and parallel resistors and finding the current/potential difference across specific components."""
        )
    ]
    patch_file_by_anchors(study_guides_path, study_guides_anchors)

if __name__ == "__main__":
    main()
