import re

def main():
    path = "C:/Sagar/Projects/CBSE/byAntiGravity/scratch/science_2.txt"
    with open(path, "r", encoding="utf-8") as f:
        lines = f.readlines()

    print("=== SEARCHING HEADINGS AND SECTIONS ===")
    for line in lines:
        cleaned = line.strip()
        # Find lines matching typical heading pattern
        if re.search(r'^(?:2\.\d+|Activity|Figure|Questions|Exercises)\b', cleaned, re.IGNORECASE):
            print(cleaned)
        elif cleaned.startswith("--- PAGE"):
            print(cleaned)

if __name__ == "__main__":
    main()
