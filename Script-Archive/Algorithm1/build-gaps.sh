#!/bin/bash

svLabel=$1
inputFile=$2
outputFile=$3
svMinSize=$4


echo "Writing $svLabel to $outputFile..."
readarray indexArray < $inputFile

arrLength="${#indexArray[@]}"
maxIndex=$((arrLength-1))
REQ_OVERLAP=$svMinSize
highestEnd=0
currentStart=0
currentEnd=0
prevChr=""
gapsArray=()

for((eachIndex=0;eachIndex<arrLength;eachIndex++)) do
    
	currRowArray=( ${indexArray[$eachIndex]} )
	
	if [ $eachIndex == 0 ]
	then
		prevChr=${currRowArray[0]}
	fi
	
    refChr=${currRowArray[0]}
    refDir=${currRowArray[1]}
    currentStart=${currRowArray[2]}
    currentEnd=${currRowArray[3]}

	if [ $prevChr != $refChr ] # reset counter at each new sequence/chromosome reached in the ref
	then
			highestEnd=0
	fi

    gapStart=$((highestEnd+1))
    gapEnd=$((currentStart-1))
	refChr=$refChr
	qryChr=$refChr # Copies ref info since the qry should not contain the same sequence elsewhere (its a gap)
    qryDir=$refDir # Copies ref info since the qry should not contain the same sequence elsewhere (its a gap)
	
	if [ $svLabel == "DEL" ]
	then
		refStart=$gapStart
		refEnd=$gapEnd
		qryStart=$((gapStart-1))
		qryEnd=$((gapStart-1))
	else
        refStart=$((gapStart-1))
        refEnd=$((gapStart-1))
        qryStart=$gapStart
        qryEnd=$gapEnd
	fi

    gapLength=$((gapEnd-gapStart))
	
	if [ $((gapStart)) -lt $((gapEnd)) ] && [ $gapLength -gt $((REQ_OVERLAP)) ]
    then
		gapsArray+=("$refChr $refDir $refStart $refEnd $qryChr $qryDir $qryStart $qryEnd $((gapLength)) $svLabel")
        highestEnd=$currentEnd
    fi

    if [ $((currentEnd)) -ge $((highestEnd)) ] #update furthest aligned index to largest index
    then
		highestEnd=$currentEnd
    fi
	
	prevChr=$refChr
done

printf "%s\n" "${gapsArray[@]}" > $outputFile
