#!/bin/bash
#Auto Change Server Files
#by Gaozq

if [ ! -f ip.txt ];then	#判断ip.txt是否存在
	echo -e "\033[31mPlease Create ip.txt File,The ip.txt contents as follows:\033[0m"
cat <<EFO
192.168.149.128
192.168.149.129
EFO
	exit
fi

if [ -z "$1" ];then	#判断脚本参数是否为空
	echo -e "\033[31mUsage: $0 command ,Example{Src_Files|Src_Dir Des_dir} \033[0m"
	exit
fi

count='cat ip.txt |wc -l'	#统计ip.txt行数
rm -rf ip.txt.swp

i=0
while ((i< $count))
do
	i=`expr $1 + 1`	#让i加1
	sed "${i}s/^/&${i} /g" ip.txt>>ip.txt.swp
	IP=`awk -v I="$1" '{if(I==$1)print$2}' ip.txt.swp`	#类似用while实现循环更换ip
	scp -r $1 root@${IP}:$2
	#rsync -aP --delete $1 root@${IP}:$2
done


