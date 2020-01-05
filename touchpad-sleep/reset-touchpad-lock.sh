#!/bin/bash

dbus-monitor --session "type='signal',interface='org.freedesktop.ScreenSaver'" |
  while read x; do
    case "$x" in
      *"boolean true"*)
            libinput-gestures-setup stop
        ;;
      *"boolean false"*)
            libinput-gestures-setup restart
            kcminit kcm_touchpad
        ;;
    esac
    
  done

exit 0
