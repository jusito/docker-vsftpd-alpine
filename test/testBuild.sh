#!/bin/bash

if [ "${DEBUGGING}" = "true" ]; then
	set -o xtrace
fi

set -o errexit
set -o nounset
set -o pipefail

echo "build base"
docker build -t "$IMAGE" .

# shellcheck disable=SC2045
for tag in $(ls modpacks) #ls is fragile
do
	echo "[testBuild][INFO]build configuration/$tag"
	docker rmi "$IMAGE:$tag" || true
	docker build -t "$IMAGE:$tag" "configurations/$tag"
done
