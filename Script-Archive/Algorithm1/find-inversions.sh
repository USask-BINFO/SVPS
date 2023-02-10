#!/bin/bash

inputFilePath=$1
outputFilePath=$2

echo "Writing $targetChr inversions to $outputFilePath..."
awk '{if ($7==-1 && $1==$6)
	print $0 " "  "INV";
}' $inputFilePath > $outputFilePath
