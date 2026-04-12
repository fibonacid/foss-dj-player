#!/bin/sh
set -eux

# add rpi bootloader files to /boot
/usr/sbin/update-raspberrypi-bootloader
install -m 644 ./files/usercfg.txt /boot

# setup users
setup-user -a -g seat -u pi
echo "pi:pi" | chpasswd

# setup desktop
setup-desktop sway

# setup networking
setup-hostname alpine-pi
setup-interfaces -i < ./files/networking/interfaces
rc-update add networking boot
