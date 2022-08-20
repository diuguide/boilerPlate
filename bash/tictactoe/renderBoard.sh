#!/bin/bash

if [ -n "$1" ]
then
	echo $1
fi

MOVE=$1
line1=".   1  2  3 "
line2=".  -- -- -- "
line3="A |  |  |  |"
line4=".  -- -- -- "
line5="B |  |  |  |"
line6=".  -- -- -- "
line7="C |  |  |  |"
line8=".  -- -- -- "


if [ -z "$1" ] 
then

echo ".  1  2  3 "
echo ". -- -- -- "
echo "A |  |  |  |"
echo ".  -- -- -- "
echo "B |  |  |  |"
echo ".  -- -- -- "
echo "C |  |  |  |"
echo ".  -- -- -- "

elif [ "$1" == "A1" ]
then
	echo $line1
	echo $line2
	echo "A |X |  |  |"
	echo $line4
	echo $line5
	echo $line6
	echo $line7
	echo $line8
fi

exit


