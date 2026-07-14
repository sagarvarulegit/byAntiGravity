import re

def main():
    path = "C:/Sagar/Projects/CBSE/byAntiGravity/scratch/science_2.txt"
    with open(path, "r", encoding="utf-8") as f:
        content = f.read()

    print("=== SECTIONS ===")
    sections = re.findall(r'(?:^|\n)\s*([23]\.\d+(?:\.\d+)?\s+[A-Z\s,]+)', content)
    for s in set(sections):
        print(s.strip())
        
    print("\n=== ACTIVITIES ===")
    activities = re.findall(r'(Activity\s+[23]\.\d+)', content, re.IGNORECASE)
    for a in sorted(list(set(activities))):
        print(a)
        
    print("\n=== FIGURES ===")
    figures = re.findall(r'(Figure\s+[23]\.\d+)', content, re.IGNORECASE)
    for fig in sorted(list(set(figures))):
        print(fig)
        
    print("\n=== QUESTIONS / EXERCISES ===")
    questions = re.findall(r'(Questions\b|Exercises\b)', content, re.IGNORECASE)
    print(f"Total occurrences of Questions/Exercises: {len(questions)}")

if __name__ == "__main__":
    main()
