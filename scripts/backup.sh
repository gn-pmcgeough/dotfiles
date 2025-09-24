#!/bin/sh
set -euo pipefail

echo "Backing up existing zsh files..."

# Backs up existing .zshrc and .zsh_* files from $HOME
if [ -f "$HOME/.zshrc" ]; then
    mv "$HOME/.zshrc" "$HOME/.zshrc.bak"
    echo "Backed up existing .zshrc to .zshrc.bak"
fi

for file in $HOME/.zsh_*; do
    if [ -f "$file" ]; then
        mv "$file" "$file.bak"
        echo "Backed up existing $file to $file.bak"
    fi
done
