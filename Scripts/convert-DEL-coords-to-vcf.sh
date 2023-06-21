#!/bin/bash

INPUT_FILE=$1
OUTPUT_FILE=$2
REF_FILE=$3
#QRY_FILE=$4

echo "Converting $INPUT_FILE DEL Coord entries to VCF format..."

readarray INDEX_ARR < $INPUT_FILE
ARR_LEN="${#INDEX_ARR[@]}"
VCF_ARR=()

DEL_COUNT=1
for((EACH_INDEX=0;EACH_INDEX<ARR_LEN;EACH_INDEX++)) do
        CURR_ROW_ARR=( ${INDEX_ARR[$EACH_INDEX]} )

        REF_CHR=${CURR_ROW_ARR[0]}
        REF_DIR=${CURR_ROW_ARR[1]}
        REF_START=${CURR_ROW_ARR[2]}
        REF_END=${CURR_ROW_ARR[3]}
        REF_SEQ=`seqret -auto ${REF_FILE}:${REF_CHR}[${REF_START}:${REF_END}] stdout | tail -n+2 | tr -d "\n\r "`
        QRY_CHR=${CURR_ROW_ARR[4]}
        QRY_DIR=${CURR_ROW_ARR[5]}
        QRY_START=${CURR_ROW_ARR[6]}
        QRY_END=${CURR_ROW_ARR[7]}
        ALT_SEQ=`echo $REF_SEQ | cut -c1`

        SV_LEN=${CURR_ROW_ARR[8]}
        SV_TYPE=${CURR_ROW_ARR[9]}

        VCF_ARR+=("$REF_CHR	$REF_START	${SV_TYPE}.${DEL_COUNT}	$REF_SEQ	$ALT_SEQ	.	PASS	SVTYPE=$SV_TYPE;END=$REF_END;QRYCHR=$QRY_CHR;QRYSTART=$QRY_START;QRYEND=$QRY_END;SVLEN=-$SV_LEN	GT:DP	./.:40")
        DEL_COUNT=$((DEL_COUNT+1))
done

printf "%s\n" "${VCF_ARR[@]}" >> $OUTPUT_FILE
