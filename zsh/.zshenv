# ~/.zshenv — the only file that MUST live in $HOME
# Zsh reads this before anything else, even for non-interactive shells.

export ZDOTDIR="$HOME/.config/zsh"

# ── XDG Base Directories ──────────────────────────────────────────
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# ── Editor / Terminal ─────────────────────────────────────────────
export EDITOR=nvim
export VISUAL=nvim
export SUDO_EDITOR=nvim
export TERMINAL=st
export BROWSER=w3m
export TERM="st-256color"

# ── Custom directories ──────────────────────────────────────────
export DEV_DIR="$HOME/dev"
export NOTES_DIR="$HOME/notes"
export SRC_DIR="$HOME/src"

# ── PATH ────────────────────────────────────────────────────────
export GOPATH="$XDG_DATA_HOME/go"
path=(
  "$HOME/.local/bin"                              # Local binaries
  "/usr/local/go/bin"                             # Go compiler
  "$HOME/.cargo/bin"                              # Rust / Cargo
  "$GOPATH/bin"                                   # Go modules
  "$HOME/.bun/bin"                                # Bun
  "$HOME/.local/share/fnm"                        # fnm (Node.js)
  "$HOME/.config/tmux/plugins/tmuxifier/bin"      # Tmuxifier
  "$HOME/.nimble/bin"
  "$XDG_DATA_HOME/development/flutter/bin"          # Flutter
  "$XDG_DATA_HOME/android/sdk/platform-tools"       # Android platform-tools
  "$XDG_DATA_HOME/android/sdk/cmdline-tools/latest/bin" # Android cmdline-tools
  $path                                           # System default
)
export PATH

# ── Android / Flutter ───────────────────────────────────────────
export ANDROID_HOME="$XDG_DATA_HOME/android/sdk"
export CHROME_EXECUTABLE=/usr/bin/brave-browser

# ── History ─────────────────────────────────────────────────────
export HISTFILE="$XDG_STATE_HOME/zsh/history"
