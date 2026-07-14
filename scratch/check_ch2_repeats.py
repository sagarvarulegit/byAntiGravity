import json

def main():
    path = r"c:\Sagar\Projects\CBSE\byAntiGravity\scratch\board_exam_questions.json"
    with open(path, "r", encoding="utf-8") as f:
        data = json.load(f)
        
    print("Top repeated questions for Chapter 2:")
    count = 0
    for item in data:
        if item["chapter_id"] == 2:
            print(f"- Repeats: {item['repetition_count']}x, Years: {item['years']}")
            print(f"  Text: {item['question_text'][:200]}...")
            count += 1
            if count >= 10:
                break

if __name__ == "__main__":
    main()
