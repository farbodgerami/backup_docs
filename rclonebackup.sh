#!/bin/bash
rclone sync ~/home/ubuntu/mysql_backup/ mybackupminio:mysql_backup -v
rclone sync ~/home/ubuntu/postgresql_backup/ mybackupminio:postgresql_backup -v
rclone sync ~/home/ubuntu/mongodb_backup/ mybackupminio:mongodb_backup -v