#!/usr/bin/env bash

for i in {1..10} 
	do 
		echo "mapper=100, sample=100, run=${i}" 
		./scale-freq-sample100-mapper-larger-than-80.sh 200
	done

