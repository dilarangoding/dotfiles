#!/usr/bin/env bash

BACKGROUND_DIR="$HOME/.config/backgrounds"

BACKGROUND_LIST=("$BACKGROUND_DIR"/*)

if [ -f "$HOME/.fehbg" ]; then
    CURRENT_BACKGROUND=$(grep -oP "feh.* '\K[^']+" "$HOME/.fehbg" | head -1)
else
    CURRENT_BACKGROUND="${BACKGROUND_LIST[0]}"
fi

echo "Current background: $CURRENT_BACKGROUND"

CURRENT_INDEX=0
for i in "${!BACKGROUND_LIST[@]}"; do
    if [[ "${BACKGROUND_LIST[$i]}" == "${CURRENT_BACKGROUND}" ]]; then
        CURRENT_INDEX=$i
        break
    fi
done

NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#BACKGROUND_LIST[@]} ))

NEXT_BACKGROUND="${BACKGROUND_LIST[$NEXT_INDEX]}"

echo "Next background: $NEXT_BACKGROUND"

feh --bg-fill "$NEXT_BACKGROUND"
