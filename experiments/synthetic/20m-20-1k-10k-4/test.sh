#!/usr/bin/env bash 

SAMPLE=100000
MAPPER=300

hadoop jar ~/test/jars/samplingdriver.jar freq \
	-D mapred.job.name="syn(20M, 20), freq, sample${SAMPLE}, mapper${MAPPER}" \
	-D mapred.map.tasks=${MAPPER} 	\
	-D mapred.map.tasks.speculative.execution=false	\
	/user/s117449/synthetic/d_20m_20_1k_10k_4.data	\
	output/20m-20/scale-freq-sample${SAMPLE}-mapper${MAPPER}	\
	${SAMPLE}		
