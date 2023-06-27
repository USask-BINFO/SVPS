#!/bin/bash

INPUT_FILE=$1
OUTPUT_FILE=$2

echo "Writing inversion coords to $OUTPUT_FILE..."
awk '{ print $5 " " $6 " " $7 " " $8 " " $1 " " $2 " " $3 " " $4 " " $9 " " $10 " " $11;
}' $INPUT_FILE > $OUTPUT_FILE
sort -k1,1 -k3,3n -k4,4n $OUTPUT_FILE
