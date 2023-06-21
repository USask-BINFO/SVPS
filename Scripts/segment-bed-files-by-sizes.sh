#!/bin/bash

INPUT_FILE=$1
SV_TYPE=$2
OUTPUT_PREFIX=$3

awk '{ if ( $3-$2 <= 100 || $3-$2 >= -100 ) print $0 }' $INPUT_FILE > ${OUTPUT_PREFIX}${SV_TYPE}.SSm.bed
awk '{ if ( ($3-$2 > 100 && $3-$2 <= 1000) || ($3-$2 < -100 && $3-$2 >= -1000) ) print $0 }' $INPUT_FILE > ${OUTPUT_PREFIX}${SV_TYPE}.Sml.bed
awk '{ if ( ($3-$2 > 1000 && $3-$2 <= 100000) || ($3-$2 < -1000 && $3-$2 >= -100000) ) print $0 }' $INPUT_FILE > ${OUTPUT_PREFIX}${SV_TYPE}.Med.bed
awk '{ if ( $3-$2 > 100000 || $3-$2 < -100000 ) print $0 }' $INPUT_FILE > ${OUTPUT_PREFIX}${SV_TYPE}.Lrg.bed
