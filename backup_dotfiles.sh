#!/bin/bash

# List of files to back up from the home directory
files_to_backup=(".zshrc" ".zsh_aliases_commands" ".zsh_aliases_locations")
HOME_DIR=~
BACKUP_SUFFIX=".backup"

# Rename files with a .backup suffix if they exist
for file in "${files_to_backup[@]}"; do
    if [ -e "$HOME_DIR/$file" ]; then
        echo "Backing up ~/$file to ~/$file$BACKUP_SUFFIX"
        mv "$HOME_DIR/$file" "$HOME_DIR/$file$BACKUP_SUFFIX"
    else
        echo "~/$file does not exist, no backup needed."
    fi
done

echo "Backup process finished. Existing files have been renamed with a .backup suffix."