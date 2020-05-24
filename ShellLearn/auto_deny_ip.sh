#!/bin/bash
#auto drop ssh failed IP address
#by Gaozq

SEC_FILE=/var/log/secure	#远程登录log文件
#以下是截取文件中恶意IP登录22端口大于等4次的记录到防火墙
#其中egrep -o "([0-9]{1,3}\.){3}[0-9]{1,3}"是匹配IP的意思
IP_ADDR=tail -n 1000 /var/log/secure |grep "Failed password" |egrep -o "([0-9]{1,3}\.){3}[0-9]{1,3}" |sort -nr |uniq -C |awk '$1>=4 {print $2}'
IPTABLE_CONF=/etc/sysconfig/iptables

echo
cat <<EOF
+++++++++++++welcome to use ssh login drop failed ip++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
EOF

for i in `echo $IP_ADDR`
do
	#查看iptables配置文件是否含有提取IP信息
	cat $IPTABLE_CONF |grep $i >/dev/null
if
	[ $? -ne 0 ];then
	#判断iptables配置文件里是否存在已拒绝的ip，sed a参数的意思是匹配之后加入行
	sed -i "/lo/a -A INPUT -s $i -m state --state NEW -m tcp -p tcp --drop 22 -j DROP" $IPTABLE_CONF
else
	#存在就打印提示信息
	echo "this is $i is exist in iptables.please exit..."
fi
done

#最后重启iptables生效
/etc/init.d/iptables restart
