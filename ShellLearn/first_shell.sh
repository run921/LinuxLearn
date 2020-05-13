#!/bin/bash
#Filename: first_shell.sh
#auto echo hello world!
#by author gao

#echo "hello world!";
A=123;
name="gaozq";

echo "this is $A";
echo "name is $name";

#UserID
echo "User ID is $UID";

#echo $0 $n $*

echo -e '\033[32m--------------\033[0m'
echo "$0";

echo "$1";

echo "$*";
