#!/usr/bin/env bash 

SAMPLE=100
MAPPER=$1

hadoop jar ~/test/jars/samplingdriver.jar freq \
	-D mapred.reduce.tasks=1	\
	-D mapred.job.name="syn(100M, 20), freq, sample${SAMPLE}, mapper${MAPPER}" \
	-D mapred.map.tasks=${MAPPER} 	\
	-D mapred.map.tasks.speculative.execution=false	\
	/user/s117449/synthetic/d_100m_20_1k_10k_4.data	\
	output/100m-20/scale-freq-sample${SAMPLE}-mapper${MAPPER}	\
	${SAMPLE}		
