#!/usr/bin/env python
import sys

for line in sys.stdin: 
	try:
		key, record = line.strip().split('\t', 1)
		print record
	except ValueError:
		print line.strip().rstrip()
		print >> sys.stderr, 'Error: ' + line
		print >> sys.stderr, "reporter:counter:reducer,malformed,1"
