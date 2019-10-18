#!/bin/bash

if [ "${DEBUGGING}" = "true" ]; then
	set -o xtrace
fi

set -o errexit
set -o nounset
set -o pipefail

IMAGE="jusito/docker-vsftpd-alpine"
tag="simple"

bash test/testStyle.sh


echo "build: ${IMAGE}:base"
docker rmi "${IMAGE}:base" || true
docker build -t "${IMAGE}:base" "base/"

echo "[testBuild][INFO]build configuration/$tag"
docker rmi "$IMAGE:$tag" || true
docker build -t "$IMAGE:$tag" "configurations/$tag"

# TODO run test needed


#bash test/testHealth.sh