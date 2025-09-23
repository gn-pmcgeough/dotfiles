## Directory Overview

This directory contains personal dotfiles for macOS, designed to automate the setup of a development environment. It uses [GNU Stow](https://www.gnu.org/software/stow/) to manage symlinks and [Homebrew](https://brew.sh/) for package installation.

## Key Files

*   `bootstrap.sh`: This script prepares the system by installing essential tools like the Xcode Command Line Tools, Oh My Zsh, and Homebrew.
*   `install.sh`: This script installs all the applications and tools specified in the `Brewfile`. It also creates a `~/brs/development` directory for projects and runs the `clone.sh` script.
*   `clone.sh`: This script is responsible for cloning various Git repositories, likely for development projects.
*   `Brewfile`: This file lists all the Homebrew packages (both command-line tools and cask applications) to be installed.
*   `zsh/`: This directory contains the Zsh configuration, including:
    *   `.zshrc`: The main configuration file for the Zsh shell.
    *   `.zsh_aliases_commands`: Custom command aliases.
    *   `.zsh_aliases_locations`: Aliases for navigating the filesystem.
*   `iterm/`: This directory holds configuration files for the iTerm2 terminal emulator.
*   `fonts/`: This directory contains a collection of custom fonts for the terminal and other applications.
*   `custom.zsh-theme`: A custom theme for Oh My Zsh.

## Usage

To set up a new macOS environment using these dotfiles, follow these steps:

1.  **Bootstrap the system:**
    ```bash
    curl -fsSL https://raw.githubusercontent.com/gn-pmcgeough/dotfiles/main/bootstrap.sh | bash
    ```

2.  **Clone the repository:**
    ```bash
    git clone git@github.com:gn-pmcgeough/dotfiles.git ~/.dotfiles
    ```

3.  **Install applications and tools:**
    ```bash
    cd ~/.dotfiles
    ./install.sh
    ```

4.  **Create symlinks:**
    Use GNU Stow to create symlinks for the configuration files. For example, to symlink the Zsh configuration:
    ```bash
    stow zsh
    ```

5.  **Install the custom theme:**
    Copy the `custom.zsh-theme` file to the Oh My Zsh custom themes directory:
    ```bash
    cp custom.zsh-theme ~/.oh-my-zsh/custom/themes/example.zsh-theme
    ```
