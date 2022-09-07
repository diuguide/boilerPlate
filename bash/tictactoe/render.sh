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
		echo -n []
	elif [ $1 = "x" ] 
	then
		echo -n [x]
	else
		echo -n [o]
	fi

}

function printBoard() {
	
	count=0
	while [ $count -lt 9 ]; do
	 while read p;
                do
                        if [ $count == "2" ] || [ $count == "5" ]
                        then
                                renderSquare
                                echo
                        else
                               renderSquare
                        fi
                    count=$(( $count + 1 ));
                done < "./guide.dat"
	

	done

}

printBoard


exit;

