#!/bin/bash -e

for f in ./files/mixxx/*; do
  install -D -o 1000 -g 1000 "./files/mixxx/$f" "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/mix/$f"
done
