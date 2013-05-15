#!/usr/bin/env bash

FRAC=$1

hadoop jar \
	$HADOOP_HOME/contrib/streaming/hadoop-streaming-0.20.2-cdh3u3.jar \
	-D mapred.job.name="startpagina, split"	\
	-D mapred.map.tasks.speculative.execution=false	\
	-D mapred.reduce.tasks.speculative.execution=false	\
	-input startpagina/startpagina-20120814-parsed-1/part-00000 \
	-output startpagina/startpagina-20120814-parsed-1/split-${FRAC}	\
	-mapper "mapper.py ${FRAC}"			\
	-reducer reducer.py			\
	-numReduceTasks 2		\
	-file *.py	
