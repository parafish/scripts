#!/usr/bin/env bash

for SUPPORT in 10000000 40000000 100000000 400000000
do
echo "support=$SUPPORT"
$MAHOUT_HOME/bin/mahout fpg	\
	-i startpagina/startpagina-parsed-10	\
	-o output/fpg-startpagina-support${SUPPORT}	\
	-method mapreduce	\
	-regex '[\ ]'		\
	-s ${SUPPORT}	
done
