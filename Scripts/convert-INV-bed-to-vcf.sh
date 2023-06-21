#!/bin/bash

INPUT_FILE=$1
OUTPUT_FILE=$2
REF_FILE=$3

echo "Converting $INPUT_FILE BED intervals to VCF format..."

readarray INDEX_ARR < $INPUT_FILE
ARR_LEN="${#INDEX_ARR[@]}"
VCF_ARR=()

INV_COUNT=1
for((EACH_INDEX=0;EACH_INDEX<ARR_LEN;EACH_INDEX++)) do
        CURR_ROW_ARR=( ${INDEX_ARR[$EACH_INDEX]} )

        REF_CHR=${CURR_ROW_ARR[0]}
        REF_START=${CURR_ROW_ARR[1]}
        REF_END=${CURR_ROW_ARR[2]}
        REF_SEQ=`seqret -auto ${REF_FILE}:${REF_CHR}[${REF_START}:${REF_START}] stdout | tail -n+2 | tr -d "\n\r "`
        SV_LEN=$((REF_END-REF_START))
        SV_TYPE="INV"

        VCF_ARR+=("$REF_CHR	$REF_START	${SV_TYPE}.${INV_COUNT}	$REF_SEQ	<$SV_TYPE>	.	PASS	SVTYPE=$SV_TYPE;END=$REF_END;SVLEN=$SV_LEN	GT:DP	./.:40")
        INV_COUNT=$((INV_COUNT+1))
done

printf "%s\n" "${VCF_ARR[@]}" >> $OUTPUT_FILE
