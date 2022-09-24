#!/bin/bash

index=0

# reads runner.dat file for moves
while IFS= read -r line; do
    if [[ $line == 'x' ]]; then
        p1+="${index}"
    elif [[ $line == 'o' ]]; then
        p2+="${index}"
    fi
    index=$(($index + 1))
done <"./runner.dat"

# checks moves to winning combinations
while IFS= read -r line1; do
    if [[ $p1 == *$line1* ]]; then
        echo
        echo "player 1 wins!"
        echo 1 >"./state/gameover.dat"
    elif [[ $p2 == *$line1* ]]; then
        echo
        echo "player 2 wins!"
        echo 1 >"./state/gameover.dat"
    fi
done <"./win.dat"

exit
