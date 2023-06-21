#!/bin/bash

INPUT_FILE=$1
OUTPUT_FILE=$2
TEMP_FILE=$3

echo "Renaming Chrom names in $INPUT_FILE for SyRI..."
awk '$10="R"$10' $INPUT_FILE > $TEMP_FILE
awk '$11="Q"$11' $TEMP_FILE > $OUTPUT_FILE
sed -i 's/ /\t/g' $OUTPUT_FILE

#awk '{ print $1, $2, $3, $4, $5, $6, $7, $8, $9, "R"$10, "Q"$11 }' $INPUT_FILE > $OUTPUT_FILE

rm $TEMP_FILE
echo "Renaming Complete!.."
