#!/bin/bash

INPUT_FILE=$1
OUTPUT_FILE=$2
TEMP_FILE=$3
MATCH_FILE=$4
FINAL_FILE=$5

awk 'BEGIN{FS=OFS=" "}{print $1 " " $2 " " $3 " " $6 " " $7 " " $8 " " $9 " " $11 " " $3-$2 " " $8-$7 }' $INPUT_FILE > $TEMP_FILE
#awk 'BEGIN{FS=OFS=" "}{print $1 " " $2 " " $3 " " $6 " " $7 " " $8 " " $9 " " $11}'  > $TEMP_FILE
awk '{if ($10 > 50 || $11 > 50)
                 print $0
        }' $TEMP_FILE > $OUTPUT_FILE
awk '{if ($8 != "SYN" )
                 print $0
        }' $OUTPUT_FILE > $TEMP_FILE
awk '{if ($8 != "SYNAL" )
                 print $0
        }' $TEMP_FILE > $OUTPUT_FILE
awk '{if ($8 != "INVAL" )
                 print $0
        }' $OUTPUT_FILE > $TEMP_FILE
awk '{if ($8 != "TRANSAL" )
                 print $0
        }' $TEMP_FILE > $OUTPUT_FILE
awk '{if ($8 != "INVDPAL" )
                 print $0
        }' $OUTPUT_FILE > $TEMP_FILE
awk '{if ($8 != "HDR" )
                 print $0
        }' $TEMP_FILE > $OUTPUT_FILE
awk '{if ($8 != "DUPAL" )
                 print $0
        }' $OUTPUT_FILE > $TEMP_FILE
awk '{if ($8 != "CPG" )
                 print $0
        }' $TEMP_FILE > $OUTPUT_FILE
awk '{if ($8 != "CPL" )
                 print $0
        }' $OUTPUT_FILE > $TEMP_FILE
awk '{if ($8 != "TDM" )
                 print $0
        }' $TEMP_FILE > $OUTPUT_FILE
#awk '{if ($8 != "NOTAL" )
#                 print $0
#        }' $OUTPUT_FILE > $TEMP_FILE
#cat $TEMP_FILE > $OUTPUT_FILE
rm $TEMP_FILE

#convert random classes to match my pipeline
cp $OUTPUT_FILE $MATCH_FILE
sed -i 's/INVDP/DUP/g' $MATCH_FILE
sed -i 's/INVTR/TRANS/g' $MATCH_FILE
sed -i 's/NOTAL/DEL/g' $MATCH_FILE

#select final columns required and remove a cap if needed
awk 'BEGIN{FS=OFS=" "}{print $1 " " $2 " " $3 " " $4 " " $5 " " $6 " " $10 " " $8}' $MATCH_FILE > $FINAL_FILE
#sed -i 's/C/c/g' $FINAL_FILE

#Replace all spaces with tabs for correct formatting for Bedtools
#sed -i 's/ /\t/g' $OUTPUT_FILE
sed -i 's/ /\t/g' $FINAL_FILE

rm $MATCH_FILE
