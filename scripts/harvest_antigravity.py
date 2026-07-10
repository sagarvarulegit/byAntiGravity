#!/usr/bin/env python3
import os
import re
import sys
import json
import hashlib
from typing import List, Dict, Any

# Heuristics for feedback
_NEGATIVE_FEEDBACK = (
    "still broken", "still not", "still wrong", "doesn't work", "does not work",
    "not working", "that's wrong", "thats wrong", "incorrect", "wrong",
    "no,", "nope", "fix it", "didn't", "did not", "broken", "error again",
    "still failing", "still fails", "not fixed", "revert", "undo",
)
_POSITIVE_FEEDBACK = (
    "thanks", "thank you", "perfect", "great", "works now", "fixed",
    "that works", "lgtm", "looks good", "nice", "awesome", "correct",
)

def detect_feedback(text: str) -> List[str]:
    low = text.lower()
    sig = []
    for ph in _NEGATIVE_FEEDBACK:
        if ph in low:
            sig.append("neg:" + ph)
    for ph in _POSITIVE_FEEDBACK:
        if ph in low:
            sig.append("pos:" + ph)
    return sig

def get_hash_id(project: str, intent: str) -> str:
    h = hashlib.sha256((project + "::" + intent).encode("utf-8")).hexdigest()[:12]
    return "task_" + h

def parse_transcript(transcript_path: str, project_dir: str) -> List[Dict[str, Any]]:
    if not os.path.exists(transcript_path):
        print(f"Error: transcript file not found at {transcript_path}", file=sys.stderr)
        return []

    turns = []
    current_turn = None

    with open(transcript_path, "r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            try:
                step = json.loads(line)
            except Exception:
                continue

            stype = step.get("type")
            source = step.get("source")

            if stype == "USER_INPUT":
                # Save previous turn if it exists
                if current_turn:
                    turns.append(current_turn)
                
                content = step.get("content", "")
                current_turn = {
                    "intent": content,
                    "attempted_solution": "",
                    "tools_called": [],
                    "feedback_signals": [],
                    "outcome": "unknown"
                }
            elif current_turn and source == "MODEL" and stype == "PLANNER_RESPONSE":
                current_turn["attempted_solution"] += step.get("content", "") + "\n"
                tool_calls = step.get("tool_calls", [])
                for tc in tool_calls:
                    if isinstance(tc, dict) and tc.get("name"):
                        current_turn["tools_called"].append(tc["name"])

        if current_turn:
            turns.append(current_turn)

    # Label outcomes retrospectively by checking follow-up feedback
    for i in range(len(turns)):
        turn = turns[i]
        # Check next turn for user feedback
        if i + 1 < len(turns):
            next_user_content = turns[i + 1]["intent"]
            signals = detect_feedback(next_user_content)
            turn["feedback_signals"] = signals
            
            if any(s.startswith("neg:") for s in signals):
                turn["outcome"] = "fail"
            elif any(s.startswith("pos:") for s in signals):
                turn["outcome"] = "success"
            else:
                turn["outcome"] = "unknown"

    # Convert to TaskRecord schema
    tasks = []
    for turn in turns:
        intent = turn["intent"]
        if len(intent.strip()) < 8:
            continue
        
        tid = get_hash_id(project_dir, intent)
        tags = []
        if turn["tools_called"]:
            tags.append("tools:" + "+".join(list(set(turn["tools_called"]))[:4]))

        tasks.append({
            "id": tid,
            "project": project_dir,
            "intent": intent,
            "context_excerpt": "",
            "attempted_solution": turn["attempted_solution"].strip(),
            "outcome": turn["outcome"],
            "reference_kind": "none",
            "reference": "",
            "tags": tags,
            "source_sessions": ["session_current"],
            "split": "train",
            "origin": "real"
        })

    return tasks

def main():
    if len(sys.argv) < 3:
        print("Usage: harvest_antigravity.py [transcript_path] [output_json_path]")
        sys.exit(1)

    transcript_path = sys.argv[1]
    output_path = sys.argv[2]
    project_dir = os.path.abspath(os.getcwd())

    tasks = parse_transcript(transcript_path, project_dir)
    
    # Assign splits deterministically using simple hashing (analogous to assign_splits)
    val_fraction = 0.34
    for i, t in enumerate(tasks):
        # Deterministic split hashing
        bucket = int(hashlib.sha256(t["id"].encode()).hexdigest(), 16) % 100
        if bucket < val_fraction * 100:
            t["split"] = "val"
        else:
            t["split"] = "train"

    # Save format
    payload = {
        "format": "skillopt_sleep.tasks.v1",
        "project": project_dir,
        "transcript_source": "antigravity",
        "n_sessions": 1,
        "target_skill_path": os.path.abspath("GEMINI.md"),
        "reviewed": True,  # Already pre-formatted/reviewed by script
        "tasks": tasks
    }

    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(payload, f, ensure_ascii=False, indent=2)
        f.write("\n")

    print(f"Mined {len(tasks)} tasks from transcript.")
    print(f"Wrote tasks to: {output_path}")

if __name__ == "__main__":
    main()
