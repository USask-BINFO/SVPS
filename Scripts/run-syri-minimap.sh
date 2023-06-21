#/bin/bash

THREADS=$1
ALIGN_FILE=$2
REF_GENOME=$3
QRY_GENOME=$4
OUTPUT_DIR=$5
SAMP_NAME=$6

mkdir -p $OUTPUT_DIR

echo "Starting SyRI w Minimap!.."
syri --nc $THREADS -c $ALIGN_FILE -r $REF_GENOME -q $QRY_GENOME -k -F B #--nosnp


mv TLOut.txt $OUTPUT_DIR/$SAMP_NAME.syri.minimap.TLOut.txt
mv ctxOut.txt $OUTPUT_DIR/$SAMP_NAME.syri.minimap.ctxOut.txt
mv dupOut.txt $OUTPUT_DIR/$SAMP_NAME.syri.minimap.dupOut.txt
mv invDupOut.txt $OUTPUT_DIR/$SAMP_NAME.syri.minimap.invDupOut.txt
mv invOut.txt $OUTPUT_DIR/$SAMP_NAME.syri.minimap.invOut.txt
mv invTLOut.txt $OUTPUT_DIR/$SAMP_NAME.syri.minimap.invTLOut.txt
mv notAligned.txt $OUTPUT_DIR/$SAMP_NAME.syri.minimap.notAligned.txt
mv snps.txt $OUTPUT_DIR/$SAMP_NAME.syri.minimap.snps.txt
mv sv.txt $OUTPUT_DIR/$SAMP_NAME.syri.minimap.sv.txt
mv synOut.txt $OUTPUT_DIR/$SAMP_NAME.syri.minimap.synOut.txt
mv syri.log $OUTPUT_DIR/$SAMP_NAME.syri.minimap.log
mv syri.out $OUTPUT_DIR/$SAMP_NAME.syri.minimap.out
mv syri.summary $OUTPUT_DIR/$SAMP_NAME.syri.minimap.summary
mv syri.vcf $OUTPUT_DIR/$SAMP_NAME.syri.minimap.vcf
mv $OUTPUT_DIR/syri.out $OUTPUT_DIR/$SAMP_NAME.syri.minimap.out

echo "SyRI Minimap w Complete!.."
