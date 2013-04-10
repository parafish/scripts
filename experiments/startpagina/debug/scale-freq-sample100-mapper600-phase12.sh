#!/usr/bin/env bash 

SAMPLE=100
MAPPER=600

hadoop jar ~/git/DistributedSampling/ds/target/ds-0.0.1-SNAPSHOT-jar-with-dependencies.jar 	\
	-D mapred.job.name="scalability, startpagina, sample${SAMPLE}, mapper${MAPPER}" \
	-D mapred.min.split.size=9223372036854775807 	\
	-D mapred.map.tasks.speculative.execution=false	\
	startpagina/startpagina_parsed_${MAPPER}/part-00000	\
	startpagina/output/scale-freq-sample${SAMPLE}-mapper${MAPPER}-phase12	\
	${SAMPLE}								\
	1	\
	-phase 12	\
	-ow
