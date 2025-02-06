
## mongodb

docker exec -i <container_name> /usr/bin/mongorestore --username <username> --password <password> --authenticationDatabase admin --nsInclude="<database_name>.*" --archive < ~/Downloads/mongodb.dump

docker exec -i mongo  mongorestore --username root --password root --authenticationDatabase admin --nsInclude="credit.*" --archive  < ./credit-mongodb/2024-09-04/credit-2024-09-04-20-01-56.dump

docker exec -i mongoServer  mongorestore --username root --password root --authenticationDatabase admin --nsInclude="credit.*" --archive  < ./payment-2024-09-07-11-30-01.dump

### mysql
cat backup.sql | docker exec -i mysql /usr/bin/mysql -u user --password=password db

### postgresql
docker exec -i apppostgresql pg_restore --verbose --clean --no-acl --no-owner -U postgres -d mydb < ./my_data.dump











 

### Backup  
docker exec mysql mysqldump --no-tablespaces -u user --password=password db > ~/database_backups/mysql_backup/$(date +'%Y_%m_%d_%H_%M_%S')_mydb.sql.dump

or

docker exec mysql /usr/bin/mysqldump --no-tablespaces -u user --password=password db > backup.sql

### Restore
cat backup.sql | docker exec -i mysql /usr/bin/mysql -u user --password=password db

## Redis
### Backup from redis
docker exec redis-master redis-cli save && docker cp redis-master:/data/dump.rdb .

### Restore
#docker cp ./dump.rdb redis:/data/dump.rdb docker restart redis

mongogoldpass: d%gj@3chGTw