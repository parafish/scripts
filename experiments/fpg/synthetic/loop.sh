#!/usr/bin/env bash

MAPPER=100
sleep 7200

for THRESHOLD in 0.99 0.9 0.75 0.5 0.25 0.1 0.05
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
