xxxx/app  
/usr/share/app  |mongo|nginx|node|redis
           config
dos2unix *.sh
docker run  --volumes-from=data -it --rm  --link redis:redis redis bash -c '/usr/share/app/ssh/redis.sh'
=========================================================================
resis backup:
docker exec -it redis /usr/share/app/ssh/redisBackup.sh


resis backup:


