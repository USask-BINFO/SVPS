#!/bin/bash

OUTPUT_FILE=$1
CONTIGS_FILE=$2
MUMMER_L=$3
MUMMER_C=$4
MUMMER_B=$5

VCF_ARR=()

#Append header metadata to VCF array
VCF_ARR+=("##fileformat=VCFv4.2")
VCF_ARR+=("##FILTER=<ID=PASS,Description=\"SV Identified by MUMmer4 with L ${MUMMER_L} C ${MUMMER_C} B ${MUMMER_B} settings\">")
TODAYS_DATE=$(date '+%Y%m%d')

#Append headers for chromosome/contig info from each sequence included from ref
readarray CHROM_LEN_ARR < <(cut -f2 $CONTIGS_FILE)
readarray CHROM_NAME_ARR < <(cut -f1 $CONTIGS_FILE)
CHROM_NAME_ARR_LEN="${#CHROM_NAME_ARR[@]}"

for((EACH_INDEX=0;EACH_INDEX<CHROM_NAME_ARR_LEN;EACH_INDEX++)) do
	CURRENT_CHROM=`echo ${CHROM_NAME_ARR[EACH_INDEX]} | tr -d '\n'`
	CURRENT_LENGTH=`echo ${CHROM_LEN_ARR[EACH_INDEX]} | tr -d '\n'`
	echo $CURRENT_CHROM $CURRENT_LENGTH
        ROW_STRING="##contig=<ID=${CURRENT_CHROM},length=${CURRENT_LENGTH}>"
        #ROW_STRING="##contig=<ID=${CHROM_NAME_ARR[EACH_INDEX]},length=${CHROM_LEN_ARR[EACH_INDEX]}>"
        VCF_ARR+=($ROW_STRING)
done

#Append field description headers
VCF_ARR+=("##fileDate=$TODAYS_DATE")
VCF_ARR+=("##ALT=<ID=DEL,Description=\"Deletion\">")
VCF_ARR+=("##ALT=<ID=INS,Description=\"Insertion\">")
VCF_ARR+=("##ALT=<ID=DUP,Description=\"Duplication\">")
VCF_ARR+=("##ALT=<ID=INV,Description=\"Inversion\">")
VCF_ARR+=("##ALT=<ID=TRANS,Description=\"Translocation or Transposition\">")
VCF_ARR+=("##INFO=<ID=SVTYPE,Number=1,Type=String,Description=\"Type of SV identified based on Mummer Delta file alignment\">")
VCF_ARR+=("##INFO=<ID=END,Number=1,Type=Integer,Description=\"Index position at which the identified SV terminated in the Ref sequence according to Mummer Delta file alignment\">")
VCF_ARR+=("##INFO=<ID=SVLEN,Number=1,Type=Integer,Description=\"Length of SV as number of indexes between POS and SVEND\">")
VCF_ARR+=("##INFO=<ID=QRYCHR,Number=1,Type=String,Description=\"Chromosome ID for SV in Query sequence\">")
VCF_ARR+=("##INFO=<ID=QRYSTART,Number=1,Type=Integer,Description=\"Index position at which the identified SV starts in Query sequence\">")
VCF_ARR+=("##INFO=<ID=QRYEND,Number=1,Type=Integer,Description=\"Index position at which the identified SV end in Query sequence\">")
VCF_ARR+=("##INFO=<ID=MATEID,Number=1,Type=String,Description=\"Identifier for the mated pair BND reported that makes up the other end of the Transloc SV\">")
VCF_ARR+=("##INFO=<ID=TRANSSTART,Number=1,Type=String,Description=\"Index position at which the identified Transloc SV starts in ref sequence\">")
VCF_ARR+=("##INFO=<ID=TRANSEND,Number=1,Type=String,Description=\"Index position at which the identified Transloc SV ends in ref sequence\">")
VCF_ARR+=("##FORMAT=<ID=GT,Number=1,Type=String,Description=\"Genotype\">")
VCF_ARR+=("##FORMAT=<ID=DP,Number=1,Type=Integer,Description=\"Read depth\">")

#Append VCF column header line to finish header format for VCF file to be output, then translate entries to VCF
VCF_ARR+=("#CHROM	POS	ID	REF	ALT	QUAL	FILTER	INFO	FORMAT	SAMPLE")

printf "%s\n" "${VCF_ARR[@]}" > $OUTPUT_FILE
