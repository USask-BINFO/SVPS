#!/bin/bash

threads=$1
nucmerL=$2
nucmerC=$3
nucmerB=$4
mummer4OutputPathPrefix=$5
refGenomeFilePath=$6
qryGenomeFilePath=$7

echo "Starting Nucmer..."

echo "Running Nucmer Ref <- Query..."
nucmer --threads $threads --maxmatch -l $nucmerL -c $nucmerC -b $nucmerB -p "${mummer4OutputPathPrefix}_ref" $refGenomeFilePath $qryGenomeFilePath
echo "Nucmer Query -> Ref Complete.."

echo "Running Nucmer Query <- Ref..."
nucmer --threads $threads --maxmatch -l $nucmerL -c $nucmerC -b $nucmerB -p "${mummer4OutputPathPrefix}_qry" $qryGenomeFilePath $refGenomeFilePath
echo "Nucmer Ref -> Query Complete..."

