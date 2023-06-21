#!/bin/bash

TOOL_A_NAME=$1
TOOL_A_FILE=$2
INTERSECT_FILE_A=$3
TOOL_B_NAME=$4
TOOL_B_FILE=$5
INTERSECT_FILE_B=$6
SV_TYPE=$7
OUTPUT_FILE=$8
WRITE_MODE=$9


#Get size of each set contained in files (extract the numeric value in truvari summary.txt from a specific line containing an identifier)

#Tool A's values
INTERSECT_A_SIZE=$(cat $INTERSECT_FILE_A | wc -l)
TOOL_A_SIZE=$(cat $TOOL_A_FILE | wc -l)
TOOL_A_PRECISION=$(awk -v AINTERSECT="$INTERSECT_A_SIZE" -v ASIZE="$TOOL_A_SIZE" 'BEGIN { printf "%.2f", AINTERSECT/ASIZE*100 }' </dev/null)
if [ -z ${TOOL_A_PRECISION} ]; then
        TOOL_A_PRECISION="0.0"
fi
TOOL_A_UNIQUE=$((TOOL_A_SIZE-INTERSECT_A_SIZE))

#Tool B's values
INTERSECT_B_SIZE=$(cat $INTERSECT_FILE_B | wc -l)
TOOL_B_SIZE=$(cat $TOOL_B_FILE | wc -l)
TOOL_B_PRECISION=$(awk -v BINTERSECT="$INTERSECT_B_SIZE" -v BSIZE="$TOOL_B_SIZE" 'BEGIN { printf "%.2f", BINTERSECT/BSIZE*100 }' </dev/null)
if [ -z ${TOOL_B_PRECISION} ]; then
        TOOL_B_PRECISION="0.0"
fi
TOOL_B_UNIQUE=$((TOOL_B_SIZE-INTERSECT_B_SIZE))

#Calculate union size and Jaccard Index value for the provided pair of tools
if [ $INTERSECT_A_SIZE -ge $INTERSECT_B_SIZE ]; then
        BIGGER_INTERSECT="$INTERSECT_A_SIZE"
else
        BIGGER_INTERSECT="$INTERSECT_B_SIZE"
fi

UNION_SIZE=$((TOOL_A_SIZE+TOOL_B_SIZE-BIGGER_INTERSECT))
if [ -z ${UNION_SIZE} ]; then
        UNION_SIZE="0"
fi
JACCARD=$(awk -v INTERSECT="$BIGGER_INTERSECT" -v UNION="$UNION_SIZE" 'BEGIN { printf "%.2f", INTERSECT/UNION*100 }' </dev/null)
if [ -z ${JACCARD} ]; then
        JACCARD="0.0"
fi

#Check if script should write/overwrite a file with the new header info (should only be done for first pair of tools compared)
if [ $WRITE_MODE = "W" ] || [ $WRITE_MODE = "w" ]
then
        echo "#ToolA	ToolB	Type	Jaccard%	PrecA%	PrecB%	Union	SizeA	SizeB	UniqueA	Intersect	UniqueB" > $OUTPUT_FILE
fi

#Append the entry for the pair of tools designated by arguments
echo "$TOOL_A	$TOOL_B	$SV_TYPE	${JACCARD}%	${TOOL_A_PRECISION}%	${TOOL_B_PRECISION}%	$UNION_SIZE	$TOOL_A_SIZE	$TOOL_B_SIZE	$TOOL_A_UNIQUE	$BIGGER_INTERSECT	$TOOL_B_UNIQUE" >> "$OUTPUT_FILE"
