#!/bin/bash -e

# Ensure mount point exists
mkdir -p /media/usb1
mkdir -p /media/usb2

# Define fstab entries
entries=(
	"/dev/sda1  /media/usb1  auto  nofail,x-systemd.automount,uid=1000,gid=1000,umask=022  0  0"
	"/dev/sda1  /media/usb2  auto  nofail,x-systemd.automount,uid=1000,gid=1000,umask=022  0  0"
)

# Append each entry if not already present
for entry in "${entries[@]}"; do
	grep -qxF "$entry" /etc/fstab || echo "$entry" >>/etc/fstab
done
