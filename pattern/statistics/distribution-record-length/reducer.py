#!/usr/bin/env python
'''
aggregates the record length
'''
import sys

current_length = None
current_count = 0
length = None

for line in sys.stdin:
	line = line.strip()
	length, count = line.split('\t', 1)
	try:
		count = int(count)
	except ValueError:
		print >> sys.stderr, "reporter:counter:reducer,valueerror,1"
		continue
	
	if current_length == length:
		current_count += count
	else:
		if current_length:
			print current_length + '\t' + str(current_count)
		current_length = length
		current_count = count

if current_length == length:
	print current_length + '\t' + str(current_count)
	
