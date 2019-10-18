#!/bin/bash

if [ "${DEBUGGING}" = "true" ]; then
	set -o xtrace
fi

set -o errexit
set -o nounset
set -o pipefail

IMAGE="jusito/docker-vsftpd-alpine"

echo "build base"
docker rmi "$IMAGE:base"
docker build -t "$IMAGE:base" "base/"

# shellcheck disable=SC2045
for tag in $(ls configurations) #ls is fragile
do
	echo "[testBuild][INFO]build configuration/$tag"
	docker rmi "$IMAGE:$tag" || true
	docker build -t "$IMAGE:$tag" "configurations/$tag"
done
