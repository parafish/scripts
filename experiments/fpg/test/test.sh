#!/usr/bin/env bash

mahout fpg	\
	-i fimi/test.dat	\
	-o output/fpg-test	\
	-method mapreduce	\
	-regex '\ '		
