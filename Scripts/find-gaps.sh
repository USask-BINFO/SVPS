#!/bin/bash

SV_LABEL="DEL" #$1
INPUT_FILE=$2
OUTPUT_FILE=$3
SV_MIN_SIZE=$4

echo "Writing $SV_LABEL to $OUTPUT_FILE..."
readarray INDEX_ARRAY < $INPUT_FILE

ARR_LEN="${#INDEX_ARRAY[@]}"
REQ_OVERLAP=$SV_MIN_SIZE
HIGHEST_END=0
QRY_INDEX_FOR_HIGHEST=0
CURR_START=0
CURR_END=0
PREV_CHR=""
GAPS_ARR=()

for((EACH_INDEX=0;EACH_INDEX<ARR_LEN;EACH_INDEX++)) do

    CURR_ROW_ARRAY=( ${INDEX_ARRAY[$EACH_INDEX]} )

    if [ $EACH_INDEX == 0 ]
    then
        PREV_CHR=${CURR_ROW_ARRAY[0]}
    fi

    REF_CHR=${CURR_ROW_ARRAY[0]}
    REF_DIR=${CURR_ROW_ARRAY[1]}
    CURR_START=${CURR_ROW_ARRAY[2]}
    CURR_END=${CURR_ROW_ARRAY[3]}
    QRY_START=${CURR_ROW_ARRAY[7]}
    QRY_END=${CURR_ROW_ARRAY[8]}

    if [ $PREV_CHR != $REF_CHR ] # reset counter at each new sequence/chromosome reached in the ref
    then
        HIGHEST_END=0
    fi

    GAP_START=$((HIGHEST_END+1))
    GAP_END=$((CURR_START-1))
    REF_CHR=$REF_CHR
    QRY_CHR=$REF_CHR # Copies ref info since the qry should not contain the same sequence elsewhere (its a gap)
    QRY_DIR=$REF_DIR # Copies ref info since the qry should not contain the same sequence elsewhere (its a gap)

    #if [ $SV_LABEL == "DEL" ]
    #then
        REF_START=$GAP_START
        REF_END=$GAP_END
        QRY_START=$QRY_START #$QRY_INDEX_FOR_HIGHEST
        QRY_END=$QRY_START #$QRY_INDEX_FOR_HIGHEST
    #else
    #    REF_START=$QRY_INDEX_FOR_HIGHEST
    #    REF_END=$QRY_INDEX_FOR_HIGHEST
    #    QRY_START=$GAP_START
    #    QRY_END=$GAP_END
    #fi

    GAP_LEN=$((GAP_END-GAP_START))

    if [ $((GAP_START)) -lt $((GAP_END)) ] && [ $GAP_LEN -gt $((REQ_OVERLAP)) ]
    then
        GAPS_ARR+=("$REF_CHR $REF_DIR $REF_START $REF_END $QRY_CHR $QRY_DIR $QRY_START $QRY_END $((GAP_LEN)) $SV_LABEL")
        HIGHEST_END=$CURR_END
	QRY_INDEX_FOR_HIGHEST=$QRY_END
    fi

    if [ $((CURR_END)) -ge $((HIGHEST_END)) ] #update furthest aligned index to largest index
    then
        HIGHEST_END=$CURR_END
	QRY_INDEX_FOR_HIGHEST=$QRY_END
    fi

    PREV_CHR=$REF_CHR
done

printf "%s\n" "${GAPS_ARR[@]}" > $OUTPUT_FILE
