#!/bin/bash

if [ "${DEBUGGING}" = "true" ]; then
	set -o xtrace
fi

set -o errexit
set -o nounset
set -o pipefail

# shellcheck disable=SC2045
for tag in $(ls modpacks) #ls is fragile
do
	echo "[testRun][INFO]running $tag"
	if ! docker run -ti --name "JusitoTesting" --rm -e TEST_MODE=true -e DEBUGGING=${DEBUGGING} "$IMAGE:$tag"; then
		echo "[testRun][ERROR]run test failed for $tag"
		exit 1
	fi
	docker stop "$IMAGE:$tag" || true
	docker rm "$IMAGE:$tag" || true
done