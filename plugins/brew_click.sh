#!/bin/bash

# Refresh popup items
$CONFIG_DIR/plugins/brew_popup.sh

# Toggle popup
sketchybar --set $NAME popup.drawing=toggle
