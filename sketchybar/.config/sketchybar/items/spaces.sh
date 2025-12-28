#!/bin/bash
source "$CONFIG_DIR/colors.sh"

space=(
  background.corner_radius=9
  background.border_width=2
  background.drawing=on
  background.shadow.drawing=on
  background.shadow.angle=90
  icon.padding_left=20
  label.padding_right=20
  icon.y_offset=1
  icon.padding_right=5
  label.font="sketchybar-app-font:Regular:15.0"
  drawing=off
  label.color="$MOCHA_PEACH"
)

sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
  sketchybar --add item space.$sid left \
             --subscribe space.$sid aerospace_workspace_change \
             --set space.$sid "${space[@]}" \
                   icon="$sid" \
                   click_script="aerospace workspace $sid" \
                   script="$CONFIG_DIR/plugins/aerospace.sh $sid"
  apps=$(aerospace list-windows --format %{app-name} --workspace "$sid" | sort -u)
  icon_strip=""
  if [ "${apps}" != "" ]; then
    while read -r app; do
      icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
    done <<<"${apps}"
    sketchybar --animate tahn 10 --set space.$sid drawing=on label="$icon_strip"
  fi
done

sketchybar --add item space_windows left \
           --set space_windows \
		 background.drawing=off\
                 script="$PLUGIN_DIR/space_windows.sh" \
           --subscribe space_windows aerospace_workspace_change space_windows_change
