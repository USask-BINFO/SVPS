#!/bin/bash

mummer4ConfigFilePath="./WGA-Alignment-MUMmer4/configMUMmer4.config" # update to reflect correct path
source $mummer4ConfigFilePath

./WGA-Alignment-MUMmer4/run-Nucmer.sh $threads $nucmerL $nucmerC $nucmerB $mummer4OutputPathPrefix $refGenomeFilePath $qryGenomeFilePath

./WGA-Alignment-MUMmer4/run-DeltaFilter.sh $minIdentity $minLength $mummer4OutputPathPrefix

./WGA-Alignment-MUMmer4/run-ShowCoords.sh $mummer4OutputPathPrefix

./WGA-Alignment-MUMmer4/reformat-and-sort-coords.sh "${mummer4OutputPathPrefix}_RefAsRef.coords" "${mummer4OutputPathPrefix}.ref"

./WGA-Alignment-MUMmer4/reformat-and-sort-coords.sh "${mummer4OutputPathPrefix}_QryAsRef.coords" "${mummer4OutputPathPrefix}.qry"