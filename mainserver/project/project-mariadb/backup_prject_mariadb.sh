#!/bin/bash

source /root/backups/prject/prject-mariadb/config.sh

getCurrentDate=$(date +"%Y-%m-%d")
getCurrentTime=$(date +"%H-%M-%S")
storeDumpPath=/root/backups/data/prject-mysql/"${getCurrentDate}"/
storeDumpName="prject-${getCurrentDate}-${getCurrentTime}.sql"
logFilePath=/root/backups/logs/prject-mysql/"${getCurrentDate}"/
logFileName="${getCurrentTime}.log"

#if dir not exist then make it
[[ -d "$logFilePath" ]] || mkdir -p ${logFilePath}
[[ -d "$storeDumpPath" ]] || mkdir -p ${storeDumpPath}

docker exec ${CONTAINER_NAME} mysqldump -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${DATABASE_NAME} --default-character-set=utf8mb4 > "${storeDumpPath}${storeDumpName}" 2>&1 | tee -a "${logFilePath}${logFileName}"

EXITSTATUS=${PIPESTATUS[0]}

  if [[ ${EXITSTATUS} -eq 0 ]]
    then
	tar cvzf "${storeDumpPath}${storeDumpName}.tar.gz" "${storeDumpPath}${storeDumpName}"
	rm -r "${storeDumpPath}${storeDumpName}"
        echo "${DATABASE_NAME} Dump successfully" 2>&1 | tee -a "${logFilePath}${logFileName}"

        exit 0
    fi
        rm "${storeDumpPath}${storeDumpName}"
        echo "mariadb dump failed for db ${DATABASE_NAME}" 2>&1 | tee -a "${logFilePath}${logFileName}"
        exit 1
