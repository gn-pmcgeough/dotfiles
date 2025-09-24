#!/bin/sh
set -uo pipefail  # Exit on error, undefined vars, pipe failures

# Back up existing zsh files
./scripts/backup.sh

# Install all our dependencies with bundle (See Brewfile)
echo "Installing base Brewfile dependencies..."
brew bundle --file ./Brewfile.base

echo "Installing development Brewfile dependencies..."
brew bundle --file ./Brewfile.dev

# Create a projects directories
echo "Creating development directory..."
mkdir $HOME/brs/development

# Clone Github repositories
./clone.sh

# Set macOS preferences - we will run this last because this will reload the shell
# source ./.macos
