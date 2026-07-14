import re

def main():
    path = "C:/Sagar/Projects/CBSE/byAntiGravity/scratch/science_2.txt"
    with open(path, "r", encoding="utf-8") as f:
        content = f.read()

    # Search for all occurrences of "QUESTIONS"
    matches = list(re.finditer(r'\bQUESTIONS\b', content))
    print(f"Found {len(matches)} QUESTIONS blocks.")
    
    for idx, match in enumerate(matches):
        start = match.start()
        # Grab about 1200 characters after each match
        segment = content[start:start+1200]
        print(f"\n--- QUESTIONS BLOCK {idx+1} (Around character {start}) ---")
        print(segment)
        print("-" * 40)

if __name__ == "__main__":
    main()
