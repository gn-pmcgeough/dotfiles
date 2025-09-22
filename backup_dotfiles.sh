#!/bin/bash

# Create a backup directory in the home folder with a timestamp
BACKUP_DIR=~/dotfiles_backup_$(date +%Y-%m-%d_%H-%M-%S)
echo "Creating backup directory at $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

# List of files to back up from the home directory
files_to_backup=(".zshrc" ".zsh_aliases_commands" ".zsh_aliases_locations")
HOME_DIR=~

# Move files to the backup directory if they exist
for file in "${files_to_backup[@]}"; do
    if [ -e "$HOME_DIR/$file" ]; then
        echo "Backing up ~/$file to $BACKUP_DIR"
        mv "$HOME_DIR/$file" "$BACKUP_DIR/"
    else
        echo "~/$file does not exist, no backup needed."
    fi
done

echo "Backup process finished. Backups are in $BACKUP_DIR (if any files existed)."
