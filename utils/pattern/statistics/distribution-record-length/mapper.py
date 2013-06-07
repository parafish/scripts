#!/usr/bin/env python
'''
emit 
key 	= line length (record length)
value 	= 1
'''

import sys


for line in sys.stdin:
	line = line.strip()
	length = str(len(line.split()))
	print length + '\t' + '1'
