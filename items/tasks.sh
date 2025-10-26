#!/bin/bash

sketchybar --add item tasks right \
  --set tasks update_freq=120 \
  icon=􀷾 \
  script="$PLUGIN_DIR/noti_task.sh" \
  click_script="$PLUGIN_DIR/tasks_click.sh" \
  popup.align=right \
  popup.height=30
