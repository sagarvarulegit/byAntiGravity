import os

def search_keywords(filepath, keywords, out_f):
    out_f.write(f"\n--- Searching in {os.path.basename(filepath)} ---\n")
    with open(filepath, "rb") as f:
        content_bytes = f.read()
    content = content_bytes.decode('utf-8', errors='replace').replace("\r\n", "\n")
    
    for kw in keywords:
        pos = content.find(kw)
        if pos != -1:
            out_f.write(f"Keyword '{kw}' found at position {pos}:\n")
            snippet = content[max(0, pos-100):pos+len(kw)+150]
            out_f.write(repr(snippet) + "\n")
        else:
            out_f.write(f"Keyword '{kw}' NOT found!\n")

def main():
    base_dir = r"c:\Sagar\Projects\CBSE\byAntiGravity"
    out_path = r"c:\Sagar\Projects\CBSE\byAntiGravity\scratch\debug_strings.txt"
    
    with open(out_path, "w", encoding="utf-8") as out_f:
        # 1. Search in db/seed_science_ch2_notes.sql
        ch2_path = os.path.join(base_dir, "db", "seed_science_ch2_notes.sql")
        search_keywords(ch2_path, ["NaOH(aq) + HCl(aq)", "glucose and alcohol", "Chlor-alkali process", "The Chlor-alkali Process:"], out_f)
        
        # 2. Search in db/seed_notes_v2.sql
        notes_v2_path = os.path.join(base_dir, "db", "seed_notes_v2.sql")
        search_keywords(notes_v2_path, ["Displacement Reaction", "Ohm''s Law", "Ohm's Law", "R_p", "R_1"], out_f)
        
        # 3. Search in db/seed_study_guides.sql
        study_guides_path = os.path.join(base_dir, "db", "seed_study_guides.sql")
        search_keywords(study_guides_path, ["Observation: Gas bubbles", "Displacement Reaction", "Resistors in Parallel"], out_f)

    print(f"Written debug findings to {out_path}")

if __name__ == "__main__":
    main()
