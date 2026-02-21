#!/bin/bash -e

install -D -o 1000 -g 1000 ./files/mixxx ./files/Music "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/"
