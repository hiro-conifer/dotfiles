#!/bin/sh
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_CURRENT_SESSION=sway
export LIBSEAT_BACKEND=logind
export QT_QPA_PLATFORM="wayland;xcb"
export GDK_DPI_SCALE=1.5
export QT_SCALE_FACTOR=1.5
export MOZ_ENABLE_WAYLAND=1
export WINIT_UNIX_BACKEND=x11

exec sway
