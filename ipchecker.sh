#!/bin/bash

#usage ipchecker.sh /path/file.txt
#outputs stuff only if bad rep found


while read line
do
	url=https://www.abuseipdb.com/check/$line
	#curl writes the output to stderr, so redirect that and also suppress the progress to grep the html
	#sed cleans html tags
	#curl --silent  $url 2>&1 | grep "was first reported on" | sed -e 's/<[^>]*>//g'
	
	match1=$(curl --silent $url | grep "This IP was reported" | sed -e 's/<[^>]*>//g' )
	#Check the 
	if [ ${#match1} -gt 1 ]
	then
		#He tenido que separar las siguientes dos queries porque se hacían de forma asíncrona automáticamente
		#ineficiente de cojones 3 peticiones lo sé, pero tengo prisa
		match2=$(curl --silent $url | grep "distinct source" | sed -e 's/<[^>]*>//g' )
		match3=$(curl --silent $url | grep -E "first reported|most recently reported" | sed -e 's/<[^>]*>//g' )
		echo "$line:"
		echo "$match1"
		echo "$match2"
		echo "$match3"
		echo
	fi
done<$1
