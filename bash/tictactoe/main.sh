#!/bin/bash
clear

d=$(date '+%Y%m%d%H%M%S')
echo 0 >"./state/gameover.dat"
cp "./guide.dat" "./runner.dat"
gameover=$(cat "./state/gameover.dat")
movecount=0
playerToggle=0

function updateRunner() {
	position=$1
	player=$2
	file_path="./runner.dat"
	index=0

	while read p && [ $index -lt 9 ]; do
		if [ $index -eq $1 ]; then
			sed -i "s/$index/$2/1" "./runner.dat"
		fi
		index=$(($index + 1))
	done <$file_path

}

echo 0 >"./state/firstmove.dat"

./render.sh

echo 1 >"./state/firstmove.dat"

while [ $gameover -eq 0 ] && [ $movecount -le 9 ]; do
	echo
	read -p "Player move..." playervar

	if [[ $playerToggle -eq 0 ]]; then
		updateRunner $playervar x
	elif [[ $playerToggle -eq 1 ]]; then
		updateRunner $playervar o
	fi

	movecount=$(($movecount + 1))
	playerToggle=!$playerToggle
	clear
	./render.sh

	if [ $movecount -ge 4 ]; then
		./calculateWin.sh
	fi

	gameover=$(cat "./state/gameover.dat")

done

echo GAME OVER!

cp "./runner.dat" "./hist/match$d.txt"

exit
