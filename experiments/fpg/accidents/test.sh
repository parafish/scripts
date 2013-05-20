#!/usr/bin/env bash

mahout fpg	\
	-i fimi/accidents.dat	\
	-o output/fpg-accidents	\
	-method mapreduce	\
	-regex '[\ ]'		\
	-k 3	
