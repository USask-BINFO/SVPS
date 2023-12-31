#!/bin/bash

INPUT_FILE=$1
TEMP_FILE=$2
OUTPUT_FILE=$3
MAX_DIST=$4

echo "Extracting BED columns from $INPUT_FILE..."

#awk 'BEGIN{FS=OFS=" "}{print $1 "\t" $2 "\t" $3 "\t" $8}' $INPUT_FILE > $TEMP_FILE
awk 'BEGIN{FS=OFS=" "}{if ($1 != "-")
                                 print $1 "\t" $2 "\t" $3 "\t" $8 "\t" $7;
                       else
                                print $4 "\t" $5-1 "\t" $6-1 "\t" $8 "\t" $7;
                        }' $INPUT_FILE > $TEMP_FILE

sort -k 1,1 -k2,2n -k3,3n -o $OUTPUT_FILE $TEMP_FILE
#bedtools merge -d $MAX_DIST -c 1 -o count -i $TEMP_FILE > $OUTPUT_FILE

#rm $TEMP_FILE

echo "Extraction complete!.."
