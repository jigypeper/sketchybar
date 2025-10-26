#!/bin/bash
export PATH="$PATH:/Users/Leo/.local/bin"

# Remove old task items
sketchybar --remove '/tasks.task\..*/' 2>/dev/null

# Parse todo task view and create items for each task
INDEX=0
while IFS= read -r line; do
    # Skip table borders and header
    if [[ $line =~ ^\+.*\+$ ]] || [[ $line =~ ^\|.*ID.*\|.*PROJECT.*\| ]]; then
        continue
    fi
    
    # Parse task lines
    if [[ $line =~ ^\|[[:space:]]*([0-9]+)[[:space:]]*\|[[:space:]]*([^|]+)[[:space:]]*\|[[:space:]]*([^|]+)[[:space:]]*\|[[:space:]]*([^|]+)[[:space:]]*\|[[:space:]]*([^|]+)[[:space:]]*\|$ ]]; then
        ID="${BASH_REMATCH[1]}"
        PROJECT=$(echo "${BASH_REMATCH[2]}" | xargs)
        TASK=$(echo "${BASH_REMATCH[3]}" | xargs)
        DUE=$(echo "${BASH_REMATCH[4]}" | xargs)
        COMPLETE=$(echo "${BASH_REMATCH[5]}" | xargs)
        
        # Skip completed tasks
        if [[ $COMPLETE == "true" ]]; then
            continue
        fi
        
        # Format label with task and due date
        LABEL="$TASK • Due: $DUE"
        
        # Add popup item with proper styling
        sketchybar --add item tasks.task.$INDEX popup.tasks \
                   --set tasks.task.$INDEX \
                   label="$LABEL" \
                   icon="[$PROJECT]" \
                   icon.font="Hack Nerd Font:Bold:14.0" \
                   label.font="Hack Nerd Font:Bold:14.0" \
                   icon.padding_left=10 \
                   icon.padding_right=4 \
                   label.padding_left=4 \
                   label.padding_right=10
        
        INDEX=$((INDEX + 1))
    fi
done < <(todo task view)
