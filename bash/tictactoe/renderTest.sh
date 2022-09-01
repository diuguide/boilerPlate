#!/bin/bash

for number in 0 1 2
do
	if [ "$number" = 0 ] 
	then
		echo -e "[][][]"
	elif [ "$number" = 1 ]
	then
		echo -e "[][][]"
	else
		echo [][][]
	fi
done
