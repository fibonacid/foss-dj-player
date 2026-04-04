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
		cd /build; ./build.sh
	"

# Ensure that deploy/ is always owned by calling user
echo "copying results from deploy/"
docker cp "${CONTAINER_NAME}":/build/deploy/. ./deploy/

# cleanup
docker rm -v "${CONTAINER_NAME}"
echo "Done! Your rootfs should be in deploy/"
