#!/bin/bash

index=0;

echo "[ENTER] calculateWins.sh";

# reads runner.dat file for moves
while IFS= read -r line; do
    if [[ $line == 'x' ]]; then
        p1+="${index}";
    elif [[ $line == 'o' ]]; then
        p2+="${index}";    
    fi
    index=$(( $index + 1 ));
    done < "./runner.dat"; 

echo X :: $p1;
echo O :: $p2; 

while IFS= read -r line1; do
    if [[ $p1 == *$line1* ]]; then
        echo "player 1 wins!"
    elif [[ $p2 == *$line1* ]]; then
        echo "plauyer 2 wins!"
    fi
done < "./win.dat";

exit;

