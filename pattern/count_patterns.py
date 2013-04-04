#!/usr/bin/env python
'''
count the sampled pattens
'''
import sys
import os
import operator


count = {}
total = 0
for line in sys.stdin:
	line = line.rstrip()
	count[line] = count.get(line, 0) + 1
	total += 1
result = sorted(count.iteritems(), key=operator.itemgetter(1), reverse=True)

print "Pattern\tCount\tPercentage"
for line in result:
	print line[0] + "\t" + str(line[1]) + "\t" +str(line[1]*1.0/total)
print "Total\t" + str(total) + "\t1"
