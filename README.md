# Dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

```
dotfiles/
├── backgrounds/        # Wallpapers (not stowed)
├── fonts/              # ~/.local/share/fonts/
├── git/                # ~/.gitconfig, ~/.gitignore_global
├── gtk/                # ~/.config/gtk-3.0/
├── i3/                 # ~/.config/i3/
├── joplin/             # ~/.config/joplin/keymap.json (file only)
├── kitty/              # ~/.config/kitty/
├── lf/                 # ~/.config/lf/
├── newsboat/           # ~/.newsboat/
├── nvim/               # ~/.config/nvim/
├── st/                 # Suckless terminal (built from source, not stowed)
│   ├── st-src/         # Patched st source code
│   │   ├── config.def.h
│   │   └── config.h    # Personal config (edit this)
│   └── patches/        # .diff patch files
├── tmux/               # ~/.config/tmux/ (includes tmuxifier submodule)
├── w3m/                # ~/.w3m/
├── zsh/                # ~/.zshrc
├── Makefile
└── README.md
```

## Dependencies

```sh
sudo apt install git stow build-essential libx11-dev libxft-dev libxext-dev libharfbuzz-dev
```

## Install

### 1. Clone

```sh
git clone --recurse-submodules <repo-url> ~/dotfiles
cd ~/dotfiles
```

If you already cloned without `--recurse-submodules`:

```sh
git submodule update --init --recursive
```

### 2. Stow all packages

```sh
make install
```

Or stow individual packages:

```sh
make nvim
make zsh
make kitty
```

### 3. Build st (suckless terminal)

```sh
cd ~/dotfiles/st/st-src
sudo make clean install
```

This installs `st` to `/usr/local/bin/st`.

## Uninstall

Remove all symlinks:

```sh
make uninstall
```

Uninstall st:

```sh
cd ~/dotfiles/st/st-src
sudo make uninstall
```

## Restow

If you changed the directory structure of a package, restow to refresh symlinks:

```sh
make restow
```

## Managing Packages

### Stow a single package

```sh
cd ~/dotfiles
stow -v -t ~ <package>
```

### Unstow a single package

```sh
cd ~/dotfiles
stow -v -t ~ -D <package>
```

### Packages with `--no-folding`

Joplin uses `--no-folding` so that only `keymap.json` is symlinked, not the entire
`~/.config/joplin/` directory. This prevents database files and other runtime data from
ending up in the repo.

```sh
stow -v -t ~ --no-folding joplin
```

This is already handled automatically by `make install`.

## st (Suckless Terminal)

st is configured at compile time. The source lives in `st/st-src/` and is tracked
directly in this repo (not stowed).

### Applying a Patch

1. Download the patch into `st/patches/`:

```sh
cd ~/dotfiles/st/patches
wget https://st.suckless.org/patches/<name>/<file>.diff
```

2. Apply it:

```sh
cd ~/dotfiles/st/st-src
patch -p1 < ../patches/<file>.diff
```

3. If there are conflicts, check the `.rej` files and resolve manually.

4. Merge any new options from `config.def.h` into your `config.h`.

5. Rebuild:

```sh
sudo make clean install
```

### Removing a Patch

```sh
cd ~/dotfiles/st/st-src
patch -Rp1 < ../patches/<file>.diff
sudo make clean install
```

### Currently Applied Patches

| Patch                        | Description                                      |
| ---------------------------- | ------------------------------------------------ |
| scrollback                   | Scroll back through output with Shift+PageUp/Down |
| scrollback-mouse             | Scroll back with Shift+MouseWheel                |
| scrollback-mouse-altscreen   | MouseWheel scrolls without Shift outside alt screen |
| externalpipe                 | Pipe terminal output to external commands        |
| boxdraw                      | Gapless box-drawing and braille characters       |
| clipboard                    | Selection automatically copies to clipboard      |
| bold-is-not-bright           | Bold text does not change color                  |
| anysize                      | No pixel gaps in tiling WMs like i3              |

### Config

All configuration is in `st/st-src/config.h`. Key settings:

- **Font**: `Iosevka Nerd Font:pixelsize=16`
- **Colorscheme**: Gruber Darker
- **Boxdraw**: enabled (lines, bold, braille)

> **Note**: `config.def.h` is the upstream default with patches applied — do not edit it
> directly. Always edit `config.h`.

## Notes

- `newsboat` and `w3m` use their legacy paths (`~/.newsboat/`, `~/.w3m/`) instead of XDG.
- `joplin` only tracks `keymap.json` to avoid leaking database/sensitive data.
- `fonts/` contains Iosevka Nerd Font (Regular, Bold, Italic, BoldItalic).
- `backgrounds/` is not stowed — reference wallpapers directly from `~/dotfiles/backgrounds/`.
- After adding new fonts, rebuild the font cache: `fc-cache -fv`.
```

Now let me also clean up the leftover `.orig` file and verify the git state: