### backup:
mongodump --db mymongodb --authenticationDatabase admin  -u mongoadmin -p mongoadmin --port 27017 --collection abc --out - | gzip >  dump_`date "+%Y-%m-%d"`.gz

mongodump --db mymongodb --authenticationDatabase admin  -u mongoadmin -p mongoadmin --port 27017 --collection abc >  dump_`date "+%Y-%m-%d"`


#### for docker container(tested)

docker exec -i mongo-docker mongodump  --username mongoadmin --password mongoadmin --authenticationDatabase admin --db mymongodb --archive > dump_`date "+%Y-%m-%d"`.dump

docker exec -i mongodb-mongo-1 mongodump --username root --password d%gj@3chGTw --authenticationDatabase admin --db technogold  --archive >  /home/farbod/data.dump 

docker exec -i mongo-1-container mongodump --username sa --password Password123 --authenticationDatabase admin --db myDatabase  --archive >  data.dump 

### Restore(tested)+
docker exec -i containername  mongorestore --username username --password password --authenticationDatabase admin   --archive  < dumpfile.dump

docker exec -i mongo-docker mongorestore --username mongoadmin --password mongoadmin --authenticationDatabase admin --nsInclude="mymongodb.*" --archive < ./dump_2024-08-10.dump
 
 
### working with mongodb in docker container:
mongosh "mongodb://127.0.0.1:27017" --username root --authenticationDatabase admin



