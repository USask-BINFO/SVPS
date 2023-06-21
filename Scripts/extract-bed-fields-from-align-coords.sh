#!/bin/bash

INPUT_FILE=$1
OUTPUT_FILE=$2

awk '{print $1 "\t" $3 "\t" $4 "\t" $5; }' $INPUT_FILE > $OUTPUT_FILE
