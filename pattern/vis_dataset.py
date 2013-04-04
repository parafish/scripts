#!/usr/bin/env python

import sys
import os
import collections
from pylab import *


count = collections.OrderedDict() 
nlines = 0
total = 0

for line in sys.stdin:
	nlines += 1
	length = len(line.strip().split())
	total += length
	count[length] = count.get(length, 0) +1

x = []
y = []
for k in sorted(count.keys()):
	x.append(k)
	y.append(count[k])
plot(x, y)

print "#trans: ", nlines
print "Avg.len: ", total*1.0/nlines
print "Minimum length: ", max(count.keys())
print "maximum length: ", min(count.keys())

show()
