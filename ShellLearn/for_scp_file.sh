#!/bin/bash
#auto scp files for client
#GaoZQ

for i in `seq 100 200`
do
	scp -r /tmp/test.txt
root@192.168.1.$i:/data/webapps/www
done
