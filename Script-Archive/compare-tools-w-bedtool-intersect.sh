#!/bin/bash

TOOL_A=$1
TOOL_A_PREFIX=$2
TOOL_B=$3
TOOL_B_PREFIX=$4
OUTPUT_PREFIX=$5
MIN_OVERLAP=$6

bedtools intersect -f $MIN_OVERLAP -F $MIN_OVERLAP -e -wa -a ${TOOL_A_PREFIX}.INS.bed -b ${TOOL_B_PREFIX}.INS.bed | sort -k 1,1 -k 2,2n | uniq > ${OUTPUT_PREFIX}/${TOOL_A}.INS.intersect.bed
bedtools intersect -f $MIN_OVERLAP -F $MIN_OVERLAP -e -wb -a ${TOOL_A_PREFIX}.INS.bed -b ${TOOL_B_PREFIX}.INS.bed | sort -k 1,1 -k 2,2n | uniq > ${OUTPUT_PREFIX}/${TOOL_B}.INS.intersect.bed

bedtools intersect -f $MIN_OVERLAP -F $MIN_OVERLAP -e -wa -a ${TOOL_A_PREFIX}.DEL.bed -b ${TOOL_B_PREFIX}.DEL.bed | sort -k 1,1 -k 2,2n | uniq > ${OUTPUT_PREFIX}/${TOOL_A}.DEL.intersect.bed
bedtools intersect -f $MIN_OVERLAP -F $MIN_OVERLAP -e -wb -a ${TOOL_A_PREFIX}.DEL.bed -b ${TOOL_B_PREFIX}.DEL.bed | sort -k 1,1 -k 2,2n | uniq > ${OUTPUT_PREFIX}/${TOOL_B}.DEL.intersect.bed

bedtools intersect -f $MIN_OVERLAP -F $MIN_OVERLAP -e -wa -a ${TOOL_A_PREFIX}.DUP.bed -b ${TOOL_B_PREFIX}.DUP.bed | sort -k 1,1 -k 2,2n | uniq > ${OUTPUT_PREFIX}/${TOOL_A}.DUP.intersect.bed
bedtools intersect -f $MIN_OVERLAP -F $MIN_OVERLAP -e -wb -a ${TOOL_A_PREFIX}.DUP.bed -b ${TOOL_B_PREFIX}.DUP.bed | sort -k 1,1 -k 2,2n | uniq > ${OUTPUT_PREFIX}/${TOOL_B}.DUP.intersect.bed

bedtools intersect -f $MIN_OVERLAP -F $MIN_OVERLAP -e -wa -a ${TOOL_A_PREFIX}.INV.bed -b ${TOOL_B_PREFIX}.INV.bed | sort -k 1,1 -k 2,2n | uniq > ${OUTPUT_PREFIX}/${TOOL_A}.INV.intersect.bed
bedtools intersect -f $MIN_OVERLAP -F $MIN_OVERLAP -e -wb -a ${TOOL_A_PREFIX}.INV.bed -b ${TOOL_B_PREFIX}.INV.bed | sort -k 1,1 -k 2,2n | uniq > ${OUTPUT_PREFIX}/${TOOL_B}.INV.intersect.bed

bedtools intersect -f $MIN_OVERLAP -F $MIN_OVERLAP -e -wa -a ${TOOL_A_PREFIX}.TRANS.bed -b ${TOOL_B_PREFIX}.TRANS.bed | sort -k 1,1 -k 2,2n | uniq > ${OUTPUT_PREFIX}/${TOOL_A}.TRANS.intersect.bed
bedtools intersect -f $MIN_OVERLAP -F $MIN_OVERLAP -e -wb -a ${TOOL_A_PREFIX}.TRANS.bed -b ${TOOL_B_PREFIX}.TRANS.bed | sort -k 1,1 -k 2,2n | uniq > ${OUTPUT_PREFIX}/${TOOL_B}.TRANS.intersect.bed
