#!/bin/bash

postprocessConfigFilePath="./Algorithm1-Postprocessing/configAlg1PostProcess.config" # update to reflect correct path
source $postprocessConfigFilePath


## Filter duplication Coord files to prevent double counting in result
./Algorithm1-Postprocessing/remove-trans-dups.sh "${alg1OutputFilePrefix}.DUP.out" $dupNoTransOutputFile

./Algorithm1-Postprocessing/remove-inv-dups.sh $dupNoTransOutputFile $dupNoInvsOutputFile


## Reformat headers file from Coords to BED
./Algorithm1-Postprocessing/headers-master-to-bed.sh  $dupNoInvsOutputFile "${alg1OutputFilePrefix}.DUP"

./Algorithm1-Postprocessing/headers-master-to-bed.sh "${alg1OutputFilePrefix}.INV.out" "${alg1OutputFilePrefix}.INV"

./Algorithm1-Postprocessing/headers-master-to-bed.sh "${alg1OutputFilePrefix}.TRANS.out" "${alg1OutputFilePrefix}.TRANS"


## Reformat headers to VCF format
./Algorithm1-Postprocessing/headers-DEL-to-vcf.sh "${alg1OutputFilePrefix}.DEL.out" "${alg1OutputFilePrefix}.DEL.vcf" $sampleChromInfoFile

./Algorithm1-Postprocessing/headers-INS-to-VCF.sh "${alg1OutputFilePrefix}.INS.out" "${alg1OutputFilePrefix}.INS.vcf" $sampleChromInfoFile

./Algorithm1-Postprocessing/headers-bed-DUP-to-vcf.sh "${alg1OutputFilePrefix}.DUP.bed" "${alg1OutputFilePrefix}.DUP.vcf" $sampleChromInfoFile

./Algorithm1-Postprocessing/headers-bed-INV-to-vcf.sh "${alg1OutputFilePrefix}.INV.bed" "${alg1OutputFilePrefix}.INV.vcf" $sampleChromInfoFile

./Algorithm1-Postprocessing/headers-bed-TRANS-to-vcf.sh "${alg1OutputFilePrefix}.TRANS.bed" "${alg1OutputFilePrefix}.TRANS.vcf" $sampleChromInfoFile


## Verify SV locations identified
./Algorithm1-Postprocessing/verify-Duplication-Alignments.sh $refGenomeFilePath $qryGenomeFilePath $dupNoTransOutputFile $verificationDirPath "DUP"
