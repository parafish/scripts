#! /usr/bin/env python
import sys
import json
import itertools

def main(argv):
	# collect all the records, and weights
	records = []
	totalweight = 0
	for line in sys.stdin:
		record = json.loads(line)
		totalweight += record[1]
		records.append(record)
	
	product = itertools.product(records, repeat=2) 
	for p in product:
		print json.dumps(p)

if __name__=='__main__':
	main(sys.argv)
