# My Dotfiles

These are my personal dotfiles for macOS, managed with GNU Stow and Homebrew.

## One-Command Setup

To set up a new machine, run the following command in your terminal. It will automatically install all the necessary tools and applications.

```bash
curl -fsSL https://raw.githubusercontent.com/gn-pmcgeough/dotfiles/main/booststrap.sh | bash
```

### How it Works

The bootstrap script will:

1.  Install Xcode Command Line Tools and Homebrew.
2.  Install `git` and `stow`.
3.  Clone the repository to `~/.dotfiles`.
4.  Run the `install.sh` script to:
    *   Install all applications from the `Brewfile`.
    *   Create symbolic links for your dotfiles using `stow`.
    *   Set up your Git configuration.

## Manual Installation

If you prefer to install manually, you can follow these steps:

1.  **Install Homebrew**:

    ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```

2.  **Install Git and Stow**:

    ```bash
    brew install git stow
    ```

3.  **Clone the repository**:

    ```bash
    git clone git@github.com:gn-pmcgeough/dotfiles.git ~/.dotfiles
    ```

4.  **Run the installer**:

    ```bash
    cd ~/.dotfiles
    make install
    ```

## Available Commands

This project uses a `Makefile` for common commands:

*   `make install`: Run the full installation process.
*   `make sync`: Pull the latest changes from the Git repository and sync your local setup.
*   `make update-brew`: Update only Homebrew packages.
*   `make update-stow`: Re-apply the dotfile symlinks.
*   `make status`: Show the git status and the sync log.
*   `make clean`: Clean up backup files and logs.
