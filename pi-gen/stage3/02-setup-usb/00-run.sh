#!/bin/bash -e

install -D -o root -g root -m 755 ./files/usb-mount.sh "${ROOTFS_DIR}/usr/local/bin/usb-mount.sh"
install -D -o root -g root -m 755 ./files/usb-umount.sh "${ROOTFS_DIR}/usr/local/bin/usb-umount.sh"

install -D -o root -g root -m 644 ./files/99-usb-mount.rules "${ROOTFS_DIR}/etc/udev/rules.d/99-usb-mount.rules"
install -D -o root -g root -m 644 ./files/99-usb-umount.rules "${ROOTFS_DIR}/etc/udev/rules.d/99-usb-umount.rules"

