#!/usr/bin/env bash 

set -e

MAPPER=100
for SAMPLE in {900..2000..100}
do
	for i in 1 2 3
	do
		OUTPUT="output/100m-20/scale-sample-mapper${MAPPER}-sample${SAMPLE}-run${i}"

		hadoop job -history $OUTPUT	\
			| grep "Finished At" | grep -o "(.*)" | grep -o "[^()]*" | tr '\n' '\0'
		echo -en '\t'
	done
	echo
done
