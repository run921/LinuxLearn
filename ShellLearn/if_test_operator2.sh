#!/bin/bash
#if operator test
#GaoZQ

FILES=~/text.txt

if [ ! -f $FILES ];then
	echo "ok" >> $FILES
else
	cat $FILES
fi
