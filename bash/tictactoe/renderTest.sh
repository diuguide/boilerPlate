#!/bin/bash

#function creates a blank board - takes two arguments an array of each players moves

function renderBoard() {
	
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
done;

}

exit;

