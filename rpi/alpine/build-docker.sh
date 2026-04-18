#!/usr/bin/env bash

set -euo pipefail

IMAGE_NAME="alpine-make-rootfs"
CONTAINER_NAME="alpine-builder"

CONTAINER_EXISTS=$(docker ps -a --filter name="${CONTAINER_NAME}" -q)
CONTAINER_RUNNING=$(docker ps --filter name="${CONTAINER_NAME}" -q)
if [ "${CONTAINER_RUNNING}" != "" ]; then
	echo "The build is already running in container ${CONTAINER_NAME}. Aborting."
	exit 1
fi
if [ "${CONTAINER_EXISTS}" != "" ]; then
	echo "Container ${CONTAINER_NAME} already exists. Aborting."
	echo "You can delete the existing container like this:"
	echo "  docker rm -v ${CONTAINER_NAME}"
	exit 1
fi

echo "Creating docker image..."
time docker build  -t "${IMAGE_NAME}" .

echo "Building alpine inside container"
time docker run \
	--name ${CONTAINER_NAME} \
	--privileged \
	--platform linux/arm64 \
	${IMAGE_NAME} \
	bash -e -o pipefail -c "
	    # Download manually first
		wget -q -O /tmp/apk.static 'https://gitlab.alpinelinux.org/api/v4/projects/5/packages/generic/v2.14.10/aarch64/apk.static'
		chmod +x /tmp/apk.static

		# Override APK to use our manually downloaded version
		export APK='/tmp/apk.static'

		cd /build; ./build.sh
	"

# Ensure that deploy/ is always owned by calling user
mkdir -p deploy
echo "copying results from deploy/"
docker cp "${CONTAINER_NAME}":/build/deploy/alpine-rpi.tar.gz \
	"./deploy/alpine-rpi-$(date -u +%Y-%m-%d).tar.gz"
docker cp "${CONTAINER_NAME}":/build/deploy/rootfs.tar.gz \
	"./deploy/rootfs-$(date -u +%Y-%m-%d).tar.gz"

# cleanup
docker rm -v "${CONTAINER_NAME}"
echo "Done! Your rootfs should be in deploy/"
