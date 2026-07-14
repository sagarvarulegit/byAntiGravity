import sys
from pypdf import PdfReader

def main():
    pdf_path = "C:/Sagar/Projects/CBSE/textbooks/science/extracted/jesc102.pdf"
    output_path = "C:/Sagar/Projects/CBSE/byAntiGravity/scratch/science_2.txt"
    
    print(f"Reading {pdf_path}...")
    reader = PdfReader(pdf_path)
    text = ""
    for idx, page in enumerate(reader.pages):
        page_text = page.extract_text() or ""
        text += f"--- PAGE {idx+1} ---\n" + page_text + "\n"
    
    with open(output_path, "w", encoding="utf-8") as f:
        f.write(text)
    
    print(f"Successfully extracted {len(text)} characters to {output_path}")

if __name__ == "__main__":
    main()
