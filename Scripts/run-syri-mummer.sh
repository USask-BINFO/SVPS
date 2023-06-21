#/bin/bash

THREADS=$1
COORDS_FILE=$2
DELTA_FILT_FILE=$3
REF_GENOME=$4
QRY_GENOME=$5
OUTPUT_DIR=$6
SAMP_NAME=$7

#QRY_ABS_PATH=`echo "$(cd "$(dirname "$QRY_GENOME")"; pwd)/$(basename "$QRY_GENOME")"`

mkdir -p $OUTPUT_DIR

echo "Starting SyRI w MUMmer!.."
syri --nc $THREADS -c $COORDS_FILE -d $DELTA_FILT_FILE -r $REF_GENOME -q $QRY_GENOME #--nosnp


mv TLOut.txt $OUTPUT_DIR/$SAMP_NAME.syri.mummer.TLOut.txt
mv ctxOut.txt $OUTPUT_DIR/$SAMP_NAME.syri.mummer.ctxOut.txt
mv dupOut.txt $OUTPUT_DIR/$SAMP_NAME.syri.mummer.dupOut.txt
mv invDupOut.txt $OUTPUT_DIR/$SAMP_NAME.syri.mummer.invDupOut.txt
mv invOut.txt $OUTPUT_DIR/$SAMP_NAME.syri.mummer.invOut.txt
mv invTLOut.txt $OUTPUT_DIR/$SAMP_NAME.syri.mummer.invTLOut.txt
mv notAligned.txt $OUTPUT_DIR/$SAMP_NAME.syri.mummer.notAligned.txt
mv snps.txt $OUTPUT_DIR/$SAMP_NAME.syri.mummer.snps.txt
mv sv.txt $OUTPUT_DIR/$SAMP_NAME.syri.mummer.sv.txt
mv synOut.txt $OUTPUT_DIR/$SAMP_NAME.syri.mummer.synOut.txt
mv syri.log $OUTPUT_DIR/$SAMP_NAME.syri.mummer.log
mv syri.out $OUTPUT_DIR/$SAMP_NAME.syri.mummer.out
mv syri.summary $OUTPUT_DIR/$SAMP_NAME.syri.mummer.summary
mv syri.vcf $OUTPUT_DIR/$SAMP_NAME.syri.mummer.vcf
mv $OUTPUT_DIR/syri.out $OUTPUT_DIR/$SAMP_NAME.syri.mummer.out

echo "SyRI w MUMmer Complete!.."
