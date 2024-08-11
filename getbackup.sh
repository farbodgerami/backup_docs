#!/bin/bash
#backup from postgresql
docker exec apppostgresql pg_dump -FC  -U postgres -h 127.0.0.1 -p 5432 -d mydb > /home/farbod/postgresql_backup/$(date +'%Y_%m_%d_%H_%M_%S')_mydb.sql.dump

#backup from mongodb
docker exec -i mongo-docker mongodump  --username mongoadmin --password mongoadmin --authenticationDatabase admin --db mymongodb --archive > ~/home/ubuntu/mongodb_backup/$(date +'%Y_%m_%d_%H_%M_%S')_mydb.sql.dump

#backup from mysql
docker exec mysql /usr/bin/mysqldump --no-tablespaces -u user --password=password db > ~/home/ubuntu/mysql_backup/$(date +'%Y_%m_%d_%H_%M_%S')_mydb.sql.dump

