#!/usr/bin/env bash 

SAMPLE=100
MAPPER=$1

hadoop jar ~/git/scripts/experiments/ds-0.0.1-SNAPSHOT-jar-with-dependencies.jar 	\
	-D mapred.job.name="syn(100M, 20), freq, sample${SAMPLE}, mapper${MAPPER}" \
	-D mapred.min.split.size=$((9825385372/${MAPPER})) 	\
	-D mapred.map.tasks.speculative.execution=false	\
	/user/s117449/synthetic_data/d_100m_20_1k_10k_4.data	\
	output/100m-20/scale-freq-sample${SAMPLE}-mapper${MAPPER}	\
	${SAMPLE}			\
	1	\
	-ow
