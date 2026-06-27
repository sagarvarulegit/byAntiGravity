#!/bin/bash
set -e

echo "🔄 [1/2] Concatenating database seed files..."
python3 concat_seeds.py

echo "🔥 [2/2] Resetting local Supabase database with the latest seed..."
npx supabase db reset

echo "✅ Success! The local database is now perfectly in sync with the codebase."
