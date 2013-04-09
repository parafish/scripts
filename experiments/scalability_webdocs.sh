#!/usr/bin/env bash

SCALE="6"
hadoop jar ~/git/DistributedSampling/ds/target/ds-0.0.1-SNAPSHOT-jar-with-dependencies.jar 	\
	-D mapred.job.name="scalability_webdocs, sample=1000, scale=${SCALE}"	\
	-D mapred.map.tasks="${SCALE}00"	\
	-D mapred.map.tasks.speculative.execution=false	\
	fimi/webdocs.dat	\
	output_scalability_webdocs_${SCALE}	\
	1000								\
	1	\
	-ow

