#!/bin/bash
export WAYLAND_DISPLAY=""
export GDK_BACKEND=x11
export QT_QPA_PLATFORM=xcb
export _JAVA_AWT_WM_NONREPARENTING=1
~/tools/vivado/2025.2/Vivado/bin/vivado -nolog -nojournal "$@"
