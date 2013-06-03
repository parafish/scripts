#!/usr/bin/env bash

MAPPER=100
set -e
for THRESHOLD in 0.0559 0.0558 0.0557 0.05556 0.0555
do
	for i in 1 
	do 
		SUPPORT=`echo "100000000*${THRESHOLD}*100/100" | bc`
		echo "Threshold=${THRESHOLD}\tSupport=$SUPPORT\tRun=${i}"
		$MAHOUT_HOME/bin/mahout	fpg	\
			-i /user/s117449/synthetic/d_100m_20_1k_10k_4	\
			-o output/fpg-synthetic-support${THRESHOLD}-run${i}	\
			-method mapreduce	\
			-regex '[\t\ ]'		\
			-s $SUPPORT
	done
done
