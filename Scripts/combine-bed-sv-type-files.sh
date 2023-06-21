#!/bin/bash

OUTPUT_FILE=$1
shift

COMBO_TARGETS=""
for TARGET in $*
do
	COMBO_TARGETS="$TARGET $COMBO_TARGETS"
done

cat $COMBO_TARGETS | sort -k 1,1 -k 2,2n > $OUTPUT_FILE
