#!/bin/bash

export DEBUGGING=false
if [ "${DEBUGGING}" = "true" ]; then
	set -o xtrace
fi

set -o errexit
set -o nounset
set -o pipefail

IMAGE="jusito/docker-vsftpd-alpine"

bash test/testStyle.sh

tag=simple
echo "build base"
docker build -t "$IMAGE:base" .

echo "[testBuild][INFO]build configuration/$tag"
docker rmi "$IMAGE:$tag" || true
docker build -t "$IMAGE:$tag" "configurations/$tag"

# TODO run test needed


#bash test/testHealth.sh