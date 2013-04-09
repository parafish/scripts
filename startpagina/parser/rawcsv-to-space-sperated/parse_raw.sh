#!/usr/bin/env bash
hadoop jar \
	$HADOOP_HOME/contrib/streaming/hadoop-streaming-0.20.2-cdh3u3.jar \
	-D mapred.job.name="parse raw startpagina to spaced separated"	\
	-D mapred.map.tasks.speculative.execution=false	\
	-D mapred.reduce.tasks.speculative.execution=false	\
	-input startpagina/startpagina_csv/	\
	-output startpagina/startpagina_parsed_600	\
	-mapper mapper.py			\
	-reducer reducer.py			\
	-numReduceTasks 600 		\
	-file *.py	
