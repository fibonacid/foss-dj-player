#!/bin/bash

# https://linuxmind.dev/2025/09/02/auto-mount-usb-with-udev-rules/

DEVNAME="$1"
MOUNTBASE="/media/usb"
DEVICE="/dev/$DEVNAME"
MOUNTPOINT="$MOUNTBASE/$DEVNAME"

# Create mount directory
mkdir -p "$MOUNTPOINT"

# Mount with options
mount -o uid=1000,gid=1000,umask=022 "$DEVICE" "$MOUNTPOINT" || exit 1

# Log event
echo "$(date): Mounted $DEVICE at $MOUNTPOINT" >> /var/log/usb-mount.log

exit 0
