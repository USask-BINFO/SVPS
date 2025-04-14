#!/bin/bash

CHROM_NAMES=$1
SV_COORDS_FILE=$2
SAMPLE_OUT_FILE=$3
SAMPLE_SIZE=$4

#Determine contig and input size details to prepare for sampling
readarray NAMES_ARR < <(cat $CHROM_NAMES | cut -f1)
#NUM_COORDS=`cat $SV_COORDS_FILE | wc -l` #Total number of input entries to sample from
NUM_COORDS=$(sort -k1,1 -k3,3n -k4,4n -k5,5 -k6,6n "$SV_COORDS_FILE" | uniq | wc -l) # Count the number of unique entries found in SV_COORDS_FILE
CONTIGS_REMAINING="${#NAMES_ARR[@]}"

SAMPLE_ARR=() #Store sampled entries in an array
declare -A SEEN # Track entries already sampled so they don't get duplicated

if [ $SAMPLE_SIZE -lt $NUM_COORDS ] # If sample size is less than number of total entries, take random sample (evenly distributed as possible)
then
	echo "There were enough unique entries for random sampling. Building random verification sample!..."
	for CONTIG in "${NAMES_ARR[@]}"
	do
		readarray -t CONTIG_ARR < <(cat $SV_COORDS_FILE | grep "^$CONTIG")
		CONTIG_ARR_LEN="${#CONTIG_ARR[@]}"
                SAMP_FROM_CHROM=$((SAMPLE_SIZE/CONTIGS_REMAINING)) # Number of samples to select for even distribution across remaining contigs/chroms

		# Check Contig has enough entries to sample. Add them all if not enough, otherwise random sample
		if [ $CONTIG_ARR_LEN -lt $SAMP_FROM_CHROM ]
		then
			SAMP_FROM_CHROM=$CONTIG_ARR_LEN #Update ready to do the math at the end of current loop iteration
			for EACH_ENTRY in "${CONTIG_ARR[@]}" #Add all to sample
			do
				#Test if an entry is present in the SEEN array and add to both the SAMPLE_ARR and SEEN if not
    				if [[ -z "${SEEN["$EACH_ENTRY"]}" ]]; then
					SAMPLE_ARR+=("$EACH_ENTRY")
					SEEN["$EACH_ENTRY"]=1
				fi
				#SAMPLE_ARR+=($EACH_ENTRY)
			done
		else

			readarray -t SHUFFLED < <(printf "%s\n" "${CONTIG_ARR[@]}" | shuf)
			COUNT=0
			for ENTRY in "${SHUFFLED[@]}"; do
				if [[ -z "${SEEN["$ENTRY"]}" ]]; then
					SAMPLE_ARR+=("$ENTRY")
					SEEN["$ENTRY"]=1
					COUNT=$((COUNT+1))
					if [ $COUNT -eq $SAMP_FROM_CHROM ]; then
						break
					fi
				fi
			done
			# Take random entries from the current chromosome until enough unique entries are sampled
			#COUNT=0
			#while [ $COUNT -lt $SAMP_FROM_CHROM ]; do
			#	RAND_INDEX=$(shuf -i 0-$((CONTIG_ARR_LEN-1)) -n 1)
			#	ENTRY="${CONTIG_ARR[$RAND_INDEX]}"
			#	if [[ -z "${SEEN["$ENTRY"]}" ]]; then
			#		SAMPLE_ARR+=("$ENTRY")
			#		SEEN["$ENTRY"]=1
			#		COUNT=$((COUNT+1))
			#	fi
			#done
			#for RAND_INDEX in `shuf -i 0-$((CONTIG_ARR_LEN-1)) -n $SAMP_FROM_CHROM` #Perform sampling of random indicies
			#do
			#	SAMPLE_ARR+=("${CONTIG_ARR[$RAND_INDEX]}")
			#done
		fi

		#Update variables to ensure even distribution of remaining entries across remaining contigs to be sampled
		SAMPLE_SIZE=$((SAMPLE_SIZE-SAMP_FROM_CHROM))
		CONTIGS_REMAINING=$((CONTIGS_REMAINING-1))
	done

	#Write Sample to output file
	printf "%s\n" "${SAMPLE_ARR[@]}" > $SAMPLE_OUT_FILE

else #otherwise just copy all input entries as the sample since it's smaller
	echo "Not enough unique entries for random sampling. Using all coords as the verification sample!..."
	cat $SV_COORDS_FILE > $SAMPLE_OUT_FILE
fi

sort -k1,1 -k3,3n -k4,4n -k5,5 -k6,6n -o $SAMPLE_OUT_FILE $SAMPLE_OUT_FILE
echo "Sampling Complete!.."
