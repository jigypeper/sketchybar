#!/bin/bash

sketchybar --add item brew right \
  --set brew update_freq=10800 \
  icon=􀁹 \
  script="$PLUGIN_DIR/noti_brew.sh"
