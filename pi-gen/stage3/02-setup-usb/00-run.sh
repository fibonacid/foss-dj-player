#!/bin/bash -e

install -D -o root -g root -m 755 ./bin/* "${ROOTFS_DIR}/usr/local/bin/"
install -D -o root -g root -m 644 ./udev/rules.d/* "${ROOTFS_DIR}/etc/udev/rules.d/"

