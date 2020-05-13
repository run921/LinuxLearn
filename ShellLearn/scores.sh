#!/bin/bash
#operator test
#GaoZQ

if [ -z $1 ];then
	echo "sh后输入参数"
	exit
fi

if [ $1 -gt 80 ];then
	echo "very good"

elif [ $1 -gt 60 ];then
	echo "good"
else 
	echo "bed"
fi
