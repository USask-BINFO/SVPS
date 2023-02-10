#!/bin/bash

mummer4OutputPathPrefix=$1

echo "Running RefAsRef Show Coords.."
show-coords -THrd ${mummer4OutputPathPrefix}_ref.delta_filter > ${mummer4OutputPathPrefix}_RefAsRef.coords

echo "Running QueryAsRef Show Coords"
show-coords -THrd ${mummer4OutputPathPrefix}_qry.delta_filter > ${mummer4OutputPathPrefix}_QryAsRef.coords

echo "Show-Coords complete..."

