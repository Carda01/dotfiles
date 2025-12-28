#!/bin/bash
source "$CONFIG_DIR/colors.sh"

sketchybar --add item volume right \
	   --set volume script="$PLUGIN_DIR/volume.sh" \
			icon.color=$MOCHA_PEACH \
	   --subscribe volume volume_change
