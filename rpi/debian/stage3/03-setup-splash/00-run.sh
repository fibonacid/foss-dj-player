#!/bin/bash -e

SPLASH_IMAGE=splash-image.tga

convert ./files/image.png -colors 224 -depth 8 -type TrueColor -alpha off -compress none -define tga:bits-per-sample=8 "./${SPLASH_IMAGE}"

cp "./${SPLASH_IMAGE}" "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/"

on_chroot <<-EOF
	configure-splash "home/${FIRST_USER_NAME}/$SPLASH_IMAGE"
EOF
