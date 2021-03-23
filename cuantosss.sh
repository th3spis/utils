#!/bin/bash

#Count files in directiories
#	Current directory if no args
#	Specified directory if specified
#	List all files in folders of the current dir


if [ $# -eq 0 ]
	then
		echo
		echo "There are $(find . -type f | wc -l) files in this directory."
		echo
	else
		if [ $# -eq 1 ]
		 	then
				if [[ "$1" == *list* ]]
				then
				    echo "Pendiente de implementar"
				else
					echo
					echo "There are $(find $1 -type f | wc -l) files in the specified directory."
					echo
				fi
			else
				echo
				echo "ERROR: Wrong number of args"
				echo
		fi		
fi


