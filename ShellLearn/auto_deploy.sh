#!/bin/bash
#Auto deploy
#Gaozq
#SRC=/etc/

flush()
{
if [ ! -f rsync.list ];then
	echo -e "\033[31mPlease Create rsync.list File. list contents as follows:\033[0m"
cat <<EOF
192.168.149.128	src_dir	des_dir
192.168.149.129	src_dir	des_dir
EOF
	exit
fi

	rm -rf rsync.list.swp ;cat rsync.list |grep -v "#">rsync.list.swp
	COUNT=`cat rsync.list.swp|wc -l`
	NUM=0
while ((${NUM} < $COUNT))
do
	NUM=`expr $NUM + 1`
	Line=`sed -n "${NUM}p" rsync.list.swp`
	SRC=`echo $Line |awk '{print $2}'`
	DES=`echo $Line |awk '{print $3}'`
	IP=`echo $Line |awk '{print $1}'`
	rsync -aP --delete  ${SRC}/ root@{IP}:${DES}/
done
}

restart()
{
	rm -rf restart.list.swp ;cat restart.list |grep -v "#">>restart.list.swp
	COUNT=`cat restart.list.swp|wc -l`
	NUM=0
while ((${NUM} < $COUNT))
do
	NUM=`expr $NUM + 1`
	Line=`sed -n "${NUM}p" restart.list.swp`
	Command=`echo $Line |awk '{print $2}'`
	IP=`echo $Line |awk '{print $1}'`
	ssh -l root $IP "sh $Command;echo -e '-------------------\nThe $IP Exec Command : sh $Command success !"
done
}

case $1 in
	flush )
	flush
	;;
	restart )
	restart
	;;
	* )
	echo -e "\033[31mUsage: $0 command ,example{flush | resatrt \033[0m}"
	;;
esac
