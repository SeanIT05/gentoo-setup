#!/bin/sh

 picom -f --no-vsync &
 feh --bg-tile .local/share/bg
 unclutter &
 slstatus &
 



 # Loop
 #while true; do
 #	dwm >/dev/null 2>&1
 #done

 # Start DWM
 exec dwm

