#!/usr/bin/env bash

MAPPER=100
THRESHOLD=$1
SUPPORT=`echo "461566504*${THRESHOLD}*100/100" | bc`

echo "Support = $SUPPORT"

$MAHOUT_HOME/bin/mahout	fpg	\
	-i startpagina/startpagina-parsed-${MAPPER}	\
	-o output/fpg-startpagina-support${THRESHOLD}	\
	-method mapreduce	\
	-regex '[\ ]'		\
	-s $SUPPORT
