#! /usr/bin/env python
import sys
import json
import argparse

def main(argv):
	parser = argparse.ArgumentParser(description='distribution selector')
	parser.add_argument('-m', help='1,2,3 or 4', type=int, default=1)
	args = parser.parse_args()

	# m = 1, freq
	if args.m is 1:
		for line in sys.stdin:
			items = [int(i) for i in line.strip().split() if i.isdigit()]
			weight = 2**len(items)
			record = [[items, []], weight]
			print json.dumps(record)
	# m = 2, area
	if args.m is 2:
		for line in sys.stdin:
			items = [int(i) for i in line.strip().split() if i.isdigit()]
			weight = len(items) * 2**(len(items)-1)
			record = [[items, []], weight]
			print json.dumps(record)
	# m = 3, disc, things are different here
	if args.m is 3:
		pass
		
	# m = 4, freq2, things are different here
	if args.m is 4:
		for line in sys.stdin:
			d = json.loads(line)
			items = list(set(d[0]) & set(d[1]))
			if items:	# the intersection is not an empty set
				weight = 2**len(items)
				record = [[items, []], weight]
				print json.dumps(record)


if __name__=='__main__':
	main(sys.argv)
