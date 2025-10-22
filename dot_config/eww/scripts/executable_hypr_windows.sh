#!/bin/bash

theme=$(gsettings get org.gnome.desktop.interface icon-theme | tr -d "'")
clients=$(hyprctl clients -j)

echo "$clients" | jq -rc '.[]' | while read -r win; do
  class=$(jq -r '.class' <<< "$win")
  address=$(jq -r '.address' <<< "$win")
  title=$(jq -r '.initialTitle' <<< "$win")

  desktop_file=$(find /usr/share/applications ~/.local/share/applications -iname "$class*.desktop" -print -quit 2>/dev/null)

  if [ -z "$desktop_file" ]; then
    desktop_file=$(grep -ril "Exec=.*$class" /usr/share/applications ~/.local/share/applications 2>/dev/null | head -n 1)
  fi

  icon_path=""

  if [ -n "$desktop_file" ]; then
    icon_name=$(grep -m1 "^Icon=" "$desktop_file" | cut -d= -f2)

    if [[ "$icon_name" == /* ]]; then
      icon_path="$icon_name"
    else
      icon_path=$(find /usr/share/icons/"$theme" /usr/share/icons/hicolor /usr/share/pixmaps ~/.icons \
        -type f \( -iname "$icon_name.png" -o -iname "$icon_name.svg" -o -iname "$icon_name.xpm" \) \
        -print -quit 2>/dev/null)
    fi

    [ -z "$icon_path" ] && icon_path="$icon_name"
  fi

  jq -n --arg icon "$icon_path" --arg address "$address" --arg title "$title" \
    '{icon: $icon, address: $address, title: $title}'
done | jq -s '.'
