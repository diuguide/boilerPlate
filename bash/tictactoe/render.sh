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
	
	if [[ -z "$@" ]]
	then
        	for num in 0 1 2 3 4 5 6 7 8
        	do
			if [ $num == "2" ] || [ $num == "5" ]
			then 
				renderSquare
				echo 
			else
				renderSquare
			fi

			done
	else
		
		for num in 0 1 2 3 4 5 6 7 8
                do
                        if [ $num == "2" ] || [ $num == "5" ]
                        then
				containsElement $num $@
				echo $?
                                renderSquare 
                                echo
                        else
                                renderSquare
                        fi

                        done

	fi


}

if [[ -z "$@" ]] 
then
	printBoard
else
	
	printBoard $@
fi

exit;

