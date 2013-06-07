#!/usr/bin/env bash

MAPPER=100
set -e

for SAMPLE in 200 300 400 500 600 700 800
do
	for i in 1 2 3 
	do 
		echo "Sample=${SAMPLE}, Mapper=${MAPPER}, RUN=${i}\n"
		hadoop job -history /user/s117449/startpagina/startpagina-20120814-parsed-1/split-0.9999/output/disc-sample${SAMPLE}-mapper${MAPPER}-${i}	\
			| grep "Finished At"
	done
done
