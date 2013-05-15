#!/usr/bin/env python
''' 
parse the raw data of site 470072 to structured:
<key=value> pairs, where key is the field name
'''
import sys
import os
import httpagentparser
import urlparse

if (len(sys.argv) > 1):
	day = sys.argv[1]
else:
	day = ''
sys.stderr.write("selected day = " + day)

count = 0L
for line in sys.stdin:
	filepath = os.environ.get('map_input_file', None)
	if filepath:
		date = os.path.split(filepath)[-1]
		if day not in filepath:		# skip this record, if 'day' is specified
			continue
	else:
		date = None
		filepath = ''

	line = line.split()
	record = ""
	if date:
		record += 'date.year=' + date[0:4] + " "
		record += 'date.month=' + date[4:6] + " "
		record += 'date.day=' + date[6:8] + " "
	record += 'time=' + line[0] + " "
	record += 'xiti=' + line[1] + " "
	record += 'ip=' + line[3] + " "
	record += 'website='+line[5] + " "

	# parse the querystring
	querystring = line[2].strip().strip('&')
	qsl = querystring.split('&')
	for p in qsl:
		record += "query." + p + " "
	'''
	qsl = urlparse.parse_qsl(line[2])
	for key, value in qsl:
		record += "query." + key + "=" + value + " "
	'''
	
	# parse the user-agent
	try:
		agent = httpagentparser.detect(line[4])
		for k, v in agent.items():
			record += 'agent.' + k + '=' + v['name'].replace(' ', '+') + " "
	except IndexError:
		sys.stderr.write("reporter:counter:field.agent,malware,1")
		sys.stderr.write("cannot parse user-agent: " + line[4] + "\n")
	
	record = filepath + '&' + str(count) + '\t' + record.strip()
	print record
	count += 1
