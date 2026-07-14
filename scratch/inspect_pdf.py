import sys
from pypdf import PdfReader

def main():
    pdf_path = r"c:\Sagar\Projects\CBSE\byAntiGravity\syllabus\BoardExams\2024\SCIENCE\SCIENCE\31_1_1_Science.pdf"
    reader = PdfReader(pdf_path)
    print(f"Num pages: {len(reader.pages)}")
    for i in range(min(5, len(reader.pages))):
        page = reader.pages[i]
        text = page.extract_text()
        print(f"Page {i+1} text length: {len(text) if text else 0}")
        if text:
            print(f"Page {i+1} snippet: {text[:200]}")
        
        # Check images
        images = page.images
        print(f"Page {i+1} images count: {len(images)}")

if __name__ == "__main__":
    main()
