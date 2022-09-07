#!/bin/bash

#function creates a blank board - takes two arguments an array of each players moves

containsElement () {
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && return 0; done
  return 1
}

function renderSquare() {

	if [ -z "$@" ]
	then
		echo -n '[ ]'
	elif [ $1 = "x" ] 
	then
		echo -n [x]
	elif [ $1 = "o" ]
	then
		echo -n [o]
	else
		echo -n '[ ]'
	fi

}

function printBoard() {
	
	count=0

	textVar=$( cat "./state/firstmove.dat" )
	
	[[ $textVar -eq 0 ]] && file_path="./guide.dat" || file_path="./runner.dat"

	while [ $count -lt 9 ]; do
		while read p;
                do
			if [ $count == "2" ] || [ $count == "5" ]
                        then
                                renderSquare $p
                                echo
                        else
                                renderSquare $p
                        fi
                    	count=$(( $count + 1 ));
	    	done < $file_path

	done

}


printBoard


exit;

