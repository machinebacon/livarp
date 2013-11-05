#!/bin/bash
## random wallpaper script from feh arch wiki ##
exec find /usr/share/backgrounds -type f -name '*.jpg' -o -name '*.png' | shuf -n 1 | xargs feh --no-xinerama --bg-fill
exit 0
