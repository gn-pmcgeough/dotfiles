# My Dotfiles

These are my personal dotfiles for macOS, managed with GNU Stow and Homebrew.

## Installation

This guide provides instructions for a manual installation of the dotfiles.

1.  **Install Homebrew:**
    ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```

2.  **Install Oh My Zsh:**
    ```bash
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```

3.  **Install Git:**
    ```bash
    brew install git

    # after install set user details
    git config --global user.name "gn-pmcgeough"
    git config --global user.email "pierce.mcgeough@nbcuni.com"
    ```

4.  **Clone Dotfiles Repository (via SSH):**
    ```bash
    git clone git@github.com:gn-pmcgeough/dotfiles.git ~/.dotfiles
    ```

5.  **Install Brewfile Contents:**
    ```bash
    cd ~/.dotfiles
    brew bundle --file=Brewfile
    ```

6.  **Stow Dotfiles:**
    This will create the necessary symlinks for your configuration files.
    ```bash
    stow .
    ```

## Maintenance

This repository includes a `Makefile` and a `sync.sh` script to help you manage your dotfiles.

### Syncing

To pull the latest changes from the repository and apply updates to Homebrew and your dotfiles, you can run the `sync` command:

```bash
make sync
```
This will run the `sync.sh` script, which automatically checks for changes and applies them.

### Available Commands

The `Makefile` provides several useful commands:

*   `make sync`: Pull the latest changes and sync your local setup.
*   `make update-brew`: Update only Homebrew packages.
*   `make update-stow`: Re-apply the dotfile symlinks.
*   `make status`: Show the git status and the sync log.
*   `make clean`: Clean up backup files and logs.
