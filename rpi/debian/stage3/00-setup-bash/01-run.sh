#!/bin/bash -e

# adds sway config
mkdir -p "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config"
cp -r ./files/sway "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config/"

# launches sway at login
cp ./files/.bash_profile "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/"
cp ./files/logo.txt "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/"

on_chroot <<-EOF
	  if ! getent group seat >/dev/null; then
	    groupadd seat
	  fi
		sudo systemctl enable seatd
		sudo usermod -aG seat ${FIRST_USER_NAME} 

		chown -R ${FIRST_USER_NAME}:${FIRST_USER_NAME} /home/${FIRST_USER_NAME}
 
    # Set autologin to console
		# https://www.raspberrypi.com/documentation/computers/configuration.html#boot-options-nonint
		raspi-config nonint do_boot_behaviour B2
EOF
