#!/bin/bash

# default values:
input=../data/iris.dat
k=10		# samples
iness=1		# frequency

# usage
function usage
{
	echo "Usage: $0 [-i <input>] [-o <output>] [-k <number>] [-m <interestingness>]"
}

# if the arguments < 3
if [ $# -lt 3 ] ; then
	usage
	exit 1
fi

# parse the arguments
while getopts i:o:k:m: opt
do	
	case "$opt" in
		i) input=$OPTARG;;
		o) output=$OPTARG;;
		k) k=$OPTARG;;
		m) iness=$OPTARG;;
		h) usage;;
	esac
done

case $iness in 
	1)	dist="frequency distribution";;
	2)	dist="area distribution";;
	4)	dist="squared-freq distribution";;
esac
# run the job
# mapper phase, generate one variable containing all data
echo "Sample $k patterns using $dist..."
case $iness in
	1) 	weighted_data=`cat $input | ./mapper.py -m$iness`;;
	2) 	weighted_data=`cat $input | ./mapper.py -m$iness`;;
	3) 	echo "disc not supported yet"
		exit 1;;
	4) 	weighted_data=`cat $input | ./join/mapper.py | ./join/reducer.py |
		./mapper.py -m$iness`;;
esac

# reduce phase, sample record, then pattern
echo "$weighted_data" | ./reducer.py -m$iness -k$k

echo "Done."

