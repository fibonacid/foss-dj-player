#!/bin/bash

# https://linuxmind.dev/2025/09/02/auto-mount-usb-with-udev-rules/

DEVNAME="$1"
MOUNTPOINT="/media/usb/$DEVNAME"

# Unmount gracefully
umount "$MOUNTPOINT" || exit 1

# Remove directory
rmdir "$MOUNTPOINT"

# Log event
echo "$(date): Unmounted $DEVNAME from $MOUNTPOINT" >> /var/log/usb-mount.log

exit 0

