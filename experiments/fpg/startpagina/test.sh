#!/usr/bin/env bash

mahout fpg	\
	-i startpagina/startpagina-parsed-10	\
	-o startpagina/output/fpg	\
	-method mapreduce	\
	-regex '[\ ]'	
