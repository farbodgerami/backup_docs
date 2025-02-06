#!/bin/bash
getCurrentDate=$(date +"%Y-%m-%d")
getCurrentTime=$(date +"%H-%M-%S")
PRODUCTION_VOLUME_PATH=/root/docker_volume_backups/production/"${getCurrentDate}"/"${getCurrentDate}-${getCurrentTime}"
[[ -d "$PRODUCTION_VOLUME_PATH" ]] || mkdir -p ${PRODUCTION_VOLUME_PATH}
rsync -r production:/var/lib/docker/volumes $PRODUCTION_VOLUME_PATH
