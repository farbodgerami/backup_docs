#!/bin/bash
# set timezone IRAN
#cp /usr/share/zoneinfo/Asia/Tehran /etc/localtime
source /root/backups/project/project-mongodb/config.sh
 
getCurrentDate=$(date +"%Y-%m-%d")
getCurrentTime=$(date +"%H-%M-%S")
storeDumpPath=~/backups/data/project-mongodb/"${getCurrentDate}"/
logFilePath=~/backups/logs/project-mongodb/"${getCurrentDate}"/
logFileName="${getCurrentTime}.log"
storeDumpName="project-${getCurrentDate}-${getCurrentTime}.dump"
#if log dir not exist then make it
[[ -d "$logFilePath" ]] || mkdir -p ${logFilePath}
[[ -d "$storeDumpPath" ]] || mkdir -p ${storeDumpPath}
docker exec -i ${CONTAINER_NAME} mongodump --username ${MONGO_USER} --password ${MONGO_PASSWORD} --authenticationDatabase admin --db ${dbName}  --archive >  "${storeDumpPath}${storeDumpName}"  
  if [[ $? -eq 0 ]]
    then
	tar cvzf "${storeDumpPath}${storeDumpName}.tar.gz" "${storeDumpPath}${storeDumpName}"
	rm -r "${storeDumpPath}${storeDumpName}"
        echo "$dbName Dump successfully" 2>&1 | tee -a "${logFilePath}${logFileName}"
        exit 0
    fi
        echo "mongo dump failed for db ${dbName}" | tee -a "${logFilePath}${logFileName}"
        exit 1
