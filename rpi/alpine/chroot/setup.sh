#!/bin/sh
set -eux

# add rpi bootloader files to /boot
/usr/sbin/update-raspberrypi-bootloader
install -m 644 ./files/boot/usercfg.txt /boot

# setup users
setup-user -a -g seat pi
echo "pi:pi" | chpasswd
chown -R pi:pi /home/pi
chsh -s "$(which zsh)" pi

# setup desktop
setup-desktop sway
# rc-update add seatd

# setup networking
setup-hostname alpine-pi
setup-interfaces -i < ./files/network/interfaces
setup-sshd -k "$(cat ./files/ssh/key.pub)" openssh
rc-update add networking boot

