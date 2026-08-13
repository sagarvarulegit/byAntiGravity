# Sample Test Exam Paper Generator — Implementation Plan

**Date:** 2026-08-13
**Target:** CBSE Class 10 Learning Portal (`byAntiGravity`)
**Stack:** Flutter (client) + Supabase/PostgreSQL (backend) + LLM API (generation + verification)
**Status:** PLAN ONLY — no code changes yet

---

## 1. Problem Statement

Students need unlimited, board-realistic practice papers to prepare for CBSE Class 10 exams. Today the platform has chapter notes, videos, and short quizzes — but no full-length exam paper generation. The goal is a feature that:

- Generates **unlimited** 80-mark mock board papers for any CBSE Class 10 subject
- Uses **previous-year CBSE board papers** + **NCERT textbook content** as source material
- Runs **AI verification** on every generated paper before showing it to the student
- Produces papers that are structurally identical to real CBSE board papers

---

## 2. Current State (What Exists)

| Component | Status |
|-----------|--------|
| `subjects` table | ✅ Exists (MATH10, SCI10, SST10, ENG10, HIN10) |
| `chapters` table | ✅ Exists with sequence numbers |
| NCERT extracted text | ✅ Available in `cbse_class10_textbooks/extracted_text/` |
| Chapter notes (seed SQL) | ✅ Exists in `db/seed_notes_*.sql` |
| Quizzes (5-question) | ✅ Exists in `db/seed_chapters_*.sql` |
| Question bank | ❌ **Does not exist** — no `question_bank` table, no tagged questions |
| Paper blueprints | ❌ Does not exist |
| Board audit | ✅ Done in prior session — chapter/topic/type coverage matrix exists |
| PDF export | ❌ Does not exist |
| Previous-year papers | ⚠️ Raw PDFs may exist; no structured extraction done |

**Critical gap:** The entire question bank must be built from scratch. This is the single largest prerequisite.

---

## 3. Product Definition

### What "Unlimited" Means

Not unlimited AI generation (that's expensive and unreliable). Instead:

1. **Finite curated bank** (~5,000–6,000 tagged questions from PYQs + NCERT)
2. **Deterministic selection engine** (blueprint-based, seeded randomization)
3. **AI variant generation** (create new versions of approved questions — different numbers, names, contexts)
4. **Same seed = same paper** (reproducible for teachers reviewing student work)

### Subjects (MVP)

| Subject | Code | Paper Type | Marks | Duration |
|---------|------|-----------|-------|----------|
| Mathematics Standard | MATH10 | Full board paper | 80 | 3 hours |
| Science | SCI10 | Full board paper | 80 | 3 hours |
| Social Science | SST10 | Full board paper | 80 | 3 hours |
| English Language & Literature | ENG10 | Full board paper | 80 | 3 hours |
| Hindi Course A | HIN10 | Full board paper | 80 | 3 hours |

### Generation Modes

| Mode | Description | Reliability | Cost |
|------|-------------|-------------|------|
| **Curated** | Select reviewed questions from bank | ★★★★★ | Free |
| **Variant** | AI creates new version of approved question (different values) | ★★★★ | Low |
| **New** | AI generates entirely new question from NCERT content | ★★★ | Medium |

**Initial mix:** 70% curated / 25% variant / 5% new → shift as bank grows.

---

## 4. Data Model (New Tables)

All tables extend the existing PostgreSQL schema. UUIDs via `uuid-ossp`.

### 4.1 `question_bank` — The Core Asset

```sql
CREATE TABLE question_bank (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    subject_id UUID NOT NULL REFERENCES subjects(id),
    chapter_id UUID REFERENCES chapters(id),
    topic VARCHAR(200) NOT NULL,
    question_text TEXT NOT NULL,
    question_type VARCHAR(30) NOT NULL,
    -- MCQ, ASSERTION_REASON, VSA_1, SA_2, SA_3, LA_5,
    -- CASE_STUDY, SOURCE_BASED, MAP_BASED, DIAGRAM,
    -- NUMERICAL, PROOF, GRAMMAR, READING_COMP, WRITING_TASK
    marks INT NOT NULL CHECK (marks IN (1, 2, 3, 4, 5)),
    difficulty VARCHAR(10) NOT NULL DEFAULT 'medium',
    -- easy, medium, hard
    bloom_level VARCHAR(20),
    -- remember, understand, apply, analyze, evaluate, create

    -- Source tracking
    source_type VARCHAR(20) NOT NULL,
    -- 'pyq', 'ncert_exercise', 'ncert_example', 'ncert_exemplar',
    -- 'sample_paper', 'ai_variant', 'ai_new'
    source_year INT,           -- e.g. 2025 (for PYQs)
    source_set VARCHAR(10),    -- e.g. '30/1/1' (CBSE set code)
    ncert_reference VARCHAR(100), -- e.g. 'Ch12 Ex 12.3 Q4'

    -- Answer content
    answer TEXT,               -- correct answer / model answer
    marking_scheme TEXT,       -- CBSE step-marking breakdown
    solution_explanation TEXT, -- detailed solution for student review
    common_mistakes TEXT,      -- what students typically get wrong

    -- For MCQ / assertion-reason
    options JSONB,             -- [{"label":"A","text":"...","is_correct":true}, ...]

    -- Quality & lifecycle
    is_verified BOOLEAN DEFAULT false,
    verification_details JSONB,
    usage_count INT DEFAULT 0,
    tags TEXT[],
    language VARCHAR(10) DEFAULT 'en',  -- 'en', 'hi', 'bn', etc.

    -- Asset references
    diagram_url VARCHAR(500),  -- if question has a diagram
    passage_text TEXT,         -- for reading comp / source-based

    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_qb_subject_chapter ON question_bank(subject_id, chapter_id);
CREATE INDEX idx_qb_type_marks ON question_bank(question_type, marks);
CREATE INDEX idx_qb_source ON question_bank(source_type, source_year);
CREATE INDEX idx_qb_subject_type_marks_diff ON question_bank(subject_id, question_type, marks, difficulty);
```

### 4.2 `paper_blueprints` — CBSE Paper Structure

```sql
CREATE TABLE paper_blueprints (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    subject_id UUID NOT NULL REFERENCES subjects(id),
    name VARCHAR(100) NOT NULL,        -- 'Mathematics Standard 2025-26'
    academic_session VARCHAR(20) NOT NULL, -- '2025-26'
    total_marks INT NOT NULL DEFAULT 80,
    duration_minutes INT NOT NULL DEFAULT 180,
    sections JSONB NOT NULL,           -- see structure below
    chapter_distribution JSONB NOT NULL, -- marks per chapter
    difficulty_targets JSONB,           -- {"easy":0.25,"medium":0.55,"hard":0.20}
    instructions TEXT,                  -- standard board instructions
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
```

**`sections` JSONB structure:**
```json
[
  {
    "id": "A",
    "name": "Section A",
    "question_count": 20,
    "marks_each": 1,
    "total_marks": 20,
    "allowed_types": ["MCQ", "ASSERTION_REASON", "FILL_BLANK"],
    "compulsory": true,
    "internal_choice": false
  },
  {
    "id": "B",
    "name": "Section B",
    "question_count": 5,
    "marks_each": 2,
    "total_marks": 10,
    "allowed_types": ["SA_2"],
    "compulsory": true,
    "internal_choice": false
  },
  {
    "id": "C",
    "name": "Section C",
    "question_count": 6,
    "marks_each": 3,
    "total_marks": 18,
    "allowed_types": ["SA_3", "NUMERICAL"],
    "compulsory": true,
    "internal_choice": false
  },
  {
    "id": "D",
    "name": "Section D",
    "question_count": 4,
    "marks_each": 5,
    "total_marks": 20,
    "allowed_types": ["LA_5", "PROOF"],
    "compulsory": true,
    "internal_choice": true
  },
  {
    "id": "E",
    "name": "Section E",
    "question_count": 3,
    "marks_each": 4,
    "total_marks": 12,
    "allowed_types": ["CASE_STUDY"],
    "compulsory": true,
    "internal_choice": false
  }
]
```

> **Note:** The actual section structure must be derived from the audited 2025-26 CBSE sample papers per subject. Math example above; Science/SST/English/Hindi differ.

### 4.3 `generated_test_papers` — Immutable Paper Snapshots

```sql
CREATE TABLE generated_test_papers (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id),
    blueprint_id UUID NOT NULL REFERENCES paper_blueprints(id),
    title VARCHAR(200) NOT NULL,
    status VARCHAR(20) DEFAULT 'generating',
    -- generating, verifying, approved, rejected, published, archived
    total_marks INT NOT NULL,
    duration_minutes INT NOT NULL,
    generation_seed BIGINT NOT NULL,    -- for reproducibility
    generation_params JSONB,            -- difficulty_mix, chapter_filter, etc.
    paper_content JSONB NOT NULL,       -- full paper snapshot (see 4.5)
    marking_scheme JSONB,               -- full marking scheme
    verification_report JSONB,          -- AI verification result
    verified_at TIMESTAMPTZ,
    pdf_url VARCHAR(500),               -- generated PDF
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_gtp_user ON generated_test_papers(user_id, created_at DESC);
CREATE INDEX idx_gtp_status ON generated_test_papers(status);
```

**Key design decision:** `paper_content` is an **immutable snapshot**. It copies question text, options, answers, and marking schemes at generation time. If a question in `question_bank` is later edited, existing papers are unaffected.

### 4.4 `student_attempts` — Exam Attempts

```sql
CREATE TABLE student_attempts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id),
    paper_id UUID NOT NULL REFERENCES generated_test_papers(id),
    status VARCHAR(20) DEFAULT 'in_progress',
    -- in_progress, submitted, evaluated
    started_at TIMESTAMPTZ DEFAULT NOW(),
    submitted_at TIMESTAMPTZ,
    total_score NUMERIC(5,2),
    section_scores JSONB,
    chapter_scores JSONB,
    time_per_question JSONB,    -- {question_id: seconds_spent}
    answers JSONB,              -- {question_id: student_answer_text}
    evaluated_answers JSONB     -- {question_id: {score, feedback, correct}}
);
```

### 4.5 `question_usage_log` — Prevent Repetition

```sql
CREATE TABLE question_usage_log (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id),
    question_id UUID NOT NULL REFERENCES question_bank(id),
    paper_id UUID NOT NULL REFERENCES generated_test_papers(id),
    used_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_qul_user_recent ON question_usage_log(user_id, used_at DESC);
```

This enables the generator to exclude questions the student has seen in their last N papers (configurable, default 10).

---

## 5. Question Bank Population Pipeline

This is the **critical path** — nothing works without a tagged question bank.

### 5.1 Source Inventory

| Source | Estimated Questions | Status |
|--------|-------------------|--------|
| CBSE PYQ Papers 2019–2026 (all sets) | ~2,500 | Raw PDFs — needs extraction |
| NCERT In-text + End-of-chapter exercises | ~2,000 | Text available in `extracted_text/` |
| NCERT Exemplar Problems | ~500 | Needs sourcing |
| CBSE Sample Papers 2023–2026 | ~500 | Raw PDFs — needs extraction |
| CBSE Official Marking Schemes | N/A (pairs with PYQs) | Raw PDFs |
| **Total curated target** | **~5,500** | |

### 5.2 Extraction Pipeline (4 stages)

```
┌─────────────┐    ┌──────────────┐    ┌──────────────┐    ┌─────────────┐
│  Raw PDFs   │───▶│  Parse +     │───▶│  LLM-assisted│───▶│  Store in   │
│  + NCERT    │    │  Split into  │    │  classify:   │    │  question_  │
│  text files │    │  individual  │    │  chapter,    │    │  bank with  │
│             │    │  questions   │    │  topic, type │    │  verification│
└─────────────┘    └──────────────┘    └──────────────┘    └─────────────┘
```

**Stage 1 — Parse:**
- NCERT text: Use `extracted_text/` files (already done for notes). Split exercises into individual questions.
- PYQ PDFs: Use `marker` or `pymupdf` for text extraction. Tables and diagrams need special handling.

**Stage 2 — Split:**
- Separate into individual questions
- For case-studies: extract passage + sub-questions as one unit
- For diagram questions: extract question text + diagram reference

**Stage 3 — Classify (LLM-assisted):**
- Subject → chapter → topic mapping
- Question type detection
- Marks extraction
- Difficulty estimation
- Bloom's taxonomy level
- For PYQs: year, set code extraction from header

**Stage 4 — Store + Verify:**
- Write to `question_bank` with `is_verified = false`
- Run LLM verification on answer correctness
- Flag for human spot-check (10% random sample minimum)
- Mark `is_verified = true` only after passing

### 5.3 Subject-Specific Extraction Challenges

| Subject | Challenge | Approach |
|---------|-----------|----------|
| **Mathematics** | Equations, diagrams, coordinate geometry | Store as LaTeX/text; diagram URLs |
| **Science** | Chemical equations, circuit diagrams, ray diagrams | Balance-check equations; image assets |
| **Social Science** | Map questions, source-based passages, timeline | Map coordinates; passage text extraction |
| **English** | Reading passages, grammar rules, writing formats | Passage extraction; rubric storage |
| **Hindi** | Devanagari text, grammar, literature passages | UTF-8 encoding; separate font handling |

### 5.4 Phase 1 Priority (MVP Question Bank)

Start with **Mathematics** and **Science** — they have the most structured questions and the fewest extraction challenges.

- **Math Ch 1–5:** ~300 questions (Real Numbers, Polynomials, Pair of Linear Equations, Quadratic Equations, Arithmetic Progressions)
- **Science Ch 1–5:** ~300 questions (Chemical Reactions, Acids Bases Salts, Metals Non-metals, Carbon Compounds, Life Processes)

This gives ~600 questions to prototype the generation engine with.

---

## 6. Paper Generation Engine

### 6.1 Algorithm

```
INPUT: user_id, subject_id, blueprint_id, params {chapter_filter?, difficulty_mix?, seed?}

1. LOAD BLUEPRINT
   → sections[], chapter_distribution, difficulty_targets

2. BUILD CANDIDATE POOL
   For each (section × marks × allowed_type):
     → Query question_bank WHERE subject AND marks AND type match
     → EXCLUDE questions in user's question_usage_log (last N papers)
     → WEIGHT by: (1 / usage_count) × difficulty_match × freshness
     → Result: candidate_set[section_i]

3. SELECT QUESTIONS (Greedy with backtracking)
   For each section:
     → Pick questions to fill marks_total exactly
     → Respect chapter_distribution (blueprint)
     → Respect difficulty_targets
     → No duplicates within the paper
     → If internal_choice: select N+1, mark as "attempt any N"

4. GENERATE VARIANTS (if candidate pool insufficient)
   → For gaps: pick closest existing question
   → Call LLM: "Create a new question of same type, marks, difficulty, topic"
   → Require structured JSON output: question, answer, marking_scheme
   → Add to selection with source_type = 'ai_variant'

5. ASSEMBLE PAPER
   → Compile questions into sections
   → Add instructions page (from blueprint)
   → Generate marking scheme
   → Set generation_seed for reproducibility

6. PERSIST
   → INSERT into generated_test_papers (immutable snapshot)
   → INSERT into question_usage_log for each question
   → Update question_bank.usage_count
   → Set status = 'draft'

7. TRIGGER VERIFICATION (async)
```

### 6.2 Configuration Knobs

Students can customize:

| Parameter | Default | Options |
|-----------|---------|---------|
| Paper type | Full board mock | Full mock, Half syllabus, Chapter-wise, Unit test |
| Chapters | All | Select specific chapters |
| Difficulty | Board-style mix | Easy (70/20/10), Medium (25/55/20), Hard (10/30/60) |
| PYQ ratio | 40% | 0–100% |
| Avoid recently used | Yes | On/Off |
| Include internal choice | Yes | On/Off |
| Seed | Random | Any integer (for reproducibility) |

### 6.3 Technical Implementation

- **Service:** Python async service (FastAPI or Supabase Edge Function)
- **Question selection:** SQL query with weighted random (`ORDER BY RANDOM() * weight`) + greedy constraint satisfaction
- **Variant generation:** LLM API call with structured output (JSON mode)
- **Async job:** Use Supabase `pg_cron` + Edge Functions, or a simple Python worker polling `generation_queue` table
- **Timeout:** Max 60 seconds for curated-only; max 3 minutes with variant generation

---

## 7. AI Verification Pipeline

Every generated paper passes through a **mandatory verification gate** before becoming visible to the student.

### 7.1 Two-Layer Verification

```
Layer 1: DETERMINISTIC (no AI, instant, 100% reliable)
    ↓ all pass
Layer 2: LLM-AS-JUDGE (AI, ~10-30s per paper, ~95% reliable)
    ↓ all pass
PAPER PUBLISHED
```

### 7.2 Layer 1 — Deterministic Checks

| Check | Pass Criteria |
|-------|---------------|
| **Total marks** | Sum of all question marks = blueprint total |
| **Section marks** | Each section total matches blueprint |
| **Question count** | Each section has correct count |
| **No duplicate IDs** | No question appears twice |
| **No duplicate text** | Cosine similarity < 0.85 between any two questions |
| **Subject alignment** | All questions belong to selected subject |
| **Chapter coverage** | All blueprint chapters represented |
| **Internal choice marks** | Choice groups mark correctly |
| **MCQ validity** | Exactly one correct option per MCQ |
| **Units present** | Numerical answers include units |
| **Language consistency** | All questions in same language |

### 7.3 Layer 2 — LLM-as-Judge

Single LLM call with structured rubric:

```
SYSTEM: You are a CBSE board exam paper reviewer. Evaluate this generated paper.

RUBRIC:
1. Blueprint compliance — marks, sections, question types match
2. Answer correctness — every answer/marking scheme is factually correct
3. Syllabus alignment — no out-of-syllabus content
4. Question clarity — no ambiguous, misleading, or incomplete stems
5. Difficulty calibration — difficulty labels are accurate
6. CBSE style — questions follow board exam phrasing conventions
7. Age appropriateness — content suitable for Class 10

OUTPUT (JSON):
{
  "verdict": "approve" | "reject" | "needs_review",
  "overall_score": 0.0-1.0,
  "checks": {
    "blueprint_compliance": {"status": "pass"|"fail", "details": "..."},
    "answer_correctness": {"status": "pass"|"fail", "details": "..."},
    "syllabus_alignment": {"status": "pass"|"fail", "details": "..."},
    "question_clarity": {"status": "pass"|"fail", "details": "..."},
    "difficulty_calibration": {"status": "pass"|"fail", "details": "..."},
    "cbse_style": {"status": "pass"|"fail", "details": "..."}
  },
  "question_issues": [
    {"question_index": 5, "issue": "...", "severity": "warning"|"error"}
  ]
}
```

### 7.4 Gating Policy

| Verdict | Action |
|---------|--------|
| `approve` (all pass, score ≥ 0.8) | Publish paper, set `status = 'approved'` |
| `needs_review` (warnings only) | Publish with warning flags, set `status = 'approved'` with notes |
| `reject` (any fail) | Discard paper, regenerate with different seed. After 3 rejects, escalate to human queue |

### 7.5 Subject-Specific Verification

| Subject | Special Checks |
|---------|---------------|
| **Math** | Verify numerical answers with `sympy`; check equation balancing; verify coordinate geometry |
| **Science** | Verify chemical equations balanced; check unit consistency; verify biological terms |
| **SST** | Verify dates, names, places against reference DB; check map locations |
| **English** | Verify grammar rules; check passage word counts; validate writing format |
| **Hindi** | Verify Devanagari rendering; check grammar rules; validate literary references |

---

## 8. Student Experience (Flutter Screens)

### Screen Flow

```
┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│  Generator   │────▶│  Configure   │────▶│  Generating  │
│  Home        │     │  Paper       │     │  (loading)   │
│  (subjects)  │     │  (options)   │     │              │
└──────────────┘     └──────────────┘     └──────┬───────┘
                                                  │
                     ┌──────────────┐     ┌──────▼───────┐
                     │  Results &   │◀────│  Exam Paper  │
                     │  Analysis    │     │  View        │
                     │              │     │  (timer)     │
                     └──────────────┘     └──────────────┘
```

### Key Screens

1. **Generator Home** — Subject cards with "Generate Paper" CTA; history of past papers with scores
2. **Configuration** — Paper type, chapters, difficulty, PYQ ratio, internal choice toggle
3. **Generating** — Animated loading with "AI verifying your paper..." message (30-60s)
4. **Exam View** — Full paper layout with timer, section navigation, question status indicators, autosave
5. **Results** — Score breakdown (section-wise, chapter-wise), question-level review with marking scheme
6. **History** — All past papers with scores, dates, ability to re-attempt or export

### Exam Modes

| Mode | Description |
|------|-------------|
| **Timed Exam** | Full board simulation — 3-hour timer, no peeking at answers |
| **Practice** | No timer, instant answer reveal per question |
| **Review** | See completed paper with marking scheme and explanations |

---

## 9. PDF Export

Generated papers should be exportable as professional CBSE-format PDFs:

- **Cover page:** Subject, time allowed, maximum marks, general instructions
- **Section layout:** Question numbers, marks in brackets, proper spacing
- **Diagram embedding:** Inline diagram images
- **Answer key:** Separate section at the end
- **Marking scheme:** Step-by-step marks allocation
- **Watermark:** "Practice Paper — Generated by [Platform Name]"

**Implementation:** Python `reportlab` or `weasyprint` service. Generate PDF on demand and cache the URL.

---

## 10. Phased Delivery

### Phase 0 — Schema & Blueprints (Week 1)
- [ ] Create migration: `question_bank`, `paper_blueprints`, `generated_test_papers`, `student_attempts`, `question_usage_log`
- [ ] Define blueprints for Mathematics Standard and Science (from 2025-26 CBSE sample papers)
- [ ] Register migration in Supabase

### Phase 1 — Question Bank Foundation (Weeks 2–5)
- [ ] Build NCERT extraction script (from `extracted_text/` → structured questions)
- [ ] Build PYQ PDF extraction script (from PDFs → structured questions)
- [ ] Extract Math Chapters 1–5 (~300 questions)
- [ ] Extract Science Chapters 1–5 (~300 questions)
- [ ] LLM-classify each question: chapter, topic, type, marks, difficulty
- [ ] Human spot-check: 10% random sample
- [ ] Write to `question_bank` seed SQL

### Phase 2 — Deterministic Generation Engine (Weeks 5–7)
- [ ] Implement blueprint loader
- [ ] Implement question selection with weighted randomization
- [ ] Implement chapter/difficulty distribution constraints
- [ ] Implement duplicate avoidance (usage log)
- [ ] Implement paper snapshot persistence
- [ ] Test: generate 50 Math papers, verify structure manually

### Phase 3 — AI Verification (Weeks 7–9)
- [ ] Implement deterministic checks (Layer 1)
- [ ] Implement LLM-as-judge verification (Layer 2)
- [ ] Implement gating logic (approve/reject/needs_review)
- [ ] Test: run 50 papers through verification, measure accuracy

### Phase 4 — Variant Generation (Weeks 9–11)
- [ ] Implement LLM variant generation for gap-filling
- [ ] Implement structured output parsing (JSON mode)
- [ ] Add variants to verification pipeline
- [ ] Test: generate 50 papers with variants, verify quality

### Phase 5 — Flutter UI (Weeks 11–14)
- [ ] Generator Home screen
- [ ] Configuration screen
- [ ] Exam View with timer and autosave
- [ ] Results and analysis screen
- [ ] History screen
- [ ] API integration

### Phase 6 — PDF Export + Polish (Weeks 14–16)
- [ ] PDF generation service
- [ ] CBSE-format template
- [ ] Answer key and marking scheme
- [ ] Download and share

### Phase 7 — Scale to All Subjects (Weeks 16–20)
- [ ] Expand question bank to all 5 subjects (full chapters)
- [ ] Define blueprints for SST, English, Hindi
- [ ] Subject-specific extraction challenges (maps, passages, Devanagari)
- [ ] Subject-specific verification rules

---

## 11. Risks & Mitigations

| Risk | Impact | Mitigation |
|------|--------|------------|
| **Question bank too small** — "unlimited" papers feel repetitive | High | Target 5,500+ curated questions; use variant generation; track per-user exposure |
| **AI-generated answers are wrong** — especially Math numericals and Science facts | High | Two-layer verification; sympy for Math; reference DB for SST facts; human spot-check |
| **PYQ PDF extraction errors** — tables, diagrams, Hindi text misread | Medium | Use `marker`/`pymupdf` for extraction; manual review of 10% sample; store raw + parsed |
| **CBSE blueprint changes** — paper format changes year to year | Medium | Version blueprints by academic session; update annually; store historical blueprints |
| **Copyright on PYQ content** — redistribution restrictions | Medium | Track source provenance; label questions as official/adapted/generated; avoid presenting raw PYQs in exports |
| **LLM cost for verification** — each paper needs AI verification | Medium | Cache verified paper templates; use smaller models for classification; batch verification |
| **Diagram/map questions** — can't be purely text-based | Medium | Phase 1: exclude diagram questions; Phase 3+: add image asset pipeline |
| **Hindi text rendering** — Devanagari in PDFs and Flutter | Low | Test early; use Noto Sans Devanagari; UTF-8 throughout |
| **PostgreSQL vs SQLite confusion** | Low | This plan targets PostgreSQL/Supabase exclusively (matching existing schema) |

---

## 12. Cost Estimate (AI Calls)

| Operation | Model | Calls per Paper | Est. Cost |
|-----------|-------|-----------------|-----------|
| Variant generation (25% of questions) | GPT-4o-mini | ~5-8 calls | ~$0.01 |
| Verification (Layer 2) | GPT-4o-mini | 1 call | ~$0.005 |
| **Total per paper** | | | **~$0.015** |
| **1000 papers/month** | | | **~$15/month** |

Cost is manageable. Use GPT-4o-mini or DeepSeek for classification/variants; reserve stronger models for verification if quality demands it.

---

## 13. Success Metrics

| Metric | Target |
|--------|--------|
| Blueprint compliance | 100% of published papers |
| Answer correctness (objective) | 100% deterministic verification |
| Answer correctness (subjective) | ≥95% AI verification accuracy |
| Student-reported errors | <2% of generated papers |
| Generation time (curated only) | <10 seconds |
| Generation time (with variants) | <60 seconds |
| Question bank size (MVP) | 600+ questions (Math + Science) |
| Question bank size (full) | 5,500+ questions (all subjects) |
| Teacher approval rate | ≥90% of sampled papers |

---

## 14. Dependencies & Prerequisites

Before starting Phase 0:

1. **Confirm board audit is accessible** — the prior coverage matrix from the June 2026 audit
2. **Confirm PYQ PDF sources** — do we have actual CBSE board paper PDFs for 2019–2026?
3. **Confirm NCERT extracted text completeness** — are all 5 subjects' chapters extracted?
4. **Confirm LLM API access** — which model for generation vs verification?
5. **Resolve any PostgreSQL migration tooling** — Supabase CLI migration workflow

---

*This plan is a living document. Update as implementation progresses.*
