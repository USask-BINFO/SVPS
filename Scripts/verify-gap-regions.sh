#!/bin/bash

#ALIGN_FILE=$1
#GAPS_FILE=$2
GAP_COORDS=$1
DEPTH_FILE=$2 #$3
#GAP_DEPTH_OUT=$4
#GENOME_FILE=$5
#OUTPUT_DIR=$6
OUTPUT_FILE=$3
SV_TYPE=$4 #$7


echo "Starting $SV_TYPE Gap Verification!.."
#bedtools depth -a -b $GAPS_FILE -o $OUTPUT_DIR/GapRegions.depth $ALIGN_FILE

rm $OUTPUT_FILE # delete existing file if it exists as script appends later

readarray COORDS_ARR < $GAP_COORDS
ARR_LEN="${#COORDS_ARR[@]}"
LAST_CHR=""
AVG_DEPTH=""

for((EACH_INDEX=0;EACH_INDEX<ARR_LEN;EACH_INDEX++)) do
    CURR_ENTRY=( ${COORDS_ARR[EACH_INDEX]} ) #convert current entry string to its own array

    echo ${COORDS_ARR[EACH_INDEX]}

    REF_CHR=${CURR_ENTRY[0]}
    REF_START=${CURR_ENTRY[2]}
    REF_END=${CURR_ENTRY[3]}

    RESULT=`awk -v START=$REF_START -v STOP=$REF_END' { if ($2 > START && $2 < STOP) sum += $3 } END { if (NR > 0) print 100 * sum / NR }' ${DEPTH_FILE}.${REF_CHR}`
    if [ $REF_CHR != $LAST_CHR ]
    then
	AVG_DEPTH=`awk ' { sum += $3 } END { if (NR > 0) print 100 * sum / NR }' ${DEPTH_FILE}.${REF_CHR}`
    fi

    if [ $RESULT -le $AVG_DEPTH ]
    then
	echo "$CURR_ENTRY\t1" >> OUTPUT_FILE
    else
	echo "$CURR_ENTRY\t0" >> OUTPUT_FILE
    fi 
done

#MEAN_DEPTH=`./Scripts/calculate-mean-alignment-depth.sh $DEPTH_IN_FILE`
##STDEV_DEPTH=`./Scripts/calculate-stdev-alignment-depth.sh $DEPTH_IN_FILE`
#awk -v AVGDEPTH="$MEAN_DEPTH" '{ if ( $3 < AVGDEPTH ) result="1"; else result="0"; print $0 "\t" result; }' $OUTPUT_DIR/GapRegions.depth > $GAP_DEPTH_OUT
#awk '{ sum += $3 } END { if (NR > 0) print "Average: " 100 * sum / NR }' $GAP_DEPTH_OUT >> $GAP_DEPTH_OUT







echo "$SV_TYPE Gap Verification Complete!.."
