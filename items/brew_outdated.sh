#!/bin/bash

sketchybar --add item brew right \
  --set brew update_freq=120 \
  icon=􀁹 \
  script="$PLUGIN_DIR/noti_brew.sh"
