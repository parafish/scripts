#!/usr/bin/env bash

SAMPLE=1
MAPPER=100

hadoop jar ~/test/jars/discdriver.jar	\
	-D mapred.job.name="scale-mapper, disc, sample${SAMPLE}, mapper${MAPPER}"	\
	-D mapred.map.tasks.speculative.execution=false	\
	-D mapred.map.tasks=${MAPPER}	\
	-D dps.right.line.length=585	\
	/user/s117449/disc-datasets/census/positive.data	\
	/user/s117449/disc-datasets/census/negative-expanded/negative.data-expanded-584	\
	/user/s117449/disc-datasets/census/output/disc-sample${SAMPLE}-mapper${MAPPER}		\
	${SAMPLE}
