#!/usr/bin/env bash 

SAMPLE=10
MAPPER=100

hadoop jar ~/test/jars/discdriver.jar  \
	-D mapred.job.name="disc, startpagina, sample${SAMPLE}, mapper${MAPPER}" \
	-D mapred.min.split.size=9223372036854775807 	\
	-D mapred.map.tasks.speculative.execution=false	\
	-D dps.right.line.length=4477	\
	/user/s117449/startpagina/startpagina-parsed-${MAPPER}/part* 	\
	/user/s117449/startpagina/startpagina-parsed-10-expanded/startpagina-parsed-10-expanded-4476	\
	startpagina/output/disc/sample10-10	\
	${SAMPLE}						
