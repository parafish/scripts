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
	line = line.strip().split('\t', 1)[1]
	pattern = line.split(' ')
	line = ' '.join(sorted(pattern))
	count[line] = count.get(line, 0) + 1
	total += 1
result = sorted(count.iteritems(), key=operator.itemgetter(1), reverse=True)

print "Percent\tCount\t|Pattern"
for line in result:
	print str(line[1]*1.0/total)  + "\t" + str(line[1]) + "\t|" + line[0] 
print "1\t" + str(total)
