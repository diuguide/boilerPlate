#!/bin/bash

index=0;


while IFS= read -r line; do
    if [[ $line == 'x' ]]; then
        p1+="${index} ";
    elif [[ $line == 'o' ]]; then
        p2+="${index} ";
    else
        continue;    
    fi
    index=$(( $index + 1 ));
    done < "./runner.dat"; 

p1Arr=( $p1 );
p2Arr=( $p2 );

exit;

