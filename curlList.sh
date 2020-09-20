#!/bin/bash

#source: https://stackoverflow.com/questions/6136022/script-to-get-the-http-status-code-of-a-list-of-urls (user: Phil, user: estani)
#    -o /dev/null throws away the usual output
#    --silent throws away the progress meter
#    --head makes a HEAD HTTP request, instead of GET
#    --write-out '%{http_code}\n' prints the required status code
# If too many lines in url-list, better run in background 
# Not a bad idea to set a timeout with " --max-time 5.5 " for 5.5 secods, for example

while read LINE; do
  curl -o /dev/null --silent --head --write-out "%{http_code} $LINE\n" "$LINE"
done < url-list.txt


# To extend, we could do it adding parallelism 
# xargs -n1 -P 10 curl -o /dev/null --silent --head --write-out '%{url_effective}: %{http_code}\n' < url.lst
# Example saving specific oputput in csv 
#xargs -n1 -P 10 curl -o /dev/null --silent --head --write-out '%{url_effective};%{http_code};%{time_total};%{time_namelookup};%{time_connect};%{size_download};%{speed_download}\n' < url.lst | tee results.csv
#   -n1: use just one value (from the list) as argument to the curl call
#   -P10: Keep 10 curl processes alive at any time (i.e. 10 parallel connections)
