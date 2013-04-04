import random

def sample_uniform(population):
	pass

def sample_pattern_uniform(population):
	pattern = []
	while not pattern:
		pattern = filter(lambda x: bool(random.getrandbits(1)), population)
	return pattern

def sample_pattern_area(population):
	ids = [[i, i] for i in xrange(1, len(population)+1)]
	k = sample_weight(ids, n=1).next()
	return random.sample(population, k)

def sample_weight(population, totalweight = 0, n = 10):
	if totalweight  is 0:
		totalweight = sum(r[1] for r in population)
	
	i = 0
	v, w = population[0]
	while n:
		x = totalweight * (1-random.random()**(1.0/n))
		totalweight -= x
		while x > w:
			x -= w
			i += 1
			v, w = population[i]
		w -= x
		yield v
		n -= 1		
	
def test_sample_weight():
	records = [['apple', 1], ['perl', 10], ['banana', 89]]
	n_samples = 1000000
	
	sampled_items = sample_weight(records, 100, n_samples)

	result = {}
	for item in sampled_items:
		result[item] = result.get(item, 0) +1 

	for key, value in result.items():
		print key, ': ', 100 * float(value) / n_samples

def test_sample_pattern_uniform():
	items = [1,2,3,4,5]
	n_samples = 1000000

	sampled_items = []
	for i in xrange(n_samples):
		sampled_items.append(sample_pattern_uniform(items))
	
	result = {}
	import json
	for item in sampled_items:
		key = json.dumps(item)
		result[key] = result.get(key, 0) + 1

	for key, value in result.items():
		print key, ': ', 100 * float(value) / n_samples

if __name__=='__main__':	
	test_sample_weight()
	'''items = [1,2,3,4,5]
	print sample_pattern_area(items)'''
