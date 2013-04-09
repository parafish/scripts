#!/usr/bin/env bash

SCALE="20"
hadoop jar ~/git/DistributedSampling/ds/target/ds-0.0.1-SNAPSHOT-jar-with-dependencies.jar 	\
	-D mapred.job.name="see cartesian join, 400mappers"	\
	-D mapred.map.tasks="${SCALE}"	\
	-D mapred.map.tasks.speculative.execution=false	\
	fimi/accidents.dat	\
	output_scalability_accidents${SCALE}	\
	10								\
	4	\
	-phase 1	\
	-ow

