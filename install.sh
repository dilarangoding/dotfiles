#!/bin/bash

# Dotfiles installation script
# This script creates symlinks from dotfiles to home directory

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Dotfiles directory
DOTFILES_DIR="$HOME/dotfiles"

# Function to print colored messages
print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

# Function to create symlink
create_symlink() {
    local source=$1
    local target=$2

    # Create target directory if it doesn't exist
    local target_dir=$(dirname "$target")
    if [ ! -d "$target_dir" ]; then
        mkdir -p "$target_dir"
        print_info "Created directory: $target_dir"
    fi

    # Check if target already exists
    if [ -e "$target" ] || [ -L "$target" ]; then
        if [ -L "$target" ]; then
            local current_source=$(readlink "$target")
            if [ "$current_source" = "$source" ]; then
                print_warning "Already linked: $target"
                return 0
            fi
        fi

        print_warning "Target exists: $target"
        read -p "Do you want to backup and replace it? (y/N) " -n 1 -r
        echo

        if [[ $REPLY =~ ^[Yy]$ ]]; then
            # Backup existing file/directory
            local backup="${target}.backup.$(date +%Y%m%d_%H%M%S)"
            mv "$target" "$backup"
            print_info "Backed up to: $backup"
        else
            print_warning "Skipped: $target"
            return 1
        fi
    fi

    # Create symlink
    ln -sf "$source" "$target"
    print_success "Linked: $target -> $source"
}

# Main installation
main() {
    echo ""
    echo "╔═══════════════════════════════════════╗"
    echo "║     Dotfiles Installation Script     ║"
    echo "╚═══════════════════════════════════════╝"
    echo ""

    # Check if dotfiles directory exists
    if [ ! -d "$DOTFILES_DIR" ]; then
        print_error "Dotfiles directory not found: $DOTFILES_DIR"
        exit 1
    fi

    cd "$DOTFILES_DIR"
    print_info "Installing dotfiles from: $DOTFILES_DIR"
    echo ""

    # Link .config files
    print_info "Linking .config files..."
    create_symlink "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"
    create_symlink "$DOTFILES_DIR/.config/kitty" "$HOME/.config/kitty"
    create_symlink "$DOTFILES_DIR/.config/i3" "$HOME/.config/i3"
    create_symlink "$DOTFILES_DIR/.config/joplin" "$HOME/.config/joplin"
    create_symlink "$DOTFILES_DIR/.config/lf" "$HOME/.config/lf"
    create_symlink "$DOTFILES_DIR/.config/gtk-3.0" "$HOME/.config/gtk-3.0"
    create_symlink "$DOTFILES_DIR/.config/starship.toml" "$HOME/.config/starship.toml"

    echo ""

    # Link .local directory
    print_info "Linking .local files..."
    create_symlink "$DOTFILES_DIR/.local/bin" "$HOME/.local/bin"

    echo ""

    # Link home directory files
    print_info "Linking home directory files..."
    create_symlink "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
    create_symlink "$DOTFILES_DIR/.zprofile" "$HOME/.zprofile"

    echo ""
    echo "╔═══════════════════════════════════════╗"
    echo "║     Installation Complete! 🎉        ║"
    echo "╚═══════════════════════════════════════╝"
    echo ""

    print_info "Next steps:"
    echo "  1. Change shell to zsh: chsh -s \$(which zsh)"
    echo "  2. Logout and login again (to load .zprofile)"
    echo "  3. Reload shell configuration: source ~/.zshrc"
    echo "  4. Open neovim to install plugins: nvim"
    echo ""
}

# Run main function
main
