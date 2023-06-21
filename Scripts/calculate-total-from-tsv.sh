#!/bin/bash


OUTPUT_FILE=$1
TOOL_A=$2
TOOL_B=$3
SV_TYPE="ALL"

#Tool A values calculated
TOOL_A_SIZE=$(awk '{sum+=$8;} END{print sum;}' $INPUT_FILE)
TOOL_A_UNIQUE=$(awk '{sum+=$10;} END{print sum;}' $INPUT_FILE)

#Tool B values calculated
TOOL_B_SIZE=$(awk '{sum+=$9;} END{print sum;}' $INPUT_FILE)
TOOL_B_UNIQUE=$(awk '{sum+=$12;} END{print sum;}' $INPUT_FILE)

#Shared/common values calculated
INTERSECT_SIZE=$(awk '{sum+=$11;} END{print sum;}' $INPUT_FILE)
UNION_SIZE=$(awk '{sum+=$7;} END{print sum;}' $INPUT_FILE)

#Rates recalculated using new totals
TOOL_A_PRECISION=$(awk -v INTERSECT="$INTERSECTION_SIZE" -v ASIZE="$TOOL_A_SIZE" 'BEGIN { printf "%.2f", INTERSECT/ASIZE*100 }' </dev/null)
TOOL_B_PRECISION=$(awk -v INTERSECT="$INTERSECTION_SIZE" -v BSIZE="$TOOL_B_SIZE" 'BEGIN { printf "%.2f", INTERSECT/BSIZE*100 }' </dev/null)
JACCARD=$(awk -v INTERSECT="$INTERSECTION_SIZE" -v UNION="$UNION_SIZE" 'BEGIN { printf "%.2f", INTERSECT/UNION*100 }' </dev/null)

#Append output to existing file argument
echo "$TOOL_A	$TOOL_B	$SV_TYPE	${JACCARD}%	${TOOL_A_PRECISION}%	${TOOL_B_PRECISION}%	$UNION_SIZE	$TOOL_A_SIZE	$TOOL_B_SIZE	$TOOL_A_UNIQUE	$INTERSECT_SIZE	$TOOL_B_UNIQUE" >> "$OUTPUT_FILE"
