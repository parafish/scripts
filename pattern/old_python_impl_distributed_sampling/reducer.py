#! /usr/bin/env python
import sys
import json
import argparse
import sampler

def main(argv):
	parser = argparse.ArgumentParser(description="interestingness")
	parser.add_argument('-m', help="1,2,3 or 4", type=int, default=1)
	parser.add_argument('-k', help='num of samples', type=int, default=10)
	args = parser.parse_args()

	# collect all the records, and weights
	records = []
	totalweight = 0
	for line in sys.stdin:
		record = json.loads(line)
		totalweight += record[1]
		records.append(record)
	
	# step 1. sample one element from the records
	sampled_records = sampler.sample_weight(records, totalweight, n=args.k)

	# step 2. sample one pattern from the data
	pattern_samplers = {
							1 : sampler.sample_pattern_uniform,
							2 : sampler.sample_pattern_area,
							4 : sampler.sample_pattern_uniform
						}
	for r in sampled_records:
		print pattern_samplers[args.m](r[0])

if __name__=='__main__':
	main(sys.argv)
