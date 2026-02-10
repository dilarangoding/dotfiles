# ─── Auto startx on tty1 ─────────────────────────────────────────────
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec sway
fi
