#!/usr/bin/env bash

SUPPORT=$1	

mahout fpg	\
	-i /user/s117449/synthetic/d_20m_20_1k_10k_4.data	\
	-o output/fpg-synthetic-20m-support${SUPPORT}	\
	-method mapreduce	\
	-regex '[\ ]'		\
	-s ${SUPPORT}	
