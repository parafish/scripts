#!/usr/bin/env bash

MAPPER=100
set -e
for THRESHOLD in 0.09 0.08 0.07 0.06
do 
	for i in 1 2 3
	do 
		SUPPORT=`echo "100000000*${THRESHOLD}*100/100" | bc`
		echo "Threshold=${THRESHOLD}\tSupport=$SUPPORT\tRun=${i}"
		$MAHOUT_HOME/bin/mahout	fpg	\
			-i /user/s117449/synthetic/dd_100m_20_1k_10k_4	\
			-o output/fpg-synthetic-support${THRESHOLD}-run${i}	\
			-method mapreduce	\
			-regex '[\t\ ]'		\
			-s $SUPPORT
	done
done
