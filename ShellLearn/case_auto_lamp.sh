#!/bin/bash
#auto install LAMP
#By Gaoq

PS3="select your will exec Menu:"

select i in "Apache" "Mysql" "PHP"
do

case $i in  
	Apache )
	echo "wait install httpd server..."
	#tar jxvf httpd-2.2.27.tar,bz2;cd httpd-2.2.27
	;;
	Mysql )
	echo "wait install Mysql server..."
	;;
	PHP )
	echo "wait install PHP server..."
	;;
	* )
	echo -e "\033[31mUsage: {$0 Apache|Mysql|PHP|help} \033[0m"
	;;
esac

done
