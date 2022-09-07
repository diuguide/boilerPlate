#!/bin/bash

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

read -p "Player move..." playervar

d=`date '+%Y%m%d%H%M%S'`

echo 1 > "./state/firstmove.dat"

updateRunner 3 x

./render.sh 

read -p "Player move..." playervar

updateRunner 6 o

./render.sh

cp  "./runner.dat"  "./hist/match$d.txt"

exit

