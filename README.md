# Dotfiles - Fedora 43 Sway Setup

### Window Manager & Desktop
- **Sway** - Wayland compositor (i3-compatible)
- **Waybar** - Status bar dengan custom styling
- **Rofi** - Application launcher (dmenu style)
- **swaylock** - Screen locker
- **swayidle** - Idle management
- **swaybg** - Background manager
- **autotiling** - Auto tiling layout

### Terminal & Shell
- **Alacritty** - Terminal emulator
- **Zsh** - Shell dengan Zinit plugin manager
- **Starship** - Cross-shell prompt
- **Tmux** - Terminal multiplexer

### Development Tools
- **Neovim** - Text editor dengan LSP support
- **Lazygit** - Git TUI
- **Lazydocker** - Docker TUI
- **btop** - System monitor

### CLI Utilities
- **fzf** - Fuzzy finder
- **bat** - Cat replacement dengan syntax highlighting
- **lsd** - Modern ls replacement
- **zoxide** - Smarter cd command
- **yazi** - File manager (y shell wrapper included)
- **cliphist** - Clipboard history
- **grim** - Screenshot utility
- **slurp** - Region selector
- **wl-copy** - Wayland clipboard utility
- **dunst** - Notification daemon

### Languages & Runtimes
- **Go** (golang)
- **Node.js** & npm
- **PHP** dengan Intelephense LSP
- **Rust** (via cargo)

### Browsers & Apps
- **Brave Browser**
- **Zen Browser** (Flatpak: `app.zen_browser.zen`)
- **Obsidian** (Flatpak: `md.obsidian.Obsidian`)
- **Localsend** (Flatpak: `org.localsend.localsend_app`)
- **Nautilus** - File manager

### Fonts
- **JetBrains Mono Nerd Font** - Primary font
- **Cascadia Mono** - Waybar font

### Themes
- **Gruvbox Hard** - Color scheme (Alacritty, Neovim, Bat)

## Installation

### 1. Quick Setup (Automated)
```bash
git clone https://github.com/dilarangoding/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x scripts/setup.sh
./scripts/setup.sh
```

Script akan otomatis:
- Update sistem
- Install semua dependencies
- Setup Zsh + Zinit
- Install fonts
- Link semua config files
- Setup SDDM background

### 2. Manual Installation

#### Base System Update
```bash
sudo dnf update -y && sudo dnf upgrade -y
```

#### Install Sway & Dependencies
```bash
sudo dnf install -y sway waybar rofi swaylock swayidle swaybg \
    grim slurp wl-clipboard dunst
```

#### Install Terminal & Shell
```bash
sudo dnf install -y alacritty zsh
chsh -s $(which zsh)
```

#### Install Dev Tools
```bash
sudo dnf install -y git neovim golang nodejs npm curl wget unzip tar
```

#### Install CLI Utilities
```bash
sudo dnf install -y fzf bat tmux btop \
    nautilus pavucontrol
```

#### Install Starship
```bash
curl -sS https://starship.rs/install.sh | sh
```

#### Install Zoxide
```bash
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
```

#### Install lsd
```bash
sudo dnf install -y lsd
```

#### Install Brave Browser
```bash
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install -y brave-browser
```

#### Install Zed Editor
```bash
curl -f https://zed.dev/install.sh | sh
```

#### Setup Flatpak
```bash
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install -y flathub md.obsidian.Obsidian
flatpak install -y flathub org.localsend.localsend_app
flatpak install -y flathub app.zen_browser.zen
```

#### Install JetBrains Mono Nerd Font
```bash
FONT_DIR="/usr/share/fonts/jetbrains-mono-nf"
sudo mkdir -p "$FONT_DIR"
wget -O /tmp/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
sudo unzip -o /tmp/JetBrainsMono.zip -d "$FONT_DIR"
sudo fc-cache -fv
rm /tmp/JetBrainsMono.zip
```

#### Install Zinit (Zsh Plugin Manager)
```bash
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
```

#### Install Neovim Plugins (Lazy.nvim)
```bash
nvim
# Lazy.nvim akan auto-bootstrap saat first launch
# Tekan 'q' untuk close dashboard, plugins akan auto-install
```

#### Link Dotfiles
```bash
CONFIG_DIR="$HOME/.config"
DOTFILES_DIR="$HOME/dotfiles"

ln -sf "$DOTFILES_DIR/sway" "$CONFIG_DIR/"
ln -sf "$DOTFILES_DIR/waybar" "$CONFIG_DIR/"
ln -sf "$DOTFILES_DIR/rofi" "$CONFIG_DIR/"
ln -sf "$DOTFILES_DIR/alacritty" "$CONFIG_DIR/"
ln -sf "$DOTFILES_DIR/backgrounds" "$CONFIG_DIR/"
ln -sf "$DOTFILES_DIR/bat" "$CONFIG_DIR/"
ln -sf "$DOTFILES_DIR/nvim" "$CONFIG_DIR/"
ln -sf "$DOTFILES_DIR/i3" "$CONFIG_DIR/"
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/"
ln -sf "$DOTFILES_DIR/starship.toml" "$CONFIG_DIR/"

# Create scripts directory and link scripts
mkdir -p "$CONFIG_DIR/i3/scripts"
ln -sf "$DOTFILES_DIR/scripts/i3-background-swap.sh" "$CONFIG_DIR/i3/scripts/"

chmod +x "$DOTFILES_DIR/sway/scripts/"*.sh
chmod +x "$DOTFILES_DIR/scripts/"*.sh
```

## Configuration

### Sway Config Structure
```
~/.config/sway/
├── config                          # Main config
├── config.d/
│   ├── autostart-applications.conf
│   ├── clamshell.conf             # Laptop lid management
│   ├── colors                      # Tokyo Night theme
│   ├── default-layouts-for-applications.conf
│   ├── default-options-and-keymaps.conf
│   ├── input.conf                 # Touchpad & keyboard
│   ├── output.conf                # Display settings
│   └── theme.conf                 # GTK theme & gaps
└── scripts/
    ├── auto-rotate.sh
    ├── background-swap.sh         # Cycle backgrounds
    ├── battery-check.sh           # Battery notifications
    ├── clamshell.sh
    ├── light.sh                   # wlsunset (night light)
    └── lockman.sh                 # Lock screen manager
```

### Key Bindings (Sway)

#### Basics
- `Mod+Return` - Launch terminal
- `Mod+W` - Kill window
- `Mod+Space` - Application launcher
- `Mod+Escape` - Lock & suspend

#### Screenshots
- `Mod+Shift+S` - Screenshot region
- `Mod+Shift+P` - Screenshot full screen

#### Window Management
- `Mod+Arrow Keys` - Focus window
- `Mod+Shift+Arrow Keys` - Move window
- `Mod+Tab` / `Mod+Shift+Tab` - Workspace navigation
- `Mod+F` - Toggle fullscreen
- `Mod+T` - Toggle floating

#### Workspaces
- `Mod+1-9` - Switch to workspace
- `Mod+Shift+1-9` - Move window to workspace

#### App Shortcuts
- `Mod+Shift+B` - Browser (Zen)
- `Mod+Shift+F` - File manager (Nautilus)
- `Mod+Shift+T` - btop
- `Mod+Shift+N` - Neovim
- `Mod+Shift+D` - lazydocker
- `Mod+Shift+O` - Obsidian

#### Rotation (for convertible laptops)
- `Mod+F9` - Normal (0°)
- `Mod+Ctrl+F9` - Rotate 90°
- `Mod+Shift+F9` - Rotate 180°

#### Notifications
- `Mod+,` - Close notification
- `Mod+Shift+,` - Close all notifications
- `Mod+Ctrl+,` - Toggle pause

#### Misc
- `Mod+Mod1+Space` - Cycle backgrounds
- `Mod+Shift+V` - Clipboard history (cliphist)

### Neovim LSP & Plugins

#### Installed LSPs (via Mason)
- **tailwindcss** - TailwindCSS
- **intelephense** - PHP
- **gopls** - Go
- **ts_ls** - TypeScript/JavaScript

#### Key Plugins
- **lazy.nvim** - Plugin manager
- **snacks.nvim** - File picker, Git, notifications
- **nvim-treesitter** - Syntax highlighting
- **nvim-lspconfig** - LSP configuration
- **nvim-cmp** - Autocompletion
- **LuaSnip** - Snippets
- **copilot.vim** - GitHub Copilot
- **avante.nvim** - AI assistant (Claude)
- **gruvbox.nvim** - Color scheme
- **oil.nvim** - File explorer
- **vim-test** - Testing framework

#### Neovim Key Bindings
- `Space` - Leader key
- `K` - Hover documentation
- `<leader>gd` - Go to definition
- `<leader>gr` - Go to references
- `<leader>ca` - Code actions
- `<leader>gf` - Format
- `<leader>rn` - Rename
- `Ctrl+p` - File picker
- `<leader><leader>` - Recent files
- `<leader>fb` - Buffers
- `<leader>fg` - Grep
- `Ctrl+n` - File explorer
- `-` - Oil.nvim toggle

### Zsh Aliases

#### Navigation
```bash
c         # clear
q         # exit
..        # cd ..
```

#### File Operations
```bash
cat       # bat (syntax highlighting)
ls        # lsd with icons
ll        # lsd detailed list
tree      # lsd tree view
```

#### Editors
```bash
vi/vim    # nvim
```

#### Utilities
```bash
preview   # fzf file preview + open
iplocal   # show local IP
ipexternal # show public IP
y         # yazi with directory change support
```

### Custom Scripts

#### LEMP Stack Manager
```bash
lemp start    # Start nginx, mariadb, php-fpm
lemp stop     # Stop all services
lemp restart  # Restart all services
lemp status   # Check status
```

## Post-Installation

### 1. Reboot
```bash
sudo reboot
```

### 2. First Zsh Launch
Zinit akan auto-install plugins saat first launch.

### 3. Neovim Setup
```bash
nvim
# Mason akan auto-install LSPs
# Tekan :checkhealth untuk verify
```

### 4. Configure Git
```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

### 5. Setup Backgrounds
Taruh wallpaper di `~/.config/backgrounds/`
- Format: JPG/PNG
- Cycle dengan `Mod+Mod1+Space`

## Troubleshooting

### Waybar tidak muncul
```bash
killall waybar
waybar &
```

### Fonts tidak terdeteksi
```bash
fc-cache -fv
```

### Zsh plugins tidak load
```bash
rm -rf ~/.local/share/zinit
# Re-run setup.sh atau install Zinit manual
```

### LSP tidak kerja di Neovim
```bash
nvim
:Mason
# Install LSP yang dibutuhkan
```

### Cliphist tidak berfungsi
```bash
wl-paste --watch cliphist store &
```

## Customization

### Ganti Wallpaper Default
Edit [`sway/config`](sway/config):
```
output * bg /path/to/your/wallpaper.jpg fill
```

### Ganti Font Waybar
Edit [`waybar/style.css`](waybar/style.css):
```css
font-family: "Your Font Name";
```

### Ganti Color Scheme
- Sway: Edit [`sway/config.d/colors`](sway/config.d/colors)
- Alacritty: Ganti theme di [`alacritty/alacritty.toml`](alacritty/alacritty.toml)
- Neovim: Edit [`nvim/lua/plugins/gruvbox.lua`](nvim/lua/plugins/gruvbox.lua)


**Note**: Script setup.sh akan remove Firefox, Foot, dan Thunar. Edit script jika tidak ingin remove.
