import os
import re
import json

def has_devnagari(text):
    return any(u'\u0900' <= char <= u'\u097F' for char in text)

def clean_question_text(lines):
    cleaned = []
    for line in lines:
        line_strip = line.strip()
        if not line_strip:
            continue
        if has_devnagari(line_strip):
            continue
        # Skip header/footer noise
        if line_strip.startswith("--- PAGE") or "*ECNEICS*" in line_strip or "*31/" in line_strip:
            continue
        if line_strip.startswith("Series :") or line_strip.startswith("Q.P. Code") or "Candidates must write" in line_strip:
            continue
        cleaned.append(line_strip)
    return " ".join(cleaned)

def parse_questions_from_file(filepath):
    with open(filepath, "r", encoding="utf-8") as f:
        lines = f.readlines()
        
    questions = {}
    current_q_num = None
    current_q_lines = []
    
    # We look for lines starting with "1.", "2.", ... "39."
    # Avoid matching things like "1.1" or decimal numbers
    q_start_pat = re.compile(r'^([1-9][0-9]*)\.\s+(.*)')
    
    for line in lines:
        line_strip = line.strip()
        
        # Check for section headers
        if "SECTION" in line_strip:
            if current_q_num is not None:
                questions[current_q_num] = clean_question_text(current_q_lines)
                current_q_num = None
                current_q_lines = []
            continue
            
        m = q_start_pat.match(line_strip)
        if m:
            # Save previous question
            if current_q_num is not None:
                questions[current_q_num] = clean_question_text(current_q_lines)
            
            current_q_num = int(m.group(1))
            current_q_lines = [m.group(2)]
        else:
            if current_q_num is not None:
                current_q_lines.append(line_strip)
                
    # Save the last question
    if current_q_num is not None:
        questions[current_q_num] = clean_question_text(current_q_lines)
        
    return questions

def main():
    extracted_dir = r"c:\Sagar\Projects\CBSE\byAntiGravity\scratch\extracted_science_papers"
    all_papers_questions = {}
    
    for filename in os.listdir(extracted_dir):
        if filename.endswith(".txt") and not "temp" in filename:
            filepath = os.path.join(extracted_dir, filename)
            # Parse year and set from name, e.g., 2025_31-1-1_Science.txt
            parts = filename.split("_")
            year = parts[0]
            set_name = parts[1]
            
            questions = parse_questions_from_file(filepath)
            
            # If we extracted questions, save them
            if questions:
                # Filter out sets that have 0 or very few questions (scanned files)
                if len(questions) < 5:
                    continue
                paper_id = f"{year}_{set_name}"
                all_papers_questions[paper_id] = {
                    "year": year,
                    "set": set_name,
                    "questions": questions
                }
                
    print(f"Parsed {len(all_papers_questions)} papers with questions.")
    for paper_id, data in all_papers_questions.items():
        print(f"  {paper_id}: {len(data['questions'])} questions")
        
    # Write raw questions to a json file
    with open(r"c:\Sagar\Projects\CBSE\byAntiGravity\scratch\raw_extracted_questions.json", "w", encoding="utf-8") as f:
        json.dump(all_papers_questions, f, indent=2)

if __name__ == "__main__":
    main()
