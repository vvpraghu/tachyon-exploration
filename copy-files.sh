#!/bin/bash
hosts=$(cat ~/hosts | grep -v '#')
for host in $hosts
do
	      echo "------------------" $host "------------"  
        # tachyon
        rsync -avz --delete --exclude 'logs/*' --exclude 'pids/*' --exclude underfs --exclude journal -e 'ssh -o StrictHostKeyChecking=no' ~/tachyon/  $host:tachyon/

        # spark
        #rsync -avz --delete --exclude 'logs/*' --exclude 'pids/*' --exclude "work/*" -e 'ssh -o StrictHostKeyChecking=no' ~/spark/  $host:spark/

done
