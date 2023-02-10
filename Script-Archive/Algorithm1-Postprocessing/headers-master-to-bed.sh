#!/bin/bash

inputFile=$1
outputFilePrefix=$2

echo "Converting $targetChr Header file to $outputFile..."
readarray indexArray < $inputFile
arrLength="${#indexArray[@]}"
maxIndex=$((arrLength-1))

vcfArray=()

for((eachIndex=0;eachIndex<arrLength;eachIndex++)) do
    currRowArray=( ${indexArray[$eachIndex]} )
    refChr=${currRowArray[0]}
    refStart=${currRowArray[2]}
    refEnd=${currRowArray[3]}
	refLength=${currRowArray[4]}
	svType=${currRowArray[9]}

    vcfArray+=("$refChr	$refStart	$refEnd	$svType")
done

printf "%s\n" "${vcfArray[@]}" > $outputFilePrefix.bed
sort -k1,1 -k2,2n -k3,3n -k4,4 $outputFilePrefix.bed > $outputFilePrefix-sorted.bed
