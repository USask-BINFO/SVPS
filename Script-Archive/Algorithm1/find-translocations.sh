#!/bin/bash

inputFilePath=$1
outputFilePath=$2

echo "Writing Translocations to $outputFilePath..."
awk '{if ($1!=$6)
	print $0 " " "TRANS";
}' $inputFilePath > $outputFilePath

