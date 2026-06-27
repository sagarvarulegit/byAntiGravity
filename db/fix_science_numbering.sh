#!/bin/bash
# Fix Science chapter/topic numbering — run this in your terminal
# Just type: bash db/fix_science_numbering.sh

echo "Fixing Science chapter/topic numbering..."
docker exec -i supabase_db_byAntiGravity psql -U postgres -d postgres <<'SQL'
UPDATE chapters SET sequence_number = 12 WHERE id = 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd383012';
UPDATE lessons SET title = '11.1 Electric Current & Circuit' WHERE id = 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380006';
UPDATE lessons SET title = '11.2 Electric Potential & Potential Difference' WHERE id = 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380010';
UPDATE lessons SET title = '11.3 Ohm'"'"'s Law & Circuit Elements' WHERE id = 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380007';
SQL

echo ""
echo "--- Verification ---"
docker exec -i supabase_db_byAntiGravity psql -U postgres -d postgres <<'SQL'
SELECT title, sequence_number FROM chapters WHERE id IN ('c0eebc99-9c0b-4ef8-bb6d-6bb9bd383012','c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222') ORDER BY sequence_number;
SELECT title FROM lessons WHERE chapter_id = 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380222' ORDER BY sequence_number;
SQL

echo ""
echo "✅ Done!"
