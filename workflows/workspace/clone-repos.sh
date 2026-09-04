# ---------------------------------------------------------------------------
# This script creates the local Notebooks and Compliance directories, then
# clones the required Git repositories into them if they do not already exist.
# ---------------------------------------------------------------------------

#!/usr/bin/env bash

# Notebooks
# =========

notebooks_dir="$HOME/Notebooks"

if [ ! -d "$notebooks_dir" ]; then
    echo "Notebooks directory does not exist. Creating: $notebooks_dir"
    mkdir -p "$notebooks_dir"
fi

cd "$notebooks_dir" || exit 1

repos=(
    "git@github.com:Adam-Antios/professional-workbench.git"
    "git@github.com:Adam-Antios/development-handbook.git"
    "git@github.com:Adam-Antios/trumaneu-management.git"
    "git@github.com:Adam-Antios/environment-bootstrap.git"
)

for repo in "${repos[@]}"; do
    dir="$(basename "$repo" .git)"

    if [ -d "$dir/.git" ]; then
        echo "Skipping $dir: repository already exists."
    else
        echo "Cloning $dir..."
        git clone "$repo"
    fi
done

# Compliance
# ==========

compliance_dir="$HOME/Compliance"

if [ ! -d "$compliance_dir" ]; then
    echo "Compliance directory does not exist. Creating: $compliance_dir"
    mkdir -p "$compliance_dir"
fi

cd "$compliance_dir" || exit 1

compliance_repos=(
    "pdneurotechnology@vs-ssh.visualstudio.com:v3/pdneurotechnology/ISMS-PIMS/records"
    "pdneurotechnology@vs-ssh.visualstudio.com:v3/pdneurotechnology/ISMS-PIMS/develop"
    "pdneurotechnology@vs-ssh.visualstudio.com:v3/pdneurotechnology/ISMS-PIMS/release"
)

for repo in "${compliance_repos[@]}"; do
    dir="$(basename "$repo" .git)"

    if [ -d "$dir/.git" ]; then
        echo "Skipping $dir: repository already exists."
    else
        echo "Cloning $dir..."
        git clone "$repo"
    fi
done
