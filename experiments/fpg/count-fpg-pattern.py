#!/usr/bin/env python

import sys
import json
import collections

patterns = collections.OrderedDict()
allpatterns = set()
minsupp = sys.maxint
maxsupp = 0

for line in sys.stdin:
	if line.startswith('Key: '):
		line = line.strip().replace('Key: ', '').replace('Value: ', '')
		line = line.replace('(', '[').replace(')', ']')
		key, value = line.split(': ')
		p = json.loads('[' + value+ ']')
		item_patterns = dict()
		for pair in p:
			item_patterns[json.dumps(sorted(pair[0]))] = int(pair[1])
		patterns[key] = item_patterns		

print "Item\tPttrns\tMinSupp\tMaxSupp"
print "--------------------------------------------------"
for k, v in patterns.items():
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
