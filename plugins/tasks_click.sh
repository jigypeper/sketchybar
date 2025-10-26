#!/bin/bash
export PATH="$PATH:/Users/Leo/.local/bin"

# Refresh popup items
$CONFIG_DIR/plugins/tasks_popup.sh

# Toggle popup
sketchybar --set $NAME popup.drawing=toggle
