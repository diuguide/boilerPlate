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


function renderSquare() {

	if [ -z "$@" ]
	then
		echo -n []
	elif [ $1 = "x" ] 
	then
		echo -n [x]
	else
		echo -n [o]
	fi

}

function printBoard() {

        for num in 0 1 2 3 4 5 6 7 8
        do
		if [ $num == "2" ] || [ $num == "5" ]
		then 
		renderSquare
		echo ''
		else
		renderSquare
		fi

	done


}

printBoard


exit;

