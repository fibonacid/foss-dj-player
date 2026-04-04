#!/usr/bin/env bash

# https://github.com/alpinelinux/alpine-make-rootfs/issues/18#issuecomment-3255465655
export ARCH=aarch64
export APK_OPTS="--arch $ARCH"

./alpine-make-rootfs \
  --branch latest-stable \
  --keys-dir=./keys \
  --packages 'linux-rpi curl vim alpine-conf seatd zsh' \
  --script-chroot \
  "./deploy/example-$(date +%Y%m%d).tar.gz" -- ./example/install.sh


