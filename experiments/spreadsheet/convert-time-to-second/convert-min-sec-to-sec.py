#!/usr/bin/env python
'''
convert the time from hadoop's output to second-based.
e.g. 
1mins, 20sec	to		80
'''
import sys

for line in sys.stdin:
	durations = line.strip().replace('hrs,', '').replace('mins,', '').replace('sec', '').split('\t')
	result = ""
	for d in durations:
		
		compound = d.strip().split()
		if (len(compound) == 2):	
			mins, sec = compound
			result += str( int(mins) * 60 + int(sec) ) + '\t'
		else:
			hrs, mins, sec = compound
			result += str( (int(hrs) * 60 + int(mins)) * 60 + int(sec)) + '\t'
	print result.strip()
		
