#!/bin/bash

# Close the popup
sketchybar --set brew popup.drawing=off

# Run brew upgrade in a terminal window
osascript -e 'tell application "Terminal"
    do script "echo \"Updating Homebrew packages...\"; brew upgrade; echo \"\\nUpdate complete! Press any key to close...\"; read -n 1 -s"
    activate
end tell'

# Trigger a refresh of the brew item after a delay
(sleep 2 && sketchybar --trigger brew_update) &
