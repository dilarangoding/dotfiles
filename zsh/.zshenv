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
export TERMINAL=foot
export BROWSER=firefox

# ── PATH ──────────────────────────────────────────────────────────

path=(
  "$HOME/.local/bin"                              # Local binaries
  "/usr/local/go/bin"                             # Go compiler
  "$HOME/.cargo/bin"                              # Rust / Cargo
  "$HOME/go/bin"                                  # Go modules
  "$HOME/.bun/bin"                                # Bun
  "$HOME/.local/share/fnm"                        # fnm (Node.js)
  "$XDG_DATA_HOME/bob/nvim-bin"                   # Neovim (bob)
  "$HOME/.config/tmux/plugins/tmuxifier/bin"      # Tmuxifier
  $path                                           # System default
)
export PATH