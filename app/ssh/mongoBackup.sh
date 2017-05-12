#! /bin/bash
PATH=/usr/local/bin:$PATH
mongodump -o /tmp
date=$(date +"%Y%m%d")
tar -zcvf /usr/share/app/mongo/$date.tar.gz /tmp
rm -rf /tmp/*
echo "done!"
