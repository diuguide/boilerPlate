#!/bin/bash
clear
mkdir state
echo 0 >"./state/gameover.dat"
echo 0 >"./state/firstmove.dat"
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

./render.sh

echo 1 >"./state/firstmove.dat"

while [ $gameover -eq 0 ] && [ $movecount -le 8 ]; do

	echo
	echo

	if [[ $playerToggle -eq 0 ]]; then
		read -p "Player X move..." playervar
		updateRunner $playervar x
	elif [[ $playerToggle -eq 1 ]]; then
		read -p "Player O move..." playervar
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
echo
echo
echo
if [[ $gameover -eq 0 ]]; then
	echo NOBODY WINS!
	echo
	echo
	echo GAME OVER!
else
	echo GAME OVER!
fi
rm -rf ./state

exit
