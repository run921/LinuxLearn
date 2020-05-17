#/bin/bash
#for也能实现，同for echo -e "\033[32mscp -r /tmp/test.txt root@$line:/tmp\033[0m"3，
while read line
do
	echo -e "\033[32mscp -r /tmp/test.txt root@$line:/tmp\033[0m"
done<list.txt 
