# ---------------------------------------------------------------------------
# This script is intended only for creating pull requests within the
# ISMS-PIMS /records Git repository.
# ---------------------------------------------------------------------------

#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 0 ]; then
  echo "Usage: $0" >&2
  exit 1
fi

required_root="$HOME/Compliance/records"

if [ ! -d "$required_root/.git" ]; then
  echo "Repository does not exist: $required_root" >&2
  exit 1
fi

cd "$required_root"

mapfile -t changed_files < <(git status --porcelain=v1 --untracked-files=normal | cut -c4-)

if [ "${#changed_files[@]}" -ne 1 ]; then
  echo "Expected exactly 1 changed file, found ${#changed_files[@]}." >&2
  printf 'Changed files:\n' >&2
  printf '  %s\n' "${changed_files[@]}" >&2
  exit 1
fi

file="${changed_files[0]}"
dir="$(basename "$(dirname "$file")")"
name="$(basename "$file")"
name_without_extension="${name%.*}"
branch="add-${dir}-${name_without_extension}"

git switch -c "$branch"
git add "$file"
git commit -m "Add ${dir} ${name_without_extension}"
git push -u origin HEAD
git switch main
git branch -d "$branch"
