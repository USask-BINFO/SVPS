#!/bin/bash

SV_FILE_PREFIX=$1
TYPE=$2
TOOL_NAME=$3


#Segment SV types by size thresholds
for TYPE in DEL INS DUP
do
        bcftools filter -e 'INFO/SVLEN > 100 || INFO/SVLEN < -100' -o ${SV_FILE_PREFIX}.${TYPE}.SSm.vcf ${SV_FILE_PREFIX}.${TYPE}.vcf
        bcftools filter -i '(INFO/SVLEN > 100 && INFO/SVLEN <= 1000) || (INFO/SVLEN < -100 && INFO/SVLEN >= -1000' -o ${SV_FILE_PREFIX}.${TYPE}.Sml.vcf ${SV_FILE_PREF>
        bcftools filter -i '(INFO/SVLEN > 1000 && INFO/SVLEN <= 100000) || (INFO/SVLEN < -1000 && INFO/SVLEN >= -100000' -o ${SV_FILE_PREFIX}.${TYPE}.Med.vcf ${SV_FIL>
        bcftools filter -i 'INFO/SVLEN > 100000) || INFO/SVLEN < -100000' -o ${SV_FILE_PREFIX}.${TYPE}.Lrg.vcf ${SV_FILE_PREFIX}.${TYPE}.vcf
done

if [ "SVIM" = $TOOL_NAME || "SVIM-ASM" = $TOOL_NAME ]; then
        bcftools filter -e '(POS-INFO/END) > 100 || (POS-INFO/END) < -100' -o ${SV_FILE_PREFIX}.INV.SSm.vcf ${SV_FILE_PREFIX}.INV.vcf
        bcftools filter -i '((POS-INFO/END) > 100 && (POS-INFO/END) <= 1000) || ((POS-INFO/END) < -100 && (POS-INFO/END) >= -1000)' -o ${SV_FILE_PREFIX}.INV.Sml.vcf $>
        bcftools filter -i '((POS-INFO/END) > 1000 && (POS-INFO/END) <= 100000) || ((POS-INFO/END) < -1000 && (POS-INFO/END) >= -100000)' -o ${SV_FILE_PREFIX}.INV.Med>
        bcftools filter -i '(POS-INFO/END) > 100000) || (POS-INFO/END) < -100000' -o ${SV_FILE_PREFIX}.INV.Lrg.vcf ${SV_FILE_PREFIX}.INV.vcf
else
        bcftools filter -e 'INFO/SVLEN > 100 || INFO/SVLEN < -100' -o ${SV_FILE_PREFIX}.INV.SSm.vcf ${SV_FILE_PREFIX}.INV.vcf
        bcftools filter -i '(INFO/SVLEN > 100 && INFO/SVLEN <= 1000) || (INFO/SVLEN < -100 && INFO/SVLEN >= -1000)' -o ${SV_FILE_PREFIX}.INV.Sml.vcf ${SV_FILE_PREFIX}>
        bcftools filter -i '(INFO/SVLEN > 1000 && INFO/SVLEN <= 100000) || (INFO/SVLEN < -1000 && INFO/SVLEN >= -100000)' -o ${SV_FILE_PREFIX}.INV.Med.vcf ${SV_FILE_P>
        bcftools filter -i 'INFO/SVLEN > 100000) || INFO/SVLEN < -100000' -o ${SV_FILE_PREFIX}.INV.Lrg.vcf ${SV_FILE_PREFIX}.INV.vcf
fi
