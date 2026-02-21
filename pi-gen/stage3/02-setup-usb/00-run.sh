#!/bin/bash -e

mkdir -p "${ROOTFS_DIR}/usr/local/bin"
cp ./bin/* "${ROOTFS_DIR}/usr/local/bin/"
cp ./udev/rules.d/* "${ROOTFS_DIR}/etc/udev/rules.d/"

on_chroot <<-EOF
	chown root:root /usr/local/bin/*
	chmod 755 /usr/local/bin/*
	chown root:root /etc/udev/rules.d/*
	chmod 644 /etc/udev/rules.d/*
EOF
