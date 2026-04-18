#!/usr/bin/env bash

set -exuo pipefail

# https://github.com/alpinelinux/alpine-make-rootfs/issues/18#issuecomment-3255465655
export ARCH=aarch64
export APK_OPTS="--arch $ARCH"

packages=(
# system
linux-rpi
raspberrypi-bootloader
alpine-conf
doas
shadow
seatd
zsh
curl
# utils
vim
tmux
font-comic-shanns-mono-nerd
)

./alpine-make-rootfs \
  --branch latest-stable \
  --keys-dir ./apk/keys \
  --packages "${packages[*]}" \
  --fs-skel-dir ./rootfs \
  --script-chroot \
  "./deploy/rootfs.tar.gz" -- ./chroot/setup.sh

cd deploy || exit 1

# Create a disk image (2GB, adjust as needed)
dd if=/dev/zero of=alpine-rpi.img bs=1M count=2048 status=progress

# Partition the image (256MB FAT32 boot, rest ext4 root)
parted -s alpine-rpi.img -- \
  mklabel msdos \
  mkpart primary fat32 1MiB 257MiB \
  set 1 boot on \
  mkpart primary ext4 257MiB -1s

# Set up loop device + partition maps
LOOP=$(losetup --find --show alpine-rpi.img)
kpartx -av "$LOOP"
echo "Loop device: $LOOP"

# Format partitions (kpartx creates these under /dev/mapper/)
MAP=$(basename "$LOOP")
mkfs.vfat -F32 -n BOOT "/dev/mapper/${MAP}p1"
mkfs.ext4 -L ROOT "/dev/mapper/${MAP}p2"

# Mount and populate
mkdir -p mnt/boot mnt/root
mount "/dev/mapper/${MAP}p2" mnt/root
mkdir -p mnt/root/boot
mount "/dev/mapper/${MAP}p1" mnt/boot

# Copy rootfs
tar -xf rootfs.tar.gz -C mnt/root/

# Move boot files to FAT partition
mv mnt/root/boot/* mnt/boot/ 2>/dev/null || true

# Write fstab
cat > mnt/root/etc/fstab << 'EOF'
/dev/mmcblk0p1  /boot   vfat    defaults        0 2
/dev/mmcblk0p2  /       ext4    defaults,noatime 0 1
EOF

# Unmount cleanly
umount mnt/boot
umount mnt/root
kpartx -dv "$LOOP"
losetup -d "$LOOP"

# remove artifacts
tar caf alpine-rpi.tar.gz alpine-rpi.img
rm alpine-rpi.img

echo "Image ready: alpine-rpi.tar.gz"

