#!/bin/sh

echo "Cloning repositories..."

BASE_DIR="$HOME/brs/development"
REPO_LIST="repos.txt"

if [ ! -f "$REPO_LIST" ]; then
    echo "Repository list not found: $REPO_LIST"
    exit 1
fi

while read -r repo dir; do
    # Skip empty lines or comments
    [[ -z "$repo" || "$repo" =~ ^#.*$ ]] && continue

    TARGET_DIR="$BASE_DIR/$dir"
    if [ ! -d "$TARGET_DIR" ]; then
        echo "Cloning $repo into $TARGET_DIR..."
        git clone "$repo" "$TARGET_DIR"
    else
        echo "Directory $TARGET_DIR already exists, skipping clone."
    fi

done < "$REPO_LIST"

echo "Repository cloning complete."