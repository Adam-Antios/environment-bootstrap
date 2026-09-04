# ---------------------------------------------------------------------------
# This script commits all changes on the work branch using the current
# ISO-8601 timestamp, pushes it to origin, then returns to main and deletes
# the local work branch.
# ---------------------------------------------------------------------------

#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 0 ]; then
  echo "Usage: $0" >&2
  exit 1
fi

required_root="$HOME/Compliance/release"

if [ ! -d "$required_root/.git" ]; then
  echo "Repository does not exist: $required_root" >&2
  exit 1
fi

cd "$required_root"

git switch work
git add --all

if git diff --cached --quiet; then
  echo "No changes staged on branch work." >&2
  exit 1
fi

git commit -m "$(date -Iseconds)"
git push -u origin work
git switch main
git branch -D work
