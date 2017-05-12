mongodump   --port=27019 -d rjy -o /usr/share/app/mongo -u admin -p=admin --authenticationDatabase admin
gzexe

docker exec mongo /backup.sh