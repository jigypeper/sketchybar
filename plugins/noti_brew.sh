#!/bin/sh

STATUS_LABEL=$(brew outdated | wc -l | xargs)
LABEL=""

if [[ $STATUS_LABEL == 0 ]]; then
    LABEL=""
else
    LABEL=$STATUS_LABEL
fi

if [[ $LABEL == "" ]];
then
  sketchybar --set $NAME label.drawing=off    \
                         icon.padding_left=4  \
                         icon.padding_right=4
else
  sketchybar --set $NAME label="${LABEL}"     \
                         label.drawing=on     \
                         icon.padding_left=6  \
                         icon.padding_right=2
fi
