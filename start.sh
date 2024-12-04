#!/bin/sh
Xvfb :0 -screen 0 1024x768x16 &
sleep 1
startxfce4 &
x11vnc -display :0 -forever -nopw