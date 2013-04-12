#!/usr/bin/env python

import sys
import os
import collections
from pylab import *

count = collections.OrderedDict() 
nlines = 0
total = 0

for line in sys.stdin:
	length, c = line.split()
	c = int(c)
	count[length] = c
	nlines += c
	total += int(length) * c

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
