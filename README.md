# My Dotfiles

These are my personal dotfiles for macOS, managed with `stow` and `brew`.

## Quick Start

```bash
curl -fsSL https://raw.githubusercontent.com/yourusername/dotfiles/main/bootstrap.sh | bash
```

## Installation

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
    ```

2.  **Run the installation:**

    ```bash
    cd ~/.dotfiles
    make install
    ```

    The installer will prompt you to choose a profile (`work`, `personal`, or `both`) to install the appropriate applications and tools.

## Usage

This repository uses a `Makefile` to simplify common tasks. Each command is a shortcut for a specific action:

*   `make install`: This is for the initial setup. It runs the `install.sh` script, which will:
    *   Back up any existing dotfiles in your home directory.
    *   Ask you to choose a profile (work, personal, or both).
    *   Install the appropriate applications and tools using Homebrew.
    *   Create symbolic links for your dotfiles using `stow`.
    *   Set up your git configuration.

*   `make sync`: This keeps your local setup up-to-date with the repository. It runs the `sync.sh` script, which will:
    *   Pull the latest changes from the git repository.
    *   Update your Homebrew packages if the `Brewfile` has changed.
    *   Re-link your dotfiles with `stow` if any dotfiles have changed.

*   `make update-brew`: This updates only your Homebrew packages. It's a good command to run periodically to keep your applications and tools up-to-date.

*   `make update-stow`: This re-creates the symbolic links for your dotfiles. You should run this command after adding a new dotfile to this repository.

*   `make status`: This shows you the current status of your dotfiles, including any uncommitted changes and the last few sync log messages.

*   `make clean`: This removes any backup files and logs that have been created by the installation and sync scripts.

## Customization

*   **Dotfiles:** Add new configuration files to this directory and run `make update-stow`.
*   **Packages:** Add new packages to the `Brewfile` (for common packages), `Brewfile_work` (for work-specific packages), or `Brewfile_personal` (for personal packages) and run `make update-brew`.
*   **Aliases:** Add new shell aliases to `~/.zsh_aliases_commands` or `~/.zsh_aliases_locations`.
