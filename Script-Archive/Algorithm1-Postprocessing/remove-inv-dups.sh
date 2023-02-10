#!/bin/bash

inputFile=$1
outputFile=$2

echo "Removing inverted DUP entries from to $inputFile..."
awk '{if ($6==1)
     	print $0;
     }' $inputFile > $outputFile
