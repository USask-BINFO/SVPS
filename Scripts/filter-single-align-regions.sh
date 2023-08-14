#!/bin/bash

INPUT_FILE=$1
OUTPUT_FILE=$2
THRESHOLD=$3

echo "Filtering single alignment regions by threshold to $OUTPUT_FILE..."
awk -v THRESHOLD="$THRESHOLD" '{if ($11 > THRESHOLD)
        print $0;
}' $INPUT_FILE > $OUTPUT_FILE
