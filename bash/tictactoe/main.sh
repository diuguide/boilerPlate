#!/bin/bash

./render.sh

read -p "Player move..." playervar

d=`date '+H%m%s'`

mkdir temp

echo -e $playervar >> "./temp/moves$d.txt"

./render.sh 

read -p "Player move..." playervar

echo -e $playervar >> "./temp/moves$d.txt"

mv  "./temp/moves$d.txt"  "./hist/moves$d.txt"

rm -r ./temp

exit

