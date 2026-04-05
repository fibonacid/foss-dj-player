#!/bin/sh
set -eu

# add rpi bootloader files to /boot
/usr/sbin/update-raspberrypi-bootloader

# setup general stuff
setup-alpine -c ./setup-alpine.answers

# setup user
adduser -u 1000 -G wheel -s /bin/zsh -D pi
addgroup pi seat
addgroup pi wheel

# setup desktop
setup-desktop sway

