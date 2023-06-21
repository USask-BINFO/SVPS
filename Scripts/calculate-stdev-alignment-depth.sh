#!/bin/bash

DEPTH_FILE=$1

awk '{x+=$3;y+=$3^2}END{print sqrt(y/NR-(x/NR)^2)}' $DEPTH_FILE
