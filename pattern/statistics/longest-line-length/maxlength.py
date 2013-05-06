#!/usr/bin/env python
import sys

maxlength = 0
for line in sys.stdin:
	length = len(line.strip())
	if length > maxlength:
		maxlength = length

print "max length: " + str(maxlength)
