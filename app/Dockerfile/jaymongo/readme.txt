docker run -it --volumes-from=data --name mongo -p 27019:27019 jaymongo /run.sh mongod --port 27019 --dbpath /data



mongo --port 27019 admin --eval "db.createUser({user: 'admin', pwd: 'admin', roles:[{role:'root',db:'admin'}]});"
mongo --port 27019 rjy --eval "db.createUser({user: 'rjy', pwd: 'rjy', roles:[{role:'dbOwner',db:'rjy'}]});"
docker commit xxxx jaymongopwd

docker run -it --volumes-from=data --name mongo -p 27019:27019 jaymongopwd /run.sh mongod --port 27019 --dbpath /data --auth

mongodump   --port=27019 -d testdb -o /usr/share/app/mongo -u admin -p=admin --authenticationDatabase admin

gzexe

docker exec mongo /backup.sh


mongodump --port=27019 -d rjy -o /usr/share/app/mongo/`date +"%m-%d-%y"` -u admin -p=admin --authenticationDatabase admin 


#!/bin/bash
 
MONGO_DATABASE="your_db_name"
APP_NAME="your_app_name"

MONGO_HOST="127.0.0.1"
MONGO_PORT="27017"
TIMESTAMP=`date +%F-%H%M`
MONGODUMP_PATH="/usr/bin/mongodump"
BACKUPS_DIR="/home/username/backups/$APP_NAME"
BACKUP_NAME="$APP_NAME-$TIMESTAMP"
 
# mongo admin --eval "printjson(db.fsyncLock())"
# $MONGODUMP_PATH -h $MONGO_HOST:$MONGO_PORT -d $MONGO_DATABASE
$MONGODUMP_PATH -d $MONGO_DATABASE
# mongo admin --eval "printjson(db.fsyncUnlock())"
 
mkdir -p $BACKUPS_DIR
mv dump $BACKUP_NAME
tar -zcvf $BACKUPS_DIR/$BACKUP_NAME.tgz $BACKUP_NAME
rm -rf $BACKUP_NAME
 @sheharyarn
Owner
sheharyarn commented on Jun 28, 2014
Make it executable:

chmod +x mongo_backup.sh
Schedule a Cronjob:

sudo su
crontab -e
Enter this in a new line:

# Everyday at 1 a.m.
00 01 * * * /bin/bash /home/username/scripts/mongo_backup.sh



mongodump --host 0.0.0.0 -d mydb --username mayusername --password mypassword
--out /var/dbbackups/backup_$(date +\%Y\%m\%d) &&
cd /var/dbbackups && tar -zcf backup_$(date +\%Y\%m\%d).tar.gz backup_$(date +\%Y\%m\%d)/mydb