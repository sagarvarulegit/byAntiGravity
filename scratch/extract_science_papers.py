import os
import glob
from pypdf import PdfReader

def extract_pdf_to_txt(pdf_path, txt_path):
    print(f"Extracting: {os.path.basename(pdf_path)} -> {os.path.basename(txt_path)}")
    try:
        reader = PdfReader(pdf_path)
        text = ""
        for idx, page in enumerate(reader.pages):
            page_text = page.extract_text() or ""
            text += f"--- PAGE {idx+1} ---\n" + page_text + "\n"
        with open(txt_path, "w", encoding="utf-8") as f:
            f.write(text)
        return True
    except Exception as e:
        print(f"Error extracting {pdf_path}: {e}")
        return False

def main():
    base_dir = r"c:\Sagar\Projects\CBSE\byAntiGravity"
    board_exams_dir = os.path.join(base_dir, "syllabus", "BoardExams")
    output_dir = os.path.join(base_dir, "scratch", "extracted_science_papers")
    
    os.makedirs(output_dir, exist_ok=True)
    
    # Define mapping for years and their directories
    year_dirs = {
        "2024": os.path.join(board_exams_dir, "2024", "SCIENCE", "SCIENCE"),
        "2025": os.path.join(board_exams_dir, "2025", "086_Science", "086_Science"),
        "2026": os.path.join(board_exams_dir, "2026", "Science", "Science")
    }
    
    for year, folder in year_dirs.items():
        print(f"Processing year {year} in folder: {folder}")
        if not os.path.exists(folder):
            print(f"Directory {folder} does not exist!")
            continue
        
        pdf_pattern = os.path.join(folder, "*.pdf")
        pdf_files = glob.glob(pdf_pattern)
        print(f"Found {len(pdf_files)} PDF files for year {year}")
        
        for pdf_file in pdf_files:
            filename = os.path.basename(pdf_file)
            # Remove spaces and keep a clean txt name
            clean_filename = filename.replace(" ", "_").replace(".pdf", ".txt")
            txt_path = os.path.join(output_dir, f"{year}_{clean_filename}")
            if not os.path.exists(txt_path):
                extract_pdf_to_txt(pdf_file, txt_path)
            else:
                print(f"Already extracted: {txt_path}")

if __name__ == "__main__":
    main()
