# st (Simple Terminal)

Suckless simple terminal build, configured and patched for personal use.

## Dependencies

```sh
sudo apt install build-essential libx11-dev libxft-dev libxext-dev libharfbuzz-dev
```

## Structure

```
st/
├── st-src/          # st source code (cloned from suckless.org)
│   ├── config.def.h # default config (DO NOT EDIT)
│   ├── config.h     # your config (edit this)
│   └── ...
├── patches/         # downloaded .diff patch files
└── README.md
```

## Build & Install

```sh
cd ~/dotfiles/st/st-src
sudo make clean install
```

This installs `st` to `/usr/local/bin/st`.

## Applying Patches

1. Download the patch from [st patches](https://st.suckless.org/patches/) into the `patches/` directory:

```sh
cd ~/dotfiles/st/patches
wget https://st.suckless.org/patches/<patch-name>/<patch-file>.diff
```

2. Apply the patch:

```sh
cd ~/dotfiles/st/st-src
patch -p1 < ../patches/<patch-file>.diff
```

3. If conflicts occur, resolve them manually in the `.rej` files, then rebuild.

4. Rebuild:

```sh
sudo make clean install
```

## Removing a Patch

```sh
cd ~/dotfiles/st/st-src
patch -Rp1 < ../patches/<patch-file>.diff
sudo make clean install
```

## Recommended Patches

| Patch | Description |
|-------|-------------|
| [scrollback](https://st.suckless.org/patches/scrollback/) | Scroll back through terminal output |
| [alpha](https://st.suckless.org/patches/alpha/) | Background transparency |
| [clipboard](https://st.suckless.org/patches/clipboard/) | Copy/paste with Ctrl+Shift+C/V |
| [anysize](https://st.suckless.org/patches/anysize/) | Fill window without gaps |
| [bold-is-not-bright](https://st.suckless.org/patches/bold-is-not-bright/) | Prevent bold from changing colors |

## Config

All configuration is done in `st-src/config.h`. After editing, rebuild with `sudo make clean install`.

Key settings:
- **font**: `Iosevka Nerd Font:pixelsize=14`
- **shell**: defaults to `$SHELL` or `/bin/sh`
- **tabspaces**: 8 (default)

## Notes

- `config.def.h` is the upstream default — don't edit it directly.
- `config.h` is your personal config and what gets compiled.
- Always apply patches **before** editing `config.h` to minimize conflicts.
- After applying a patch, merge any changes from the updated `config.def.h` into your `config.h`.