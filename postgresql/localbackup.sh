#!/bin/bash
export PGPASSWORD=<YOUR_DATABASE_PASSWORD>
pg_dump -FC  -U postgres -h 127.0.0.1 -p 5434 -d tlowdatabase > /home/ubuntu/postgresbackup/$(date +'%Y_%m_%d_%H_%M_%S')_tlow.sql.dump


#!/bin/bash
export PGPASSWORD=<YOUR_DATABASE_PASSWORD>
docker exec apppostgresql /usr/bin/pg_dump -FC  -U postgres -h 127.0.0.1 -p 5432 -d mydb > /home/farbod/postgresbackup/$(date +'%Y_%m_%d_%H_%M_%S')_mydb.sql.dump

docker exec apppostgresql /usr/bin/pg_restore -FC  -U postgres -h 127.0.0.1 -p 5432 -d mydb > /home/farbod/postgresbackup/$(date +'%Y_%m_%d_%H_%M_%S')_mydb.sql.dump

 

docker exec -i apppostgresql pg_restore -U postgres -h 127.0.0.1 -p 5432 -d mydb < /backups/my_data.dump

docker exec -i apppostgresql pg_restore -U postgres -v -d mydb < /backups/my_data.dump

docker exec -i apppostgresql pg_restore --verbose --clean --no-acl --no-owner -U postgres -d mydb < ./my_data.dump