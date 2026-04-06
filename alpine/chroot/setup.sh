#!/bin/sh
set -eu

# add rpi bootloader files to /boot
/usr/sbin/update-raspberrypi-bootloader
install -m 644 ./files/usercfg.txt /boot

# setup general stuff
setup-alpine -c ./files/setup-alpine.answers

# setup user
adduser -u 1000 -G wheel -s "$(which zsh)" -D pi
addgroup pi seat

# setup desktop
setup-desktop sway
