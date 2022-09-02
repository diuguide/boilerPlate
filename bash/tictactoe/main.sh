#!/bin/bash

./render.sh

read -p "Player move..." playervar

./render.sh $playervar

exit

