#!/bin/bash
#Automatic Backup Linux System Files
#By GaoZQ
SOURCE_DIR=(
	$*
)
#备份目录
TARGET_DIR=/home/gao/LinuxLearn/Backup01
#需要根据日期备份
YEAR=`date +%Y`
MONTH=`date +%m`
DAY=`date +%d`
WEEK=`date +%u`
A_NAME=`date +%H%M`

FILES=${A_NAME}system_backup.tgz
CODE=$?
if [ -z "$*" ];then
	echo -e "\033[32mUsage:\nPlease  Enter Your Backup Files or Directories\n------------------------------------\n\nUsage:{ $0 /boot /etc\033[0m"
	exit
fi

#Determine Whether the Target Direvtory Exists
if [ ! -d $TARGET_DIR/$YEAR/$MONTH/$DAY ];then
#递归创建目录
	mkdir -p $TARGET_DIR/$YEAR/$MONTH/$DAY
	echo -e "\033[32mThe $TARGET_DIR Creates Successfully\o33[0m"
fi

#Full Backup Function
Full_Backup()
{
if [ "$WEEK" -eq "7" ];then
	rm -rf $TARGET_DIR/snapshot
	cd $TARGET_DIR/$TEAR/$MONTH/$DAY ;tar -g $TARGET_DIR/snapshot -czvf $FILE ${SOURCE_DIR[@]} 
	[ "$CODE" == "0" ]&&echo -e "----------------------------------------------\n\033[32mThese Full_Back System Files Backup Successfully\033[0m"
fi
}
#Add Backup 
Add_Backup()
{
if [ $WEEK -ne "7" ];then
	cd $TARGET_DIR/$YEAR/$MONTH/$DAY ;tar -g $TARGET_DIR/snapshot -czvf $FILES ${SOURCE_DIR[@]}
	[ "$CODE" == "0" ]&&echo -e "----------------------------------------------\n\033[32mThese Add_Back System Files $TARGET_DIR/$YEAR/$MONTH/$DAY/${YEAR}_$FILES Backup Successfully\033[0m"
fi
}

sleep 3
Full_Backup;Add_Backup
