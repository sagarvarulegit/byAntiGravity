import os
from pypdf import PdfReader

def main():
    folder = r"c:\Sagar\Projects\CBSE\byAntiGravity\syllabus\BoardExams\2024\SCIENCE (1)"
    for filename in os.listdir(folder):
        if filename.endswith(".pdf"):
            path = os.path.join(folder, filename)
            reader = PdfReader(path)
            total_text_len = 0
            for page in reader.pages:
                text = page.extract_text()
                if text:
                    total_text_len += len(text)
            print(f"{filename}: pages={len(reader.pages)}, extracted text length={total_text_len}")

if __name__ == "__main__":
    main()
