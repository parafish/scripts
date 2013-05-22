#!/usr/bin/env bash

SUPPORT=$1

$MAHOUT_HOME/bin/mahout fpg	\
	-Dmapred.reduce.tasks=1	\
	-i fimi/accidents.dat	\
	-o output/fpg-accidents-support${SUPPORT}	\
	-method mapreduce	\
	-regex '[\ ]'		\
	-k ${SUPPORT}
