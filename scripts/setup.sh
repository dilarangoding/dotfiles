#!/bin/bash

set -e

# Colors for logging
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Configuration Variables
DOTFILES_REPO="https://github.com/dilarangoding/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"
FONT_DIR="/usr/share/fonts/jetbrains-mono-nf"

log_info() { echo -e "${BLUE}[INFO] $1${NC}"; }
log_success() { echo -e "${GREEN}[OK] $1${NC}"; }
log_error() { echo -e "${RED}[ERROR] $1${NC}"; }

log_info "Starting Setup for Fedora Sway 43..."

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# -----------------------------------------------------------
# 1. System Update
# -----------------------------------------------------------
log_info "[1/9] Updating System..."
sudo dnf update -y && sudo dnf upgrade -y
log_success "System Updated."

# -----------------------------------------------------------
# 2. Base Dependencies
# -----------------------------------------------------------
log_info "[2/9] Installing Base Dependencies..."
sudo dnf install -y git curl wget unzip tar flatpak util-linux-user
log_success "Base dependencies installed."

# -----------------------------------------------------------
# 3. Shell Setup (Zsh)
# -----------------------------------------------------------
log_info "[3/9] Installing Zsh..."
if ! rpm -q zsh &> /dev/null; then
    sudo dnf install -y zsh
    log_success "Zsh installed."
else
    log_success "Zsh already installed."
fi

# -----------------------------------------------------------
# 4. RPM Applications & Dev Tools
# -----------------------------------------------------------
log_info "[4/9] Installing Applications & Dev Tools..."
sudo dnf install -y alacritty nautilus rofi golang nodejs npm fzf bat tmux btop zoxide

# Install Brave Browser
log_info "Installing Brave Browser..."
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install -y brave-browser

# Install Zed Editor
log_info "Installing Zed Editor..."
curl -f https://zed.dev/install.sh | sh
export PATH=$HOME/.local/bin:$PATH

# Remove Old Apps
log_info "Removing old apps (Firefox, Foot, Thunar)..."
for app in firefox foot thunar; do
    if rpm -q $app &> /dev/null; then
        sudo dnf remove -y $app
        log_success "$app removed."
    else
        echo "$app not found, skipping removal."
    fi
done

# -----------------------------------------------------------
# 5. Flatpak Setup
# -----------------------------------------------------------
log_info "[5/9] Configuring Flatpak..."

# Add Flathub
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install Apps
log_info "Installing Obsidian..."
flatpak install -y flathub md.obsidian.Obsidian

log_info "Installing Localsend..."
flatpak install -y flathub org.localsend.localsend_app

# -----------------------------------------------------------
# 6. System-Wide Fonts
# -----------------------------------------------------------
log_info "[6/9] Installing JetBrains Mono Nerd Font..."

if [ ! -d "$FONT_DIR" ]; then
    sudo mkdir -p "$FONT_DIR"
    wget -O /tmp/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
    sudo unzip -o /tmp/JetBrainsMono.zip -d "$FONT_DIR"

    log_info "Fixing font permissions..."
    sudo find "$FONT_DIR" -type f -exec chmod 644 {} \;
    sudo find "$FONT_DIR" -type d -exec chmod 755 {} \;

    sudo fc-cache -fv
    rm /tmp/JetBrainsMono.zip
    log_success "Fonts installed."
else
    log_success "Fonts already exist."
fi

# -----------------------------------------------------------
# 7. Dotfiles Setup
# -----------------------------------------------------------
log_info "[7/9] Setting up Dotfiles..."

# Clone Repo
if [ -d "$DOTFILES_DIR" ]; then
    log_info "Dotfiles directory exists, pulling latest changes..."
    cd "$DOTFILES_DIR" && git pull
else
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
fi

# Symlink Function
link_config() {
    local source="$DOTFILES_DIR/$1"
    local target="$CONFIG_DIR/$1"

    rm -rf "$target"
    ln -s "$source" "$target"
    log_success "Linked: $1"
}

mkdir -p "$CONFIG_DIR"

# Link configurations
link_config "sway"
link_config "waybar"
link_config "rofi"
link_config "alacritty"
link_config "backgrounds"

# Make Sway scripts executable
chmod +x "$DOTFILES_DIR/sway/scripts/"*.sh
log_success "Sway scripts made executable."

# -----------------------------------------------------------
# 8. Zsh Configuration
# -----------------------------------------------------------
log_info "[8/9] Configuring Zsh..."

# Change Default Shell
if [ "$SHELL" != "/usr/bin/zsh" ]; then
    log_info "Changing default shell to Zsh..."
    sudo chsh -s /usr/bin/zsh "$USER"
fi

# Install Zinit (Bootstrap)
ZINIT_DIR="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_DIR" ]; then
    log_info "Bootstrapping Zinit..."
    bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
fi

# Force Symlink .zshrc (Override Zinit's default)
if [ -f "$DOTFILES_DIR/.zshrc" ]; then
    rm -f ~/.zshrc
    ln -s "$DOTFILES_DIR/.zshrc" ~/.zshrc
    log_success ".zshrc linked (overwritten)."
else
    log_error ".zshrc not found in repository root!"
fi

# -----------------------------------------------------------
# 9. SDDM Background Hack
# -----------------------------------------------------------
log_info "[9/9] Configuring SDDM Background..."

BG_SRC="$DOTFILES_DIR/backgrounds/006.jpg"
BG_DST="/usr/share/backgrounds/006.jpg"
DEFAULT_JXL="/usr/share/backgrounds/default.jxl"

if [ -f "$BG_SRC" ]; then
    sudo cp "$BG_SRC" "$BG_DST"

    if [ ! -f "${DEFAULT_JXL}.bak" ]; then
        if [ -f "$DEFAULT_JXL" ]; then
            sudo mv "$DEFAULT_JXL" "${DEFAULT_JXL}.bak"
        fi
    fi

    sudo rm -f "$DEFAULT_JXL"
    sudo ln -s "$BG_DST" "$DEFAULT_JXL"
    log_success "SDDM background hack applied."
else
    log_error "Background image (006.jpg) not found in dotfiles."
fi

# -----------------------------------------------------------
# Completion
# -----------------------------------------------------------
echo -e "${GREEN}=========================================${NC}"
echo -e "${GREEN}SETUP COMPLETED SUCCESSFULLY!${NC}"
echo -e "${GREEN}Please reboot your system to apply all changes.${NC}"
echo -e "${GREEN}Note: Zed is installed in ~/.local/bin. Re-login to update PATH.${NC}"
echo -e "${GREEN}=========================================${NC}"
