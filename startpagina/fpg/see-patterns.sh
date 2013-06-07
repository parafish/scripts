#!/usr/bin/env bash 
set -e

i=1
for THRESHOLD in 0.04 0.03 0.02 0.01 0.001 0.0001 0.00001 0.000001
do 
		$MAHOUT_HOME/bin/mahout	seqdumper -i output/fpg-startpagina-support${THRESHOLD}-run1/frequentpatterns/part-r-00000	\
			| ~/scripts/experiments/fpg/count-fpg-pattern.py | tail -1
done
