#/bin/bash

MUMCO_SCRIPT_PATH=$1
THREADS=$2
REF_GENOME=$3
QRY_GENOME=$4
GENOME_DETAILS=$5
OUTPUT_DIR=$6
SAMPLE_NAME=$7
OUTPUT_PREFIX=$8

GENOME_SIZE=$(awk '{ sum += $2 } END { if (NR > 0) print sum }' $GENOME_DETAILS)
WORKING_DIR=`pwd` # Stores pipeline's working directory to allow for return

#Convert Relative to Abs path before changing to MUMCO output directory
REF_ABS_PATH=`echo "$(cd "$(dirname "$REF_GENOME")"; pwd)/$(basename "$REF_GENOME")"`
QRY_ABS_PATH=`echo "$(cd "$(dirname "$QRY_GENOME")"; pwd)/$(basename "$QRY_GENOME")"`

echo "Changing directory to $OUTPUT_DIR!.."
mkdir -p $OUTPUT_DIR
cd $OUTPUT_DIR

echo "Starting MUM&CO!.."
bash $MUMCO_SCRIPT_PATH -t $THREADS -r $REF_ABS_PATH -q $QRY_ABS_PATH -g $GENOME_SIZE -o $OUTPUT_PREFIX #-b

#mv ${OUTPUT_PREFIX}_output ${SAMPLE_NAME}_output #Rename to match Snakefile without causing Dir exists error
cp ${OUTPUT_PREFIX}_output/${OUTPUT_PREFIX}.SVs_all.tsv ${SAMPLE_NAME}_output/${SAMPLE_NAME}.SVs_all.tsv

echo "MUM&CO Complete, returning to pipeline's working directory!.."
cd $WORKING_DIR
