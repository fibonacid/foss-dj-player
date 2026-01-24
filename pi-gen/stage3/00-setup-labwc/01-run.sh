#!/bin/bash -e

# adds labwc config
mkdir -p "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config"
cp -r ./files/labwc "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config/"

# launches labwc at login
cp ./files/.bash_profile "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/"

on_chroot <<-EOF
	  if ! getent group seat >/dev/null; then
	    groupadd seat
	  fi
		sudo systemctl enable seatd
		sudo usermod -aG seat ${FIRST_USER_NAME} 

		chown -r ${FIRST_USER_NAME}:${FIRST_USER_NAME} /home/${FIRST_USER_NAME}
EOF
