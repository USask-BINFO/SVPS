#!/bin/bash

inputFilePath=$1
outputFilePath=$2
REQ_OVERLAP=$3

echo "Writing Duplications to $outputFilePath..."
readarray indexArray < $inputFilePath

# Create array for alignments to identify duplicates
arrLength="${#indexArray[@]}"
maxIndex=$((arrLength-1))

highestEnd=-1
previousEnd=-1
currentStart=0
currentEnd=0
nextStart=0
prevChr=""
refChr=""

dupsArray=()

for((eachIndex=0;eachIndex<(arrLength);eachIndex++)) do #-1
	if [ $(( eachIndex )) -gt 0 ]
	then
		prevRowArray=( ${indexArray[$((eachIndex-1))]} )
		previousEnd=${prevRowArray[3]}
	fi

	currRowArray=( ${indexArray[$eachIndex]} )
	refChr=${currRowArray[0]}

	if [ $eachIndex == 0 ]
    then
        prevChr=${currRowArray[0]}
    fi

	if [ $prevChr != $refChr ]
	then
		highestEnd=-1
		previousEnd=-1
		currentStart=0
		currentEnd=0
	fi

	currentStart=${currRowArray[2]}
	currentEnd=${currRowArray[3]}

	#Start index occurs before last align end, or ends after next align beginning, meaning it's a duplicate
	if [ $((currentStart)) -lt $((highestEnd)) ] 
	then
		#If overlap relates to previous header and is of sufficient length to be an SV then store key info
		if [ $((highestEnd-currentStart)) -ge $((REQ_OVERLAP)) ]
		then
			refChr=${currRowArray[0]}
                        refDirVal=${currRowArray[1]}
			queryChr=${currRowArray[5]}
                        queryDirVal=${currRowArray[6]}
                        dupRefStart=${currRowArray[2]}
		        if [ $(( highestEnd )) -lt ${currRowArray[3]} ]
               		then
                        	dupRefEnd=$highestEnd
               		else
                       		dupRefEnd=${currRowArray[3]}
               		fi
                        dupLength=$((dupRefEnd-dupRefStart))
                        dupQueryStart=${currRowArray[7]}
			if [ ${currRowArray[7]} -lt ${currRowArray[8]} ]
			then
				dupQueryEnd=$((dupQueryStart+dupLength))
			else
				dupQueryEnd=$((dupQueryStart-dupLength))
			fi
            dupsArray+=("$refChr $refDirVal $dupRefStart $dupRefEnd $queryChr $queryDirVal $dupQueryStart $dupQueryEnd $dupLength DUP ${currRowArray[10]}")
		fi
	fi

    if [ $((currentEnd)) -ge $((highestEnd)) ] # Update furthest aligned index to higher value
    then
		highestEnd=$currentEnd
    fi

	prevChr=$refChr
done

#Print the arrays to file
printf "%s\n" "${dupsArray[@]}" > $outputFilePath
