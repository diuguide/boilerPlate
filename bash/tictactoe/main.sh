#!/bin/bash

./render.sh

read -p "Player move..." playervar

d=`date '+%Y%m%d%H%M%S'`

mkdir temp

echo -e $playervar > "./temp/moves.txt"

./render.sh 

read -p "Player move..." playervar

echo -e $playervar >> "./temp/moves.txt"

mv  "./temp/moves.txt"  "./hist/moves$d.txt"

rm -r ./temp

exit

