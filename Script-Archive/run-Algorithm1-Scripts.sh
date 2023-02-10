#!/bin/bash

alg1ConfigFilePath="./Algorithm1/configAlg1.config" # update to reflect correct path
source $alg1ConfigFilePath

./Algorithm1/build-gaps.sh "DEL" "${mummer4OutputPathPrefix}.ref.sorted.coord" "${outputFilePrefix}.DEL.out" $svMinSize

./Algorithm1/build-gaps.sh "INS" "${mummer4OutputPathPrefix}.qry.sorted.coord" "${outputFilePrefix}.INS.out" $svMinSize

./Algorithm1/find-dups.sh "${mummer4OutputPathPrefix}.ref.sorted.coord" "${outputFilePrefix}.DUP.out" $svMinSize

./Algorithm1/find-inversions.sh "${mummer4OutputPathPrefix}.ref.sorted.coord" "${outputFilePrefix}.INV.out"

./Algorithm1/find-translocations.sh "${mummer4OutputPathPrefix}.ref.sorted.coord" "${outputFilePrefix}.TRANS.out"
