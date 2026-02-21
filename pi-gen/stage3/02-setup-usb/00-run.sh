#!/bin/bash -e

on_chroot <<-EOF
    # Ensure mount point exists
    mkdir -p /media/usb1
    mkdir -p /media/usb2

    # Append fstab entry if not already present
    grep -qxF '/dev/sda1  /media/usb/sda1  auto  nofail,x-systemd.automount,uid=1000,gid=1000,umask=022  0  0' /etc/fstab || \
    echo '/dev/sda1  /media/usb1  auto  nofail,x-systemd.automount,uid=1000,gid=1000,umask=022  0  0' >> /etc/fstab
    echo '/dev/sda1  /media/usb2  auto  nofail,x-systemd.automount,uid=1000,gid=1000,umask=022  0  0' >> /etc/fstab
EOF
