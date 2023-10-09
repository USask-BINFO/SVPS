#!/bin/bash

ALIGN_COORDS=$1
OUTPUT_FILE=$2
SIMILARITY_THRESH=$3

echo "Starting tranposition location filtering.."
INPUT_FILE=${ALIGN_COORDS} #.NeighbourAligns
#cp $ALIGN_COORDS $INPUT_FILE
#printf "%s\n" "${RESULTS_ARR[@]}" > $INPUT_FILE


#Calculate the thresholds for filtering based on mean and stdev
MEAN_ALIGN=$(awk '{ sum += ($13 + $14) } END { if (NR > 0) printf "%0.0f", sum / (2*NR) }' $INPUT_FILE)

STDEV_DOWN=$(awk -v MEANVAL="$MEAN_ALIGN" '{a[NR]=$13} END {for(i in a)y+=(a[i]-MEANVAL)^2;printf "%0.1f", sqrt(y/(NR-1))}' $INPUT_FILE)
STDEV_UP=$(awk -v MEANVAL="$MEAN_ALIGN" '{a[NR]=$14} END {for(i in a)y+=(a[i]-MEANVAL)^2;printf "%0.1f", sqrt(y/(NR-1))}' $INPUT_FILE)
STDEV_TOTAL=$(awk -v STDEVDOWN="$STDEV_DOWN" -v STDEVUP="$STDEV_UP" 'BEGIN { printf "%.1f", STDEVDOWN<=STDEVUP ? STDEVDOWN: STDEVUP}' </dev/null)

#Setting threshold for TRANSPOS filtering to be -1.282 stdev from the mean, assuming normal distribution (implies an alpha of 0.1)(OTher options 1.645 for alpha=0.05, 1.965 for 0.025, and 2.326 for 0.01), alt: use 0.3333
FILTER_THRESHOLD=$(awk -v MEANRATE="$MEAN_ALIGN" -v STDEVRATE="$STDEV_TOTAL" 'BEGIN { printf "%.0f", MEANRATE }' </dev/null) # (MEANRATE+STDEVRATE) }' </dev/null)
#FILTER_THRESHOLD=$SIMILARITY_THRESH #Provided in Config file based on the result of random alignments experiment result


echo "TRANSPOS Threshold calculation results.."
echo "Mean: $MEAN_ALIGN"
echo "STDEV-Down: $STDEV_DOWN"
echo "STDEV-UP: $STDEV_UP"
echo "STDEV-Total: $STDEV_TOTAL"
echo "Threshold: $FILTER_THRESHOLD"

#Filter columns to only those where both up and downstream meet the threshold (below)
echo "Writing Filtered Transpositions to $OUTPUT_FILE..."
awk -v FILTTHRESH="$FILTER_THRESHOLD" -v SIMTHRESH="$SIMILARITY_THRESH" '{if (($13<=SIMTHRESH && $14<=FILTTHRESH) || ($14<=SIMTHRESH && $13<=FILTTHRESH))
        print $0;
}' $INPUT_FILE > $OUTPUT_FILE


echo "Filtering Transpositions complete!.."
echo "Jobs done!.."
