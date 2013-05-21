#!/usr/bin/env bash

SUPPORT=$1	

mahout fpg	\
	-Dmapred.reduce.tasks=1	\
	-i startpagina/startpagina-parsed-10	\
	-o startpagina/output/fpg-support${SUPPORT}	\
	-method mapreduce	\
	-regex '[\ ]'		\
	-s ${SUPPORT}	
