#!/usr/bin/env bash

MAPPER=100

set -e
set -x

for THRESHOLD in 0.04 0.03 0.02 0.01 0.001 0.0001 0.00001 0.000001
do 
	for i in 1 2 3
	do 
		SUPPORT=`echo "461566504*${THRESHOLD}*100/100" | bc`
		echo "Threshold=${THRESHOLD} Support=$SUPPORT Run=${i}"
		$MAHOUT_HOME/bin/mahout	fpg	\
			-i startpagina/startpagina-parsed-${MAPPER}	\
			-o output/fpg-startpagina-support${THRESHOLD}-run${i}	\
			-method mapreduce	\
			-regex '[\ \t]'		\
			-s $SUPPORT
	done
done
