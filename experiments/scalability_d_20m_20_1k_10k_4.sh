#!/usr/bin/env bash

SCALE="6"
hadoop jar ~/git/DistributedSampling/ds/target/ds-0.0.1-SNAPSHOT-jar-with-dependencies.jar 	\
	-D mapred.job.name="scalability_20m_20_1k_10k_4, sample=100, scale=${SCALE}"	\
	-D mapred.map.tasks="${SCALE}00"	\
	-D mapred.map.tasks.speculative.execution=false	\
	/user/s117449/synthetic_data/d_20m_20_1k_10k_4.data	\
	output/scalability-d_20m_20_1k_10k_4_sample100-mapper${SCALE}	\
	100								\
	1	\
	-ow

