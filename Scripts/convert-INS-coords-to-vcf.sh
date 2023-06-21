#!/bin/bash

INPUT_FILE=$1
OUTPUT_FILE=$2
QRY_FILE=$3

echo "Converting $INPUT_FILE INS Coords to VCF format..."

readarray INDEX_ARR < $INPUT_FILE
ARR_LEN="${#INDEX_ARR[@]}"
VCF_ARR=()

INS_COUNT=1
for((EACH_INDEX=0;EACH_INDEX<ARR_LEN;EACH_INDEX++)) do
        CURR_ROW_ARR=( ${INDEX_ARR[$EACH_INDEX]} )

        REF_CHR=${CURR_ROW_ARR[0]}
        REF_DIR=${CURR_ROW_ARR[1]}
        REF_START=${CURR_ROW_ARR[2]}
        REF_END=${CURR_ROW_ARR[3]}

        QRY_CHR=${CURR_ROW_ARR[4]}
        QRY_DIR=${CURR_ROW_ARR[5]}
        QRY_START=${CURR_ROW_ARR[6]}
        QRY_END=${CURR_ROW_ARR[7]}

        ALT_SEQ=`seqret -auto ${QRY_FILE}:${QRY_CHR}[${QRY_START}:${QRY_END}] stdout | tail -n+2 | tr -d "\n\r "`
        REF_SEQ=`echo $ALT_SEQ | cut -c1`

        SV_LEN=${CURR_ROW_ARR[8]}
        SV_TYPE=${CURR_ROW_ARR[9]}

	#echo "$REF_CHR     $QRY_START      ${SV_TYPE}.${INS_COUNT} $REF_SEQ        $ALT_SEQ        .       PASS    SVTYPE=$SV_TYPE;END=$REF_END;QRYCHR=$REF_CHR;QRYSTART=$REF_START;QRYEND=$QRY_END;SVLEN=$SV_LEN  GT:DP   ./.:40"
        VCF_ARR+=("$REF_CHR	$QRY_START	${SV_TYPE}.${INS_COUNT}	$REF_SEQ	$ALT_SEQ	.	PASS	SVTYPE=$SV_TYPE;END=$REF_END;QRYCHR=$REF_CHR;QRYSTART=$REF_START;QRYEND=$QRY_END;SVLEN=$SV_LEN	GT:DP	./.:40")
        INS_COUNT=$((INS_COUNT+1))
done

printf "%s\n" "${VCF_ARR[@]}" >> $OUTPUT_FILE
