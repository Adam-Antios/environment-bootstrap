#!/usr/bin/env bash

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
    "git@github.com:Adam-Antios/workspace-bootstrap.git"
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
