#!/bin/bash
#if operator test
#GaoZQ 
DIR=~/111
if [ ! -d $DIR ];then

	mkdir -p $DIR
	echo -e "\033[32mThis $DIR create success!\033[0m"
else 
	echo -e "\033[32mThis $DIR exist!\033[0m"
fi
