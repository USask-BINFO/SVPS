#!/bin/bash

INPUT_FILE=$1
TEMP_FILE=$2
OUTPUT_FILE=$3
MAX_DIST=$4

# Select any entry except those of type 'contraction'
awk 'BEGIN{FS=OFS=" "}{if ($6 != "contraction" && $5 > 50) print $1 " " $3 " " $4 " " $6}' $INPUT_FILE > $TEMP_FILE

#convert random classes to match my pipeline
sed -i 's/transloc/TRANS/g' $TEMP_FILE
sed -i 's/inversion/INV/g' $TEMP_FILE
sed -i 's/duplication/DUP/g' $TEMP_FILE
sed -i 's/deletion/DEL/g' $TEMP_FILE
sed -i 's/deletion_novel/DEL/g' $TEMP_FILE
sed -i 's/deletion_mobile/DEL/g' $TEMP_FILE
sed -i 's/insertion/INS/g' $TEMP_FILE
sed -i 's/insertion_novel/INS/g' $TEMP_FILE
sed -i 's/insertion_mobile/INS/g' $TEMP_FILE

#Replace all spaces with tabs for correct formatting for Bedtools
tail -n+2 $TEMP_FILE > ${TEMP_FILE}.noHeader
sort -k1,1 -k2,2n -k3,3n -o $OUTPUT_FILE ${TEMP_FILE}.noHeader
sed -i 's/ /\t/g' $OUTPUT_FILE #${TEMP_FILE}.noHeader
#tail -n+1 $TEMP_FILE > ${TEMP_FILE}.noHeader

#bedtools merge -d $MAX_DIST -c 1 -o count -i ${TEMP_FILE}.noHeader > $OUTPUT_FILE
rm $TEMP_FILE ${TEMP_FILE}.noHeader

