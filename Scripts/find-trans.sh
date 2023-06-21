#!/bin/bash

INPUT_FILE=$1
OUTPUT_FILE=$2

echo "Writing Translocations to $OUTPUT_FILE..."
awk '{if ($1!=$6)
        print $0 " " "TRANS";
}' $INPUT_FILE > $OUTPUT_FILE
