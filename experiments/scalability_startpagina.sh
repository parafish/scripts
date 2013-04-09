#!/usr/bin/env bash

SCALE="4"
hadoop jar ~/git/DistributedSampling/ds/target/ds-0.0.1-SNAPSHOT-jar-with-dependencies.jar 	\
	-D mapred.job.name="scalability_webdocs, sample=10, scale=${SCALE}"	\
	-D mapred.map.tasks="1"	\
	-D mapred.map.tasks.speculative.execution=false	\
	fimi/p*.dat	\
	output_scalability_startpagina_${SCALE}	\
	10								\
	1	\
	-ow
