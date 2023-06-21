#!/bin/bash

INPUT_FILE=$1
OUTPUT_FILE=$2

echo "Removing inverted DUP entries from to $INPUT_FILE..."
awk '{if ($6==1)
        print $0;
     }' $INPUT_FILE > $OUTPUT_FILE
