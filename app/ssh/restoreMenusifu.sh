#! /bin/bash
backDb="20170407menusifu"
restoreDb="menusifu2"
PATH=/usr/local/bin:$PATH
tar xvf  /usr/share/app/mongo/$backDb.tar.gz
mongorestore -d $restoreDb  /usr/share/app/mongo/tpm/menusifu
echo "done!"