#### 1. Install MariaDB on Both Servers
Ensure MariaDB is installed on both servers. If not, install it using:

```
sudo apt-get install mariadb-server mariadb-client -y
```
#### 2. Configure the Master Server

Edit the MariaDB Configuration File: Open the MariaDB configuration file on the master server, typically located at /etc/mysql/mariadb.conf.d/50-server.cnf:

```
sudo nano /etc/mysql/mariadb.conf.d/50-server.cnf
```

Enable Binary Logging and Set Server ID: Add or modify the following lines under the [mysqld] section to enable binary logging and set a unique server ID:
```
[mysqld]
log-bin = /var/log/mysql/mysql-bin.log
server-id = 1
```

The server-id must be a unique positive integer for each server in the replication setup.
Restart MariaDB Service: Apply the changes by restarting the MariaDB service:

```
sudo systemctl restart mariadb
```

Create a Replication User: Log in to the MariaDB shell and create a user for replication:
```
CREATE USER 'replication_user'@'<slave_ip>' IDENTIFIED BY '<PASSWORD>';
GRANT REPLICATION SLAVE ON *.* TO 'replication_user'@'%';
FLUSH PRIVILEGES;
```
sample:
```
CREATE USER 'replication_user'@'5.34.206.146' IDENTIFIED BY '111111';
GRANT REPLICATION SLAVE ON *.* TO 'replication_user'@'5.34.206.146';
FLUSH PRIVILEGES;
```

Replace 'your_secure_password' with a strong password. The '%' wildcard allows connections from any host; for enhanced security, specify the replica's IP address instead.
Obtain Master Status: While in the MariaDB shell, execute:
```
FLUSH TABLES WITH READ LOCK;
SHOW MASTER STATUS;
UNLOCK tables;
```
This command outputs the current binary log file name and position, which are essential for configuring the replica.

Important: Keep this session open to maintain the read lock until the replica is configured.

#### 3. Configure the Replica Server

Edit the MariaDB Configuration File: On the replica server, open the configuration file:
```
sudo nano /etc/mysql/mariadb.conf.d/50-server.cnf
```

Set Server ID: Assign a unique server ID different from the master:
```
[mysqld]
server-id = 2
log-bin = /var/log/mysql/mysql-bin.log
```
Restart MariaDB Service: Apply the changes:
```
sudo systemctl restart mariadb
```
go to mysql shell
```
mysql
```
Set Up Replication: Log in to the MariaDB shell on the replica and execute:
```
CHANGE MASTER TO MASTER_HOST='5.34.206.240', MASTER_USER='replication_user', MASTER_PASSWORD='111111' ,MASTER_LOG_FILE='mysql-bin.000003', MASTER_LOG_POS=2812;
START SLAVE;
```

Replace:
```
'master_server_ip' with the master's IP address.
'replication_user' and 'your_secure_password' with the replication user's credentials.
'mysql-bin.000001' and position with the values obtained from the SHOW MASTER STATUS command on the master.
```

#### 4. Verify Replication Status
Check Replica Status: On the replica, execute:
 ```
SHOW SLAVE STATUS\G;
```
Ensure that Slave_IO_Running and Slave_SQL_Running are both set to Yes, indicating successful replication.

#### 5. Test the Replication
Create a Test Database on the Master: On the master server, create a new database and table:
```
CREATE DATABASE test_db;
USE test_db;
CREATE TABLE test_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data VARCHAR(100)
);
INSERT INTO test_table (data) VALUES ('Replication test');
```
Verify on the Replica: On the replica server, check if the database and table exist and contain the inserted data:
```
SHOW DATABASES;
USE test_db;
SELECT * FROM test_table;
```
If the data appears on the replica, the replication setup is successful.


SELECT user();
SHOW MASTER STATUS;
CREATE USER 'replication_user'@'5.34.206.146' IDENTIFIED BY '111111';
GRANT REPLICATION SLAVE ON *.* TO 'replication_user'@'5.34.206.146';

FLUSH PRIVILEGES;
show grants for replication_user
show grants for replication_user@5.34.206.146;
UNLOCK tables;

SELECT USER, Host FROM USER;

SHOW DATABASES;
delete from user where user='replication_user'
SELECT user FROM mysql.user;
SELECT user FROM mysql.user;
SHOW MASTER STATUS;
show master status\G;
