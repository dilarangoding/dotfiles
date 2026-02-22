# ─── Powerlevel10k Instant Prompt ────────────────────────────────────
# Must stay at the top. Initialization code that may require console
# input (password prompts, [y/n] confirmations, etc.) must go above.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ─── Zinit (plugin manager) ──────────────────────────────────────────
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# ─── ZSH Options ─────────────────────────────────────────────────────
setopt autocd
setopt correct
setopt interactivecomments
setopt magicequalsubst
setopt nonomatch
setopt notify
setopt numericglobsort
setopt promptsubst

# ─── History ─────────────────────────────────────────────────────────
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# ─── Plugins ─────────────────────────────────────────────────────────
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl

# Sync: vi-mode must bind keys before first input
zinit light jeffreytse/zsh-vi-mode

# Turbo: deferred loading after prompt is shown
zinit wait lucid for \
    zsh-users/zsh-completions \
    zsh-users/zsh-autosuggestions \
    Aloxaf/fzf-tab \
    atinit"zicompinit; zicdreplay" \
        zsh-users/zsh-syntax-highlighting

# ─── Prompt (Powerlevel10k) ─────────────────────────────────────────
zinit ice depth=1
zinit light romkatv/powerlevel10k

# Completions handled by turbo block above (zicompinit + zicdreplay)

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# ─── Tool Integrations (deferred) ───────────────────────────────────
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=rounded \
  --color=border:#27a1b9 \
  --color=fg:#c0caf5 \
  --color=gutter:#16161e \
  --color=header:#ff9e64 \
  --color=hl+:#2ac3de \
  --color=hl:#2ac3de \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#2ac3de \
  --color=query:#c0caf5:regular \
  --color=scrollbar:#27a1b9 \
  --color=separator:#ff9e64 \
  --color=spinner:#ff007c \
"

zinit ice wait lucid atinit'source <(fzf --zsh)'
zinit light zdharma-continuum/null

zinit ice wait lucid atinit'eval "$(zoxide init --cmd cd zsh)"'
zinit light zdharma-continuum/null

zinit ice wait lucid atinit'
  if (( $+commands[fnm] )); then
    eval "$(fnm env --use-on-cd)"
  fi
'
zinit light zdharma-continuum/null

if (( $+commands[tmuxifier] )); then
  zinit ice wait lucid atinit'eval "$(tmuxifier init -)"'
  zinit light zdharma-continuum/null
fi

# ─── Functions ───────────────────────────────────────────────────────
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# ─── Aliases ─────────────────────────────────────────────────────────
alias c='clear'
alias q='exit'
alias ..='cd ..'
alias mkdir='mkdir -pv'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias rmdir='rmdir -v'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias lg='lazygit'
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias nb='newsboat'

if [[ -x "$(command -v nvim)" ]]; then
    alias vi='nvim'
    alias vim='nvim'
    alias svi='sudo nvim'
    alias vis='nvim "+set si"'
elif [[ -x "$(command -v vim)" ]]; then
    alias vi='vim'
    alias svi='sudo vim'
    alias vis='vim "+set si"'
fi

if [[ -x "$(command -v lsd)" ]]; then
    alias ls='lsd -F --group-dirs first'
    alias ll='lsd --all --header --long --group-dirs first'
    alias tree='lsd --tree'
fi

if [[ -x "$(command -v xdg-open)" ]]; then
    alias open='xdg-open'
fi

if [[ -x "$(command -v evince)" ]]; then
    alias pdf='evince'
fi

if [[ -x "$(command -v fzf)" ]]; then
    alias fzf='fzf --preview "head -500 {}"'
    if [[ -x "$(command -v xdg-open)" ]]; then
        alias preview='open $(fzf --info=inline --query="${@}")'
    else
        alias preview='edit $(fzf --info=inline --query="${@}")'
    fi
fi

if [[ -x "$(command -v ip)" ]]; then
    alias iplocal="ip -br -c a"
else
    alias iplocal="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
fi

if [[ -x "$(command -v curl)" ]]; then
    alias ipexternal="curl -s ifconfig.me && echo"
elif [[ -x "$(command -v wget)" ]]; then
    alias ipexternal="wget -qO- ifconfig.me && echo"
fi

# ─── Powerlevel10k Config ───────────────────────────────────────────
[[ -f "${ZDOTDIR:-$HOME}/.p10k.zsh" ]] && source "${ZDOTDIR:-$HOME}/.p10k.zsh"
# fnm
FNM_PATH="/home/ry/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
