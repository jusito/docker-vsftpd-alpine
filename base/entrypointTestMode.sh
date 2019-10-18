#!/bin/sh

if [ "${DEBUGGING}" = "true" ]; then
	set -o xtrace
fi

set -o errexit
set -o nounset
set -o pipefail

# start
#trap 'pkill -15 vsftpd' 15
#/usr/sbin/vsftpd "$CONFIG_FILE" &


echo "vsftpd started"
wait "$!"
echo "Vsftpd ended"

