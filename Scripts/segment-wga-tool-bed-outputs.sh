#!/bin/bash

INPUT_FILE=$1
OUTPUT_PREFIX=$2
MAX_DIST

echo "Segmenting Deletion bed coords to ${OUTPUT_PREFIX}DEL.bed..."
awk '{if ($4=="DEL")
        print $0;
}' $INPUT_FILE > ${OUTPUT_PREFIX}DEL.wMult.bed

echo "Segmenting SyRI Insertion bed coords to ${OUTPUT_PREFIX}INS.bed..."
awk '{if ($4=="INS")
        print $0;
}' $INPUT_FILE > ${OUTPUT_PREFIX}INS.wMult.bed

echo "Segmenting SyRI Duplication bed coords to ${OUTPUT_PREFIX}DUP.bed..."
awk '{if ($4=="DUP")
        print $0;
}' $INPUT_FILE > ${OUTPUT_PREFIX}DUP.wMult.bed

echo "Segmenting SyRI Inversion bed coords to ${OUTPUT_PREFIX}INV.bed..."
awk '{if ($4=="INV")
        print $0;
}' $INPUT_FILE > ${OUTPUT_PREFIX}INV.wMult.bed

echo "Segmenting SyRI Translocation bed coords to ${OUTPUT_PREFIX}TRANS.bed..."
awk '{if ($4=="TRANS")
        print $0;
}' $INPUT_FILE > ${OUTPUT_PREFIX}TRANS.wMult.bed
