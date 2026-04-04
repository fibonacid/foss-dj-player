#!/usr/bin/env bash

# https://github.com/alpinelinux/alpine-make-rootfs/issues/18#issuecomment-3255465655
export ARCH=aarch64
export APK_OPTS="--arch $ARCH"

./alpine-make-rootfs \
  --branch latest-stable \
  --keys-dir=./keys \
  --packages 'linux-rpi raspberrypi-bootloader curl vim alpine-conf seatd zsh' \
  --script-chroot \
  "./deploy/rootfs.tar.gz" -- ./example/install.sh

cd deploy || exit
mkdir rootfs
tar xf rootfs.tar.gz -C rootfs
rm rootfs.tar.gz


