#!/bin/bash
#auto backup mysql db
#by GaoZQ
#define backup path

BAK_DIR=/data/backup/`date +%Y%m%d`
MYSQLDB=DBName
MYSQLUSR=backup
MYSQLPW=123456
MYSQLCMD=/usr/bin/mysqldump

if [ $UID -ne 0 ];then
	echo -e "\033[31mMust Use Root Execute this script\033[0m"
	exit
fi

if [ -f $BAK_DIR/DBName.sql ];then
	echo -e "\033[31mBackup Already!\033[0m"
fi


if [ ! -d $BAK_DIR ];then
	mkdir -p $BAK_DIR
	echo -e "\033[32m The $BAK_DIR create Successfully!\033[0m"
else
	echo "This $BAK_DIR is exists..."
fi

#Mysql Backup command
$MYSQLCMD -u$MYSQLUSR -p$MYSQLPW -d $MYSQLDB >$BAK_DIR/DBName.sql

if [ $? -eq 0 ];then
	echo -e "\033[32mThe Mysql Backup $MYSQLDB Successfully!\033[0m"
else
	echo -e "\033[32mThe Mysql Backup $MYSQLDB Failed, Please Check!"

