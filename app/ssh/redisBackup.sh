#! /bin/bash
PATH=/usr/local/bin:$PATH
redis-cli SAVE
date=$(date +"%Y%m%d")
tar -zcvf /usr/share/app/redis/$date.tar.gz /data/
rm -rf /data/*
echo "done!"