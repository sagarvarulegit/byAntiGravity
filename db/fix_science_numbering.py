#!/usr/bin/env python3
"""
Run this script to fix Science chapter/topic numbering in the local Supabase DB.
Usage: python3 fix_science_numbering.py
Requires: Docker running with supabase_db_byAntiGravity container
"""

import subprocess
import sys

DB_CONTAINER = "supabase_db_byAntiGravity"
PSQL_CMD = ["docker", "exec", "-i", DB_CONTAINER, "psql", "-U", "postgres", "-d", "postgres"]

QUERIES = [
    # Fix 1: Chapter 12 Magnetic Effects → sequence_number should be 12, not 11
    "UPDATE chapters SET sequence_number = 12 WHERE id = 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd383012';",

    # Fix 2: Electricity (Ch 11) lesson topic numbers 12.x → 11.x
    "UPDATE lessons SET title = '11.1 Electric Current & Circuit' WHERE id = 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380006';",
    "UPDATE lessons SET title = '11.2 Electric Potential & Potential Difference' WHERE id = 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380010';",
    "UPDATE lessons SET title = '11.3 Ohm''s Law & Circuit Elements' WHERE id = 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380007';",
]

def run_sql(sql):
    result = subprocess.run(PSQL_CMD, input=sql, capture_output=True, text=True, timeout=30)
    if result.returncode != 0:
        print(f"❌ ERROR: {result.stderr.strip()}")
        return False
    print(f"✅ OK: {result.stdout.strip()}")
    return True

def main():
    # Check Docker is running and container exists
    check = subprocess.run(["docker", "ps", "--filter", f"name={DB_CONTAINER}", "--format", "{{.Names}}"],
                           capture_output=True, text=True, timeout=10)
    if DB_CONTAINER not in check.stdout:
        print(f"❌ Container '{DB_CONTAINER}' not running. Start Supabase first: cd <project> && supabase start")
        sys.exit(1)

    print("Fixing Science chapter/topic numbering...\n")

    all_ok = True
    for q in QUERIES:
        if not run_sql(q):
            all_ok = False

    print("\n--- Verification ---")
    verify = """
    SELECT id, title, sequence_number FROM chapters
    WHERE id IN ('c0eebc99-9c0b-4ef8-bb6d-6bb9bd383012', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222')
    ORDER BY sequence_number;

    SELECT id, title FROM lessons
    WHERE chapter_id = 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222'
    ORDER BY sequence_number;
    """
    subprocess.run(PSQL_CMD, input=verify, timeout=30)

    if all_ok:
        print("\n✅ All fixes applied successfully!")
    else:
        print("\n⚠️  Some fixes failed. Check errors above.")

if __name__ == "__main__":
    main()
