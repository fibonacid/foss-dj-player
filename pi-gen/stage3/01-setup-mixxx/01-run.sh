#!/bin/bash -e

cp -r ./files/mixxx "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.mixxx"
mkdir -p "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Music"

on_chroot <<-EOF
		chown -r ${FIRST_USER_NAME}:${FIRST_USER_NAME} /home/${FIRST_USER_NAME}
EOF
