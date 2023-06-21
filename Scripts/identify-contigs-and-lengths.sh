#!/bin/bash

GENOME_FILE=$1
DETAILS_OUT_FILE=$2
NAMES_OUT_FILE=$3
CHRM_PREFIX=$4

awk -v CHRM="$CHRM_PREFIX" '$0 ~ CHRM {if (NR > 1) {print c;} c=0;printf substr($0,2,100) "\t"; } $0 !~ CHRM {c+=length($0);} END { print c; }' $GENOME_FILE > $DETAILS_OUT_FILE
cut -s -f 1 $DETAILS_OUT_FILE > $NAMES_OUT_FILE
