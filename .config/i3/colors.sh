#!/bin/bash

# Source wal colors
source ~/.cache/wal/colors.sh

# Define variables from colors
background="$color0"
statusline="$color7"
separator="$color7"
focused_workspace="$color5"
inactive_workspace="$color3"


# Path to your i3 configuration file
i3_config_file="$HOME/.config/i3/config"

# Check if the configuration file exists
if [ -f "$i3_config_file" ]; then
    # Remove existing color settings
    sed -i '/^set \$background/d' "$i3_config_file"
    sed -i '/^set \$statusline/d' "$i3_config_file"
    sed -i '/^set \$separator/d' "$i3_config_file"
    sed -i '/^set \$focused_workspace/d' "$i3_config_file"
    sed -i '/^set \$inactive_workspace/d' "$i3_config_file"

    # Add new color settings at the top of the i3 config file
    sed -i "1s|^|set \$background $background\nset \$statusline $statusline\nset \$separator $separator\nset \$focused_workspace $focused_workspace\nset \$inactive_workspace $inactive_workspace\n|" "$i3_config_file"
    echo "Colors updated in the i3 config file."
    i3-msg restart
else
    echo "i3 config file not found."
fi

