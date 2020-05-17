#!/bin/bash

for i in `cat list.txt`
do
	 echo -e "\033[32mscp -r /tmp/test.txt root@$i:/tmp\033[0m"
done
