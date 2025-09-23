# My Dotfiles

These are my personal dotfiles for macOS, managed with GNU Stow and Homebrew.

## Installation

Automated setup is available via bootstrap and install scripts.

### Step 1: Run the Bootstrap Script

This command will install the Xcode Command Line Tools, Oh My Zsh, and Homebrew.

```bash
curl -fsSL https://raw.githubusercontent.com/gn-pmcgeough/dotfiles/main/bootstrap.sh | bash
```

### Step 2: Clone the Repository

You'll need to clone this repository to your local machine to complete the installation.

```bash
git clone git@github.com:gn-pmcgeough/dotfiles.git ~/.dotfiles
```

### Step 3: Run the Install Script

Finally, change into the dotfiles directory and run the install script. This will install all applications and tools from the `Brewfile` and configure your environment.

```bash
cd ~/.dotfiles
./install.sh
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
