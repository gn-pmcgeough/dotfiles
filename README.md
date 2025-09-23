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

### Step 4: Stow to symlink
```bash
stow zsh
```


### Step 5: Copy custom.zsh-theme to ~/.oh-my-zsh/custom/themes/example.zsh-theme
