# ~/.zshenv — the only file that MUST live in $HOME
# Zsh reads this before anything else, even for non-interactive shells.

export ZDOTDIR="$HOME/.config/zsh"

# ── XDG Base Directories ──────────────────────────────────────────
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# ── Rust ──────────────────────────────────────────────────────────
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

# ── Go ────────────────────────────────────────────────────────────
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"

# ── Node.js / npm ─────────────────────────────────────────────────
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NODE_REPL_HISTORY="$XDG_STATE_HOME/node/repl_history"

# ── Python ────────────────────────────────────────────────────────
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc.py"
export PYTHON_HISTORY="$XDG_STATE_HOME/python/history"

# ── Bun ───────────────────────────────────────────────────────────
export BUN_INSTALL="$HOME/.bun"

# ── fnm ───────────────────────────────────────────────────────────
export FNM_PATH="$HOME/.local/share/fnm"

# ── Editor / Terminal ─────────────────────────────────────────────
export EDITOR=nvim
export VISUAL=nvim
export SUDO_EDITOR=nvim
export FCEDIT=nvim
export TERMINAL=foot
export BROWSER=firefox

# ── Misc tools ────────────────────────────────────────────────────
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export LESSHISTFILE="$XDG_STATE_HOME/less/history"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

# ── PATH ──────────────────────────────────────────────────────────
export PATH="$HOME/.local/bin:$CARGO_HOME/bin:$GOPATH/bin:$BUN_INSTALL/bin:$FNM_PATH:$HOME/.config/tmux/plugins/tmuxifier/bin:$PATH"
