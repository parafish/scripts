#!/usr/bin/env bash

SUPPORT=$1

$MAHOUT_HOME/bin/mahout fpg	 \
	-i fimi/accidents.dat	\
	-o output/fpg-accidents-support${SUPPORT}-test	\
	-method mapreduce	\
	-s ${SUPPORT}
