#!/bin/bash

#removes results file if it already exists
rm common_strings.txt

#take every file in current folder and output its strings in separate files inside tmp/
for i in *; do
	name="strings_$i.txt"
	strings $i > $name
	#sort the strings
	sort -u $name > tmp.txt
	rm $name
	mv tmp.txt $name
done

#delete strings file for this script
rm strings_commonStringer.sh.txt

mkdir tmp
mv strings_* tmp/
cd tmp

#compare the string_ files with each other looking for common strings 
thisfile="commonStringer.sh"
act=0
for i in *; do
	echo ""
	echo "comparing $name and $i"
	#skip this script file for the comparation
	if [[ $i == $thisfile  ]] ; then
		continue
	fi
	tmpname="tmp_$act.txt"
	comm -12 $name $i > aux.txt
	name=$tmpname
	cat aux.txt
	mv aux.txt $name
	act=$(($act + 1))
done

mv $name ../common_strings.txt
cd ..
rm -r tmp/
