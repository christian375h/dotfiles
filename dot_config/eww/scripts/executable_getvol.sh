#!/bin/sh

# Get the default sink
sink=$(pactl get-default-sink)

# Get the volume of the sink
volume=$(pactl get-sink-volume "$sink" | grep -oP '\d+%' | head -1)

# Print the volume (numeric only)
echo "${volume%\%}"
