#!/usr/bin/env bash 

SAMPLE=100
MAPPER=$1

hadoop jar /home/zheyi/test/jars/freqdriver.jar	\
	-D mapred.job.name="scalability, startpagina, sample${SAMPLE}, mapper${MAPPER}" \
	-D mapred.min.split.size=9223372036854775807 	\
	-D mapred.map.tasks.speculative.execution=false	\
	startpagina/startpagina-parsed-${MAPPER}/part*	\
	startpagina/output/scale-freq-sample${SAMPLE}-mapper${MAPPER}	\
	${SAMPLE}				
