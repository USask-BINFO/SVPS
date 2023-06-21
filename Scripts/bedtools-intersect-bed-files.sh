#!/bin/bash

SAMPLE=$1
shift
MIN_OVERLAP=$1
BED_FILE_A=$2
BED_FILE_B=$3
OUTPUT_DIR=$4
TOOL_NAMES=$5
TOOL_A=$6
TOOL_B=$7
SV_TYPE=$8
SV_SIZE=$9


mkdir -p ${OUTPUT_DIR}/${TOOL_NAMES}/${SAMPLE}
bedtools intersect -f $MIN_OVERLAP -F $MIN_OVERLAP -wa -a $BED_FILE_A -b $BED_FILE_B | sort -k 1,1 -k 2,2n | uniq > ${OUTPUT_DIR}/${TOOL_NAMES}/${SAMPLE}/${TOOL_A}.${SV_TYPE}.${SV_SIZE}.bed
bedtools intersect -f $MIN_OVERLAP -F $MIN_OVERLAP -wb -a $BED_FILE_A -b $BED_FILE_B | sort -k 1,1 -k 2,2n | uniq > ${OUTPUT_DIR}/${TOOL_NAMES}/${SAMPLE}/${TOOL_B}.${SV_TYPE}.${SV_SIZE}.bed
