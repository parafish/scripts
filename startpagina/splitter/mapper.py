#!/usr/bin/env python
''' 
parse the raw data of site 470072 to structured:
<key=value> pairs, where key is the field name
'''
import sys
import os
import random

frac = sys.argv[1]

for line in sys.stdin:
	if random.random() < float(frac):
		print "0\t" + line.strip()
	else:	
		print "1\t" + line.strip()
