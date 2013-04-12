import random

nlines = 100000
reclen = 5
itemes = 100

for i in xrange(nlines):
	record = ""
	for j in xrange(reclen):
		record += str(random.randint(10, 99)) + " "
	print record.strip()
