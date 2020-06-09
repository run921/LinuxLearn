#!/bin/bash
#auto get device information
#by Gaozq
echo -e "\033[34m \033[0m"
cat <<EOF
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++Welcome to use system Collector+++++++++++++++++
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
EOF

ip_info=`ifconfig |grep "inet"|head -1 |awk '{print $2}' |cut -d: -f 2`
cpu_info1=`cat /proc/cpuinfo |grep 'model name'|tail -1|awk -F: '{print $2}'|sed 's/^ //g'|awk '{print $1,$2,$3,$4,$NF}'`
#awk -F: '{print $2}'表示打印以：为分隔符的第二列
cpu_info2=`cat /proc/cpuinfo |grep "physical id"|sort |uniq -c|wc -l`
serv_info=`hostname |tail -1`
#disk_info=`sudo fdisk -l|grep "Disk"|gerp -v "identifier"|awk '{print $2,$3,$4}'|sed 's/,//g'`
#fdisk命令可能需要root权限
mem_info=`free -m |grep "Mem"|awk '{print "Total",$1,$2"M"}'`
#-m表示以M为计量单位显示
load_info=`uptime |awk '{print "Current Load:"$(NF-2)}'|sed 's/\,//g'`
mark_info='BeiJing_IDC'

echo -e "\033[32m-------------------------------\033[0m"
echo IPADDR:${ip_info}
echo HOSTNAME:$serv_info
echo CPU_INFO:$cpu_info1
#echo DISK_INFO:$disk_info
echo MEM_INFO:$mem_info
echo LOAD_INFO:$load_info
