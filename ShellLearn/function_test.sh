#!/bin/bash


function hello()
{
	echo "this is hello 1"
}

function hello2()
{
	echo "this is hello 2"
}

function hello3()
{
	echo "this is hello 3"
}

PS3="Please select Mune:"
select i in "hello" "hello2" "hello3"
do
	case $i in
		hello)
		hello
		;;
		hello2)
		hello2
		;;
		hello3)
		hello3
		;; 
	esac
done 
