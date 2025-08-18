# Dotfiles Project

## Project Overview

This is a dotfiles repository for managing a user's shell environment on macOS. It uses a combination of shell scripts, a `Makefile`, and popular tools like [Homebrew](https://brew.sh/) and [GNU Stow](https://www.gnu.org/software/stow/) to automate the setup and maintenance of a development environment.

The core technologies and conventions are:

*   **Shell:** Zsh, configured via `.zshrc`.
*   **Package Management:** Homebrew, with packages defined in `Brewfile`, `Brewfile_work`, and `Brewfile_personal`.
*   **Symlink Management:** GNU Stow, for managing the symlinks of dotfiles from this repository to the user's home directory.
*   **Automation:** A `Makefile` provides high-level commands for common operations. Shell scripts (`install.sh`, `sync.sh`, `booststrap.sh`) handle the main logic.

## Building and Running

This is not a traditional software project with a build process. Instead, it has installation and synchronization commands.

### Installation

To set up a new machine, you can use the bootstrap script:

```bash
curl -fsSL https://raw.githubusercontent.com/yourusername/dotfiles/main/bootstrap.sh | bash
```

Alternatively, you can clone the repository and run the `install` command from the `Makefile`:

```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
make install
```

The `install.sh` script will prompt you to choose a profile ("work", "personal", or "both") to determine which applications and tools to install via Homebrew.

### Synchronization

To update the dotfiles and installed packages, you can run the `sync` command from the `Makefile`:

```bash
make sync
```

This will pull the latest changes from the git repository, update Homebrew packages, and re-apply the symlinks with `stow`.

### Key Commands (from Makefile)

*   `make install`: Run the full installation process.
*   `make sync`: Pull the latest changes and sync your local setup.
*   `make update-brew`: Update only Homebrew packages.
*   `make update-stow`: Re-apply the dotfile symlinks.
*   `make status`: Show the git status and the sync log.
*   `make clean`: Clean up backup files and logs.

## Development Conventions

*   **Configuration:** All configuration is done within this repository.
*   **Adding new dotfiles:** Add the file to this repository and then run `make update-stow` to create the symlink.
*   **Adding new packages:** Add the package to the appropriate `Brewfile` and then run `make update-brew`.
*   **Aliases:** Custom shell aliases are defined in `.zsh_aliases_commands` and `.zsh_aliases_locations`.
