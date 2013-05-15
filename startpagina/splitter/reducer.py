#!/usr/bin/env python
import sys

for line in sys.stdin: 
	key, record = line.strip().split('\t', 1)
	print record
