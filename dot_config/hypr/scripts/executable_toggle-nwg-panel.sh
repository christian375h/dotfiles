#!/bin/bash

# Check if the panel is running
if pgrep -x "nwg-panel" > /dev/null; then
    killall nwg-panel
else
    nohup nwg-panel >/dev/null 2>&1 &
fi
