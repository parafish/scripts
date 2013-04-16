#!/usr/bin/env bash
SPLITS=10
hadoop jar \
	$HADOOP_HOME/contrib/streaming/hadoop-streaming-0.20.2-cdh3u3.jar \
	-D mapred.job.name="startpagina, parse, space-separated, splits${SPLITS}"	\
	-D mapred.map.tasks.speculative.execution=false	\
	-D mapred.reduce.tasks.speculative.execution=false	\
	-input startpagina/startpagina-csv/	\
	-output startpagina/startpagina-parsed-${SPLITS}	\
	-mapper mapper.py			\
	-reducer reducer.py			\
	-numReduceTasks ${SPLITS} 		\
	-file *.py	
