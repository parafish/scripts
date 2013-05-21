#!/usr/bin/env bash

SUPPORT=$1	

mahout fpg	\
	-D mapred.reduce.tasks=1	\
	-i /user/s117449/synthetic/d_100m_20_1k_10k_4.data	\
	-o output/fpg-synthetic-support${SUPPORT}	\
	-method mapreduce	\
	-regex '[\ ]'		\
	-s ${SUPPORT}	
