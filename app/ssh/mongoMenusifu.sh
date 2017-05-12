#! /bin/bash
dataDb="menusifu"
PATH=/usr/local/bin:$PATH
mongodump -d $dataDb -o /tmp
date=$(date +"%Y%m%d$dataDb")
tar -zcvf /usr/share/app/mongo/$date.tar.gz /tmp/$dataDb
rm -rf /tmp/$dataDb/
echo "done!"
