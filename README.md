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
│   ├── st-src/         # Full patched source code (ready to build)
│   │   ├── config.def.h
│   │   └── config.h    # Personal config (edit this)
│   └── patches/        # .diff patch files (kept for reference)
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

The full st source code is already included in `st/st-src/` with all patches applied.
You do **not** need to clone st separately. Just build and install:

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

st is configured at compile time. Unlike other packages that use stow, st is a C program
that you build from source. The entire source code — including all applied patches — is
committed directly in `st/st-src/`. The `.diff` files in `st/patches/` are kept for
reference only.

**On a fresh machine, all you need to do is:**

```sh
cd ~/dotfiles/st/st-src
sudo make clean install
```

No cloning, no patching — everything is already in the repo and ready to build.

### Editing Config

Edit `st/st-src/config.h` and rebuild:

```sh
cd ~/dotfiles/st/st-src
sudo make clean install
```

> **Note**: `config.def.h` is the upstream default with patches applied.
> Do not edit it directly. Always edit `config.h`.

### Applying a New Patch

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

6. Commit the changes so the patch is baked into the repo for next time.

### Removing a Patch

```sh
cd ~/dotfiles/st/st-src
patch -Rp1 < ../patches/<file>.diff
sudo make clean install
```

### Upgrading st to a New Version

If a new st version is released upstream and you want to upgrade:

1. Clone the new st source to a temporary directory:

```sh
git clone https://git.suckless.org/st /tmp/st-new
```

2. Back up your current `config.h`:

```sh
cp ~/dotfiles/st/st-src/config.h ~/dotfiles/st/config.h.bak
```

3. Replace the source (keep `patches/` and `README.md`):

```sh
rm -rf ~/dotfiles/st/st-src
cp -r /tmp/st-new ~/dotfiles/st/st-src
rm -rf ~/dotfiles/st/st-src/.git
```

4. Re-apply patches one by one from `st/patches/`:

```sh
cd ~/dotfiles/st/st-src
patch -p1 < ../patches/<patch-file>.diff
```

5. Copy your backed-up `config.h` and resolve any differences with the new `config.def.h`.

6. Rebuild and commit:

```sh
sudo make clean install
```

### Currently Applied Patches

| Patch                        | Description                                       |
| ---------------------------- | ------------------------------------------------- |
| scrollback                   | Scroll back through output with Shift+PageUp/Down |
| scrollback-mouse             | Scroll back with Shift+MouseWheel                 |
| scrollback-mouse-altscreen   | MouseWheel scrolls without Shift outside altscreen |
| externalpipe                 | Pipe terminal output to external commands         |
| boxdraw                      | Gapless box-drawing and braille characters        |
| clipboard                    | Selection automatically copies to clipboard       |
| bold-is-not-bright           | Bold text does not change color                   |
| anysize                      | No pixel gaps in tiling WMs like i3               |

### Current Config

- **Font**: `Iosevka Nerd Font:pixelsize=16`
- **Colorscheme**: Gruber Darker
- **Boxdraw**: enabled (lines, bold, braille)

## Notes

- `newsboat` and `w3m` use their legacy paths (`~/.newsboat/`, `~/.w3m/`) instead of XDG.
- `joplin` only tracks `keymap.json` to avoid leaking database/sensitive data.
- `fonts/` contains Iosevka Nerd Font (Regular, Bold, Italic, BoldItalic).
- `backgrounds/` is not stowed — reference wallpapers directly from `~/dotfiles/backgrounds/`.
- After adding new fonts, rebuild the font cache: `fc-cache -fv`.
- Applications themselves (binaries) are installed via your package manager (`apt`), not through this repo. This repo only manages configuration files.