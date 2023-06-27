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
HIGHEST_ROW=""
NEW_OVERLAP=0

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

        #Reset positions if reaching a new chromosome
        if [ $PREV_CHR != $REF_CHR ]
        then
                HIGHEST_END=-1
                PREV_END=-1
                CURR_START=0
                CURR_END=0
                NEW_OVERLAP=0
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

                        DUP_LEN=$((DUP_REF_END-DUP_REF_START+1)) #Plus one to include first base in length
                        DUP_QRY_START=${CURR_ROW_ARRAY[7]}

                        if [ ${CURR_ROW_ARRAY[7]} -lt ${CURR_ROW_ARRAY[8]} ]
                        then
                                DUP_QRY_END=$((DUP_QRY_START+DUP_LEN))
                        else
                                DUP_QRY_END=$((DUP_QRY_START-DUP_LEN))
                        fi

                        #If the first time overlapping current highest index, write the duplicated entry for the Highest's entry to date (only need the overlap's qry info, ref should be the same)
                        #if [ $NEW_OVERLAP -eq 0 ]
                        #then
				#echo ${HIGHEST_ROW[@]}
                                         HIGHEST_QRY_CHR=${HIGHEST_ROW[5]}
                                         HIGHEST_QRY_DIR_VAL=${HIGHEST_ROW[6]}
                                ## If current entry completely overlapped by highest, use calculate correct index range in qry highest, else derive query location from highest entry's coordinates
                                #if [ ${HIGHEST_ROW[3]} -lt $HIGHEST_END  ]
                                #then
                                         #HIGHEST_QRY_CHR=${HIGHEST_ROW[5]}
                                         #HIGHEST_QRY_DIR_VAL=${HIGHEST_ROW[6]}
                                         HIGHEST_REF_START=${HIGHEST_ROW[2]}
                                         HIGHEST_QRY_START=${HIGHEST_ROW[7]}
                                         OFFSET_DIST=$((DUP_REF_START-HIGHEST_REF_START)) #Offset to extract index range that is the same distance inside highest QRY alignment as the REF region.
                                         HIGHEST_DUP_QRY_START=$((HIGHEST_QRY_START+OFFSET_DIST))
                                ##else
                                ##         #HIGHEST_QRY_CHR=${HIGHEST_ROW[5]}
                                ##         #HIGHEST_QRY_DIR_VAL=${HIGHEST_ROW[6]}
                                ##         HIGHEST_DUP_QRY_START=${HIGHEST_ROW[7]} #If not ful
				#fi
                                if [ ${HIGHEST_ROW[7]} -lt ${HIGHEST_ROW[8]} ]
                                then
                                        HIGHEST_DUP_QRY_START=$((HIGHEST_QRY_START+OFFSET_DIST))
                                        HIGHEST_DUP_QRY_END=$((HIGHEST_DUP_QRY_START+DUP_LEN))
                                else
                                        HIGHEST_DUP_QRY_START=$((HIGHEST_QRY_START-OFFSET_DIST))
                                        HIGHEST_DUP_QRY_END=$((HIGHEST_DUP_QRY_START-DUP_LEN))
                                fi
                                DUPS_ARR+=("$REF_CHR $REF_DIR_VAL $DUP_REF_START $DUP_REF_END $HIGHEST_QRY_CHR $HIGHEST_QRY_DIR_VAL $HIGHEST_DUP_QRY_START $HIGHEST_DUP_QRY_END $DUP_LEN DUP ${HIGHEST_ROW[10]}")
                                NEW_OVERLAP=1 # Set New Overlap to false to prevent repeated entries
                        #fi
                        DUPS_ARR+=("$REF_CHR $REF_DIR_VAL $DUP_REF_START $DUP_REF_END $QRY_CHR $QRY_DIR_VAL $DUP_QRY_START $DUP_QRY_END $DUP_LEN DUP ${CURR_ROW_ARRAY[10]}")
                fi
        fi

        if [ $((CURR_END)) -gt $((HIGHEST_END)) ] # Update furthest aligned index to higher value
        then
                        HIGHEST_END=$CURR_END
                        HIGHEST_ROW=( ${INDEX_ARR[$EACH_INDEX]} ) #Store new highest row array for use on next overlap
                        NEW_OVERLAP=0 # If setting a new highest index, assume next overlap will be the first one for that new highest point
        fi

        PREV_CHR=$REF_CHR
done

#Print the arrays to file
printf "%s\n" "${DUPS_ARR[@]}" > $OUTPUT_FILE
TEMP_FILE="./Temp.coord"
sort -k1,1 -k3,3n -k4,4n -k5,5 -k7,7n -k8,8n $OUTPUT_FILE > $TEMP_FILE
uniq $TEMP_FILE > $OUTPUT_FILE
