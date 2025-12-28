#!/bin/bash
source "$CONFIG_DIR/colors.sh"

sketchybar --add item front_app left \
           --set front_app \
                           icon.color=$MOCHA_TEAL \
                           icon.font="sketchybar-app-font:Regular:15.0" \
                           script="$CONFIG_DIR/plugins/front_app.sh" \
           --subscribe front_app front_app_switched
