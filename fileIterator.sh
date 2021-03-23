#!/bin/bash

#Do something with every file ($REPLY) in current dir and subdirs

while IFS= read -r -d '' -u 9
do
    echo $REPLY #do whatever
done 9< <( find . -type f -print0 )

#can change "." with any path/directory you want to iterate
