#!/bin/bash -e

install -D -o 1000 -g 1000 -m 644 ./files/.bash_profile "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.bash_profile"

for f in ./files/labwc/*; do
  install -D -o 1000 -g 1000 -m 700 "./files/labwc/$f" "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config/labwc/$f"
done

on_chroot <<-EOF
	  if ! getent group seat >/dev/null; then
	    groupadd seat
	  fi
		sudo systemctl enable seatd
		sudo usermod -aG seat ${FIRST_USER_NAME} 
EOF
