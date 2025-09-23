#!/bin/bash
# Sync script for dotfiles - incremental updates
# Run this to pull latest changes and apply only what's needed

set -e  # Exit on any error

DOTFILES_DIR="$HOME/.dotfiles"
SYNC_LOG="$DOTFILES_DIR/.sync.log"

# Ensure we're in the dotfiles directory
cd "$DOTFILES_DIR"

# Function to log changes silently
log_change() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$SYNC_LOG"
}

# Check if git repo has changes
check_git_changes() {
    git fetch --quiet
    if [[ $(git rev-parse HEAD) != $(git rev-parse @{u}) ]]; then
        return 0  # Changes available
    else
        return 1  # No changes
    fi
}

# Check if Brewfiles have changed
check_brewfile_changes() {
    local changed_files
    changed_files=$(git diff --name-only HEAD@{1} HEAD 2>/dev/null || echo "")

    if [[ "$changed_files" =~ Brewfile ]]; then
        return 0  # Brewfiles changed
    else
        return 1  # No Brewfile changes
    fi
}

# Check if dotfiles have changed
check_dotfile_changes() {
    local changed_files
    changed_files=$(git diff --name-only HEAD@{1} HEAD 2>/dev/null || echo "")

    # Check for changes in actual dotfiles (files starting with .)
    if echo "$changed_files" | grep -q "^\\."; then
        return 0  # Dotfiles changed
    else
        return 1  # No dotfile changes
    fi
}

# Update Homebrew packages
update_homebrew() {
    # Update Homebrew itself
    brew update --quiet

    # Install/update packages from Brewfiles
    if [[ -f "Brewfile" ]]; then
        brew bundle --file=Brewfile --quiet
    fi

    # Check for profile-specific Brewfiles
    if [[ -f "Brewfile_work" ]]; then
        brew bundle --file=Brewfile_work --quiet
    fi

    if [[ -f "Brewfile_personal" ]]; then
        brew bundle --file=Brewfile_personal --quiet
    fi

    log_change "Updated Homebrew packages"
}

# Re-stow dotfiles
update_stow() {
    stow -D . --quiet 2>/dev/null || true
    stow . --quiet
    log_change "Re-stowed dotfiles"
}

# Main sync function
main() {
    local changes_made=false

    # Check for remote changes
    if check_git_changes; then
        # Pull latest changes
        git pull --quiet
        changes_made=true
        log_change "Pulled latest changes from remote"

        # Check what changed and update accordingly
        if check_brewfile_changes; then
            update_homebrew
        fi

        if check_dotfile_changes; then
            update_stow
        fi
    fi

    # If no changes were made, still log that sync was attempted
    if [[ "$changes_made" == false ]]; then
        log_change "Sync attempted - no changes available"
    fi
}

# Run sync
main "$@"
