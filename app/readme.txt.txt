docker run -it --volumes-from=data  --rm nginx bash

docker run -d --name data -v  c:/jianyeruanwork/app:/usr/share/app busybox 
docker run -d --name code -v  c:/jianyeruanwork/app:/usr/share/app jianyeruan/app tail -f /dev/null
docker run -d --volumes-from=data --name mongo -p 27017:27017 jianyeruan/mongo /run.sh mongod --port 27017 --dbpath /usr/share/app/data
docker run -it --volumes-from=data -p 3000:3000 --link mongo:mongo -e APPPATH="LaundryServer" --rm jianyeruan/node /run.sh supervisor app.js
docker run -d --name=nginx -p 80:80 --volumes-from=data -v c:/jianyeruanwork/config/nginx:/etc/nginx/conf.d jianyeruan/nginx

docker run --volumes-from=data --link mongo:mongo -e APPPATH="LaundryServer" --rm jianyeruan/node /run.sh node modules/createsuper.js

docker run --volumes-from=data -p 6381:6379 --name restaurantredis -d redis


docker run -it --link mongo:mongo  --rm mongo sh -c 'exec mongorestore -h "mongo:27017/dataname"  /usr/share/app/backup'


sudo docker logs -f --tail="10"  cb16eadb469f