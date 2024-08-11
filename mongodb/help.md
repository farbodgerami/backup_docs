### backup:
mongodump --db mymongodb --authenticationDatabase admin  -u mongoadmin -p mongoadmin --port 27017 --collection abc --out - | gzip >  dump_`date "+%Y-%m-%d"`.gz

mongodump --db mymongodb --authenticationDatabase admin  -u mongoadmin -p mongoadmin --port 27017 --collection abc >  dump_`date "+%Y-%m-%d"`


#### for docker container(tested)

docker exec -i mongo-docker mongodump  --username mongoadmin --password mongoadmin --authenticationDatabase admin --db mymongodb --archive > dump_`date "+%Y-%m-%d"`.dump

### Restore(tested)
docker exec -i mongo-docker mongorestore --username mongoadmin --password mongoadmin --authenticationDatabase admin --nsInclude="mymongodb.*" --archive < ./dump_2024-08-10.dump