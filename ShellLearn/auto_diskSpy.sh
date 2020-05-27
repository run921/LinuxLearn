#!/bin/bahs
#auto monitor disk 
#author by Gaozq
rm -rf list.txt
LIST=`df -h |grep "^/dev/" >>list.txt`
cat << EOF
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++welcome auto monitor system++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
EOF
echo -e "\033[32m------------------------------------------------\033[0m"
echo
sleep 2
while read line
do
	IP_ADDR=`ifconfig eth1|grep "Bcast"|awk '[print $2]'|cut -d: -f 2`
	D_Name=`echo $line|awk '{print $1,$NF"分区"}'`
	D_Total=`echo $line|awk '{print $2}'`
	D_Avail=`echo $line|awk '{print $4}'`
	D_Percent=`echo $line|awk '{print $5]'|sed 's/%//g'`
	if [ "$D_Percent" -ge 50 ];then
cat >email.txt <<EOF
********************* Email ***************************

通知类型：故障

服务：Disk Monitor
主机：$IP_ADDR
状态：警告

日期/时间：

额外信息：

CRITICAL - DISK Monitor:$D_Name Used mor then ${D_Percent}%
EOF
	echo -e "\033[32mThe $D_Name has been used for more rhen ${D_Percent}%, Please Check.\033[0m"
	mail -s "$D_Name Warning" 954272009@qq.com <email.txt
	fi
done<list.txt
echo -e "\033[32m--------------------- done  --------------------\033[0m"
 
