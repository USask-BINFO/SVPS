#!/bin/bash

INPUT_FILE=$1
OUTPUT_FILE=$2

echo "Removing DUP entries that were also translocated from $INPUT_FILE..."
awk '{if ($1==$5)
        print $0;
     }' $INPUT_FILE > $OUTPUT_FILE
