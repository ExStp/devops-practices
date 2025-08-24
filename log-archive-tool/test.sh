#!/bin/bash

if [ -z $1 ]; then
    OUTPUT_DIR=$HOME
else
    OUTPUT_DIR=$1
fi

echo $OUTPUT_DIR