import pypdf
import os

pdf_path = r"C:\Sagar\Projects\CBSE\textbooks\maths\jemh102.pdf"
output_path = r"C:\Sagar\Projects\CBSE\byAntiGravity\db\math_ch2_extracted.txt"

if not os.path.exists(pdf_path):
    print(f"Error: PDF not found at {pdf_path}")
    exit(1)

print(f"Reading {pdf_path}...")
reader = pypdf.PdfReader(pdf_path)
total_pages = len(reader.pages)
print(f"Total pages: {total_pages}")

extracted_text = []
for i, page in enumerate(reader.pages):
    page_num = i + 1
    print(f"Extracting page {page_num}/{total_pages}...")
    page_text = page.extract_text()
    extracted_text.append(f"=== PAGE {page_num} ===\n{page_text}\n")

with open(output_path, "w", encoding="utf-8") as f:
    f.writelines(extracted_text)

print(f"Success! Extracted text written to {output_path}")
