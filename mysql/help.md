### to see the database in the mysql container:
docker exec -it mysql bash
mysql -u user -p
show databases;


### Backup
docker exec mysql /usr/bin/mysqldump -u user --password=root db > backup.sql


### it worked for backup
docker exec mysql /usr/bin/mysqldump --no-tablespaces -u user --password=password db > backup.sql
### to delete a database:
drop database db;

### to show databases:
show databases;

### to restore the database first create a database with the same name:
create database db;

### Now, Restore
cat backup.sql | docker exec -i mysql /usr/bin/mysql -u user --password=password db



### sample 
0 0 * * * /your/command.sh && curl -fsS -m 10 --retry 5 -o /dev/null https://hc-ping.com/7cae215d-86b0-4741-9034-4a90fc07b410


