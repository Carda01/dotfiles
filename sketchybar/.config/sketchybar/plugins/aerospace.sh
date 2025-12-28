#!/bin/bash

source "$CONFIG_DIR/colors.sh"

SID=$1

# if [ "$SID" = "$FOCUSED_WORKSPACE" ]; then
#   sketchybar --set $NAME \
#              background.drawing=on \
#              background.border_color=$MOCHA_FLAMINGO \
#              label.color=$MOCHA_CRUST \
#              icon.color=$MOCHA_CRUST
# else
#   sketchybar --set $NAME \
#              background.drawing=off \
#              label.color=$MOCHA_TEXT \
#              icon.color=$MOCHA_OVERLAY2
# fi


if [[ "$SID" = "$FOCUSED_WORKSPACE" ]]; then
  sketchybar --animate tahn 10 --set "$NAME" background.border_color="$MOCHA_PEACH" icon.color="$MOCHA_PEACH" background.shadow.color="$MOCHA_PEACH" background.shadow.distance=1
else
  sketchybar --animate tahn 10 --set "$NAME" background.border_color="$MOCHA_GREEN" background.shadow.color="$MOCHA_GREEN" background.shadow.distance=3 icon.color="$MOCHA_LAVENDER"
fi
