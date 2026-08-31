#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 0 ]; then
  echo "Usage: $0" >&2
  exit 1
fi

mapfile -t changed_files < <(git status --porcelain --untracked-files=normal | sed 's/^...//')

if [ "${#changed_files[@]}" -ne 1 ]; then
  echo "Expected exactly 1 changed file, found ${#changed_files[@]}." >&2
  exit 1
fi

file="${changed_files[0]}"
name="$(basename "$file")"
name_without_extension="${name%.*}"
branch="add-${name_without_extension}"

git switch -c "$branch"
git add "$file"
git commit -m "Add ${name_without_extension}"
git push -u origin HEAD
