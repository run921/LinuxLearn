#!/bin/bash

for i in `find ~/LinuxLearn/ShellLearn/test -name "*.gz"`
do
	tar -xzvf $i
done
