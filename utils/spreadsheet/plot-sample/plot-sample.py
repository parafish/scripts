#!/usr/bin/env python
'''
plot mapper-speedup

Input: each line in the format : mapper ideal actual
'''
import sys
import matplotlib.pyplot as plt

if (len(sys.argv) < 2):
	print "command <the label>"
	exit(0)

mapper = []
ideal = []
actual = []

for line in sys.stdin:
	line = line.split()
	mapper.append(int(line[0]))
	ideal.append(float(line[1]))
	actual.append(float(line[2]))


line1 = plt.plot(mapper, ideal, 'b--', label='Linear')
line2 = plt.plot(mapper, actual, 'ro-', label=sys.argv[1])

plt.grid()
plt.legend(loc='upper left')

plt.xlabel('Sample size')
plt.ylabel('Scaleup of sample sizes')

plt.show()
	
