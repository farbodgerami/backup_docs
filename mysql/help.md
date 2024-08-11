### it worked for Backup
docker exec mysql /usr/bin/mysqldump --no-tablespaces -u user --password=password db > backup.sql

### Now, Restore(tested)
cat backup.sql | docker exec -i mysql /usr/bin/mysql -u user --password=password db


### to see the database in the mysql container:
docker exec -it mysql bash
mysql -u user -p
show databases;
 
### to delete a database:
drop database db;

### to show databases:
show databases;

### to select your database:
use db;

### create a table
create table users(id INT PRIMARY KEY AUTO_INCREMENT,
email VARCHAR(255) NOT NULL UNIQUE,
bio TEXT,
country VARCHAR(2));

### show tables
show tables;

### Add a data row:
insert into users (email,bio,country)
values ("a","b","c");

show the inserted datas:
select from users;
### to restore the database first create a database with the same name:
create database db;

### sample 
0 0 * * * ./testmail.sh && curl -fsS -m 10 --retry 5 -o /dev/null https://hc-ping.com/7cae215d-86b0-4741-9034-4a90fc07b410
 