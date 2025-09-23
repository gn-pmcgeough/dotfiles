#!/bin/sh

echo "Bootstrapping your Mac..."

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

# Check if Xcode Command Line Tools are installed
if ! xcode-select -p &>/dev/null; then
    echo "Xcode Command Line Tools not found. Installing..."
    xcode-select --install
else
    echo "Xcode Command Line Tools already installed."
fi

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update Homebrew recipes
brew update
