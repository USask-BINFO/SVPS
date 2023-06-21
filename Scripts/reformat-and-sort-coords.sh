#!/bin/bash

#1)Convert file to vcf in array
INPUT_FILE=$1
OUTPUT_FILE=$2

echo "Reformatting $INPUT_FILE Header file..."

readarray INDEX_ARRAY < $INPUT_FILE
ARR_LEN="${#INDEX_ARRAY[@]}"

#echo ${INDEX_ARRAY[@]}
COORDS_ARRAY=()

for((EACH_INDEX=0;EACH_INDEX<ARR_LEN;EACH_INDEX++)); do
        CURR_ROW_ARRAY=( ${INDEX_ARRAY[$EACH_INDEX]} )
	REF_CHR=${CURR_ROW_ARRAY[13]} #9
        REF_DIR=${CURR_ROW_ARRAY[11]} #7
        REF_START=${CURR_ROW_ARRAY[0]}
        REF_END=${CURR_ROW_ARRAY[1]}

        QRY_CHR=${CURR_ROW_ARRAY[14]} #10
        QRY_DIR=${CURR_ROW_ARRAY[12]} #8
        QRY_START=${CURR_ROW_ARRAY[2]}
        QRY_END=${CURR_ROW_ARRAY[3]}

        REF_LEN=${CURR_ROW_ARRAY[4]}
        QRY_LEN=${CURR_ROW_ARRAY[5]}
        PERCENT_ID=${CURR_ROW_ARRAY[6]}

        COORDS_ARRAY+=("$REF_CHR	$REF_DIR	$REF_START	$REF_END	$REF_LEN	$QRY_CHR	$QRY_DIR	$QRY_START	$QRY_END	$QRY_LEN	$PERCENT_ID")
done

#echo "${COORDS_ARRAY[@]}"
printf "%s\n" "${COORDS_ARRAY[@]}" > $OUTPUT_FILE.temp
sort -k1,1 -k3,3n -k4,4n -k6,6n -k8,8n $OUTPUT_FILE.temp > $OUTPUT_FILE
rm $OUTPUT_FILE.temp
