#!/bin/bash


inputFile=$1
outputFile=$2
sampleChromInfoFile=$3

echo "Converting TRANS Header file from BED to VCF format..."

readarray indexArray < $inputFile
arrLength="${#indexArray[@]}"
maxIndex=$((arrLength-1))

vcfArray=()

#Append header metadata to VCF array
vcfArray+=("##fileformat=VCFv4.2")
vcfArray+=("##FILTER=<ID=PASS,Description=\"SV Identified by Mummer L75 C300 settings\">")
todayDate=$(date '+%Y%m%d')
vcfArray+=("##fileDate=$todayDate")
vcfArray+=("##ALT=<ID=DEL,Description=\"Deletion\">")
vcfArray+=("##ALT=<ID=INS,Description=\"Insertion\">")
vcfArray+=("##ALT=<ID=DUP,Description=\"Duplication\">")
vcfArray+=("##ALT=<ID=INV,Description=\"Inversion\">")
vcfArray+=("##ALT=<ID=BND,Description=\"Translocation Breakend\">")
vcfArray+=("##ALT=<ID=TRANS,Description=\"Translocation or Transposition\">")
vcfArray+=("##INFO=<ID=SVTYPE,Number=1,Type=String,Description=\"Type of SV identified based on Mummer Delta file alignment\">")
vcfArray+=("##INFO=<ID=END,Number=1,Type=Integer,Description=\"Index position at which the identified SV terminated in the Ref sequence according to Mummer Delta file alignment\">")
vcfArray+=("##INFO=<ID=SVLEN,Number=1,Type=Integer,Description=\"Length of SV as number of indexes between POS and SVEND\">")
vcfArray+=("##INFO=<ID=TRANSSTART,Number=1,Type=String,Description=\"Start position of the translocation identified by MUMmer\">")
vcfArray+=("##INFO=<ID=TRANSEND,Number=1,Type=String,Description=\"End position of the translocation identified by MUMmer\">")
vcfArray+=("##INFO=<ID=QRYCHR,Number=1,Type=String,Description=\"Chromosome ID for SV in Query sequence\">")
vcfArray+=("##INFO=<ID=QRYSTART,Number=1,Type=Integer,Description=\"Index position at which the identified SV starts in Query sequence\">")
vcfArray+=("##INFO=<ID=QRYEND,Number=1,Type=Integer,Description=\"Index position at which the identified SV end in Query sequence\">")
vcfArray+=("##FORMAT=<ID=GT,Number=1,Type=String,Description=\"Genotype\">")
vcfArray+=("##FORMAT=<ID=DP,Number=1,Type=Integer,Description=\"Read depth\">")

#Append sample's chromosome/contig info to VCF header from the provided file
readarray chromInfoArray < $sampleChromInfoFile
chromInfoLength="${#chromInfoArray[@]}"
maxChromInfoIndex=$((chromInfoLength-1))
for((eachIndex=0;eachIndex<maxChromInfoIndex;eachIndex++)) do
	chromRowArray=( ${chromInfoArray[$eachIndex]} )
	rowAsString="${chromRowArray}"
	vcfArray+=($rowAsString)
done

#Append VCF column header line to finish header format for VCF file to be output, then translate entries to VCF
vcfArray+=("#CHROM	POS	ID	REF	ALT	QUAL	FILTER	INFO	FORMAT	SAMPLE")
for((eachIndex=0;eachIndex<arrLength;eachIndex++)) do
  	currRowArray=( ${indexArray[$eachIndex]} )
  	
   	refChr=${currRowArray[0]}
   	refStart=${currRowArray[1]}
   	refEnd=${currRowArray[2]}
	svLength=$((refEnd-reftStart))
	svType="BND"
    
    vcfArray+=("$refChr	$refStart	N	N	<BND>	.	PASS	SVTYPE=$svType;END=$refEnd;SVLEN=$svLength;TRANSSTART=$refStart;TRANSEND=$refEND;	GT:DP	./.:.")
done

printf "%s\n" "${vcfArray[@]}" > $outputFile

