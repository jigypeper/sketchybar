#!/bin/bash

# Remove old brew items
sketchybar --remove '/brew\.package\..*/' 2>/dev/null
sketchybar --remove 'brew.update' 2>/dev/null

# Get outdated packages
OUTDATED=$(brew outdated)

if [[ -z "$OUTDATED" ]]; then
    # No outdated packages
    sketchybar --add item brew.none popup.brew \
               --set brew.none \
               label="All packages up to date!" \
               icon="✓" \
               icon.font="Hack Nerd Font:Bold:14.0" \
               label.font="Hack Nerd Font:Bold:14.0" \
               icon.padding_left=10 \
               icon.padding_right=4 \
               label.padding_left=4 \
               label.padding_right=10
else
    # Add each outdated package
    INDEX=0
    while IFS= read -r line; do
        # Parse package name (first column)
        PACKAGE=$(echo "$line" | awk '{print $1}')
        
        sketchybar --add item brew.package.$INDEX popup.brew \
                   --set brew.package.$INDEX \
                   label="$PACKAGE" \
                   icon="📦" \
                   icon.font="Hack Nerd Font:Bold:14.0" \
                   label.font="Hack Nerd Font:Bold:14.0" \
                   icon.padding_left=10 \
                   icon.padding_right=4 \
                   label.padding_left=4 \
                   label.padding_right=10
        
        INDEX=$((INDEX + 1))
    done <<< "$OUTDATED"
    
    # Add update button
    sketchybar --add item brew.update popup.brew \
               --set brew.update \
               label="Update All" \
               icon="⬆" \
               icon.font="Hack Nerd Font:Bold:14.0" \
               label.font="Hack Nerd Font:Bold:14.0" \
               icon.padding_left=10 \
               icon.padding_right=4 \
               label.padding_left=4 \
               label.padding_right=10 \
               click_script="$CONFIG_DIR/plugins/brew_update.sh"
fi
