#!/bin/bash

./renderBoard.sh

read -p "Player move..." playervar

./renderBoard.sh "${playervar}"

exit

