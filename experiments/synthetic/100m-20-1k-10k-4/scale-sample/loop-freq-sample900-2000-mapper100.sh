#!/usr/bin/env bash 

MAPPER=100

set -e
set -x

for SAMPLE in {900..2000..100}
do
	for i in 1 2 3
	do
		echo "Sample=$SAMPLE, run=$i"
		hadoop jar ~/test/jars/samplingdriver.jar freq  \
		-D mapred.job.name="scale-sample, syn-100m-20, sample${SAMPLE}, mapper${MAPPER}, run$i" \
		-D mapred.min.split.size=0	\
		-D mapred.map.tasks=${MAPPER}	\
		synthetic/d_100m_20_1k_10k_4.data		\
		output/100m-20/scale-sample-mapper${MAPPER}-sample${SAMPLE}-run${i}	\
		${SAMPLE}						
	done
done
