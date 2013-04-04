#!/usr/bin/env bash
hadoop jar \
	$HADOOP_HOME/contrib/streaming/hadoop-streaming-0.20.2-cdh3u3.jar \
	-D stream.map.output.field.separator=""	\
	-D mapred.job.name="parse raw startpagina to spaced separated"	\
	-input startpagina/startpagina_csv	\
	-output startpagina/startpagina_parsed3	\
	-mapper mapper.py			\
	-numReduceTasks 0	\
	-file *.py	\

