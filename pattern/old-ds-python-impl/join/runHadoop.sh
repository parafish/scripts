#!/usr/bin/env bash
echo "putting input file to hdfs..."
$HADOOP_HOME/bin/hadoop fs -put $1 input

echo "run sampling in hadoop"
$HADOOP_HOME/bin/hadoop jar $HADOOP_HOME/contrib/streaming/hadoop-0.22.0-streaming.jar \
-input  input \
-output output \
-mapper ./mapper.py \
-reducer ./reducer.py \
-file ./mapper.py -file ./reducer.py -file ./sampler.py

$HADOOP_HOME/bin/hadoop fs -cat /output/*
