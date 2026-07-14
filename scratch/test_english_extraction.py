import re

def has_devnagari(text):
    return any(u'\u0900' <= char <= u'\u097F' for char in text)

def main():
    path = r"c:\Sagar\Projects\CBSE\byAntiGravity\scratch\extracted_science_papers\2025_31-1-1_Science.txt"
    with open(path, "r", encoding="utf-8") as f:
        lines = f.readlines()
        
    in_english_section = False
    english_lines = []
    
    for line in lines:
        line_strip = line.strip()
        if not line_strip:
            continue
        
        # Check if line contains Devnagari
        if has_devnagari(line_strip):
            continue
            
        # Ignore cover page garbage or page numbers
        if line_strip.startswith("--- PAGE") or "*ECNEICS*" in line_strip or "*31/" in line_strip:
            continue
            
        english_lines.append(line_strip)
        
    # Write to temp file to check
    output_path = r"c:\Sagar\Projects\CBSE\byAntiGravity\scratch\temp_eng_lines.txt"
    with open(output_path, "w", encoding="utf-8") as f:
        f.write("\n".join(english_lines[:300]))
    print(f"Written first 300 English lines to {output_path}")

if __name__ == "__main__":
    main()
