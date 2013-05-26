#!/usr/bin/env bash

MAPPER=100
set -x 
set -e

for SAMPLE in 200 300 400 500 600 700 800
do
	for i in 1 2 3 
	do 
		echo "Sample=${SAMPLE}, Mapper=${MAPPER}, RUN=${i}\n"
		hadoop jar ~/test/jars/samplingdriver.jar disc	\
			-D mapred.job.name="scale-mapper, disc, startpagina-20120814, sample${SAMPLE}, mapper${MAPPER}"	\
			-D mapred.map.tasks=${MAPPER}	\
			-D dps.right.line.length=2390	\
			/user/s117449/startpagina/startpagina-20120814-parsed-1/split-0.9999/negative	\
			/user/s117449/startpagina/startpagina-20120814-parsed-1/split-0.9999/positive-expanded/positive-expanded-2390	\
			/user/s117449/startpagina/startpagina-20120814-parsed-1/split-0.9999/output/disc-sample${SAMPLE}-mapper${MAPPER}-${i}	\
			${SAMPLE}
	done
done
