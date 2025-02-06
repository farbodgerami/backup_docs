### Backup(tested)
docker exec mysql /usr/bin/mysqldump --no-tablespaces -u user --password=password db > backup.sql

### Now, Restore(tested)
cat dump.sql | docker exec -i <containername> /usr/bin/mysql -u <username> --password=<password> <databasename>
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


#### to get to mysql cli:
```
docker exec -it mysql bash
mysql -u user -p
```
#### to see databases:
show databases;

#### to restore mysql database first create a database with the same name:
```
create database db;
```
#### then get out of the container and enter following command:
```
cat backup.sql | docker exec -i mysql /usr/bin/mysql -u user --password=password db
```