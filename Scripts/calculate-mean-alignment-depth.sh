#!/bin/bash

DEPTH_FILE=$1

awk '{ sum += $3 } END { if (NR > 0) print sum / NR }' $DEPTH_FILE

