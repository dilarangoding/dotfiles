#!/bin/bash

# Symlink script for dotfiles
# This script creates symlinks for specific config files

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

DOTFILES_DIR="$HOME/dotfiles"

echo -e "${BLUE}╔═══════════════════════════════════════╗${NC}"
echo -e "${BLUE}║     Dotfiles Symlink Setup           ║${NC}"
echo -e "${BLUE}╚═══════════════════════════════════════╝${NC}"
echo ""

# Function to create symlink with backup
create_symlink() {
    local source=$1
    local target=$2

    # Check if source exists
    if [ ! -e "$source" ]; then
        echo -e "${RED}✗${NC} Source not found: $source"
        return 1
    fi

    # Check if target exists and is not a symlink
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        local backup="${target}.backup.$(date +%Y%m%d_%H%M%S)"
        mv "$target" "$backup"
        echo -e "${YELLOW}⚠${NC} Backed up: $target -> $backup"
    fi

    # Remove old symlink if exists
    if [ -L "$target" ]; then
        rm "$target"
    fi

    # Create directory if not exists
    local target_dir=$(dirname "$target")
    if [ ! -d "$target_dir" ]; then
        mkdir -p "$target_dir"
        echo -e "${BLUE}ℹ${NC} Created directory: $target_dir"
    fi

    # Create symlink
    ln -sf "$source" "$target"
    echo -e "${GREEN}✓${NC} Linked: $target -> $source"
}

# Newsboat
echo -e "${BLUE}Newsboat Config${NC}"
create_symlink "$DOTFILES_DIR/.config/newsboat/urls" "$HOME/.newsboat/urls"
create_symlink "$DOTFILES_DIR/.config/newsboat/config" "$HOME/.newsboat/config"
echo ""

# Zsh
echo -e "${BLUE}Zsh Config${NC}"
create_symlink "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
echo ""

# Joplin keymap
echo -e "${BLUE}Joplin Keymap${NC}"
create_symlink "$DOTFILES_DIR/.config/joplin/keymap.json" "$HOME/.config/joplin/keymap.json"
echo ""

# Nvim
echo -e "${BLUE}Neovim Config${NC}"
create_symlink "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"
echo ""

# Kitty
echo -e "${BLUE}Kitty Config${NC}"
create_symlink "$DOTFILES_DIR/.config/kitty" "$HOME/.config/kitty"
echo ""

# i3
echo -e "${BLUE}i3 Config${NC}"
create_symlink "$DOTFILES_DIR/.config/i3" "$HOME/.config/i3"
echo ""

# lf
echo -e "${BLUE}lf Config${NC}"
create_symlink "$DOTFILES_DIR/.config/lf" "$HOME/.config/lf"
echo ""

# GTK
echo -e "${BLUE}GTK Config${NC}"
create_symlink "$DOTFILES_DIR/.config/gtk-3.0" "$HOME/.config/gtk-3.0"
echo ""

# Starship
echo -e "${BLUE}Starship Config${NC}"
create_symlink "$DOTFILES_DIR/.config/starship.toml" "$HOME/.config/starship.toml"
echo ""

# Tmux
echo -e "${BLUE}Tmux Config${NC}"
create_symlink "$DOTFILES_DIR/.config/tmux" "$HOME/.config/tmux"
echo ""

echo -e "${GREEN}╔═══════════════════════════════════════╗${NC}"
echo -e "${GREEN}║     Symlinks Created! 🎉             ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════╝${NC}"
echo ""
echo -e "${BLUE}ℹ${NC} Next steps:"
echo "  1. Reload shell: source ~/.zshrc"
echo "  2. Test configs: newsboat, nvim, etc."
echo ""
