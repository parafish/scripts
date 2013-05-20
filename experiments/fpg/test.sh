#!/usr/bin/env bash

mahout fpg	\
	-i fimi/webdocs.dat	\
	-o output/fpg-webdocs	\
	-method mapreduce	\
	-regex '[\ ]'		\
	-k 1000000	\
	-s 100
