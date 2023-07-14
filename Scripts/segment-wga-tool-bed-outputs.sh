#!/bin/bash

INPUT_FILE=$1
OUTPUT_PREFIX=$2
MAX_DIST=$3

echo "Segmenting Deletion bed coords to ${OUTPUT_PREFIX}DEL.bed..."
awk '{if ($4=="DEL")
        print $0;
}' $INPUT_FILE > ${OUTPUT_PREFIX}DEL.wMult.bed
bedtools merge -d $MAX_DIST -c 1 -o count -i ${OUTPUT_PREFIX}DEL.wMult.bed > ${OUTPUT_PREFIX}DEL.bed
rm ${OUTPUT_PREFIX}DEL.wMult.bed

echo "Segmenting SyRI Insertion bed coords to ${OUTPUT_PREFIX}INS.bed..."
awk '{if ($4=="INS")
        print $0;
}' $INPUT_FILE > ${OUTPUT_PREFIX}INS.wMult.bed
bedtools merge -d $MAX_DIST -c 1 -o count -i ${OUTPUT_PREFIX}INS.wMult.bed > ${OUTPUT_PREFIX}INS.bed
rm ${OUTPUT_PREFIX}INS.wMult.bed

echo "Segmenting SyRI Duplication bed coords to ${OUTPUT_PREFIX}DUP.bed..."
awk '{if ($4=="DUP")
        print $0;
}' $INPUT_FILE > ${OUTPUT_PREFIX}DUP.wMult.bed
bedtools merge -d $MAX_DIST -c 1 -o count -i ${OUTPUT_PREFIX}DUP.wMult.bed > ${OUTPUT_PREFIX}DUP.bed
rm ${OUTPUT_PREFIX}DUP.wMult.bed

echo "Segmenting SyRI Inversion bed coords to ${OUTPUT_PREFIX}INV.bed..."
awk '{if ($4=="INV")
        print $0;
}' $INPUT_FILE > ${OUTPUT_PREFIX}INV.wMult.bed
bedtools merge -d $MAX_DIST -c 1 -o count -i ${OUTPUT_PREFIX}INV.wMult.bed > ${OUTPUT_PREFIX}INV.bed
rm ${OUTPUT_PREFIX}INV.wMult.bed

echo "Segmenting SyRI Translocation bed coords to ${OUTPUT_PREFIX}TRANS.bed..."
awk '{if ($4=="DEL:TRANSLOC")
        print $0;
}' $INPUT_FILE > ${OUTPUT_PREFIX}TRANS.wMult.bed
bedtools merge -d $MAX_DIST -c 1 -o count -i ${OUTPUT_PREFIX}TRANS.wMult.bed > ${OUTPUT_PREFIX}TRANS.bed
rm ${OUTPUT_PREFIX}TRANS.wMult.bed

echo "Segmenting SyRI Translocation bed coords to ${OUTPUT_PREFIX}TRANSPOS.bed..."
awk '{if ($4=="DEL:TRANSPOS")
        print $0;
}' $INPUT_FILE > ${OUTPUT_PREFIX}TRANSPOS.wMult.bed
bedtools merge -d $MAX_DIST -c 1 -o count -i ${OUTPUT_PREFIX}TRANSPOS.wMult.bed > ${OUTPUT_PREFIX}TRANSPOS.bed
rm ${OUTPUT_PREFIX}TRANSPOS.wMult.bed
