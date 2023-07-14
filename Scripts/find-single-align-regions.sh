#!/bin/bash

INPUT_FILE=$1
OUTPUT_FILE=$2

echo "Writing Non-overlaping alignments to $OUTPUT_FILE..."
readarray INDEX_ARR < $INPUT_FILE

# Create array for alignments to identify duplicates
ARR_LEN="${#INDEX_ARR[@]}"

HIGHEST_END=-1
CURR_START=0
CURR_END=0
NEXT_START=0
PREV_CHR="NotAChrom"
REF_CHR=""
HIGHEST_ROW=""
NEW_OVERLAP=0

RESULT_ARR=()

for((EACH_INDEX=0;EACH_INDEX<ARR_LEN;EACH_INDEX++)) do #-1

        CURR_ROW_ARRAY=( ${INDEX_ARR[$EACH_INDEX]} )
        REF_CHR=${CURR_ROW_ARRAY[0]}

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

        #Extract next alignment unless at the end of the array to avoid bounding issue
        if [ $((EACH_INDEX)) -ne $((ARR_LEN-1))  ]
        then
                NEXT_ROW_ARRAY=(${INDEX_ARR[$((EACH_INDEX+1))]})
                NEXT_REF_CHR=${NEXT_ROW_ARRAY[0]}
                NEXT_START=${NEXT_ROW_ARRAY[2]}
        else
                NEXT_ROW_ARRAY=""
                NEXT_REF_CHR=""
                NEXT_START=""
        fi



        #Start index occurs at or after highest align index to date, meaning it's doesn't overlap any alignments so far
        if [ $((CURR_START)) -ge $((HIGHEST_END)) ]
        then
                #If next alignment is empty then on the last alignment so it should be enough to come after highest (short circuit logic), otherwise perform overlap test on end of current versus start of next alignment
                if [ -z $NEXT_ROW_ARRAY ]  || [ $((CURR_END)) -le $((NEXT_START)) ]
                then
                        RESULT_ARR+=("${INDEX_ARR[$EACH_INDEX]}")
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
TEMP_FILE="./Temp.coord"
#printf "%s\n" "${RESULT_ARR[@]}" > $TEMP_FILE
printf "%s" "${RESULT_ARR[@]}" > $TEMP_FILE
sort -k1,1 -k3,3n -k4,4n -k5,5 -k7,7n -k8,8n $TEMP_FILE > $OUTPUT_FILE
#uniq $TEMP_FILE > $OUTPUT_FILE
rm $TEMP_FILE
