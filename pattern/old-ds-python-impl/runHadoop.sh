#!/usr/bin/env bash

# default values:
inputdirectory="input"
outputdirectory="output"
inputfile="../data/iris.dat"
number=10
iness=1
verbose=false

# usage
function usage
{
	echo "Usage: $0 [-i <input>] [-k <number>] [-m <interestingness>]"
}

##################################################
# if the args < 3
if [ $# -lt 3 ] ; 
then
	usage
	exit 1
fi

# parse the args
while getopts i:o:k:m: opt
do
	case $opt in
		i)	inputfile=$OPTARG;;
		o)	outputdirectory=$OPTARG;;
		k) 	number=$OPTARG;;
		m)	iness=$OPTARG;;
		r)	verbose=true;;
		h)	usage;;
	esac
done

##################################################
echo "making input directory..."
`$HADOOP_HOME/bin/hadoop fs -mkdir $inputdirectory`
echo "putting input file to hdfs..."
`$HADOOP_HOME/bin/hadoop fs -put $inputfile $inputdirectory`

case $iness in 
	1)	dist="frequency distribution";;
	2)	dist="area distribution";;
	4)	dist="squared-freq distribution";;
esac

# run this job
echo "running sampling $number in hadoop using $dist"
$HADOOP_HOME/bin/hadoop jar $HADOOP_HOME/contrib/streaming/hadoop-0.22.0-streaming.jar \
-input  $inputdirectory \
-output $outputdirectory \
-mapper "./mapper.py -m$iness" \
-reducer "./reducer.py -m$iness -k$number" \
-file ./mapper.py -file ./reducer.py -file ./sampler.py

# see the results:
if  $verbose  ; 
then $HADOOP_HOME/bin/hadoop fs -cat output/*
fi
