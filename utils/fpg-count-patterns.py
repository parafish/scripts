#!/usr/bin/env python
"""
input: 	the result from the PFP, i.e. mahout seqdumper -i <path-to-the-result>
output:	the statistics of patterns
"""

import sys
import json

patterns = dict() 
allpatterns = set()
minsupp = sys.maxint
maxsupp = 0

for line in sys.stdin:
	if line.startswith('Key: '):
		line = line.strip().replace('\t', '').replace('Key: ', '').replace('Value: ', '')	
		key, value = line.split(': ', 1)
		value = value[1:-1]
		pairs = value.split('), (')
		item_patterns = dict()
		for p in pairs:
			pattern, count = p.rsplit(',', 1)
			pattern = pattern[1:-1]
			ps = pattern.split(', ')
			item_patterns[json.dumps(sorted(ps))] = int(count)
		patterns[key] = item_patterns		

print "Item\tPttrns\tMinSupp\tMaxSupp"
print "--------------------------------------------------"
for k in sorted(patterns.keys()):
	v = patterns[k]
	line = ""
	line += k + '\t'
	line += str(len(v))	+ '\t'
	allpatterns = allpatterns.union(set(v.keys()))
	mi = min(v.values())
	ma = max(v.values())
	minsupp = min(mi, minsupp)
	maxsupp = max(ma, maxsupp)
	line += str(mi) + '\t'
	line += str(ma)
	print line

print "--------------------------------------------------"
lastline = str(len(patterns)) + '\t' + str(len(allpatterns)) + '\t' + str(minsupp) + '\t' + str(maxsupp)
print lastline
