#!/usr/bin/env python

import sys

linecounter = 0
result = ''
for line in sys.stdin:
	result += str(int(line)/1000) + '\t'
	linecounter += 1
	if (linecounter % 3 ==0 ):
		result = result.rstrip()
		print result
		result = '' 

