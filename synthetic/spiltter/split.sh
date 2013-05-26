#!/usr/bin/env bash

# eliminate the first three elements in the synthetic dataset

hadoop jar \
	$HADOOP_HOME/contrib/streaming/hadoop-streaming-0.20.2-cdh3u?.jar \
	-D mapred.job.name="synthetic, split"	\
	-D mapred.reduce.tasks=100	\
	-input  /user/s117449/synthetic/d_100m_20_1k_10k_4.data	\
	-output /user/s117449/synthetic/dd_100m_20_1k_10k_4	\
	-mapper "mapper.py"			\
	-reducer reducer.py			\
	-numReduceTasks 100		\
	-file *.py	
