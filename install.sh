#!/bin/sh
set -euo pipefail  # Exit on error, undefined vars, pipe failures

# Back up existing zsh files
./scripts/backup.sh

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle

brew bundle --file ./Brewfile.base
brew bundle --file ./Brewfile.dev

# Create a projects directories
mkdir $HOME/brs/development

# Clone Github repositories
./clone.sh

# Set macOS preferences - we will run this last because this will reload the shell
# source ./.macos
