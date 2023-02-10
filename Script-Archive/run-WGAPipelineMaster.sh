#!/bin/bash

wgaMasterConfigFilePath="./configWGAPipelineMaster.config" # update to reflect correct path
source $wgaMasterConfigFilePath

## Run MUMmer4 scripts
./WGA-Alignment-MUMmer4/run-Nucmer.sh $threads $nucmerL $nucmerC $nucmerB $mummer4OutputPathPrefix $refGenomeFilePath $qryGenomeFilePath
./WGA-Alignment-MUMmer4/run-DeltaFilter.sh $minIdentity $minLength $mummer4OutputPathPrefix
./WGA-Alignment-MUMmer4/run-ShowCoords.sh $mummer4OutputPathPrefix
./WGA-Alignment-MUMmer4/reformat-and-sort-coords.sh "${mummer4OutputPathPrefix}_RefAsRef.coords" "${mummer4OutputPathPrefix}.ref"
./WGA-Alignment-MUMmer4/reformat-and-sort-coords.sh "${mummer4OutputPathPrefix}_QryAsRef.coords" "${mummer4OutputPathPrefix}.qry"

## Run Alg1 scripts
./Algorithm1/build-gaps.sh "DEL" "${mummer4OutputPathPrefix}.ref.sorted.coord" "${outputFilePrefix}.DEL.out" $svMinSize
./Algorithm1/build-gaps.sh "INS" "${mummer4OutputPathPrefix}.qry.sorted.coord" "${outputFilePrefix}.INS.out" $svMinSize
./Algorithm1/find-dups.sh "${mummer4OutputPathPrefix}.ref.sorted.coord" "${outputFilePrefix}.DUP.out"  $svMinSize 
./Algorithm1/find-inversions.sh "${mummer4OutputPathPrefix}.ref.sorted.coord" "${outputFilePrefix}.INV.out"
./Algorithm1/find-translocations.sh "${mummer4OutputPathPrefix}.ref.sorted.coord" "${outputFilePrefix}.TRANS.out"

## Run Alg1 Post-processing scripts
./Algorithm1-Postprocessing/remove-trans-dups.sh "${alg1OutputFilePrefix}.DUP.out" $dupNoTransOutputFile
./Algorithm1-Postprocessing/remove-inv-dups.sh $dupNoTransOutputFile $dupNoInvsOutputFile

./Algorithm1-Postprocessing/headers-master-to-bed.sh  $dupNoInvsOutputFile "${alg1OutputFilePrefix}.DUP.bed"
./Algorithm1-Postprocessing/headers-master-to-bed.sh "${alg1OutputFilePrefix}.INV.out" "${alg1OutputFilePrefix}.INV.bed"
./Algorithm1-Postprocessing/headers-master-to-bed.sh "${alg1OutputFilePrefix}.TRANS.out" "${alg1OutputFilePrefix}.TRANS.bed"

./Algorithm1-Postprocessing/headers-DEL-to-vcf.sh "${alg1OutputFilePrefix}.DEL.out" "${alg1OutputFilePrefix}.DEL.vcf" $sampleChromInfoFile
./Algorithm1-Postprocessing/headers-INS-to-VCF.sh "${alg1OutputFilePrefix}.INS.out" "${alg1OutputFilePrefix}.INS.vcf" $sampleChromInfoFile
./Algorithm1-Postprocessing/headers-bed-DUP-to-vcf.sh "${alg1OutputFilePrefix}.DUP.bed" "${alg1OutputFilePrefix}.DUP.vcf" $sampleChromInfoFile
./Algorithm1-Postprocessing/headers-bed-INV-to-vcf.sh "${alg1OutputFilePrefix}.INV.bed" "${alg1OutputFilePrefix}.INV.vcf" $sampleChromInfoFile
./Algorithm1-Postprocessing/headers-bed-TRANS-to-vcf.sh "${alg1OutputFilePrefix}.TRANS.bed" "${alg1OutputFilePrefix}.TRANS.vcf" $sampleChromInfoFile

./Algorithm1-Postprocessing/verify-Duplication-Alignments.sh $refGenomeFilePath $qryGenomeFilePath $dupNoTransOutputFile $verificationDirPath "DUP"