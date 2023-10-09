#!/bin/bash

REF_GENOME=$1
QRY_GENOME=$2
INPUT_FILE=$3
OUTPUT_DIR=$4
SV_TYPE=$5

echo "Starting $SV_TYPE Alignments Verification..."
OUTPUT_FILE="${OUTPUT_DIR}/${SV_TYPE}-SimilarityResults.out"
REF_TEMP="${OUTPUT_DIR}/ref${SV_TYPE}Temp.fasta"
QRY_TEMP="${OUTPUT_DIR}/qry${SV_TYPE}Temp.fasta"
NEEDLE_TEMP="${OUTPUT_DIR}/temp${SV_TYPE}.needle"

rm $OUTPUT_FILE # delete existing file if it exists as script appends later

readarray INDEX_ARR < $INPUT_FILE
ARR_LEN="${#INDEX_ARR[@]}"

for((EACH_INDEX=0;EACH_INDEX<ARR_LEN;EACH_INDEX++)) do
    REV_QRY=false
    CURR_ENTRY=( ${INDEX_ARR[EACH_INDEX]} ) #convert current entry string to its own array

    echo ${INDEX_ARR[EACH_INDEX]}

    REF_CHR=${CURR_ENTRY[0]}
    REF_START=${CURR_ENTRY[2]}
    REF_END=${CURR_ENTRY[3]}

    REF_USA="$REF_CHR[$REF_START:$REF_END]"

    if [ $SV_TYPE = "DUP" ]; then #DUP coords has less columns so pick the correct ones accordingly
        QRY_CHR=${CURR_ENTRY[4]}
        QRY_START=${CURR_ENTRY[6]}
        QRY_END=${CURR_ENTRY[7]}
    else # INV and TRANS reflect all original columns since they were found with AWK, make sure correct ones are selected
        QRY_CHR=${CURR_ENTRY[5]}
        QRY_START=${CURR_ENTRY[7]}
        QRY_END=${CURR_ENTRY[8]}
    fi

    QRY_USA="$QRY_CHR[$QRY_START:$QRY_END]"

    if [ $((QRY_START)) -gt $((QRY_END)) ]
    then
        REV_QRY="true"
    fi

    if [ $REV_QRY = "true" ]
    then
        QRY_USA="$QRY_CHR[$QRY_END:$QRY_START:r]"
    else
        QRY_USA="$QRY_CHR[$QRY_START:$QRY_END]"
    fi

    SV_LEN=${CURR_ENTRY[7]}
    if [ $((SV_LEN)) -lt 0 ]
    then
                SV_LEN=$((SV_LEN * -1))
    fi

    seqret -auto $REF_GENOME:$REF_USA $REF_TEMP
    seqret -auto $QRY_GENOME:$QRY_USA $QRY_TEMP

    if [ $((SV_LEN)) -le 24000 ]
    then
        needle -auto -asequence $REF_TEMP -bsequence $QRY_TEMP -outfile $NEEDLE_TEMP
    else
        stretcher -auto -asequence $REF_TEMP -bsequence $QRY_TEMP -outfile $NEEDLE_TEMP
    fi

        #NEEDLE_RESULT=`grep "# Similarity" $NEEDLE_TEMP` #store grep result to a variable
	NEEDLE_RESULT=`grep "# Identity" $NEEDLE_TEMP` #store grep result to a variable
        REP_ENTRY="${INDEX_ARR[EACH_INDEX]} $NEEDLE_RESULT" #append needle resul to current entry
        REP_ENTRY=${REP_ENTRY//$'\n'/} #Remove newline from string using parameter expansion in bash
    echo $REP_ENTRY >> $OUTPUT_FILE
done

sed -i 's/[()]//g' $OUTPUT_FILE
#Determine which column is appropriate to sum for average based on SV_TYPE as results can have diff # of columns
if [ $SV_TYPE = "DUP" ];then
	awk '{ sum += $15 } END { if (NR > 0) print "Average: " sum / NR }' $OUTPUT_FILE >> $OUTPUT_FILE
else
	awk '{ sum += $16 } END { if (NR > 0) print "Average: " sum / NR }' $OUTPUT_FILE >> $OUTPUT_FILE
fi

rm $REF_TEMP $QRY_TEMP $NEEDLE_TEMP # do clean up of temp files

echo "$SV_TYPE Alignment Verfication Complete!.."
