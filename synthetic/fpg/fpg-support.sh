#!/usr/bin/env bash

MAPPER=100
set -e

THRESHOLD=$1
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
