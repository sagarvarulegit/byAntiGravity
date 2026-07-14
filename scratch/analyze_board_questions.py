import os
import re
import json

# Define the 13 science chapters with their standard names and IDs
CHAPTERS = {
    1: "Chemical Reactions and Equations",
    2: "Acids, Bases and Salts",
    3: "Metals and Non-metals",
    4: "Carbon and its Compounds",
    5: "Life Processes",
    6: "Control and Coordination",
    7: "How do Organisms Reproduce?",
    8: "Heredity and Evolution",
    9: "Light - Reflection and Refraction",
    10: "The Human Eye and the Colorful World",
    11: "Electricity",
    12: "Magnetic Effects of Electric Current",
    13: "Our Environment"
}

# Keywords to map questions to chapters
CHAPTER_KEYWORDS = {
    1: ["reaction", "equation", "balance", "decomposition", "displacement", "redox", "oxidation", "reduction", "exothermic", "endothermic", "precipitate", "rust", "rancid", "chemical change", "combustion"],
    2: ["acid", "base", "salt", "ph", "hcl", "naoh", "bleaching powder", "baking soda", "washing soda", "plaster of paris", "gypsum", "chlor-alkali", "neutralisation", "litmus", "phenolphthalein", "dilute", "alkali", "carbonate", "hydrogen carbonate"],
    3: ["metal", "non-metal", "ionic compound", "reactivity series", "roasting", "calcination", "thermite", "metallurgy", "cinnabar", "electrolytic refining", "alloy", "galvanize", "corrosion", "amphoteric oxide"],
    4: ["carbon", "covalent bond", "tetravalency", "catenation", "homologous series", "isomer", "alkane", "alkene", "alkyne", "ethanol", "ethanoic acid", "esterification", "saponification", "soap", "detergent", "micelle", "saturated", "unsaturated"],
    5: ["photosynthesis", "stomata", "autotrophic", "heterotrophic", "digestion", "enzyme", "pepsin", "trypsin", "lipase", "salivary amylase", "respiration", "aerobic", "anaerobic", "glucose", "pyruvate", "lactic acid", "alveoli", "trachea", "circulation", "heart", "arteries", "veins", "blood", "lymph", "xylem", "phloem", "translocation", "nephron", "kidney", "excretion", "saliva", "bisexual flower"],
    6: ["neuron", "synapse", "dendrite", "axon", "reflex action", "reflex arc", "brain", "cerebrum", "cerebellum", "medulla", "pons", "hormone", "auxin", "gibberellin", "cytokinin", "abscisic acid", "insulin", "adrenaline", "thyroxine", "endocrine", "gland", "shoot", "plant hormone"],
    7: ["reproduction", "binary fission", "budding", "regeneration", "fragmentation", "spore", "rhizopus", "hydra", "vegetative propagation", "pollen", "pollination", "fertilization", "embryo", "seed", "ovary", "stigma", "anther", "stamen", "pistil", "placenta", "uterus", "contraceptive", "menstruation", "flower"],
    8: ["heredity", "variation", "monohybrid", "dihybrid", "gene", "dominant", "recessive", "f1 generation", "f2 generation", "phenotypic", "genotypic", "sex determination", "chromosome", "pea plant", "wrinkled", "yellow seeds"],
    9: ["mirror", "lens", "focal length", "reflection", "refraction", "concave", "convex", "curvature", "magnification", "lens formula", "mirror formula", "refractive index", "snell", "speed of light", "power of lens", "dioptre", "ray diagram", "optical centre"],
    10: ["human eye", "cornea", "pupil", "iris", "ciliary muscle", "retina", "accommodation", "myopia", "hypermetropia", "presbyopia", "cataract", "prism", "dispersion", "spectrum", "rainbow", "atmospheric refraction", "star", "twinkling", "scattering", "tyndall", "blue sky"],
    11: ["electric current", "charge", "potential difference", "volt", "ampere", "ohm", "resistance", "resistivity", "series", "parallel", "joule", "heating effect", "electric fuse", "electric power", "watt", "kwh", "resistor"],
    12: ["magnetic field", "field lines", "compass", "solenoid", "electromagnet", "fleming", "left hand rule", "right hand rule", "domestic circuit", "live wire", "neutral wire", "earth wire", "short circuit", "overloading", "fuse"],
    13: ["environment", "ecosystem", "biotic", "abiotic", "food chain", "food web", "trophic level", "ten percent law", "10%", "biomagnification", "ozone layer", "depletion", "cfc", "biodegradable", "non-biodegradable", "waste", "pesticides"]
}

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
        # Skip header/footer/page details
        if line_strip.startswith("--- PAGE") or "*ECNEICS*" in line_strip or "*31/" in line_strip:
            continue
        if line_strip.startswith("Series :") or line_strip.startswith("Q.P. Code") or "Candidates must write" in line_strip:
            continue
        cleaned.append(line_strip)
    
    text = " ".join(cleaned)
    # Clean multiple spaces
    text = re.sub(r'\s+', ' ', text)
    return text.strip()

def parse_questions_from_file(filepath):
    with open(filepath, "r", encoding="utf-8") as f:
        lines = f.readlines()
        
    questions = {}
    current_q_num = None
    current_q_lines = []
    
    q_start_pat = re.compile(r'^([1-9][0-9]*)\.\s+(.*)')
    
    for line in lines:
        line_strip = line.strip()
        
        if "SECTION" in line_strip:
            if current_q_num is not None:
                questions[current_q_num] = clean_question_text(current_q_lines)
                current_q_num = None
                current_q_lines = []
            continue
            
        m = q_start_pat.match(line_strip)
        if m:
            if current_q_num is not None:
                questions[current_q_num] = clean_question_text(current_q_lines)
            current_q_num = int(m.group(1))
            current_q_lines = [m.group(2)]
        else:
            if current_q_num is not None:
                current_q_lines.append(line_strip)
                
    if current_q_num is not None:
        questions[current_q_num] = clean_question_text(current_q_lines)
        
    return questions

def get_words(text):
    # Convert to lowercase and get alphanumeric words
    words = re.findall(r'\b[a-z]{3,}\b', text.lower())
    # Filter out common stop words
    stopwords = {"the", "and", "for", "with", "from", "that", "this", "these", "those", "are", "was", "were", "been", "have", "has", "had", "does", "did", "can", "could", "should", "would", "which", "what", "when", "where", "who", "why", "how", "each", "other", "some", "any", "out", "into", "upon", "about", "above", "below", "between", "among"}
    return [w for w in words if w not in stopwords]

def classify_chapter(text):
    words = get_words(text)
    scores = {ch_id: 0 for ch_id in CHAPTERS}
    
    # Calculate score based on keyword matches
    for ch_id, keywords in CHAPTER_KEYWORDS.items():
        for keyword in keywords:
            # Check for exact keyword or sub-phrase match
            count = text.lower().count(keyword.lower())
            scores[ch_id] += count * 2
            
    best_ch = max(scores, key=scores.get)
    if scores[best_ch] == 0:
        # Default or fallback based on some broad patterns
        if any(w in words for w in ["current", "circuit", "ohm", "resistance", "volt", "power", "fuse"]):
            return 11
        if any(w in words for w in ["mirror", "lens", "light", "refraction", "reflection"]):
            return 9
        if any(w in words for w in ["acid", "base", "salt", "ph"]):
            return 2
        return 5  # Default to Life Processes (broad bio)
        
    return best_ch

def get_marks_from_text(text, q_num):
    # Try to find marks at the end of the text
    # e.g., "... environment. 2" or "... environment. [2]" or "... environment. (3)"
    m = re.search(r'\b([1-5])\s*(?:marks?|marks?\]|\]|\)|\b)?\s*$', text)
    if m:
        return int(m.group(1))
    
    # Section default fallback marks
    if 1 <= q_num <= 20:
        return 1
    elif 21 <= q_num <= 26:
        return 2
    elif 27 <= q_num <= 33:
        return 3
    elif 34 <= q_num <= 36:
        return 5
    elif 37 <= q_num <= 39:
        return 4
    return 1

def jaccard_similarity(text1, text2):
    words1 = set(get_words(text1))
    words2 = set(get_words(text2))
    if not words1 or not words2:
        return 0.0
    return len(words1 & words2) / len(words1 | words2)

def main():
    extracted_dir = r"c:\Sagar\Projects\CBSE\byAntiGravity\scratch\extracted_science_papers"
    all_questions = []
    
    # 1. Parse all files and gather all questions
    for filename in os.listdir(extracted_dir):
        if filename.endswith(".txt") and not "temp" in filename:
            filepath = os.path.join(extracted_dir, filename)
            # Clean filename to identify year and paper/set
            paper_id = filename.replace(".txt", "")
            
            # Extract year
            year_match = re.match(r'^(\d{4})', paper_id)
            year = year_match.group(1) if year_match else "Unknown"
            
            questions = parse_questions_from_file(filepath)
            if len(questions) < 5:
                continue # Skip scanned papers with very few questions
                
            for q_num, q_text in questions.items():
                if not q_text.strip():
                    continue
                marks = get_marks_from_text(q_text, q_num)
                ch_id = classify_chapter(q_text)
                
                all_questions.append({
                    "paper_id": paper_id,
                    "year": year,
                    "q_num": q_num,
                    "text": q_text,
                    "marks": marks,
                    "chapter_id": ch_id,
                    "chapter_title": CHAPTERS[ch_id]
                })

    print(f"Extracted {len(all_questions)} total questions from text-based papers.")
    
    # 2. Group similar questions across papers
    # We will use Jaccard similarity and overlapping fields.
    groups = []
    
    for q in all_questions:
        matched = False
        # Compare with existing groups
        for g in groups:
            # We check similarity with the representative question in the group
            rep = g["representative"]
            # They must be in the same chapter to be grouped
            if q["chapter_id"] != rep["chapter_id"]:
                continue
                
            sim = jaccard_similarity(q["text"], rep["text"])
            
            # If similarity is high, they are similar questions
            # Threshold: 0.38 for MCQ (q_num <= 20) and 0.40 for descriptive questions
            threshold = 0.38 if q["q_num"] <= 20 else 0.40
            
            if sim >= threshold:
                g["occurrences"].append(q)
                matched = True
                break
                
        if not matched:
            groups.append({
                "representative": q,
                "occurrences": [q]
            })
            
    print(f"Grouped into {len(groups)} unique questions/topics.")
    
    # 3. Process groups to extract repeats
    repeated_topics = []
    for g in groups:
        rep = g["representative"]
        occs = g["occurrences"]
        
        # Count unique years
        years = sorted(list(set([o["year"] for o in occs])))
        repetition_count = len(occs)
        
        # Representative text (take the cleanest/longest text)
        best_text = max([o["text"] for o in occs], key=len)
        
        # Average/common marks
        marks_list = [o["marks"] for o in occs]
        common_marks = max(set(marks_list), key=marks_list.count)
        
        repeated_topics.append({
            "chapter_id": rep["chapter_id"],
            "chapter_title": rep["chapter_title"],
            "question_text": best_text,
            "marks": common_marks,
            "years": years,
            "years_count": len(years),
            "repetition_count": repetition_count,
            "appearances": [{"paper_id": o["paper_id"], "year": o["year"], "q_num": o["q_num"]} for o in occs]
        })
        
    # Sort topics by repetition count descending
    repeated_topics.sort(key=lambda x: x["repetition_count"], reverse=True)
    
    # 4. Save results to JSON
    output_json = r"c:\Sagar\Projects\CBSE\byAntiGravity\scratch\board_exam_questions.json"
    with open(output_json, "w", encoding="utf-8") as f:
        json.dump(repeated_topics, f, indent=2)
    print(f"Saved grouped questions to {output_json}")
    
    # 5. Generate a Markdown Report
    output_md = r"c:\Sagar\Projects\CBSE\byAntiGravity\docs\CBSE_BOARD_EXAM_ANALYSIS.md"
    
    md_lines = [
        "# CBSE Class 10 Science Board Exam Analysis (2024–2026)",
        "",
        "This analysis parses the Board Exam papers for Class 10 Science (from 2024, 2025, and 2026) to identify recurring questions, core topics, and their weightage. We have grouped similar questions across different years and sets to find which topics are repeated most often.",
        "",
        "## Key Statistics",
        f"- **Total extracted questions:** {len(all_questions)}",
        f"- **Unique question groups:** {len(groups)}",
        f"- **Highly repeated topics (repeated >= 3 times):** {len([t for t in repeated_topics if t['repetition_count'] >= 3])}",
        "",
        "---",
        "",
        "## Top Repeated Board Exam Questions",
        "",
        "Below is a list of questions/topics that have appeared **3 or more times** in the board exams between 2024 and 2026.",
        ""
    ]
    
    count = 1
    for t in repeated_topics:
        if t["repetition_count"] < 3:
            continue
            
        md_lines.extend([
            f"### {count}. [Chapter {t['chapter_id']}] {t['chapter_title']}",
            f"- **Question/Concept:** {t['question_text']}",
            f"- **Marks:** {t['marks']}",
            f"- **Repeated:** **{t['repetition_count']} times** across sets in years: {', '.join(t['years'])}",
            f"- **Total Unique Years:** {t['years_count']}",
            ""
        ])
        count += 1
        
    # Chapter-wise breakdown
    md_lines.extend([
        "---",
        "",
        "## Chapter-wise Distribution of Questions",
        "",
        "This section shows how many questions from each chapter appeared in the board exam papers.",
        "",
        "| Chapter ID | Chapter Name | Total Questions | Repeated Questions (>= 3 times) |",
        "|---|---|---|---|"
    ])
    
    for ch_id in sorted(CHAPTERS.keys()):
        ch_title = CHAPTERS[ch_id]
        total_ch_q = len([q for q in all_questions if q["chapter_id"] == ch_id])
        repeated_ch_q = len([t for t in repeated_topics if t["chapter_id"] == ch_id and t["repetition_count"] >= 3])
        md_lines.append(f"| {ch_id} | {ch_title} | {total_ch_q} | {repeated_ch_q} |")
        
    with open(output_md, "w", encoding="utf-8") as f:
        f.write("\n".join(md_lines))
        
    print(f"Generated Markdown report at {output_md}")

if __name__ == "__main__":
    main()
