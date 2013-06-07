#!/usr/bin/env bash 

SAMPLE=$1
MAPPER=100

hadoop jar ~/test/jars/samplingdriver.jar freq  \
	-D mapred.job.name="scale-sample, syn-100m-20, sample${SAMPLE}, mapper${MAPPER}" \
	-D mapred.map.tasks=${MAPPER}	\
	-D mapred.map.tasks.speculative.execution=false	\
	synthetic/d_100m_20_1k_10k_4.data		\
	output/100m-20/scale-sample-mapper${MAPPER}-sample${SAMPLE}	\
	${SAMPLE}						
