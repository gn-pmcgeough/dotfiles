# My Dotfiles

These are my personal dotfiles for macOS. They are designed to automate the setup of a new development environment, making it quick and easy to get up and running on a new machine.

This setup uses [GNU Stow](https://www.gnu.org/software/stow/) to manage symlinks and [Homebrew](https://brew.sh/) for package installation.


## Installation

The installation process is automated with a series of scripts.

### Step 1: Run the Bootstrap Script

This command will install Git, Xcode Command Line Tools, Oh My Zsh, and Homebrew.

```bash
curl -fsSL https://raw.githubusercontent.com/gn-pmcgeough/dotfiles/master/bootstrap.sh | bash
```

### Step 2: Configure Git Settings

After install set user details

```bash
git config --global user.name "gn-pmcgeough"
git config --global user.email "pierce.mcgeough@nbcuni.com"
```

### Step 3: Clone the Repository

You'll need to clone this repository to your local machine to complete the installation.

```bash
git clone git@github.com:gn-pmcgeough/dotfiles.git ~/dotfiles
```

### Step 4: Run the Install Script

Change into the dotfiles directory and run the install script. This will install all applications and tools from the `Brewfile` and configure your environment.

```bash
cd ~/dotfiles
./install.sh
```

### Step 5: Create Symlinks

Use GNU Stow to create symlinks for the configuration files. For example, to symlink the Zsh configuration:

```bash
./scripts/backup.sh
stow zsh
```

### Step 6: Install the Custom Theme

Copy the `custom.zsh-theme` file to the Oh My Zsh custom themes directory:

```bash
cp custom.zsh-theme ~/.oh-my-zsh/custom/themes/custom.zsh-theme
```
