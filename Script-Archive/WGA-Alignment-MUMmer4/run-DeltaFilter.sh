#!/bin/bash

minIdentity=$1
minLength=$2
mummer4OutputPathPrefix=$3


echo "Starting Delta-Filter..."
delta-filter -m -i $minIdentity -l $minLength ${mummer4OutputPathPrefix}_ref.delta > ${mummer4OutputPathPrefix}_ref.delta_filter

echo "Starting Delta-Filter..."
delta-filter -m -i $minIdentity -l $minLength ${mummer4OutputPathPrefix}_qry.delta > ${mummer4OutputPathPrefix}_qry.delta_filter

echo "Delta-Filter complete..."
