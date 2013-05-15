#!/usr/bin/env bash
hadoop jar \
	$HADOOP_HOME/contrib/streaming/hadoop-streaming-0.20.2-cdh3u3.jar \
	-D mapred.job.name="count, record length"	\
	-D mapred.map.tasks.speculative.execution=false	\
	-D mapred.reduce.tasks.speculative.execution=false	\
	-D mapred.output.key.comparator.class=org.apache.hadoop.mapred.lib.KeyFieldBasedComparator \
	-D  mapred.text.key.comparator.options=-n	\
	-input /user/s117449/startpagina/startpagina-20120814-parsed-1/split-0.9999/positive	\
	-output /user/s117449/startpagina/startpagina-20120814-parsed-1/split-0.9999/positive-statistics \
	-mapper mapper.py			\
	-combiner reducer.py		\
	-reducer reducer.py			\
	-file *.py	
