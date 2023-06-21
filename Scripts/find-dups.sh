#!/bin/bash

INPUT_FILE=$1
OUTPUT_FILE=$2
REQ_OVERLAP=$3

echo "Writing Duplications to $OUTPUT_FILE..."
readarray INDEX_ARR < $INPUT_FILE

# Create array for alignments to identify duplicates
ARR_LEN="${#INDEX_ARR[@]}"

HIGHEST_END=-1
PREV_END=-1
CURR_START=0
CURR_END=0
NEXT_START=0
PREV_CHR=""
REF_CHR=""

DUPS_ARR=()

for((EACH_INDEX=0;EACH_INDEX<ARR_LEN;EACH_INDEX++)) do #-1
        if [ $(( EACH_INDEX )) -gt 0 ]
        then
                PREV_ROW_ARR=( ${INDEX_ARR[$((EACH_INDEX-1))]} )
                PREV_END=${PREV_ROW_ARR[3]}
        fi

        CURR_ROW_ARRAY=( ${INDEX_ARR[$EACH_INDEX]} )
        REF_CHR=${CURR_ROW_ARRAY[0]}

        if [ $EACH_INDEX == 0 ]
    then
        PREV_CHR=${CURR_ROW_ARRAY[0]}
    fi

        if [ $PREV_CHR != $REF_CHR ]
        then
                HIGHEST_END=-1
                PREV_END=-1
                CURR_START=0
                CURR_END=0
        fi

        CURR_START=${CURR_ROW_ARRAY[2]}
        CURR_END=${CURR_ROW_ARRAY[3]}

        #Start index occurs before last align end, or ends after next align beginning, meaning it's a duplicate
        if [ $((CURR_START)) -lt $((HIGHEST_END)) ]
        then
                #If overlap relates to previous header and is of sufficient length to be an SV then store key info
                if [ $((HIGHEST_END-CURR_START)) -ge $((REQ_OVERLAP)) ]
                then
                        REF_CHR=${CURR_ROW_ARRAY[0]}
                        REF_DIR_VAL=${CURR_ROW_ARRAY[1]}
                        QRY_CHR=${CURR_ROW_ARRAY[5]}
                        QRY_DIR_VAL=${CURR_ROW_ARRAY[6]}
                        DUP_REF_START=${CURR_ROW_ARRAY[2]}

                        if [ $(( HIGHEST_END )) -lt ${CURR_ROW_ARRAY[3]} ]
                        then
                                DUP_REF_END=$HIGHEST_END
                        else
                                DUP_REF_END=${CURR_ROW_ARRAY[3]}
                        fi

                        DUP_LEN=$((DUP_REF_END-DUP_REF_START))
                        DUP_QRY_START=${CURR_ROW_ARRAY[7]}

                        if [ ${CURR_ROW_ARRAY[7]} -lt ${CURR_ROW_ARRAY[8]} ]
                        then
                                DUP_QRY_END=$((DUP_QRY_START+DUP_LEN))
                        else
                                DUP_QRY_END=$((DUP_QRY_START-DUP_LEN))
                        fi
                        DUPS_ARR+=("$REF_CHR $REF_DIR_VAL $DUP_REF_START $DUP_REF_END $QRY_CHR $QRY_DIR_VAL $DUP_QRY_START $DUP_QRY_END $DUP_LEN DUP ${CURR_ROW_ARRAY[10]}")
                fi
        fi

    if [ $((CURR_END)) -ge $((HIGHEST_END)) ] # Update furthest aligned index to higher value
    then
                HIGHEST_END=$CURR_END
    fi

        PREV_CHR=$REF_CHR
done

#Print the arrays to file
printf "%s\n" "${DUPS_ARR[@]}" > $OUTPUT_FILE
