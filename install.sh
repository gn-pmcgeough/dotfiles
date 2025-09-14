#!/bin/bash
# Main dotfiles installation script
# Run this from the dotfiles directory

set -e  # Exit on any error

echo "Starting dotfiles installation..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

DOTFILES_DIR="$HOME/.dotfiles"

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_question() {
    echo -e "${BLUE}[QUESTION]${NC} $1"
}

# Ensure we're in the dotfiles directory
if [[ ! -d "$DOTFILES_DIR" ]] || [[ "$PWD" != "$DOTFILES_DIR" ]]; then
    print_error "Please run this script from the dotfiles directory ($DOTFILES_DIR)"
    exit 1
fi

# Backup existing dotfiles
backup_existing() {
    local backup_dir="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
    local files_to_backup=()

    # Check for existing dotfiles that would conflict
    for file in .zshrc .gitconfig; do
        if [[ -f "$HOME/$file" ]] && [[ ! -L "$HOME/$file" ]]; then
            files_to_backup+=("$file")
        fi
    done

    if [[ ${#files_to_backup[@]} -gt 0 ]]; then
        print_warning "Backing up existing dotfiles to $backup_dir"
        mkdir -p "$backup_dir"
        for file in "${files_to_backup[@]}"; do
            mv "$HOME/$file" "$backup_dir/"
        done
    fi
}

# Install Homebrew packages
install_homebrew_packages() {
    print_status "Installing Homebrew packages..."

    if [[ -f "Brewfile" ]]; then
        brew bundle --file=Brewfile
    fi
}

# Stow dotfiles
stow_dotfiles() {
    print_status "Stowing dotfiles..."

    # Remove any existing stow links first
    if stow -D . 2>/dev/null; then
        print_status "Removed existing stow links"
    fi

    # Create new stow links
    stow .
    print_status "Dotfiles stowed successfully"
}

# Set up git configuration
setup_git() {
    print_status "Setting up git configuration..."

    # Check if git is already configured
    if ! git config --global user.name >/dev/null 2>&1; then
        print_question "Git user name not set. Please enter your name:"
        read -p "Name: " git_name
        git config --global user.name "$git_name"
    fi

    if ! git config --global user.email >/dev/null 2>&1; then
        print_question "Git user email not set. Please enter your email:"
        read -p "Email: " git_email
        git config --global user.email "$git_email"
    fi

    print_status "Git configuration complete"
}

# Main installation flow
main() {
    print_status "Starting dotfiles installation..."

    # Backup existing files
    backup_existing

    # Install Homebrew packages
    install_homebrew_packages

    # Stow dotfiles
    stow_dotfiles

    # Set up git
    setup_git

    # Make other scripts executable
    chmod +x sync.sh 2>/dev/null || true
    chmod +x git-clone.sh 2>/dev/null || true

    print_status "Installation complete!"
    print_status ""
    print_status "Next steps:"
    print_status "1. Restart your terminal or run 'source ~/.zshrc'"
    print_status "2. Run 'sync.sh' anytime to update your dotfiles"
    print_status "3. Edit files in $DOTFILES_DIR and they'll be automatically linked"
}

# Run main installation
main "$@"