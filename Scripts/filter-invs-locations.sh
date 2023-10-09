#!/bin/bash

INV_ALIGNS=$1
OUTPUT_FILE=$2
#REF_CHROM_INDEX=$3
#QRY_CHROM_INDEX=$4
NEIGHBOUR_SIZE=$3
SIMILARITY_THRESH=$4
REF_GENOME=$5 #$5
QRY_GENOME=$6 #$6

echo "Filtering INV locations to those occurring at same location in both genomes..."
REF_TEMP="./refINVTemp.fasta"
QRY_TEMP="./qryINVTemp.fasta"
NEEDLE_TEMP="./tempINV.needle"
readarray INV_ARRAY < $INV_ALIGNS
#readarray REF_CHROMS < $REF_CHROM_INDEX
#readarray QRY_CHROMS < $QRY_CHROM_INDEX

INV_ARR_LEN="${#INV_ARRAY[@]}"
#REF_CHR_COUNT="${#REF_CHROMS[@]}"
#QRY_CHR_COUNT="${#QRY_CHROMS[@]}"
RESULTS_ARR=()

for((EACH_INDEX=0;EACH_INDEX<INV_ARR_LEN;EACH_INDEX++)) do

    #Store INV entry to array of fields and label fields based on their position
    CURR_ROW_ARRAY=( ${INV_ARRAY[$EACH_INDEX]} )
    REF_CHR=${CURR_ROW_ARRAY[0]}
    REF_DIR=${CURR_ROW_ARRAY[1]}
    REF_START=${CURR_ROW_ARRAY[2]}
    REF_END=${CURR_ROW_ARRAY[3]}
    REF_LEN=${CURR_ROW_ARRAY[4]}
    QRY_CHR=${CURR_ROW_ARRAY[5]}
    QRY_DIR=${CURR_ROW_ARRAY[6]}
    QRY_START=${CURR_ROW_ARRAY[7]}
    QRY_END=${CURR_ROW_ARRAY[8]}
    QRY_LEN=${CURR_ROW_ARRAY[9]}

#    #Verify both entries on same chrom before considering how far apart they are
    if [ $REF_CHR = $QRY_CHR ]
    then
#    	#Extract ref chrom length by scanning index file entries
#    	CURR_REF_CHR_LEN=0
#    	for((CHR_COUNTER=0;CHR_COUNTER<REF_CHR_COUNT;CHR_COUNTER++)) do
#		CURR_CHR_ROW=( ${REF_CHROMS[$CHR_COUNTER]} )
#        	if [ $REF_CHR = ${CURR_CHR_ROW[0]}  ]
#        	then
#            		CURR_REF_CHR_LEN=${CURR_CHR_ROW[1]}
#            		break
#        	fi
#    	done

#    	#Extract qry chrom length by scanning index file entries
#    	CURR_QRY_CHR_LEN=0
#    	for((CHR_COUNTER=0;CHR_COUNTER<QRY_CHR_COUNT;CHR_COUNTER++)) do
#        	CURR_CHR_ROW=( ${QRY_CHROMS[$CHR_COUNTER]} )
#        	if [ $QRY_CHR = ${CURR_CHR_ROW[0]}  ]
#        	then
#            		CURR_QRY_CHR_LEN=${CURR_CHR_ROW[1]}
#            		break
#        	fi
#    	done

#    	#Get Abs value of the difference in chrom lengths (substract from whichever is larger)
#	#echo "$CURR_QRY_CHR_LEN -gt $CURR_REF_CHR_LEN"
#    	if [ $CURR_QRY_CHR_LEN -gt $CURR_REF_CHR_LEN ]
#    	then
#    		CHR_LEN_DIFF=$((CURR_QRY_CHR_LEN-CURR_REF_CHR_LEN))
#    	else
#        	CHR_LEN_DIFF=$((CURR_REF_CHR_LEN-CURR_QRY_CHR_LEN))
#    	fi

#	#Extract midpoints of each region to compare how far apart they are (used mid in case the aligned regions not the same size
#	REF_MID=$((REF_START+REF_LEN))
#	QRY_MID=$((QRY_END+QRY_LEN)) #could also be QRY_START-SVLEN

#	#Calculate amount of distance permitted between entries (using approx. as a ratio of how far the entry is into the chromosome vs. the difference in the chrom's length between samples)
#        #echo "$REF_MID/$CURR_REF_CHR_LEN*$CHR_LEN_DIFF"
#	MAX_COORD_DIFF=$(awk -v REFMID="$REF_MID" -v REFLEN="$CURR_REF_CHR_LEN" -v CHRDIFF="$CHR_LEN_DIFF"  'BEGIN { printf "%.0f", (REFLEN>0) ? REFMID/REFLEN*CHRDIFF : 0 }' </dev/null) #$((REF_MID/CURR_REF_CHR_LEN*CHR_LEN_DIFF))

	#Calculate the distance/separation between the ref and qry entries' midpoints
#	if [ $QRY_MID -gt $REF_MID ]
#	then
#		ALIGN_SEP=$((QRY_MID-REF_MID))
#	else
#		ALIGN_SEP=$((REF_MID-QRY_MID))
#	fi

#	#echo "$ALIGN_SEP $MAX_COORD_DIFF"
#	if [ $ALIGN_SEP -lt $MAX_COORD_DIFF ]
#	then
#		RESULTS_ARR+=("${INV_ARRAY[$EACH_INDEX]}")
#	fi

	#Ref always forward orientation, so runs low index to high index
    	REF_UPSTREAM_START=$((REF_START-NEIGHBOUR_SIZE))
    	REF_UPSTREAM_END=$((REF_START-1))
    	REF_UPSTREAM_USA="$REF_CHR[$REF_UPSTREAM_START:$REF_UPSTREAM_END]"

    	REF_DOWNSTREAM_START=$((REF_END+1))
    	REF_DOWNSTREAM_END=$((REF_END+NEIGHBOUR_SIZE))
    	REF_DOWNSTREAM_USA="$REF_CHR[$REF_DOWNSTREAM_START:$REF_DOWNSTREAM_END]"

	#echo "REF_USAs:" $REF_UPSTREAM_USA $REF_DOWNSTREAM_USA

        REF_UPSTREAM_SEQ=$(seqret -auto $REF_GENOME:$REF_UPSTREAM_USA stdout)
	REF_DOWNSTREAM_SEQ=$(seqret -auto $REF_GENOME:$REF_DOWNSTREAM_USA stdout) #$REF_TEMP.downstream

	#Reverse start and end for upstream and downstream as they will run from high index to low index
        QRY_UPSTREAM_START=$((QRY_END-NEIGHBOUR_SIZE))
        QRY_UPSTREAM_END=$((QRY_END-1))
        QRY_UPSTREAM_USA="$QRY_CHR[$QRY_UPSTREAM_START:$QRY_UPSTREAM_END]"

        QRY_DOWNSTREAM_START=$((QRY_START+1))
        QRY_DOWNSTREAM_END=$((QRY_START+NEIGHBOUR_SIZE))
        QRY_DOWNSTREAM_USA="$QRY_CHR[$QRY_DOWNSTREAM_START:$QRY_DOWNSTREAM_END]"

        QRY_UPSTREAM_SEQ=$(seqret -auto $QRY_GENOME:$QRY_UPSTREAM_USA stdout) #$QRY_TEMP.upstream
        QRY_DOWNSTREAM_SEQ=$(seqret -auto $QRY_GENOME:$QRY_DOWNSTREAM_USA stdout) #$QRY_TEMP.downstream

	#Align upstreams in ref and qry and downstreams in ref and query
    	SV_LEN=${CURR_ENTRY[7]}
    	if [ $((SV_LEN)) -lt 0 ]
    	then
                SV_LEN=$((SV_LEN * -1))
    	fi

	#echo "Starting align seqs"
        #stretcher -auto -asequence $REF_TEMP.upstream -bsequence $QRY_TEMP.upstream -outfile $NEEDLE_TEMP.upstream
	UPSTREAM_ALIGN=$(stretcher -auto -asequence <(printf "%s" "$REF_UPSTREAM_SEQ") -bsequence <(printf "%s" "$QRY_UPSTREAM_SEQ") -outfile stdout) #$NEEDLE_TEMP.upstream
        #stretcher -auto -asequence $REF_TEMP.downstream -bsequence $QRY_TEMP.downstream -outfile $NEEDLE_TEMP.downstream
	DOWNSTREAM_ALIGN=$(stretcher -auto -asequence <(printf "%s" "$REF_DOWNSTREAM_SEQ") -bsequence <(printf "%s" "$QRY_DOWNSTREAM_SEQ") -outfile stdout) # $NEEDLE_TEMP.downstream
	#echo "Align seqs complete"

	#Extract similarity scores from both temp files using grep and regex to compare with required similarity threshold
	##UPSTREAM_SIM=$(head -n50 $NEEDLE_TEMP.upstream | grep "^# Similarity" | grep -E -o "\([1]?[0-9][0-9]\.[0-9][0-9]?%\)" | tr -d '(%)')
	#UPSTREAM_SIM=$(head -n50 <(printf "%s" "$UPSTREAM_ALIGN") | grep "^# Similarity" | grep -E -o "\([1]?[0-9][0-9]\.[0-9][0-9]?%\)" | tr -d '(%)')
        UPSTREAM_SIM=$(head -n50 <(printf "%s" "$UPSTREAM_ALIGN") | grep "^# Identity" | grep -E -o "\([1]?[0-9][0-9]\.[0-9][0-9]?%\)" | tr -d '(%)')
	UPSTREAM_SIM=$(awk -v SIMSCORE="$UPSTREAM_SIM" 'BEGIN { printf "%.0f", SIMSCORE }' </dev/null) 
	##DOWNSTREAM_SIM=$(head -n50 $NEEDLE_TEMP.downstream | grep "^# Similarity" | grep -E -o "\([1]?[0-9][0-9]\.[0-9][0-9]?%\)" | tr -d '(%)')
	#DOWNSTREAM_SIM=$(head -n50 <(printf "%s" "$DOWNSTREAM_ALIGN") | grep "^# Similarity" | grep -E -o "\([1]?[0-9][0-9]\.[0-9][0-9]?%\)" | tr -d '(%)')
        DOWNSTREAM_SIM=$(head -n50 <(printf "%s" "$DOWNSTREAM_ALIGN") | grep "^# Identity" | grep -E -o "\([1]?[0-9][0-9]\.[0-9][0-9]?%\)" | tr -d '(%)')
	DOWNSTREAM_SIM=$(awk -v SIMSCORE="$DOWNSTREAM_SIM" 'BEGIN { printf "%.0f", SIMSCORE }' </dev/null) 

	#echo "SIMs: $UPSTREAM_SIM $DOWNSTREAM_SIM"

       #if [ $((UPSTREAM_SIM)) -ge $((SIMILARITY_THRESH)) ] && [ $((DOWNSTREAM_SIM)) -ge $((SIMILARITY_THRESH)) ]
       #then
       #	CURR_RESULT=$(echo "${INV_ARRAY[$EACH_INDEX]}" | tr -d '\n')
       #	echo "INV FOUND: $CURR_RESULT"
       #        RESULTS_ARR+=("${INV_ARRAY[$EACH_INDEX]}")
       #fi
       CURR_RESULT=$(echo -e "${INV_ARRAY[$EACH_INDEX]}\t${DOWNSTREAM_SIM}\t${UPSTREAM_SIM}" | tr -d '\n')
       RESULTS_ARR+=("$CURR_RESULT")
    fi

done

#Write alignment results to a temp file
echo "INV neighbours align complete, filtering!.."
TEMP_FILE=${INV_ALIGNS}.NeighbourAligns
printf "%s\n" "${RESULTS_ARR[@]}" > $TEMP_FILE


#Calculate the thresholds for filtering based on mean and stdev
MEAN_ALIGN=$(awk '{ sum += ($13 + $14) } END { if (NR > 0) printf "%0.0f", sum / (2*NR) }' $TEMP_FILE)

STDEV_DOWN=$(awk -v MEANVAL="$MEAN_ALIGN" '{a[NR]=$13} END {for(i in a)y+=(a[i]-MEANVAL)^2;printf "%0.1f", sqrt(y/(NR-1))}' $TEMP_FILE)
STDEV_UP=$(awk -v MEANVAL="$MEAN_ALIGN" '{a[NR]=$14} END {for(i in a)y+=(a[i]-MEANVAL)^2;printf "%0.1f", sqrt(y/(NR-1))}' $TEMP_FILE)
STDEV_TOTAL=$(awk -v STDEVDOWN="$STDEV_DOWN" -v STDEVUP="$STDEV_UP" 'BEGIN { printf "%.1f", STDEVDOWN<=STDEVUP ? STDEVDOWN: STDEVUP}' </dev/null)

#Setting threshold for INVS filtering to be +1.645 stdev from the mean, assuming normal distribution (implies an alpha of 0.05)(Other options 1.282 for alpha=0.1,1.645 for 0.05, 1.965 for 0.025, and 2.326 for 0.01)
#FILTER_THRESHOLD=95 #$(awk -v MEANRATE="$MEAN_ALIGN" -v STDEVRATE="$STDEV_TOTAL" 'BEGIN { printf "%.0f", MEANRATE+(1.645*STDEVRATE) }' </dev/null)
FILTER_THRESHOLD=$SIMILARITY_THRESH

echo "INV Threshold calculation results.."
echo "Mean: $MEAN_ALIGN"
echo "STDEV-Down: $STDEV_DOWN"
echo "STDEV-UP: $STDEV_UP"
echo "STDEV-Total: $STDEV_TOTAL"
echo "Threshold: $FILTER_THRESHOLD"


#Filter columns to only those where both up and downstream meet the threshold (below)
echo "Writing Filtered INVs to $OUTPUT_FILE..."
awk -v THRESH="$FILTER_THRESHOLD" '{if ($13>=THRESH && $14>=THRESH)
        print $0;
}' $TEMP_FILE > $OUTPUT_FILE

#printf "%s" "${RESULTS_ARR[@]}" > $OUTPUT_FILE

#rm $REF_TEMP.upstream $REF_TEMP.downstream $NEEDLE_TEMP.upstream $NEEDLE_TEMP.downstream
