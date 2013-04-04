#! /usr/bin/env python
import sys
import json
import argparse

def main(argv):
	for line in sys.stdin:
		items = [int(i) for i in line.strip().split() if i.isdigit()]
		record = items
		print json.dumps(record)

if __name__=='__main__':
	main(sys.argv)
