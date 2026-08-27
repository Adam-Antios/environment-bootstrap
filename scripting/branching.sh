#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 path/to/file" >&2
  exit 1
fi

file="$1"
dir="$(basename "$(dirname "$file")")"
name="$(basename "$file")"
branch_name="${name%.*}"

branch="add-${dir}-${branch_name}"

git switch -c "$branch"
git add "$file"
git commit -m "Add ${dir} ${name}"
git push -u origin HEAD
