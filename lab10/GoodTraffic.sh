#!/bin/bash

for j in 1 2
do
  (trap exit INT
  VS=http://10.10.1.61
  max=1000
  echo -n "Start Good Traffic, looping $max times: "
  for i in $(seq $max); do
    for j in {1..30}; do
	(curl ${VS}/good"$j" >/dev/null 2>&1 &)
    done
    sleep 2
	[[ $((i % 100)) == 0 ]] && echo -n "$i "
    done
    echo)
done
