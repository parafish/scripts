#!/usr/bin/env bash

MAPPER=100
sleep 7200

for THRESHOLD in 0.99 0.9 0.75 0.5 0.25 0.1 0.05
do 
	for i in 1 2
	do 
		SUPPORT=`echo "461566504*${THRESHOLD}*100/100" | bc`
		echo "Threshold=${THRESHOLD}\tSupport=$SUPPORT\tRun=${i}"
		$MAHOUT_HOME/bin/mahout	fpg	\
			-i startpagina/startpagina-parsed-${MAPPER}	\
			-o output/fpg-startpagina-support${THRESHOLD}-run${i}	\
			-method mapreduce	\
			-regex '[\ ]'		\
			-s $SUPPORT
	done
done
