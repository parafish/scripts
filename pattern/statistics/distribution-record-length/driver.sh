#!/usr/bin/env bash
hadoop jar \
	$HADOOP_HOME/contrib/streaming/hadoop-streaming-0.20.2-cdh3u3.jar \
	-D mapred.job.name="count, record length"	\
	-D mapred.map.tasks.speculative.execution=false	\
	-D mapred.reduce.tasks.speculative.execution=false	\
	-input startpagina/startpagina-parsed-600/	\
	-output startpagina/startpagina-statistics/record-length	\
	-mapper mapper.py			\
	-combiner reducer.py		\
	-reducer reducer.py			\
	-file *.py	
