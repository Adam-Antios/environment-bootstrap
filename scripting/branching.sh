#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
  echo "Usage: $0 path/to/file [date]" >&2
  exit 1
fi

file="$1"
dir="$(basename "$(dirname "$file")")"
name="$(basename "$file")"
branch_name="${name%.*}"

branch="add-${dir}-${branch_name}"
commit_message="$file"

if [ "$#" -eq 2 ]; then
  commit_date="$2"
  safe_date="$(printf '%s' "$commit_date" | tr -c '[:alnum:]._' '-')"
  branch="$safe_date"
  commit_message="$commit_date"
fi

git switch -c "$branch"
git add "$file"
git commit -m "$commit_message"
git push -u origin HEAD
