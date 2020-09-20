#!/bin/bash


#    -o /dev/null throws away the usual output
#    --silent throws away the progress meter
#    --head makes a HEAD HTTP request, instead of GET
#    --write-out '%{http_code}\n' prints the required status code
# If too many lines in url-list, better run in background 

while read LINE; do
  curl -o /dev/null --silent --head --write-out "%{http_code} $LINE\n" "$LINE"
done < url-list.txt
