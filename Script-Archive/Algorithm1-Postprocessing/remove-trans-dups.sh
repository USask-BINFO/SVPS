#!/bin/bash

inputFile=$1
outputFile=$2

echo "Removing DUP entries that were also translocated from $inputFile..."
awk '{if ($1==$5)
     	print $0;
     }' $inputFile > $outputFile
