#!/usr/bin/env bash

./alpine-make-rootfs \
  --branch latest-stable \
  --packages 'ruby sqlite' \
  --script-chroot \
  "./deploy/example-$(date +%Y%m%d).tar.gz" -- ./example/install.sh


