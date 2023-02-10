#!/bin/bash

refGenomeFilePath=$1
qryGenomeFilePath=$2
inputFile=$3
verificationDirPath=$4
svType=$5

echo "Starting Duplication Alignments Verification..."
outputFile="${verificationDirPath}/${svType}-SimilarityResults.out"
refTempFile="${verificationDirPath}/ref${svType}Temp.fasta"
qryTempFile="${verificationDirPath}/qry${svType}Temp.fasta"
needleTempFile="${verificationDirPath}/temp${svType}.needle"

rm $outputFile # delete existing file if it exists as script appends later

readarray indexArray < $inputFile
arrLength="${#indexArray[@]}"
maxIndex=$((arrLength-1))

for((eachIndex=0;eachIndex<(arrLength-1);eachIndex++)) do
    reverseQry=false
    currentEntry=( ${indexArray[eachIndex]} ) #convert current entry string to its own array

    echo ${indexArray[eachIndex]}

    refChr=${currentEntry[0]}
    refStart=${currentEntry[2]}
    refEnd=${currentEntry[3]}

    refUSA="$refChr[$refStart:$refEnd]"

    qryChr=${currentEntry[4]}
    qryStart=${currentEntry[6]}
    qryEnd=${currentEntry[7]}

	qryUSA="$qryChr[$qryStart:$qryEnd]"
    
    if [ $((qryStart)) -gt $((qryEnd)) ]
    then
        reverseQry=true
    fi

    if $reverseQry
    then
        qryUSA="$qryChr[$qryEnd:$qryStart:r]"
    fi

	svLen=${currentEntry[7]}
    if [ $((svLen)) -lt 0 ]
    then
		svLen=$((svLen * -1))
    fi

    seqret $refGenomeFilePath:$refUSA $refTempFile
    seqret $qryGenomeFilePath:$qryUSA $qryTempFile

    if [ $((svLen)) -le 24000 ]
    then
        needle -auto -asequence $refTempFile -bsequence $qryTempFile -outfile $needleTempFile
    else
        stretcher -auto -asequence $refTempFile -bsequence $qryTempFile -outfile $needleTempFile
    fi

	needleResult=`grep "# Similarity" $needleTempFile` #store grep result to a variable using back ticks
	reportEntry="${indexArray[eachIndex]} $needleResult" #append needle resul to current entry
	reportEntry=${reportEntry//$'\n'/} #Remove newline from string using 'Parameter expansion' in bash
    echo $reportEntry >> $outputFile
done

sed -i 's/[()]//g' $outputFile
awk '{ sum += $4 } END { if (NR > 0) print "Average: " sum / NR }' $outputFile >> $outputFile

echo "Verification of $refChromo complete..."
rm $refTempFile $qryTempFile $needleTempFile # do clean up of temp files

echo "$svType Alignment Verfication Complete!.."
