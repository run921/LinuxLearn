#!bin/bash
i=0

A=( hello1 hello2 hello3 )
for i in `seq 0 2`
do
	echo ${A[$i]}
done

