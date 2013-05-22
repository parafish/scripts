#!/usr/bin/env bash

for SUPPORT in 10000000 40000000 100000000 400000000
do
echo "support=$SUPPORT"
mahout fpg	\
	-Dmapred.reduce.tasks=1	\
	-i startpagina/startpagina-parsed-10	\
	-o startpagina/output/fpg-support${SUPPORT}	\
	-method mapreduce	\
	-regex '[\ ]'		\
	-s ${SUPPORT}	
done
