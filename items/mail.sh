#!/bin/bash

sketchybar --add item mail right \
  --set mail update_freq=60 \
  icon=􀍖  \
  script="$PLUGIN_DIR/noti_mail.sh"
