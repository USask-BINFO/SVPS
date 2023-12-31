#!/bin/bash

OUTPUT_FILE_PREFIX=$1
shift #remove output file as first arg so remainder can be added to bcftools command (concats all files provided after output)

VCF_TYPE_FILES=""

for TYPE_FILE in $*
do
	bcftools sort -o ${TYPE_FILE}.sorted ${TYPE_FILE}
	bgzip -c ${TYPE_FILE}.sorted > ${TYPE_FILE}.gz
	tabix ${TYPE_FILE}.gz
	VCF_TYPE_FILES="${TYPE_FILE}.gz $VCF_TYPE_FILES"
	rm ${TYPE_FILE}.sorted
done

echo "Combining VCF files for each type to ${OUTPUT_FILE_PREFIX}.sorted.vcf!.."
echo "Type files: " $VCF_TYPE_FILES
#bcftools concat --allow-overlap -o ${OUTPUT_FILE_PREFIX}.vcf -O v `echo $VCF_TYPE_FILES`

#cat $1 > ${OUTPUT_FILE_PREFIX}.vcf
grep -v -e '^$' $1 > ${OUTPUT_FILE_PREFIX}.vcf
shift
for TYPE_FILE in $*
do
	grep -v "^#" $TYPE_FILE | grep -v -e '^$' >> ${OUTPUT_FILE_PREFIX}.vcf
done

bcftools sort -o ${OUTPUT_FILE_PREFIX}.sorted.vcf ${OUTPUT_FILE_PREFIX}.vcf
echo "Job's done!.."
