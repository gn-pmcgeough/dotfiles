# My Dotfiles

These are my personal dotfiles for macOS. They are designed to automate the setup of a new development environment, making it quick and easy to get up and running on a new machine.

This setup uses [GNU Stow](https://www.gnu.org/software/stow/) to manage symlinks and [Homebrew](https://brew.sh/) for package installation.

## What's Included?

This configuration installs a variety of command-line tools and GUI applications, including:

*   **Shell:** Zsh with Oh My Zsh
*   **Terminal:** iTerm2
*   **Package Manager:** Homebrew
*   **Version Control:** Git
*   **Programming Languages & Runtimes:** Node.js, PHP, OpenJDK
*   **Development Tools:** Composer, Postman
*   **IDEs & Editors:** Visual Studio Code, PhpStorm, Rider
*   **Browsers:** Google Chrome, Firefox
*   **Productivity:** Slack, Notion, Todoist, 1Password, Rectangle

For a complete list of installed packages, see the `Brewfile`.

## Installation

The installation process is automated with a series of scripts.

### Step 1: Run the Bootstrap Script

This command will install the Xcode Command Line Tools, Oh My Zsh, and Homebrew.

```bash
curl -fsSL https://raw.githubusercontent.com/gn-pmcgeough/dotfiles/main/bootstrap.sh | bash
```

### Step 2: Clone the Repository

You'll need to clone this repository to your local machine to complete the installation.

```bash
git clone git@github.com:gn-pmcgeough/dotfiles.git ~/dotfiles
```

### Step 3: Run the Install Script

Change into the dotfiles directory and run the install script. This will install all applications and tools from the `Brewfile` and configure your environment.

```bash
cd ~/dotfiles
./install.sh
```

### Step 4: Create Symlinks

Use GNU Stow to create symlinks for the configuration files. For example, to symlink the Zsh configuration:

```bash
stow zsh
```

### Step 5: Install the Custom Theme

Copy the `custom.zsh-theme` file to the Oh My Zsh custom themes directory:

```bash
cp custom.zsh-theme ~/.oh-my-zsh/custom/themes/example.zsh-theme
```

## How It Works

*   **`bootstrap.sh`**: Prepares the system by installing essential tools.
*   **`install.sh`**: Installs all the applications and tools specified in the `Brewfile`.
*   **`Brewfile`**: Lists all the Homebrew packages to be installed.
*   **`stow`**: Creates symlinks from the files in this repository to your home directory.
*   **`zsh/`**: Contains the Zsh configuration, including `.zshrc` and aliases.
*   **`iterm/`**: Holds configuration files for the iTerm2 terminal emulator.
*   **`fonts/`**: Contains custom fonts.
