#!/bin/bash

#1)Convert file to vcf in array
inputFile=$1
outputFile=$2

echo "Reformatting $inputFile Header file..."

readarray indexArray < $inputFile
arrLength="${#indexArray[@]}"
maxIndex=$((arrLength-1))

coordArray=()

for((eachIndex=0;eachIndex<arrLength;eachIndex++)) do
      	currRowArray=( ${indexArray[$eachIndex]} )
       	refChr=${currRowArray[9]}
       	refDir=${currRowArray[7]}
       	refStart=${currRowArray[0]}
       	refEnd=${currRowArray[1]}

        qryChr=${currRowArray[10]}
        qryDir=${currRowArray[8]}
        qryStart=${currRowArray[2]}
        qryEnd=${currRowArray[3]}

	refLength=${currRowArray[4]}
	qryLength=${currRowArray[5]}
	percentID=${currRowArray[6]}

        vcfArray+=("$refChr	$refDir	$refStart	$refEnd	$refLength	$qryChr	$qryDir	$qryStart	$qryEnd	$qryLength	$percentID")
done


printf "%s\n" "${vcfArray[@]}" > $outputFile.temp.coord
sort -k1,1 -k3,3n -k4,4n -k6,6n -k8,8n $outputFile.temp.coord > $outputFile.sorted.coord
rm $outputFile.temp.coord
