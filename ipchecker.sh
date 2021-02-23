#!/bin/bash

while read line
do
	url=https://www.abuseipdb.com/check/$line
	#curl writes the output to stderr, so redirect that and also suppress the progress to grep the html
	#sed cleans html tags
	curl --silent  $url 2>&1 | grep "was first reported on" | sed -e 's/<[^>]*>//g'
done<$1
