#!/bin/bash
#sum from 1 to 100
#GaoZQ

j=0
for ((i=0;i<=100;i++))

do
	j=`expr $i + $j`

done

echo $j 
