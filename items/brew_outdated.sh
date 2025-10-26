#!/bin/bash

sketchybar --add item brew right \
  --set brew update_freq=60 \
  icon=􀁹 \
  script="$PLUGIN_DIR/noti_brew.sh" \
  click_script="$PLUGIN_DIR/brew_click.sh" \
  popup.align=right \
  popup.height=30
