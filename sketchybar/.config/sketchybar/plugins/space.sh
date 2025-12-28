#!/bin/bash

source "$CONFIG_DIR/colors.sh"

SID=$1

APPS=$(/run/current-system/sw/bin/aerospace list-windows --workspace "$SID" --format "%{app-name}" | sort -u)

icon_strip=""
if [ "$APPS" != "" ]; then
  while read -r app;
  do
    if [ "$app" != "Finder" ]; then
      icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
    fi
  done <<< "$APPS"
else
  icon_strip+=""
fi

if [ "$SID" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME \
             background.drawing=on \
             background.color=$MOCHA_FLAMINGO \
             label.color=$MOCHA_CRUST \
             icon.color=$MOCHA_CRUST \
             label="$icon_strip" \
	     label.padding_right=20
else
  sketchybar --set $NAME \
             background.drawing=off \
             label.color=$MOCHA_TEXT \
             icon.color=$MOCHA_OVERLAY2 \
	     label.padding_right=5 \
             label=""
fi
