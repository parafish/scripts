#!/usr/bin/env python
''' 
parse the raw data of site 470072 to structured:
<key=value> pairs, where key is the field name
'''
import sys
import os
import random

for line in sys.stdin:
	line = line.strip().split(' ', 3)[-1]
	print line
