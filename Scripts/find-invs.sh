#!/bin/bash

INPUT_FILE=$1
OUTPUT_FILE=$2

echo "Writing inversion coords to $OUTPUT_FILE..."
awk '{if ($7==-1 && $1==$6)
        print $0 " "  "INV";
}' $INPUT_FILE > $OUTPUT_FILE
