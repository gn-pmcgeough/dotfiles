# Dotfiles Makefile
# Convenient commands for managing your dotfiles

.PHONY: help sync update-brew update-stow status clean

# Default target
help:
	@echo "Dotfiles Management Commands:"
	@echo ""
	@echo "  sync          Pull latest changes and sync"
	@echo "  update-brew   Update only Homebrew packages"
	@echo "  update-stow   Re-stow dotfiles only"
	@echo "  status        Show git status and sync log"
	@echo "  clean         Clean up backup files and logs"
	@echo ""
	@echo "Usage: make <command>"

# Sync dotfiles
sync:
	@echo "Syncing dotfiles..."
	@./sync.sh
	@echo "Sync complete"

# Update only Homebrew packages
update-brew:
	@echo "Updating Homebrew packages..."
	@brew update
	@if [ -f "Brewfile" ]; then brew bundle --file=Brewfile; fi
	@if [ -f "Brewfile_work" ]; then brew bundle --file=Brewfile_work; fi
	@if [ -f "Brewfile_personal" ]; then brew bundle --file=Brewfile_personal; fi
	@echo "Homebrew packages updated"

# Re-stow dotfiles only
update-stow:
	@echo "Re-stowing dotfiles..."
	@stow -D . 2>/dev/null || true
	@stow .
	@echo "Dotfiles re-stowed"

# Show status
status:
	@echo "Dotfiles Status:"
	@echo ""
	@echo "Git Status:"
	@git status --short
	@echo ""
	@echo "Recent Sync Activity:"
	@if [ -f ".sync.log" ]; then tail -5 .sync.log; else echo "No sync log found"; fi

# Clean up
clean:
	@echo "Cleaning up..."
	@rm -rf ~/.dotfiles_backup_* 2>/dev/null || true
	@rm -f .sync.log 2>/dev/null || true
	@echo "Cleanup complete"