#!/bin/sh
export PATH="$PATH:/Users/Leo/.local/bin"

PENDING_TASK=$(todo task stats -p | tr -d '\n')
OVERDUE_TASK=$(todo task stats -o | tr -d '\n')

if [[ $PENDING_TASK == 0 ]]; then
	sketchybar --set $NAME label.drawing=off \
		icon.padding_left=4 \
		icon.padding_right=4
else
	if [[ $OVERDUE_TASK == 0 ]]; then
		LABEL=$PENDING_TASK
	else
		LABEL="!$OVERDUE_TASK/$PENDING_TASK"
	fi

	sketchybar --set $NAME label="${LABEL}" \
		label.drawing=on \
		icon.padding_left=6 \
		icon.padding_right=2
fi
