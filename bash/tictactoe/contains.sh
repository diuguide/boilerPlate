#!/bin/bash


local e match="$1"
shift
for e; do [[ "$e" == "$match" ]] && return 0; done
return 1

string='My long string'
if [[ $string == *"My long"* ]]; then
  echo "It's there!"
fi
