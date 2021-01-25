#!/bin/bash
#Automatic Backup Log File
#By Gaozhiqiang

TIME=$(date "+%Y-%m-%d %H:%M:%S")
TWO_DAY_AGO=`date -d "x days ago" +%Y%m%d`

log_dir=(/data/log/vldt /data/log/hft_logger)
for i in ${log_dir[*]}
do
    cd $i
    FILES=`find ./ -mtime +2 -name "*.log*"`
    TAR_NAME="${i##*/}-$TWO_DAY_AGO.tar.gz"
    nohup tar -czvf /data/logBackup/$TAR_NAME $FILES >/dev/null 
    #find ./ -mtime -1 -name "*.log*"|xargs tar -czvf /data/logBackup/${log_dir##*/}-$YEAR$MONTH`expr $DAY - 2`.tar.gz {}
    if [ -f /data/logBackup/$TAR_NAME ]
    then
        echo "[$TIME] ${i##*/}-$TWO_DAY_AGO backup success" 
        rm -rf $FILES
    else
        echo "[$TIME] $i nothing need  backup "
    fi  
cd -
done
