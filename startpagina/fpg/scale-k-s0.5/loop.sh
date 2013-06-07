#!/usr/bin/env bash

MAPPER=100

set -x
set -e

THRESHOLD=0.5
for k in 100 200 300 400 500 600 700 800 900 1000
do 
	for i in 1 2 3
	do 
		SUPPORT=`echo "461566504*${THRESHOLD}*100/100" | bc`
		echo "Threshold=${THRESHOLD} Support=$SUPPORT k=${k} Run=${i}"
		$MAHOUT_HOME/bin/mahout	fpg	\
			-i startpagina/startpagina-parsed-${MAPPER}	\
			-o output/fpg-startpagina-support${THRESHOLD}-k${k}-run${i}	\
			-method mapreduce	\
			-regex '[\ \t]'		\
			-s $SUPPORT			\
			-k ${k}
	done
done
