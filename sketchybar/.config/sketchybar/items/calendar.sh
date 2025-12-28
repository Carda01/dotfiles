#!/bin/bash
source "$CONFIG_DIR/colors.sh"

sketchybar --add item calendar right \
	   --set calendar icon=󰃰 \
			  update_freq=15 \
			  script="$PLUGIN_DIR/calendar.sh" \
			  icon.color=$MOCHA_PINK
