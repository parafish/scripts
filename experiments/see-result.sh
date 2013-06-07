#!/usr/bin/env bash 

for k in {100..1000..100}
	do
		mahout seqdumper -s /user/s117449/output/fpg-startpagina-support0.5-k${k}-run1/frequentpatterns/part-r-00000	\
			| ~/scripts/experiments/fpg/count-fpg-pattern.py | tail -1
	done
