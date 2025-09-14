#!/bin/bash
# Bootstrap script for dotfiles setup on fresh Mac
# Usage: curl -fsSL https://raw.githubusercontent.com/gn-pmcgeough/dotfiles/main/bootstrap.sh | bash

set -e  # Exit on any error

echo "Starting dotfiles bootstrap..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
DOTFILES_REPO="https://github.com/gn-pmcgeough/dotfiles.git"
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

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    print_error "This script is designed for macOS only."
    exit 1
fi

# Install Command Line Tools if not present
if ! xcode-select -p >/dev/null 2>&1; then
    print_status "Installing Xcode Command Line Tools..."
    xcode-select --install
    print_warning "Please complete the Xcode Command Line Tools installation and re-run this script."
    exit 1
fi

# Install Homebrew if not present
if ! command -v brew >/dev/null 2>&1; then
    print_status "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    print_status "Homebrew already installed"
fi

# Install essential tools
print_status "Installing essential tools..."
brew install git stow

# Clone dotfiles repository
if [[ -d "$DOTFILES_DIR" ]]; then
    print_warning "Dotfiles directory already exists. Overwriting..."
    rm -rf "$DOTFILES_DIR"
fi
print_status "Cloning dotfiles repository..."
git clone "$DOTFILES_REPO" "$DOTFILES_DIR"


# Make install script executable
chmod +x "$DOTFILES_DIR/install.sh"

# Run the main installation
print_status "Running main installation..."
cd "$DOTFILES_DIR"
./install.sh

print_status "Bootstrap complete! Your dotfiles are now installed."
print_status "You may want to restart your terminal or run 'source ~/.zshrc' to apply changes."
