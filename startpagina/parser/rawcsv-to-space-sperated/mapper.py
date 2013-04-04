#!/usr/bin/env python
''' 
parse the raw data of site 470072 to structured:
<key=value> pairs, where key is the field name
'''
import sys
import os
import httpagentparser
import urlparse

for line in sys.stdin:
	filepath = os.environ.get('map_input_file', None)
	if filepath:
		date = os.path.split(filepath)[-1]
	else:
		date = None
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
	qsl = urlparse.parse_qsl(line[2])
	for key, value in qsl:
		record += "query." + key + "=" + value + " "
	
	# parse the user-agent
	try:
		agent = httpagentparser.detect(line[4])
		for k, v in agent.items():
			record += 'agent.' + k + '=' + v['name'].replace(' ', '+') + " "
	except IndexError:
		sys.stderr.write("reporter:counter:field.agent,malware,1")
		sys.stderr.write("cannot parse user-agent: " + line[4] + "\n")
	
	print record.rstrip()
