docker run -it --volumes-from=data --name mongo -p 27019:27019 jianyeruan/mongo /run.sh mongod --port 27019 --dbpath /data


auth:
docker run -it --volumes-from=data --name mongo -p 27019:27019 jianyeruan/mongo /run.sh mongod --port 27019 --dbpath /data
mongo --port 27019 admin --eval "db.createUser({user: 'admin', pwd: 'admin', roles:[{role:'root',db:'admin'}]});"
mongo --port 27019 rjy1 --eval "db.createUser({user: 'rjy', pwd: 'rjy', roles:[{role:'dbOwner',db:'rjy'}]});"
docker commit -m "Added Auth" -a "jianyeruan" f10c01095d24 jianyeruan/mongoauth
docker run -it --volumes-from=data --name mongo1 -p 27019:27019 jianyeruan/mongoauth /run.sh mongod --port 27019 --dbpath /data --auth


docker commit -m "Added Auth" -a "jianyeruan" 23e27aea76d9 jianyeruan/mongoauth