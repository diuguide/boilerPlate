#!/bin/bash

d=`date '+%Y%m%d%H%M%S'`

cp "./guide.dat" "./runner.dat"

function updateRunner () {
position=$1
player=$2
file_path="./runner.dat"
index=0

while read p && [ $index -lt 9 ];
do
	
	if [ $index -eq $1 ] 
	then
		sed -i "s/$index/$2/1" "./runner.dat"
	fi
	index=$(( $index + 1 ))
done < $file_path

}

echo 0 > "./state/firstmove.dat"

./render.sh

echo 1 > "./state/firstmove.dat"

gameover=$( cat "./state/gameover.dat" )
movecount=0

while [ $gameover -eq 0 ];
do

read -p "Player move..." playervar

updateRunner $playervar x
movecount=$(( $movecount + 1 ))
./render.sh

read -p "Player move..." playervar

updateRunner $playervar o
movecount=$(( $movecount + 1 ))
./render.sh

if [ $movecount -gt 4 ] 
then
	./calculateWin.sh
fi


done

cp  "./runner.dat"  "./hist/match$d.txt"

exit

